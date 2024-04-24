.text 
 .globl __start 
__start: 


















 li $v0,10 
 syscall 
 
 
 
 
 .data 
endl: .asciiz "01234567890123456789"
str: .asciiz"	\n"
str2:.asciiz"		\n"
str3:.asciiz"			\n"
str4: .asciiz "				\n"
str5: .asciiz "					\n"
