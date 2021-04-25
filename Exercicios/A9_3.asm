	.data
arr:	.space 80
	.eqv read_double,7
	.eqv print_double,3
	.eqv SIZE,10
	.text
	.globl main
	
main:	addiu $s0,$sp,-4
	sw $ra,0($sp)
	li $t0,0
	la $t3,arr	#pode-se usar os registos t para chamar arrays de doubles
for1:	bge $t0,SIZE,endfor1
	li $v0,read_double
	syscall
	s.d $f0,0($t3)
	addi $t3,$t3,8 #aumenta sempre de 8 em 8 por ser um array de doubles
	addi $t0,$t0,1
	j for
endfor1:
	la $a0,arr
	li $a1,SIZE
	jal average
	mov.d $f12,$f0
	li $v0,print_double
	syscall
	
	lw $ra,0($sp)
	addi $sp,$sp,4
	jr $ra

average:
	move $t0,$a1
	li $t1,0
	mtc1 $t1,$f1

for:	ble $t0,0,endfor
	l.d $f2,0($a0)
	add.d $f1,$f1,$f2
	addi $a0,$a0,-8
	addi $t0,$t0,-1
	j for
endfor:	mtc1 $a1,$f4
	cvt.d.w $f4,$f4
	div.d $f12,$f1,$f4
	jr $ra