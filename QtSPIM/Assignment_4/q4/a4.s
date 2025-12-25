# Sambit Sahoo 22277

.data
	mydetails: .asciiz "Sambit Sahoo 22277 \n\n"
	msg1: .asciiz "Give the input k = "
	printnewline: .asciiz "\n"	


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
	move $t0, $v0	#t0 = n

	li $t1, 1				#for i = 1
	
	
	loop1:
		bgt $t1, $t0, exit		#i > n
		sub $t2, $t0, $t1		#t2 = n - i


		
		li $t3, 1			#for j = 1
		loop1a:
			bgt $t3, $t2, break1a	#j > n - i
			
			li $v0, 11
			li $a0, 32		#prints space " "
			syscall
			
			addi $t3, $t3, 1	#t3++  (j++)
			j loop1a
		break1a:


		
		li $t3, 1			#for j = 1
		loop1b:
			bgt $t3, $t1, break1b	#j <= i
			
			li $v0, 1
			move $a0, $t3
			syscall			#prints j

			addi $t3, $t3, 1	#j++
			j loop1b
		break1b:



		move $t3, $t1			#for j = i
		li $t4, 2			
		loop1c:
			blt $t3, $t4, break1c	#j < 2
			
			addi $t5, $t3, -1
			li $v0, 1
			move $a0, $t5
			syscall			#prints j-1

			addi $t3, $t3, -1	#j--
			j loop1c
		break1c:
	
		addi $t1, $t1, 1		#t1++  (i++)	


		li $v0, 4
		la $a0, printnewline		#print newline
		syscall

		j loop1

	exit:
		li $v0, 10
		syscall
	

	