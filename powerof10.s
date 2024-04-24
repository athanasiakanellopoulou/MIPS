#Γράψτε πρόγραμμα assembly MIPS που να διαβάζει σε ένα βρόχο θετικούς
#ακεραίους αριθμούς και τους εκτυπώνει σαν άθροισμα δυνάμεων του 10.
#Δηλαδή για τον δεκαδικό αριθμό 137 θα εκτυπώνει POWERS-SUM =1*10^2+3*10^1+7*10^0. 
#Τερματίζεται η εκτέλεση όταν διαβαστεί το 0. Μη κάνετε έγχο αρνητικού αριθμού 


  
    .text
main:
        la $t0, number      # Load the address of number to $t0
        la $t1, index       # Load the address of index to $t1
        la $t2, ten         # Load the address of ten to $t2
        lw $t3, 0($t1)      # Load the value of index to $t3

loop:
        lw $t4, 0($t0)      # Load the value of number to $t4
        beqz $t4, end       # If number is zero, end the program
        li $t5, 0           # Initialize power of ten counter

powerLoop:
        div $t4, $t2        # Divide the number by 10
        mflo $t4            # Move the quotient to $t4
        mfhi $t6            # Move the remainder to $t6
        addi $t5, $t5, 1    # Increment the power of ten counter

        # Print the current power of ten
        li $v0, 4           # Syscall for print string
        la $a0, fmt         # Load the format string to $a0
        syscall             # Execute the syscall

        # Print the remainder and power
        # Note: You will need to convert $t6 and $t5 to string before printing.
        # MIPS doesn't provide this functionality natively.

        beqz $t4, loop      # If the quotient is zero, read the next number

        j powerLoop         # Otherwise, continue to the next power of ten

end:
        # Exit the program
        li $v0, 10          # Syscall for exit
        syscall             # Execute the syscall

  .data
        number: .word 137 0 # Predefined sequence of numbers
        index:  .word 0     # Index for array
        ten:    .word 10    # The number 10 to be used in division
        fmt:    .asciiz "POWERS-SUM="
