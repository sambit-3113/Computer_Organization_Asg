#Sambit Sahoo 22277
.data
	mydetails: .asciiz "Sambit Sahoo 22277 \n\n"
	msg0: .asciiz "Enter the number n: "
	msg1: .asciiz " number of fibonacci series is stored at memory location "
	msg2: .asciiz "fibonacci series: "
	mem1: .byte 0
	msg3: .asciiz ", "
	msg4: .asciiz "\n"
.text
.globl main
main:
	li $v0, 4
	la $a0, mydetails
	syscall

	li $v0, 4
	la $a0, msg0
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0			#t0 = n
	
	la $t2, mem1
	li $t3, 1
	sb, $t3, 4($t2)			#memory[mem1 + 4] = 1 
	
	#Fibonacci logic
	li $t4, 3			#j = 1
	loop2:
		bgt $t4, $t0, break2
		
		lbu $t5, 0($t2)		#t5 = memory[mem1]
		lbu $t6, 4($t2)		#t6 = memory[mem1 + 4]
		add $t7, $t6, $t5
		sb $t7, 8($t2) 		#memory[mem1 + 8] = t7

		addi $t4, $t4, 1	#j++
		
		addi $t2, $t2, 4	#mem1 = mem1 + 4
		j loop2
	break2:

	li $t1, 1			#i = 1
	la $t2, mem1			#again initializing
	loop1:
		bgt $t1, $t0, break1
		
		li $v0, 1
		move $a0, $t1
		syscall			#prints 1, 2, 3......

		li $v0, 4
		la $a0, msg1
		syscall			#prints "number of fibonacci series is stored at memory location"

		li $v0, 1
		move $a0, $t2		#prints the current $t2 or mem1
		syscall
		
		li $v0, 11
		li $a0, 10		#prints \n
		syscall

		addi $t2, $t2, 4	#updates by mem1 = mem1 + 4
		addi $t1, $t1, 1	#i++
		j loop1
	break1:

	li $v0, 11
	li $a0, 10		#prints \n
	syscall

	li $v0, 4
	la $a0, msg2
	syscall			#prints "fibonacci series: "

	li $t1, 1
	la $t2, mem1
	addi $t0, $t0, -1
	loop3:
			
		lbu $t9, 0($t2)
		li $v0, 1
		move $a0, $t9		
		syscall			#prints the current value of $t2 or mem1 

		bgt $t1, $t0, break3

		li $v0, 4
		la $a0, msg3
		syscall

		addi $t2, $t2, 4	#updates by mem1 = mem1 + 4
		addi $t1, $t1, 1	#i++
		j loop3
	break3:

	exit:
		li $v0, 10
		syscall