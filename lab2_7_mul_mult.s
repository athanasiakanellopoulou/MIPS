

.text 
 .globl __start 
__start: 


    la $t0, num1
    la $t1, num2
    lw $t2, 0($t0)
    lw $t3, 0($t1)

    #  mult
    mult $t2, $t3
    mfhi $t4
    mflo $t5
    la $t0, res_hi
    la $t1, res_lo
    sw $t4, 0($t0)
    sw $t5, 0($t1)
    
    #  multu
    multu $t2, $t3
    mfhi $t4
    mflo $t5
    la $t0, res_hi
    la $t1, res_lo
    sw $t4, 0($t0)
    sw $t5, 0($t1)

    # close the system
    li $v0, 10
    syscall

.data
num1: .word 0x7FFFFFFF   # a?t? ?a e??a? t? p??t? sa? ?e???? a???µ??
num2: .word 0x80000000   # a?t? ?a e??a? t? de?te?? sa? ?e???? a???µ??
res_hi: .word 0          # ?a ap????e?sete ed? t? ap?t??esµa t?? hi
res_lo: .word 0          # ?a ap????e?sete ed? t? ap?t??esµa t?? lo

