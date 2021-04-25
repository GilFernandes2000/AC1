#Mapa de registos 
# std - $t2
# n - $t1
# i - $t0
# sum - $f2
	
	.data
	.eqv print_string,4
	.eqv print_float,2
n1:	.float 2.0
n2:	.float 17.2
n3:	.float 12.5
	.align 2
 	
 	#50+4+4+1 = 59
 	#tamanho do array = 59*4=236
student:
	.space 236
	.text
	.globl main
	
fun3:	li $t0,0
	move $t1,$a1
	move $t2,$a0
	mtc1 $t0,$f2
	cvt.s.w $f2,$f2
	
for:	bge $t0,$t1,endfor
	addi $a0,$t2,0
	li $v0,print_string
	syscall
	
	addi $a0,$t2,50
	mov.s $f12,$a0
	li $v0,print_float
	syscall
	
	add.s $f2,$f2,$f12
	
	addi $t2,$t2,9
	addi $t0,$t0,4
	j for
	
endfor:	div.s $f0,$f2,n1
	jr $ra
	
main:	
	