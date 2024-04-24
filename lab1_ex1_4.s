.text 
 	.globl __start 
__start: 

li $v0, 8
la $a0, str
li $a1, 21
syscall

li $v0, 4
syscall

sb $zero, str + 5
la $a0, str1
li $v0, 4
syscall

la $a0, str

li $v0, 4
syscall




li $v0,10 
syscall

.data
str: .asciiz "---------------------" 
str1: .asciiz "\n"
