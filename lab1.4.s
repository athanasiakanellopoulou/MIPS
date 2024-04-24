
.text 
 .globl __start 
__start: 



 
 li $v0, 8
 la $a0 , str
 syscall

	li $v0, 4
 	syscall 
 sb $zero , 5($a0)
 
 	li $v0, 4
 	syscall 
 
 
 
 
 
 li $v0,10 
 syscall 
 
 
 
 
 
 .data 

by: .byte 0x01 , 0x02 , 0x03 , 0x04 , 0x81 , 0x82 , 0x83 , 0x84
wo: .word 0x12345678, 0x87654321
str: .asciiz "_____________________"
str2: .space 21

