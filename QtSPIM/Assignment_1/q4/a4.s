#Sambit Sahoo 22277


.data

A: .word 100
B: .word 150
C: .word 250
D: .word 750

.text
.globl main
main:	
	#Weighted Avg	
	lw $t0, A		#t0 = A
	lw $t1, B		#t1 = B
	lw $t2, C		#t2 = C
	lw $t3, D		#t3 = D
	
	srl $t4, $t0, 3		#t4 = A/8
	srl $t5, $t1, 2		#t5 = B/4
	srl $t6, $t2, 1		#t6 = C/2
	srl $t7, $t3, 1		#t7 = D/2

	add $t8, $t4, $t5	#t8 = A/8 + B/4
	add $t9, $t8, $t6	#t9 = A/8 + B/4 + C/2
	add $a0, $t9, $t7	#a0 = A/8 + B/4 + C/2 + D/2

	li $v0, 17
	syscall