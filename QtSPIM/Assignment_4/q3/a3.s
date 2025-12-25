# Sambit Sahoo 22277

.data
	mydetails: .asciiz "Sambit Sahoo 22277 \n\n"
	msg: .asciiz "$t0 = j \n$t1 = a"

.text
.globl main
main:
	li $v0, 4
	la $a0, mydetails
	syscall
	
	li $t0, 1	#j = 1
	li $t1, 0	#a = 0
	li $t2, 20	#t2 = 20
	loop1:
		bgt $t1, $t2, break1	
		addi $t0, $t0, 1
		addi $t1, $t1, 2
		j loop1
	break1:

	loop2:
		addi $t0, $t0, 1
		li $t3, 100
		blt $t0, $t3, loop2
		
	break2:

	loop3:
		ble $t1, $0, break3
		addi $t0, $t0, -1
		addi $t1, $t1, -1
		j loop3
	break3:
	
	li $v0, 4
	la $a0, msg
	syscall

	exit:
		li $v0, 10
		syscall



