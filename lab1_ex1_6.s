.text
 	.globl __start
__start:

li $v0, 5 
syscall
move $t0, $v0

li $v0, 5 
syscall
move $t1, $v0

add $s1, $t0, $t1
sub $s2, $t0, $t1

move $a0, $s1
li $v0, 1
syscall

move $a0, $s2
li $v0, 1
syscall



li $v0,10
syscall
