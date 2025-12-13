#Sambit Sahoo 22277

.data
	mydetails: .asciiz "Sambit Sahoo 22277 \n\n"
	st1: .asciiz "Enter first number:"
	st2: .asciiz "Enter second number:"
	st3: .asciiz " is greater than "
	st4: .asciiz " is equal to "
	 
.text
.globl main
main:
	li $v0, 4
	la $a0, mydetails
	syscall

	li $v0, 4
	la $a0, st1
	syscall

	li $v0, 6
	syscall
	mov.s $f1, $f0

	li $v0, 4
	la $a0, st2
	syscall

	li $v0, 6
	syscall
	mov.s $f2, $f0
	
	c.le.s $f1, $f2
	bc1f first_greater
	
		c.eq.s $f1, $f2
		bc1t both_equal

			second_greater:
				li $v0, 2
				mov.s $f12, $f2
				syscall

				li $v0, 4
				la $a0, st3
				syscall
	
				li $v0, 2
				mov.s $f12, $f1
				syscall
		
				beq $0, $0, end_prog
		
			both_equal:
				li $v0, 2
				mov.s $f12, $f2
				syscall

				li $v0, 4
				la $a0, st4
				syscall
	
				li $v0, 2
				mov.s $f12, $f1
				syscall

				beq $0, $0, end_prog

		first_greater:
			li $v0, 2
			mov.s $f12, $f1
			syscall

			li $v0, 4
			la $a0, st3
			syscall
	
			li $v0, 2
			mov.s $f12, $f2
			syscall
	
		end_prog:
			li $v0, 10
			syscall
		
