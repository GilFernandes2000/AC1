	.data
	.text
	
xtoy:	li $t0,0
	li $t1,1
	mtc1 $t1,$f0
	move $t2,$a0
	mtc1 $t2,$f1
	abs $t3,$a1

for:	bge $t0,$t3,endfor
	
if:	ble $a1,0,else
	add.d $f0,$f0,$f1
	
else:	div.d $f0,$f0,$f1
	addi $t0,$t0,1
	j for
endfor:
	jr $ra