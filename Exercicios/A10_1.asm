
xtoy:	li $t0,0
	li $t1,1
	mtc1 $t1,$f1
	cvt.w.s $f1,$f1
	
	move $s1,$a1
	move $s0,$a0
	
	addi $sp,$sp,-12
	sw $s0,8($sp)
	sw $s1,4($sp)
	sw $ra,0($sp)
	move $a0,$a1
	jal fabs
	lw $s0,8($sp)
	lw $s1,4($sp)
	lw $ra,0($sp)
	addi $sp,$sp,12
	
	move $t2,$v0
	mtc1 $s0,$f2
	
for:	bge $t0,$t2,endfor
	ble $s1,0,else
	mul.s $f1,$f1,$f2
	j endif
else:	div.s $f1,$f1,$f2

endif:	addi $t0,$t0,1
	j for
	
endfor:	mov.s $f0,$f1
	jr $ra

		
fabs:	move $t0,$a0
	bge $t0,0,endif1
	
	mul $t0,$t0,-1
endif1:	move $v0,$t0
	jr $ra
	