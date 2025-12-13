#Sambit Sahoo 22277

.data
	mydetails: .asciiz "Sambit Sahoo 22277 \n\n"
	a_grade: .asciiz "Grade: A"
	b_grade: .asciiz "Grade: B"
	c_grade: .asciiz "Grade: C"
	f_grade: .asciiz "Grade: F"
	
	st1: .asciiz "Enter the marks of student: "

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
	move $t0, $v0      #t0 = entered marks

	li $t1, 40
	li $t2, 60
	li $t3, 80

	blt $t0, $t1, F

		blt $t0, $t2, C

			blt $t0, $t3, B
				
				A:
					li $v0, 4
					la $a0, a_grade
					syscall
					beq $0, $0, end_prog

			B:
				li $v0, 4
				la $a0, b_grade
				syscall
				beq $0, $0, end_prog
		
		C:
			li $v0, 4
			la $a0, c_grade
			syscall
			beq $0, $0, end_prog

	F:
		li $v0, 4
		la $a0, f_grade
		syscall
	
	end_prog:
		li $v0, 10
		syscall