#Mapa de registos
#aux - $f1
#xn - $f2
#i - $t0
n1:	.float 0.5
	
sqrt:	li $t0,0
	li $t1,1
	la $f5,n1
	move $t3,$a0
	mtc1 $t1,$f1
	mtc1 $t1,$f2
	mtc1 $t0,$f3
	mtc1 $t3,$f10
	cvt.w.d $f1,$f1
	cvt.w.d $f2,$f2
	cvt.w.d $f3,$f3
	cvt.w.d $f10,$f10
	
	c.le.d $f10,$f3
	bc1t else
	
do:	mov.d $f1,$f2
	div.d $f4,$f0,$f2
	add.d $f2,$f2,$f4
	mul.d $f2,$f2,$f5
	c.eq.d $f1,$f2
	bc1f endo
	bge $t0,25,endo
	addi $t0,$t0,1
	j do
	
endo:	j endif

else:	mov.d $f2,$f3

endif:	mov.d $f0,$f2
	jr $ra
	