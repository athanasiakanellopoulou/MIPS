


.text 
 .globl __start 
__start: 





    # Ζητάμε από τον χρήστη τον πρώτο αριθμό
    li $v0, 4
    la $a0, prompt1 #print string
    syscall

    # Διαβάζουμε τον πρώτο αριθμό
    li $v0, 5	#read integer
    syscall
    move $t0, $v0 #move result to $t0

    # Ζητάμε από τον χρήστη τον δεύτερο αριθμό
    li $v0, 4			#print string
    la $a0, prompt2
    syscall

    # Διαβάζουμε τον δεύτερο αριθμό
    li $v0, 5		#read integer
    syscall
    move $t1, $v0	#move result to $t1

    # Εκτελούμε την διαίρεση
    div $t0, $t1		#t0/t1

    # Αποθηκεύουμε το πηλίκο
    mflo $t2       #$t2=t0/t1

    # Εμφανίζουμε το πηλίκο
    li $v0, 4			#print string
    la $a0, quotient_str
    syscall

    move $a0, $t2		#move result to a0
    li $v0, 1			#print integer
    syscall

    # Αποθηκεύουμε το υπόλοιπο
    mfhi $t3			#the rest of division

    # Εμφανίζουμε το υπόλοιπο
    li $v0, 4			#print string
    la $a0, remainder_str
    syscall

    move $a0, $t3		#move result to a0
    li $v0, 1				#print integer
    syscall

    # Τερματίζουμε το πρόγραμμα
    li $v0, 10
    syscall
    
    
    
    
    
    .data
prompt1: .asciiz "Παρακαλώ εισάγετε τον πρώτο αριθμό: "
prompt2: .asciiz "Παρακαλώ εισάγετε τον δεύτερο αριθμό: "
quotient_str: .asciiz "Το πηλίκο είναι: "
remainder_str: .asciiz "Το υπόλοιπο είναι: "


