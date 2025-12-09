#Sambit Sahoo 22277

.data
	message1: .asciiz "Enter your first name:"
	message2: .asciiz "Hi "
	message3: .asciiz ", MIPS assembly programming is very exciting to learn"
	name: .space 26

.text
.globl main
main:
	li $v0, 4
	la $a0, message1	#Enter your first name:
	syscall

	li $v0 8		
	la $a0, name		#input		
	li $a1, 26
	syscall 
	
	li $v0, 4
	la $a0, message2	#Hi
	syscall

	li $v0, 4
	la $a0, name		#print name
	syscall

	li $v0, 4
	la $a0, message3	#, MIPS assembly programming is very exciting to learn.
	syscall

	li $v0, 10
    	syscall