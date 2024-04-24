#Γράψτε πρόγραμμα assembly MIPS που να διαβάζει έναν 4-ψηφιο οκταδικό 
#αριθμό ως συμβολοσειρά (string) και τον εκτυπώνει ως δυαδικό στην κονσόλα 
#Να κάνετε έλεγχο αν οι χαρακτήρες που δίνονται είναι σωστοί.
#Το πρόγραμμα ολοκληρώνεται όταν εισαχθεί η τιμή οοοο.


.data
    buffer: .space 5         # Buffer to store the input string
    msg: .asciiz "Enter a 4-digit octal number: "
    err: .asciiz "Invalid character detected!\n"
    end: .asciiz "0000"

.text
main:
    la $a0, msg
    li $v0, 4                # Print message
    syscall

read:
    la $a0, buffer
    li $a1, 5                # Read 4 digits + '\0'
    li $v0, 8                # Read string syscall
    syscall

    la $t0, buffer           # Load the address of the string into $t0
    lb $t1, 0($t0)           # Load the first byte
    beq $t1, $zero, exit     # If it's zero (null terminator), exit the program

validate:
    li $t2, '0'
    li $t3, '7'
    blt $t1, $t2, error      # If the character is less than '0', it's invalid
    bgt $t1, $t3, error      # If the character is greater than '7', it's invalid

    addiu $t0, $t0, 1        # Move to the next character
    lb $t1, 0($t0)           # Load the next byte
    bnez $t1, validate       # If it's not zero (null terminator), continue validation

convert:
    la $t0, buffer           # Load the address of the string into $t0
    lb $t1, 0($t0)           # Load the first byte

print_binary:
    li $t2, '0'
    subu $t1, $t1, $t2       # Subtract '0' to get the actual digit
    sll $t1, $t1, 3          # Shift left by 3 to convert to binary

    li $v0, 1                # Print integer syscall
    move $a0, $t1
    syscall

    addiu $t0, $t0, 1        # Move to the next character
    lb $t1, 0($t0)           # Load the next byte
    bnez $t1, print_binary   # If it's not zero (null terminator), continue printing

    j read

error:
    la $a0, err
    li $v0, 4                # Print error message
    syscall
    j read

exit:
    la $t0, buffer
    la $t1, end
    beq $t0, $t1, finish     # If the input is "0000", finish the program
    j read

finish:
    li $v0, 10               # Exit syscall
    syscall

