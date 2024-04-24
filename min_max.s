.text 
 .globl __start 
__start: 

#start of main program

	li $a0 , -10 #initialize variables
	li $a1 , -30 #
	li $a2 , 120
	li $a3 , 200 #
	move $s0 , $a0 #min
	move $s1 , $a1 #max
	jal minmax
	
	
	
	move $t0 , $v0
	move $t1 , $v1
	la $a0 , max 
	li $v0 , 4
	syscall #display "Max is  :"
	move $a0 , $t0 
	li $v0 , 1 
	syscall #display max 
	la $a0 , endl 
	li $v0 , 4
	syscall 
	la $a0, min 
	li $v0 , 4
	syscall #display "Min is :"
	move $a0 , $t1
	li $v0 , 1
	syscall
	la $a0, endl
	li $v0 , 4
	syscall
	li $v0 , 10
	syscall 
	
	
	
	#end of main program
	#start of procedure
	
minmax:	addi $sp , $sp , -8
		sw $s0, 0($sp) 
		sw $s1 , 4($sp)
		slt $t0 , $s0 , $a1 #(-10)<(-30);
		bnez $t0 , MAX1 
		move $s0 , $a1
		
MAX1:	slt $t0 , $s0 , $a2
		bnez $t0 , MAX2 
		move $s0, $a2
		
MAX2:	slt $t0 , $s0 , $3
		bnez $t0 , MIN 
		move $s0, $a3
		
MIN:	sgt $t0 , $s1, $a0
		bnez $t0 , MIN2 
		move $s1, $a0
		
		
MIN2:	sgt $t0 , $s1, $a2
		bnez $t0 , MIN3 
		move $s1, $a2
		
MIN3:	sgt $t0 , $s1, $a3
		bnez $t0 , EXIT  
		move $s1, $a3
		
		
#end of procedure

