	.data
str1:	.asciiz "Arquitetura de "
str2:	.space 50
str3:	.asciiz "Computadores I"
str4:	.asciiz "\n"
	.eqv print_string,4
	.text
	.globl main
	
main:	la $t2,str2
	addiu $sp,$sp,-8
	sw $t2,4($sp)
	sw $ra,0($sp)
	la $t1,str1
	move $a0,$t2
	move $a1,$t1
	jal strcpy
	lw $t2,4($sp)
	lw $ra,0($sp)
	addiu $sp,$sp,8
	li $v0,print_string
	syscall
	la $a0,str4
	li $v0,print_string
	syscall
	addiu $sp,$sp,-4
	sw $ra,0($sp)
	la $t3,str3
	move $a0,$t2
	move $a1,$t3
	jal strcat
	lw $ra,0($sp)
	addiu $sp,$sp,4
	li $v0,print_string
	syscall
	li $v0,0
	jr $ra

strcat:	
	move $t0,$a0
while:	lb $t1,0($t0)
	beq $t1,'\0',endwhile
	addi $t0,$t0,1
	j while
endwhile:
	addi $sp,$sp,-8
	sw $ra,4($sp)
	sw $a0,0($sp)
	move $a0,$t0
	jal strcpy
	lw $v0,0($sp)
	lw $ra,4($sp)
	addi $sp,$sp,8
	jr $ra
	
	
strcpy:	
	move $t0,$a0
	move $t1,$a1
	lb $t2,0($t1)
do:	sb $t2,0($t0)
	addi $t0,$t0,1
	addi $t1,$t1,1
	lb $t2,0($t1)
	beq $t2,'\0',enddo
	j do
enddo:	move $v0,$a0
	jr $ra