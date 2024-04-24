.text 
 .globl __start 
__start: 

li $v0, 5 
syscall

move $s0, $v0 # move from v0 to s0, so you can devided
la $t0, EXIT



li $t2, 2 # so we can later devide with 2
li $t3, 3 #... 3
li $t5, 5 #... 5


#li $t0 , 0  flag
div $s0 , $t2 
mfhi $s1
bnez $s1 , case1   # checks with zero 

#add $t0, 1

la $a0 , endl # gia na perasei to mnm
li $v0 , 4 #print string
syscall
jr $t0



case1:  div $s0, $t3
		mfhi $s1
		bnez $s1, case2  
		#add $t0 , 1
		la $a0 , str
		li $v0 , 4
		syscall
		jr $t0

case2:  div $s0, $t5
		mfhi $s1
		bnez $s1, case3 
		#add $t0, 1
		la $a0 , str2
		li $v0 , 4
		syscall
		jr $t0







case3 :  
		
		#bne $t0 , $zero , EXIT 
		la $a0 , str3
		li $v0 , 4
		syscall
		

EXIT :
		












 li $v0,10 
 syscall 
 
 
 
 
 .data 
endl: .asciiz "DEVIDECD BY 2\n"
str: .asciiz"DEVIDECD BY 3\n"
str2:.asciiz"DEVIDECD BY 5\n"
str3:.asciiz "NOT DEVIDED BY 2, 3 OR 5\n"
str4: .asciiz "				\n"
str5: .asciiz "					\n"
