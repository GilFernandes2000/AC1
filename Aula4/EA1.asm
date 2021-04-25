#Mapa de registos
# $t0 = p
# $t1 = p*

	.data
str1:	.asciiz"Introduza uma string: "
	.eqv SIZE,20
	.eqv print_string,4
	.eqv read_string,8
str:	.space SIZE
	.text
	.globl main
main:	la $a0,str1		#printa da str1
	li $v0,print_string	
	syscall
	
	la $a0,str
	li $a1,SIZE
	li $v0,read_string	#le a string do teclado e aloca-a no registo $t0
	syscall
	la $t0,str
	
while:				#while(*p != '\0')
	lb $t1,0($t0)
	beq $t1,0,endw
	subu $t1,$t1,'a'
	addi $t1,$t1,'A'
	addiu $t0,$t0,1
	j while
	
endw:	la $a0,str
	li $v0, print_string
	syscall
	jr $ra