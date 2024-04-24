#Γράψτε ένα πρόγραμμα που θα διαβάζει απ΄π το παράθυρο της κονσόλας δύο ακεραίους που θα δίνει ο χρήστης.
#Κατόπιν θα εμφανίζει στο ίδιο παράθυρο το άθροισμα των δύο ακεραίων και την διαφορά τους.



  
.text 
 .globl __start 
__start: 


main:
   
    li $v0, 4       #print string
    la $a0, message1
    syscall

   
    li $v0, 5		#read the first integer
    syscall
    move $t0, $v0   #move result to t0

    
    li $v0, 4		#print string
    la $a0, message2
    syscall

    
    li $v0, 5			#read the second integer
    syscall
    move $t1, $v0   #move result to $t1

    
    add $t2, $t0, $t1 		#add the results

    
    li $v0, 4				
    la $a0, message3
    syscall

   
    li $v0, 1			#print the result 
    move $a0, $t2		#move the sum to $a0 so it can be printed
    syscall

   
    sub $t3, $t0, $t1  #sub

    
    li $v0, 4
    la $a0, message4
    syscall

    
    li $v0, 1		#print the result 
    move $a0, $t3		#move the sub to $a0 so it can be printed
    syscall

    
    li $v0, 10		#exit
    syscall
    
    
        .data
message1:   .asciiz "Give the first integer: "
message2:   .asciiz "Give the second integer: "
message3:   .asciiz "The sum is: "
message4:   .asciiz "The different is : "
input1:     .space  4
input2:     .space  4

