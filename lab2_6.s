.text 
 .globl __start 
__start: 

la $a0, wo
lw $t1 , wo #A
lw $t0 , 4($a0) #B	



addu $s0 , $t0 , $t1 #sum
not $s0 , $s0 # sum  not si' 

# srl $t1 , $t1 , 31
# srl $t0 , $t0 , 31
# srl $s0 , $s0 , 31

and $s1, $s0 , $t0 #S not * B  sum not =Si'

and $s2 , $s0 , $t1 # Si' A
and $s3 , $t0 , $t1 #Si'B

or $s3 , $s2 ,$s3 
or $s3 , $s3, $s1

srl $s3, $s3, 31
 
 
 
 
 
la $a0, wo
lw $t1 , 8($a0) #A
lw $t0 , 12($a0) #B	



addu $s0 , $t0 , $t1 #sum
add $s0, $s0, $s3
not $s0 , $s0 # sum  not si' 

# srl $t1 , $t1 , 31
# srl $t0 , $t0 , 31
# srl $s0 , $s0 , 31

and $s1, $s0 , $t0 #S not * B  sum not =Si'

and $s2 , $s0 , $t1 # Si' A
and $s4 , $t0 , $t1 #Si'B

or $s4 , $s2 ,$s3 
or $s4 , $s3, $s1

srl $s4, $s4, 31

 
 
 li $v0,10 
 syscall 
 
 
 .data 

by: .byte 0x01 , 0x02 , 0x03 , 0x04 , 0x81 , 0x82 , 0x83 , 0x84
wo: .word 0x80000000 , 0x80000000  , 0x80000000 , 0x80000000 


