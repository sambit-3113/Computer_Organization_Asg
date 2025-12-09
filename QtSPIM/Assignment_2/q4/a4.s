#Sambit Sahoo 22277

.data
	msg1: .asciiz "Enter str1: "
	msg2: .asciiz "\nEnter str2: "
	msg3: .asciiz "\nHamming distance: "
	string1: .space 3
	string2: .space 3


.text
.globl main
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 8
	la $a0, string1
	li $a1, 3
	syscall

	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 8
	la $a0, string2
	li $a1, 3
	syscall

	la $s1, string1		
	lbu $t0, 0($s1)	
	lbu $t1, 1($s1)

	la $s2, string2		
	lbu $t2, 0($s2)	
	lbu $t3, 1($s2)

	sne $t4, $t0, $t2
	sne $t5, $t1, $t3

	li $v0, 4
	la $a0, msg3
	syscall

	li $v0, 1
	move $a0, $t4
	syscall
	
	li $v0, 1
	move $a0, $t5
	syscall

	li $v0, 10
	syscall
	