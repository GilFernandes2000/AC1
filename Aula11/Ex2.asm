	.data
	.eqv MAX_STUDENTS,4
	.eqv read_int,5
	.eqv print_string,4
	.eqv read_string,8
	.eqv read_float,6
	.eqv print_int10,1
	.eqv print_float,2
	
	.align 2
st_array:
	.space 174 	# 4*44
media:	.space 4
med: 	.asciiz "\nMedia: "
nmec: 	.asciiz "\nNmec: "
pNome:	.asciiz "\nPrimeiro nome: "
uNome:	.asciiz "\nUltimo nome: "
nota:	.asciiz "\nNota: "
	.text
	.globl main
	
main:	addi $sp,$sp,-4
	sw $ra,0($sp)
	la $a0,st_array
	li $a1,MAX_STUDENTS
	jal read_data
	
	la $a0,st_array
	li $a1,MAX_STUDENTS
	la $a2,media
	jal max
	
	move $t0,$v0
	
	la $a0,med
	li $v0,print_string
	syscall
	
	l.s $f12,media
	li $v0,read_float
	syscall	

	move $a0,$t0
	jal print_student
	
	lw $ra,0($sp)
	addi $sp,$sp,4
	
	jr $ra	
	
read_data:
	li $t0,0
	move $t1,$a0
	move $t2,$a1
	
rfor:	bge $t0,$t2,rforend

	la $a0,nmec
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	sw $v0,0($s0)
	
	la $a0,pNome
	li $v0,print_string
	syscall
	
	addi $t1,$t1,4
	
	add $a0,$t1,$0
	li $a1,18
	li $v0,read_string
	syscall
	
	la $a0,uNome
	li $v0,print_string
	syscall
	
	addi $t1,$t1,18
	
	add $a0,$t1,$0
	li $a1,15
	li $v0,read_string
	syscall
	
	la $a0,nota
	li $v0,print_string
	syscall
	
	li $v0,read_float
	syscall
	s.s $f0,0($t1)
	
	addi $t1,$t1,4
	addi $t0,$t0,1
	j rfor

rforend:
	jr $ra
	
max:	
	li $t0,-20
	mtc1 $t0,$f4
	cvt.s.w $f4,$f4
	li $t0,0
	mtc1 $t0,$f5
	cvt.s.w $f5,$f5
	move $t0,$a0
	mul $t1,$a1,44
	add $t1,$a0,$t1
	li $t2,0
	
maxfor:	bge $t0,$t1,maxforend
	
	l.s $f0,40($t0)
	add.s $f5,$f5,$f0
	
	c.lt.s $f4,$f0
	bc1f endif
	
	mov.s $f4,$f5
	move $t2,$t0
	
endif:	addi $t0,$t0,44
	j maxfor
	
maxforend:
	mtc1 $a1,$f6
	cvt.s.w $f6,$f6
	
	div.s $f0,$f5,$f6
	
	s.s $f0,0($a2)
	
	move $v0,$t2
	jr $ra
	
print_student:
	move $t0,$a0
	lw $a0,0($t0)
	li $v0,print_int10
	syscall
	
	lw $a0,4($t0)
	li $v0,print_string
	syscall
	
	lw $a0,22($t0)
	li $v0,print_string
	syscall
	
	l.s $f12,40($t0)
	li $v0,print_float
	syscall
	
	jr $ra