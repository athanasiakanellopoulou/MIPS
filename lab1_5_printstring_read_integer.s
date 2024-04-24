 #������ ��� ��������� ��� �� �������� ��� �� �������� ��� �������� ���� ������� ��� �� ����� � �������.
 #������� �� ��������� ��� ���� �������� ��� ���� �������.
 #�������������� ��� ������� ���������� read_int ��� print_int ��� ���� �� �����
 
  
.text 
 .globl __start 
__start: 


    li $v0, 4            # service call to print string
    la $a0, message      # load the address of the message into $a0
    syscall              

    li $v0, 5            # service call to read an integer
    syscall              # make the system call: the result will be in $v0

    move $a0, $v0        # move the result to $a0
    li $v0, 1            # service call to print an integer
    syscall              # make the system call: prints the integer

    li $v0, 10           # service call to exit
    syscall              # end the program


  .data
message: .asciiz "\nPlease enter an integer: "
