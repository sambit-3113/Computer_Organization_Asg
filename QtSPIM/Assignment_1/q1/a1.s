#Sambit Sahoo 22277
#nth term AP =          a+(n-1)d
#sum upto n terms AP =	n(2a+(n-1)d)/2
#nth term GP =          ar^(n-1)
#sum upto n terms GP =  a(r^n-1)/(r-1)


.data

ap_a: .byte 1
ap_d: .byte 10
gp_a: .byte 4
gp_r: .byte 2


.text
.globl main
main:	
	#AP
	lb $t0, ap_a   		#t0 = a
	li $t1, 8		#t1 = n
	addi $t1, $t1, -1	#t1 = n-1 
	lb $t2, ap_d		#t2 = d
	mul $t3, $t2, $t1	#t3 = (n-1)d
	add $s0, $t0, $t3	#s0 = a+(n-1)d
	
	li $t0, 2		#t0 = 2
	lb $t1, ap_a		#t1 = a
	mul $t2, $t1, $t0	#t2 = 2a
	li $t3, 6		#t3 = n
	addi $t4, $t3, -1	#t4 = n-1
	lb $t5, ap_d		#t5 = d
	mul $t6, $t5, $t4	#t6 = (n-1)d
	add $t7, $t2, $t6	#t7 = 2a+(n-1)d
	mul $t8, $t3, $t7	#t8 = n(2a+(n-1)d)
	div $t8, $t0		#lo = n(2a+(n-1)d)/2
	mflo $s1		#s1 = n(2a+(n-1)d)/2
	
	
	#GP
	lb $t0, gp_a		#t0 = a
	lb $t1, gp_r		#t1 = r
	mul $t2, $t1, $t1	#t2 = r^2
	mul $t2, $t2, $t1	#t2 = r^3
	mul $s2, $t0, $t2	#s2 = ar^3
		
	mul $t3, $t2, $t1	#t3 = r^4
	addi $t4, $t3, -1	#t4 = r^4 - 1
	addi $t5, $t1, -1	#t5 = r - 1
	mul $t6, $t0, $t4	#t6 = a(r^4 - 1)
	div $t6, $t5		#lo = a(r^4 - 1)/r - 1
	mflo $s3		#s3 = a(r^4 - 1)/r - 1
	
	li $v0, 10
	syscall	

	