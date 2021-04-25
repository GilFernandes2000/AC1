#Mapa de Registos
# i = $t0
# v = $t1
#val = $t2

	.data
array:	.word 8,4,15,-1987,327,-9,27,16
str1:	.asciiz "Result is: "
	.eqv SIZE,8
	.eqv print_string,4
	.eqv print_int10,1
	.eqv print_char,11
	.text
	.globl main
main:	
	li $t0,0
while:	
	la $t2,array
	li $t3,SIZE
	div $t3,$t3,2
	add $t2,$t0,$t3
	lw $t1,0($t2)
	addi $t0,$t0,1
	bge $t0,$t3,endw
	j while
endw:
	la $a0,str1
	li $v0,print_string
	syscall
	li $t0,0
while1:
	addi $t5,$t0,1
	lw $t2,0($t5)
	move $a0,$t2
	li $v0,print_int10
	syscall
	li $a0,','
	li $v0,print_char
	syscall
	addi $t0,$t0,1
	bge $t0,SIZE,endw1
	j while1
endw1:
	jr $ra
