# Sambit Sahoo 22277

.data	
	mydetails: .asciiz "Sambit Sahoo 22277 \n\n"
	msg1: .asciiz "Enter a number: "
	msg2: .asciiz "\n"


.text
.globl main
main:
	li $v0, 4
	la $a0, mydetails
	syscall

	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0		#t0 = n

	loop:
		ble $t0, $0, exit	#if n<=0

		li $v0, 1	#Print current number
		move $a0, $t0
		syscall

		li $v0, 4	#newline
		la $a0, msg2
		syscall

		addi $t0, $t0, -1	#decrement
		j loop

	exit:
		li $v0, 10
		syscall
	