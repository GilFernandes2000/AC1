	.data
array:	.space 88
	.text
	.globl main
	
average:
	li $t0,0
	mtc1 $t0,$f0

for:	bge $t0,$a1,endfor
	l.d $f4,0($a0)
	add.d $f6,$f4,$f6
	addi $a0,$a0,8
	addi $t0,$t0,1
	j for
endfor:
	mtc1 $a1,$f2
	cvt.d.w $f2,$f2
	div.d $f0,$f6,$f2
	jr $ra
	
main:	