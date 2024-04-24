#Γράψτε πρόγραμμα assembly MIPS που να διαβάζει συνεχώς ένα βρόχο πραγματικούς αριθμούς
#και βρίσκει αν είναι ακέραιοι. Όταν κάποιος αριθμός που διαβάζεται είναι ακέραιος τότε να εκτυπώνει 
#FOUND- INTEGER=X όπου Χ ο αριθμός. Διαφορετικά εκτυπώνει το μήνυμα NOT-INTEGER και προχωράει
#στην ανάγνωση του επόμενου. Αν διαβάσει το μηδέν τερματίζει. 




.data
prompt: .asciiz "Enter a number: "
msg_integer: .asciiz "FOUND-INTEGER="
msg_not_integer: .asciiz "NOT-INTEGER\n"

.text
.globl main

main:
    li $t2, 0    # flag to check if number is integer or not

loop:
    # print the prompt message
    la $a0, prompt
    li $v0, 4
    syscall

    # read the number
    li $v0, 5
    syscall
    move $t0, $v0

    # check if the number is zero
    beq $t0, $zero, end

    # print the appropriate message
    beq $t0, $t2, print_integer
    j print_not_integer

print_integer:
    la $a0, msg_integer
    li $v0, 4
    syscall
    move $a0, $t0
    li $v0, 1
    syscall
    j loop

print_not_integer:
    la $a0, msg_not_integer
    li $v0, 4
    syscall
    j loop

end:
    # exit the program
    li $v0, 10
    syscall

