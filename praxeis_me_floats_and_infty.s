#������ ��� �����ᵵ� ��� �� ������ �� �� ����� ��� ��޵���� �������� ��� �������� : 0.0, +?, -?, +NaN, ��� 
#��� �������, ���� ������ x ��� ���� �������� y. �� �����ᵵ� �� ������ �� ������� ��� ������� ��� ��������� 
#���� �������� ������
#x � y 
#x � (\infty) 
#y / 0 
#0 / 0 
#0 � (+\infty) 
#(+\infty) / (-\infty) 
#(+\infty) + (-\infty) 
#x + NaN



.text
.globl main

main:
    # ������� ��� ����� x ��� y �� �����������
    la $t0, x
    l.s $f0, 0($t0)  # ������� x
    la $t1, y
    l.s $f1, 0($t1)  # ������� y

    # �������� ��� ������ x * y
    mul.s $f2, $f0, $f1  # $f2 = x * y

    # �������� ��� �������������
    li $v0, 2
    move $a0, $f2
    syscall

    # ����������� ��� ������������
    li $v0, 10
    syscall
    
    
    # ������� ������� �����
.data
x: .float 5.0
y: .float -3.0







#	.data
#pos_infinity:	.word	0x7F800000  # +\infty
#neg_infinity:	.word	0xFF800000  # -\infty
#nan:		    .word	0x7FC00000  # NaN
#zero:		    .word	0x00000000  # 0.0

#	.text
#	.globl main
#main:
    # ������� ��� �������. ��� ������ x ��� ���� ��������  y
#	li.s	$f12, 10.0    # ������� x
#	li.s	$f13, -5.0    # ���������  y

    # �������� �������
 #   lwc1    $f14, pos_infinity
 #   lwc1    $f15, neg_infinity
 #   lwc1    $f16, nan
 #   lwc1    $f17, zero

 #   mul.s   $f18, $f12, $f15    # x * -8
 #   div.s   $f19, $f13, $f17    # y / 0
  #  div.s   $f20, $f17, $f17    # 0 / 0
  #  mul.s   $f21, $f17, $f14    # 0 * +8
  #  div.s   $f22, $f14, $f15    # +8 / -8
  #  add.s   $f23, $f14, $f15    # +8 + -8
  #  add.s   $f24, $f12, $f16    # x + NaN

    # ��������� ��� ���������
#	jr	$ra


