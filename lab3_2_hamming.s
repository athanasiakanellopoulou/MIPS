


.text 
 .globl __start 
__start: 


    la $t0, word1  # load the address of the first word in  $t0
    lw $t1, 0($t0) # load the first word in $t1
    la $t0, word2  #load the address of the second word in  $t0
    lw $t2, 0($t0) # load the first word in $t2

    xor $t3, $t1, $t2  # $t3 = $t1 XOR $t2

    li $t4, 0  # ������������� ��� ������ ��� ������������ bit �� 0
    li $t5, 32 # 32 bits �� ���� ���� 

loop:
    andi $t6, $t3, 1   # $t6 = �� ��������� bit ��� $t3
    beqz $t6, next     # �� �� bit ����� 0, ������� ��� next
    addiu $t4, $t4, 1  # ������� ��� ������ ��� ������������ bit ���� 1
next:
    srl $t3, $t3, 1    # shift �� $t3 ����� ���� 1
    addiu $t5, $t5, -1 # ��������� 1 ��� ��� ������ ���  bits
    bnez $t5, loop     # ����������� ��� ���������� ������ �������� ����� bits

    la $t0, result  # �������� ��� ��������� ��� ������������� ��� $t0
    sw $t4, 0($t0)  # ����������� ��� ������ ��� ������������ bit ��� �����

    jr $ra  # ����������

    .data
word1: .word 0xAAAAAAAA # �������������� �� �� ����� 32-bit word
word2: .word 0x55555555 # �������������� �� �� ������� 32-bit word
result: .word 0

  
