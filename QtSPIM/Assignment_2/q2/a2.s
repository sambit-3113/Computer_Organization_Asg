#Sambit Sahoo 22277

.data	
	st1: .asciiz "Enter principal amount: "
	st2: .asciiz "Enter interest rate: "
	st3: .asciiz "Enter time: "
	msgraw: .asciiz "Raw result (p*r*t) = "
	msgabsolute: .asciiz "\nAbsolute result (p*r*t/100) = "


.text
.globl main
main:
	li $v0, 4
	la $a0, st1
	syscall
	
	li $v0, 5       #v0 = 5 reads integer
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, st2
	syscall

	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 4
	la $a0, st3
	syscall	

	li $v0, 5
	syscall
	move $t2, $v0
	
	mul $t3, $t0, $t1
	mul $s0, $t3, $t2	#s0 = p*r*t

	li $v0, 4
	la $a0, msgraw
	syscall

	li $v0, 1
    	move $a0, $s0
    	syscall
	
	li $t4, 100
    	div $s0, $t4
    	mflo $s1                # s1 = (p*r*t) / 100

	li $v0, 4
	la $a0, msgabsolute
	syscall 

	li $v0, 1		# 1 to print integer value
    	move $a0, $s1
    	syscall

	li $v0, 10
	syscall