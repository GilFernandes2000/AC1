	.data
	.eqv read_int,5
	.eqv print_double,3
	.text
	.globl main

main:	addiu $sp,$sp,-4
	sw $ra,0($sp)
	li $v0,read_int
	syscall
	move $t0,$v0
	mtc1 $t0,$f12
	cvt.d.w $f12,$f12
	jal f2c
	mov.d $f12,$f0
	li $v0,print_double
	syscall
	lw $ra,0($sp)
	addiu $sp,$sp,4
	jr $ra

f2c:	li $t0,5
	li $t1,9	# em vez $a0, as funcoes double recebem argumentos do tipo $f12
	li $t2,32
	
	mtc1 $t0,$f3	#e em consequencia estas funcoes devolvem $f0, e nao $v0
	mtc1 $t1,$f1
	mtc1 $t2,$f2
	
	cvt.d.w $f3,$f3
	cvt.d.w $f1,$f1
	cvt.d.w $f2,$f2
	
	div.d $f3,$f3,$f1
	sub.d $f2,,$f12,$f2
	mul.d $f0,$f3,$f2
	jr $ra