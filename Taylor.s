.data
x:    .float 1.0        # �� x �� ������� ��� ��� ������ ���� ����� ��� �� ��������� ��� ������
result: .float 1.0      # ������������� �� ���������� 1 (����� 0!=1)
factorial: .float 1.0   # ������������� �� ����������� 1 (����� 0!=1)
k: .word 8              # �� ���������������� 8 �����
n: .word 1              # � ���������

.text
.global main
main:
    la $t0, x           # �������� �� ��������� ������ ��� x
    la $t1, result      # ��������� �� ��������� ������ ��� �������������
    la $t2, factorial   # ��������� �� ��������� ������ ��� ������������
    la $t3, k           # ��������� �� ��������� ������ ��� k
    lw $t4, 0($t3)      # �������� ��� ���� ���  k ��� $t4

loop:
    beq $t4, $zero, end # �� k == 0, ���� ���������� ��  loop
    l.s $f0, 0($t0)     # �������� ��� ���� ��� x
    l.s $f1, 0($t1)     #  �������� ��� ���� ��� �������������
    l.s $f2, 0($t2)     #  �������� ��� ���� ��� ������������ 

    mul.s $f3, $f0, $f1 # x^n
    div.s $f4, $f3, $f2 # x^n / n!
    add.s $f1, $f1, $f4 # �������� ������

    addi $t4, $t4, -1   # ������ ��� k
    s.s $f1, 0($t1)     # ���������� ��� ���� �������������
    mul.s $f2, $f2, $f0 # n! = n! * x
    s.s $f2, 0($t2)     # ���������� ��� ���� ������������ 
    j loop               #����������� loop

end:
