


.text 
 .globl __start 
__start: 





    # ������ ��� ��� ������ ��� ����� ������
    li $v0, 4
    la $a0, prompt1 #print string
    syscall

    # ���������� ��� ����� ������
    li $v0, 5	#read integer
    syscall
    move $t0, $v0 #move result to $t0

    # ������ ��� ��� ������ ��� ������� ������
    li $v0, 4			#print string
    la $a0, prompt2
    syscall

    # ���������� ��� ������� ������
    li $v0, 5		#read integer
    syscall
    move $t1, $v0	#move result to $t1

    # ��������� ��� ��������
    div $t0, $t1		#t0/t1

    # ������������ �� ������
    mflo $t2       #$t2=t0/t1

    # ����������� �� ������
    li $v0, 4			#print string
    la $a0, quotient_str
    syscall

    move $a0, $t2		#move result to a0
    li $v0, 1			#print integer
    syscall

    # ������������ �� ��������
    mfhi $t3			#the rest of division

    # ����������� �� ��������
    li $v0, 4			#print string
    la $a0, remainder_str
    syscall

    move $a0, $t3		#move result to a0
    li $v0, 1				#print integer
    syscall

    # ������������ �� ���������
    li $v0, 10
    syscall
    
    
    
    
    
    .data
prompt1: .asciiz "�������� �������� ��� ����� ������: "
prompt2: .asciiz "�������� �������� ��� ������� ������: "
quotient_str: .asciiz "�� ������ �����: "
remainder_str: .asciiz "�� �������� �����: "


