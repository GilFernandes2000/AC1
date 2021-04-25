#Mapa de registos
#res:	$v0
#s:	$a0
#*s:	$t0
#digit:	$t1
	.data
str1:	.asciiz "2016 e 2020 sao anos bissextos"
	.eqv print_int10,1
	.text
	.globl main

main:	addiu $sp,$sp,-4
	sw $ra,0($sp)
	la $t0,str1
	move $a0,$t0
	jal atoi
	lw $ra,0($sp)
	addiu $sp,$sp,4
	move $a0,$v0
	li $v0,print_int10
	syscall
	li $v0,0
	jr $ra
	
atoi:	li $v0,0

while:	lb $t0,0($a0)
	blt $t0,'0',endw
	bgt $t0,'9',endw
	sub $t1,$t0,'0'
	addiu $a0,$a0,1
	mul $v0,$v0,10
	add $v0,$v0,$t1
endw:	jr $ra