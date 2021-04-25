	.data
str:	.asciiz "ITED - orievA ed edadisrevinU"
	.eqv print_string,4
	.text
	.globl main
	
main:	addiu $sp,$sp,-4
	sw $ra,0($sp)
	la $a0,str
	jal strrev
	move $a0,$v0
	li $v0,print_string
	syscall
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra

#Mapa de ref«gistos
#str: $a0
#p1: $s1
#p2: $s2

strrev:	
	move $s0,$a0
	move $s1,$a0
	move $s2,$a0
	
while1:	lb $t0,0($s2)
	beq $t0,'\0',endw1
	addiu $s2,$s2,1
	j while1
endw1:	addi $s2,$s2,-1
	
while2:	bge $s1,$s2,endw2
	addiu $sp,$sp,-12
	sw $s1,8($sp)
	sw $s2,4($sp)
	sw $ra,0($sp)
	move $a0,$s1
	move $a1,$s2
	jal exchange
	lw $s1,8($sp)
	lw $s2,4($sp)
	lw $ra,0($sp)
	addiu $sp,$sp,12
	addi $s1,$s1,1
	addi $s2,$s2,-1
	j while2
endw2:	move $v0,$s0
	
	jr $ra

exchange:
	lb $t0,0($a0)
	lb $t1,0($a1)
	sb $t0,0($a1)
	sb $t1,0($a0)
	jr $ra
