	.data
num:	.float 2.5937
zero:	.float 0.0
	.eqv read_int,5
	.eqv print_float,2
	.text
	.globl main

main:	
do:	li $v0,read_int
	syscall
	mtc1 $v0,$f0
	cvt.s.w $f0,$f0
	l.s $f1,num
	mul.s $f2,$f0,$f1
	li $v0,print_float
	mov.s $f12,$f2
	syscall
	l.s $f3,zero
	c.eq.s $f2,$f3
	bc1t enddo
	j do
	
enddo:	li $v0,0
	jr $ra