# Mapa de registos
# res: $v0
# s: $a0
# *s: $t0
# digit: $t1

	.data
	.eqv print_int10,1
str:	.asciiz"2016 e 2020 sao anis bissextos"
	.text
	.globl main
	
main:	addi $sp,$sp,-4
	sw $ra,0($sp)
	la $a0,str
	jal atoi
	lw $ra,0($sp)
	addi $sp,$sp,4
	move $a0,$v0
	li $v0,print_int10
	syscall
	jr $ra

atoi:	li $v0,0
while:	lb $t0,0($a0)
	blt $t0,'0',endw
	bgt $t0,'9',endw
	sub $t1,$t0,'0'
	addiu $a0,$a0,1
	mul $v0,$v0,10
	add $v0,$v0,$t1
	j while
endw:	
	jr $ra
