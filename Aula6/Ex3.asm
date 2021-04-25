#Mapa de registos
# i: $t0
# j: $t1
# p: $t2
# p*: $t3

	.data
	.eqv SIZE,3
	.eqv print_string,4
	.eqv print_int10,1
	.eqv print_char,11
str1:	.asciiz"\nString #"
str2:	.asciiz": "
s1:	.asciiz"Array"
s2:	.asciiz"de"
s3:	.asciiz"ponteiros"
array:	.word s1,s2,s3
	.text
	.globl main
	
main:	li $t0,0
	la $t2,array

for:	bge $t0,SIZE,endfor
	la $a0,str1
	li $v0,print_string
	syscall
	or $a0,$0,$t0
	ori $v0,$0,print_int10
	syscall
	la $a0,str2
	li $v0,print_string
	syscall
	li $t1,0
	
while:	sll $t4,$t0,2	#i*4
	addu $t4,$t2,$t4
	lw $t3,0($t4)	#array[i]
	addu $t3,$t3,$t1
	lb $t5,0($t3)	#array[i][j]
	beq $t5,'\0',endw
	or $a0,$0,$t5
	li $v0,print_char
	syscall
	li $a0,'-'
	li $v0,print_char
	syscall
	addiu $t1,$t1,1	#j++
	j while

endw:	addiu $t0,$t0,1	#i++
	j for
endfor:	jr $ra