	.data
str1:	.asciiz "I serodatupomC ed arutetiurA"
str2:	.space 31
str3:	.asciiz "Strung too long: "
str4:	.asciiz "\n"
	.eqv print_string,4
	.eqv print_int10,1	
	.eqv STR_MAX_SIZE,30
	.text
	.globl main
	
main:	la $t1,str1
	la $t2,str2
	addiu $sp,$sp,-8
	sw $t1,4($sp)
	sw $ra,0($sp)
	move $a0,$t1
	jal strlen
	move $t3,$v0	#tamanho da str1
	lw $t1,4($sp)
	lw $ra,0($sp)
	addiu $sp,$sp,8
	
if:	bgt $t3,STR_MAX_SIZE,else
	addiu $sp,$sp,-12
	sw $t1,8($sp)
	sw $t2,4($sp)
	sw $ra,0($sp)
	move $a0,$t2
	move $a1,$t1
	jal strcpy
	move $t2,$v0	#str 1 copiada para str 2
	lw $t1,8($sp)
	lw $t2,4($sp)
	lw $ra,0($sp) 
	addiu $sp,$sp,-12
	move $a0,$t2
	li $v0,print_string
	syscall
	la $a0,str4
	li $v0,print_string
	syscall
	addiu $sp,$sp,-8
	sw $t2,4($sp)
	sw $ra,0($sp)
	move $a0,$t2
	jal strrev
	move $a0,$v0	#str2 mas ao contrario
	lw $t2,4($sp)
	lw $ra,0($sp)
	addiu $sp,$sp,8
	li $v0,print_string
	syscall
	j endif
	
else:	la $a0,str3
	li $v0,print_string
	syscall
	move $a0,$t3
	li $v0,print_int10
	syscall
	li $v0,-1
	jr $ra
	
endif:	li $v0,0
	jr $ra

strcpy:	
	li $t0,0
	add $t2,$t0,$a0
	add $t3,$t0,$a1
	lb $t4,0($t3)
do:	
	sb $t4,0($t2)
	addi $t0,$t0,1
	add $t2,$t0,$a0
	add $t3,$t0,$a1
	lb $t4,0($t3)
	beq $t4,'\0',while
	j do
while:	move $v0,$a0
	jr $ra

strlen:	li $t1,0
while3:	lb $t0,0($a0)
	addiu $a0,$a0,1
	beq $t0,'\0',endw
	addi $t1,$t1,1
	j while
endw:	move $v0,$t1
	jr $ra
	
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