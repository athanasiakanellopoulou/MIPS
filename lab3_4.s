#������ ��� �����ᵵ� ��� �� ������� ��� ������ ��� �� ������ ��� ��������� ���������� ��� �� ������� ���� 
#����� ��� ���� ��������� �� �������� ��ܵ���� (���� �������� ���������� �a�-�z� �� ��������������� �� ���� 
#���-�ƒ). �� ���������� �a�-�z� ����� �������� ASCII 97-122 �� �������� ������ ��� �� �A�-�Z� ����� 
#�������� 65-90. 
#�������� : ������������� ��� ����� while ��� �� ����� ������� ��� � ���������� ��� ���������� ��� �� string 
#��� ���� ������ 0, ������ ��� ������ ��� ������� �� ����� ��� string.




.text 
 .globl __start 
__start: 

    
    li $v0, 4		# Print the string
    la $a0, prompt
    syscall

  
    li $v0, 8		  # Get the input string
    la $a0, string
    li $a1, 128
    syscall

    # Convert to uppercase
    la $t0, string

loop:
    lb $t1, 0($t0)     			# load the byte at address $t0 into $t1
    beqz $t1, end_loop 			# if $t1 is zero, end loop
    blt $t1, 97, not_lowercase
    bgt $t1, 122, not_lowercase

    
    sub $t1, $t1, 32			# This is a lowercase letter; convert to uppercase
    sb $t1, 0($t0)    				 # store the byte in $t1 at address $t0

not_lowercase:
    addiu $t0, $t0, 1 		 # increment address
    j loop             		 # go to the start of the loop

end_loop:
   
    li $v0, 4			 # Print the output string
    la $a0, string
    syscall

    
    li $v0, 10				# Exit the program
    syscall


.data
string: .space 128
prompt: .asciiz "Enter a string: "
 str :.asciiz "          "
 endl :. asciiz"\n"
