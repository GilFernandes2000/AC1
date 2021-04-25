#Mapa de registos
# p: $t0
# **p: $t1
# **punultimo: $t2

	.data
s1:	.asciiz"Array"
s2:	.asciiz"de"
s3:	.asciiz"ponteiros"
	.eqv SIZE,3
	.eqv print_string,4
	.eqv print_char,11
array:	.word s1,s2,s3
	.text
	.globl main
	
main:	li $t4,SIZE
	sll $t4,$t4,2
	la $t0,array
	addu $t4,$t0,$t4

while:	bge $t0,$t4,endw
	lw $t1,0($t0)
	or $a0,$0,$t1
	li $v0,print_string
	syscall
	li $a0,'\n'
	li $v0,print_char
	syscall
	addi $t0,$t0,4
	j while

endw:	jr $ra
