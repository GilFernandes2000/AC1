#Mapa de registos
# p: $t0
# p*: $t1
# i: $t2

	.data
	.eqv SIZE,3
	.eqv print_string,4
	.eqv print_char,11
array:	.word s1,s2,s3
s1:	.asciiz "Array"
s2:	.asciiz "de"
s3:	.asciiz "ponteiros"
	.text
	.globl main
	
main:	li $t2,0
	la $t0,array	#load do array para p
while:	bge $t2,SIZE,endw
	sll $t3,$t2,2	#i tem de ser multiplicado por 4
	addu $t3,$t0,$t3	
	lw $t1,0($t3)	#faz load do array na posicao i*4
	or $a0,$0,$t1
	li $v0,print_string
	syscall
	li $a0,'\n'
	li $v0,print_char
	syscall
	addi $t2,$t2,1
	j while
endw: 	jr $ra