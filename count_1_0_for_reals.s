#Γράψτε ένα πρόγραμμα assembly MIPS που να διαβάζει συνεχώς σε ένα βρόχο πραγματικούς αριθμούς απλής ακρίβειας μέχρι να διαβάσει το 0.
#Κάθε φορά που διαβάζει έναν αριθμό μετράει και εκτυπώνει το πλήθος των άσσων (=1) και των μηδενικών της δυαδικής αναπαράστασης.



.text 
 .globl __start 
__start:
	

    la $t0, ones   # Load address of counter for ones
    la $t1, zeros  # Load address of counter for zeros

    # Initialize counters to 0
    sw $zero, 0($t0)
    sw $zero, 0($t1)

read_loop:
    jal read_real  # Call read_real subroutine

    beq $v0, $zero, print_results # If read number is zero, jump to print_results

    # Process bits of the number
    li $t2, 32     # Initialize counter for 32 bits
bit_loop:
    andi $t3, $v0, 1    # Extract least significant bit
    beq $t3, $zero, count_zero

    # Count one
    lw $t3, 0($t0)
    addi $t3, $t3, 1
    sw $t3, 0($t0)
    j next_bit

count_zero:
    # Count zero
    lw $t3, 0($t1)
    addi $t3, $t3, 1
    sw $t3, 0($t1)

next_bit:
    srl $v0, $v0, 1     # Shift right to process next bit
    addi $t2, $t2, -1   # Decrease bit counter
    bgtz $t2, bit_loop  # If there are more bits, continue the loop

    j read_loop

print_results:
    # Print results
    jal print_ones
    jal print_zeros

    jr $ra  # Return from main

.data
ones: .word 0
zeros: .word 0

	
