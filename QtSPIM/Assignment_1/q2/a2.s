#Sambit Sahoo 22277


.data

x: .byte 0
y: .byte 1


.text
.globl main
main:	
	#Half Adder
	lb $t0, x		#t0 = x
	lb $t1, y		#t1 = y
	nor $t2, $t0, $0	#t2 = ~x
	nor $t3, $t1, $0	#t3 = ~y
	and $t4, $t0, $t3	#t4 = ~yx
	and $t5, $t1, $t2	#t5 = ~xy
	or $s0, $t4, $t5	#s0 = ~yx+~xy (sum)

	and $s1, $t0, $t1	#s1 = x&y (carry)
	
	
	#Half Subtractor
	move $s2, $s0		#s2 = s0 (diff)
	
	and $s3, $t2, $t1	#s3 = ~x&y (borrow)
	



	li $v0, 10
	syscall