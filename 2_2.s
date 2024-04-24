.text 
 .globl __start 
__start: 


li $s0 ,0x12345678 	#sw $a0, bigEndian

srl $t0, $s0 , 24



sll $t1, $s0 , 8 #byte1
srl $t1,$t1 , 24
sll $t1,$t1 , 8

#masking
#srl $t1,$a0, 8
#andi $t1, $t1, 0xff00




srl $t2 ,$s0 , 8 #byte2
sll $t2 ,$t2 , 24
srl $t2 ,$t2 , 8


#masking

#andi $t2, $a0, 0xff00
#sll $t2,$t2, 8


sll $t3, $s0 , 24

or $s1, $t0, $t1
or $s2 , $t2, $t3
or $s3 , $s1 , $s2
 
 
 
 li $v0,10 
 syscall 
 
 
 
 
 .data 
bigEndian : .word 0x12345678

