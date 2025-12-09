#Sambit Sahoo 22277

.data
	st1: .asciiz "Enter a three char string: "
	string: .space 4	#4 is allocated as there is a null string.
	st2: .asciiz "\n The second char is: "


.text
.globl main
main:
	#Print "Enter a three char string"
	li $v0, 4
	la $a0, st1
	syscall


	#Read the string
	li $v0, 8
	la $a0, string
	li $a1, 4
	syscall


	la $t0, string		# load address of string
	lbu $t1, 1($t0)		# load second byte (unsigned) into $t1
	
	
	#Print "The second char is:"
	li $v0, 4
	la $a0, st2
	syscall


	# Print the second character
	li $v0, 11
	move $a0, $t1		#move as la expects label not register
	syscall
	

	li $v0, 10
    	syscall

	
	
	