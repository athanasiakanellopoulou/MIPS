.text 
 .globl __start 
__start: 



 
 lbu $t0 , by
 lhu $t1 , by
 lw $t2 , by
 
 
 lbu $t3 , by +4 
 lhu $t4 , by+4
 lw $t5 , by+4
 
 
 
 lb $t0 , by
 lh $t1 , by
 lw $t2 , by
 lb $t3 , by+4 
 lh $t4 , by+4
 lw $t5 , by+4
 
  lb $t6 , by
  
  sb $t6, by+16
 
 
 
 
 li $v0,10 
 syscall 
 
 
 
 
 
 .data 

by: .byte 0x01 , 0x02 , 0x03 , 0x04 , 0x81 , 0x82 , 0x83 , 0x84
wo: .word 0x12345678, 0x87654321





