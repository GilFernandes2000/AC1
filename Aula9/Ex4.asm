	.data
	.text
	
max:	li $t0,0
	mtc1 $t0,$f0
	
maxfor:	bge $t0,$a1,maxendf
	l.d $f2,0($a0)
	c.le.d $f2,$f0
maxif:	bc1f maxendif
	mov.d $f0,$f2
maxendif:
	addi $t0,$t0,8
	addi $t0,$t0,1
	j maxfor
maxendf:
	jr $ra