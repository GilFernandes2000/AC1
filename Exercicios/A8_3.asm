#Mapa de registos
#i:		$t0
#bit:		$t1
#quociente:	$t2
#resto:		$t3

divs:	sll $a1,$a1,16
	andi $a0,$a0,0xFFFF
	sll $a0,$a0,1
	
	li $t0,0
for:	bge $t0,16,enfor
	li $t1,0
if:	blt $a0,$a1,endif
	sub $a0,$a0,$a1
	li $t1,1
endif:	sll $t4,$a0,1
	or $a0,$t4,$t1
	addiu $t0,$t0,1
endfor:	srl $t4,$a0,1
	andi $t3,$t4,0xFFFF0000
	andi $t2,$a0,0xFFFF
	or $v0,$t3,$t2
	jr $ra