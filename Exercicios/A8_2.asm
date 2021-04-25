	.data
	.eqv MAX_STR_SIZE,33
	.eqv print_string,4
	.eqv read_int,5
str:	.space MAX_STR_SIZE
str1:	.asciiz "\n"
	.text
	.globl main
	
main:	addiu $sp,$sp,-4
	sw $ra,0($sp)

do:	li $v0,read_int
	syscall
	move $t1,$v0
	li $t2,2
	la $t3,str
	la $t4,str1
	move $a0,$t1
	move $a1,$t2
	move $a2,$t3
	jal itoa
	move $a0,$v0
	li $v0,print_string 
	syscall
	move $a0,$t4
	li $v0,print_string
	syscall
	li $t2,8
	move $a0,$t1
	move $a1,$t2
	move $a2,$t3
	jal itoa
	move $a0,$v0
	li $v0,print_string
	syscall
	move $a0,$t4
	li $v0,print_string
	syscall
	li $t2,16
	move $a0,$t1
	move $a1,$t2
	move $a2,$t3
	jal itoa
	move $a0,$v0
	li $v0,print_string
	syscall
	move $a0,$t4
	li $v0,print_string
	syscall
	bne $t1,0,do
	
	li $v0,0
	jr $ra

# Mapa de registos
# n: $a0 -> $s0
# b: $a1 -> $s1
# s: $a2 -> $s2
# p: $s3
# digit: $t0
# Sub-rotina intermédia 

itoa:	addiu $sp,$sp,-20
	sw $s0,16($sp)
	sw $s1,12($sp)
	sw $s2,8($sp)
	sw $s3,4($sp)
	sw $ra,0($sp)
	move $s0,$a0
	move $s1,$a1
	move $s2,$a2
	move $s3,$a2
	
do1:	rem $t0,$s0,$s1
	div $s0,$s0,$s1
	move $a0,$t0
	jal toascii
	sb $v0,0($s3)
	addiu $s3,$s3,1
	bgt $s0,0,do1
	
	sb $s0,0($s3)
	move $a0,$s2
	jal strrev
	move $v0,$s2
	lw $s0,16($sp)
	lw $s1,12($sp)
	lw $s2,8($sp)
	lw $s3,4($sp)
	lw $ra,0($sp)
	addiu $sp,$sp,20
	jr $ra

toascii:
	move $v0,$a0
	addiu $v0,$v0,'0'
if:	ble $v0,'9',endif
	addiu $v0,$v0,7
endif:	jr $ra

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