#Sambit Sahoo 22277

.data
	mydetails: .asciiz "Sambit Sahoo 22277 \n\n"
	st1: .asciiz "Enter student's name: "
	st2: .asciiz "Total classes attended by the student: "
	st3: .asciiz "Total number of classes held: "
	msg1:.asciiz " is allowed to sit in the exam."
	msg2:.asciiz " is not allowed to sit in the exam."
	name: .space 26
	 
.text
.globl main
main:
	li $v0, 4
	la $a0, mydetails
	syscall

	li $v0, 4
	la $a0, st1
	syscall

	li $v0, 8
	la $a0, name
	li $a1, 26
	syscall

	li $v0, 4
	la $a0, st2
	syscall

	li $v0, 6
	syscall
	mov.s $f1, $f0

	li $v0, 4
	la $a0, st3
	syscall

	li $v0, 6
	syscall
	mov.s $f2, $f0

	div.s $f3, $f1, $f2
	li.s $f0, 0.75

	c.lt.s $f3, $f0
	bc1f allowed
	
		not_allowed:
			li $v0, 4
			la $a0, name
			syscall
			
			li $v0, 4
			la $a0, msg2
			syscall
			beq $0, $0, end_prog

		allowed:
			li $v0, 4
			la $a0, name
			syscall
			
			li $v0, 4
			la $a0, msg1
			syscall
	
		end_prog:
			li $v0, 10
			syscall
		
