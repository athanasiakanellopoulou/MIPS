������������ ���������� (����� [1.0 2.0 3.0]+ [1.0 1.0 2.0]=[2.0 3.0 5.0]) ��� ��������� ��. 
�� ��� ���������� �� ������ ��� ��� ����� (�� .data). �� 3� �������� ��� ��������� �� �� ������������ ������ ���� �����


.text
.globl main
main:
    # ������ ��� ��� �������� ��� �����������
    li $t0, 0                       # ������������ ������
    li $t1, 3                       # ������ �� ������� ��� �����������
loop:
    beq $t0, $t1, end               # ������� �� ���������� 
    sll $t2, $t0, 2                 # ���������� �� bytes

    # ��������� �� ��� ����������
    lwc1 $f0, vector1($t2)          # �������� ��� ���� ��� ��  vector1
    lwc1 $f1, vector2($t2)          # �������� ��� ���� ��� ��  vector2
    add.s $f2, $f0, $f1             # ��������� ��� �����
    swc1 $f2, result($t2)           # ���������� �� ����������

    addi $t0, $t0, 1                # ������� ��� ������
    j loop                          # ������������� ��� �����
end:
    jr $ra                          #���������� ��� ��� main





.data
vector1: .float 1.0, 2.0, 3.0
vector2: .float 1.0, 1.0, 2.0
result:  .float 0.0, 0.0, 0.0
