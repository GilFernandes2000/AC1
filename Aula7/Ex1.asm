	.data
array:	.word"Arquitetura de Computadores"
	.eqv print_int10,1
	.text
	.globl main
main:	addi $sp,$sp,-4
	sw $ra,0($sp)
	la $a0,array
	jal strlen
	lw $ra,0($sp)
	addi $sp,$sp,4
	move $a0,$v0
	li $v0,1
	syscall
	jr $ra
	
strlen:	li $t1,0
while:	lb $t0,0($a0)
	addiu $a0,$a0,1
	beq $t0,'\0',endw
	addi $t1,$t1,1
	j while
	
endw:	move $v0,$t1
	jr $ra
