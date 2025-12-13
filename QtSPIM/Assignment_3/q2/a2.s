#Sambit Sahoo 22277

.data
	mydetails: .asciiz "Sambit Sahoo 22277 \n\n"
	st1: .asciiz "Enter the year:"
	st2: .asciiz " is a leap year"
	st3: .asciiz " is not a leap year"
	 

.text
.globl main
main:
	li $v0, 4
	la $a0, mydetails
	syscall

	li $v0, 4
	la $a0, st1
	syscall

	li $v0, 5
	syscall
	move $t0, $v0		#t0 = year

	li $t1, 400
	div $t0, $t1
	mfhi $t2
	
	li $t3, 100
	div $t0, $t3
	mfhi $t4

	li $t5, 4
	div $t0, $t5
	mfhi $t6

	beq $t2, $0, div_by_400
	
		beq $t4, $0, div_by_100

			beq $t6, $0, div_by_4
	
				li $v0, 1
				move $a0, $t0
				syscall

				li $v0, 4
				la $a0, st3
				syscall

				beq $0, $0, end_prog


				div_by_4:
					li $v0, 1
					move $a0, $t0
					syscall

					li $v0, 4
					la $a0, st2
					syscall
	
					beq $0, $0, end_prog
		
			div_by_100:
				li $v0, 1
				move $a0, $t0
				syscall

				li $v0, 4
				la $a0, st3
				syscall

				beq $0, $0, end_prog

		div_by_400:
			li $v0, 1
			move $a0, $t0
			syscall

			li $v0, 4
			la $a0, st2
			syscall
	
		end_prog:
			li $v0, 10
			syscall
		
