#Mapa de registos
# k -> $t0
# *a ->$a0
# N -> $a1
# *b ->$a2
# $f2 valor de a*
# $f4 valor de b*
# $f6 const compare
# $f8 const 2 para dividir
# p -> $t1


	.data
	.text
	
fun1:	li $t0,0		#int k = 0
	li $t2,2
	
	mtc1 $t2,$f8
	mtc1 $zero,$f6
	cvt.d.w $f8,$f8		#2.0
	cvt.d.w $f6,$f6 	#0.0
	
	addu $t2,$a0,$a1	# a+N
	or $t1,$a0,$0		# p = a
	
for:
	bge $t1,$t2,endfor
	l.d $f2,0($t1)		#*p
	
	div.d $f10,$f2,$f8	#(*p/2.0)
	c.eq.d $f10,$f6		#if((*p/2.0) != 0.0)
	bc1t else
	s.d $f2,0($a2)		# *b = *p
	addiu $a2,$a2,8		#b++
	j endif
	
else:	addiu $t0,$t0,1		#k++

endif:	addiu $t1,$t1,1		#p++
	j for
	
endofor:
	sub $v0,$a1,$t0		#return (N-k)
	jr $ra