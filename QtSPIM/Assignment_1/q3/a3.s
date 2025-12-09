#Sambit Sahoo 22277


.data

x: .word 10
y: .word 14


.text
.globl main
main:	
	#Swap	
	lw $t0, x		#t0 = x
	lw $t1, y		#t1 = y
	or $t2, $t0, $0		#t2 = x
	or $t0, $t1, $0		#t0 = y
	or $t1, $t2, $0		#t1 = x
	



	li $v0, 10
	syscall