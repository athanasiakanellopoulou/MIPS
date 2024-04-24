.text 
 .globl __start 
__start: 



 
 
  
 addi $s1,$zero,1 
 add $s2,$s1,$zero 
 sll $s1,$s1,30 
again: srl $t0, $s2, 24 
 sll $s2, $s2, 8 
 or $s2, $s2, $t0 
 addi $s1,$s1,-1 
 bne $s1,$zero,again
 
 
 
 
 
 
 
 
 
 
 
 li $v0,10 
 syscall 
 
 
 
 
 
 .data 

by: .byte 0x01 , 0x02 , 0x03 , 0x04 , 0x81 , 0x82 , 0x83 , 0x84
wo: .word 0x12345678, 0x87654321
w1: .half 0x5678 , 0x1234




