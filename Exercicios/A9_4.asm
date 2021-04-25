

max:	li $t0,1
	move $t1,$a0
	mtc1 $t1,$f0
	cvt.d.w $f0,$f0
	mtc1 $t0,$f2
	cvt.d.w $f2,$f2
	mtc1 $a1,$f1
	cvt.d.w $f1,$f1
	add.d $f3,$f0,$f1
	sub.d $f3,$f3,$f2
	l.d $f4,0($a0)
	addi $a0,$a0,8
	
for:	mtc1 $a0,$f0
	cvt.w.d $f0,$f0
	c.le.d $f0,$f3
	bc1f endfor
	l.d $f5,0($a0)
	c.le.d $f5,$f4
if:	bc1t endif
	mov.d $f4,$f5
endif:	addi $a0,$a0,8
	j for
endofor:
	mov.d $f0,$f4
	jr $ra
	