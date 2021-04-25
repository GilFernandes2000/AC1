#Mapa de registos
#divisor: $t0
#dividendo : $t1
#quociente : $t2
#resto :  $t3
#i : $t4
#bit : $t5
	.data
	.eqv print_int10,1
	.eqv read_int,5
	.eqv print_string,4
str1:	.asciiz"Dividendo: "
str2:	.asciiz"Divisor: "
str3:	.asciiz"Resultado: "
	.text
	.globl main
main:	
	li $a0,34
	li $a1,2
	addi $sp,$sp,-4
	sw $ra,0($sp)
	jal divi
	move $a0,$v0
	li $v0,1
	syscall
	lw $ra,0($sp)
	addi $sp,$sp,4
	jr $ra
	
divi:	move $t1,$a0
	move $t0,$a1
	sll $t0,$t0,16
	andi $t1,$t1,0xFFFF
	sll $t1,$t1,1
	li $t4,0
	
for:	bge $t4,16,endfor
	li $t5,0

if:	blt $t1,$t0,endif
	sub $t1,$t1,$t0
	li $t5,1
endif:	
	sll $t1,$t1,1
	or $t1,$t1,$t5
	addi $t4,$t4,1
	j for
endfor:	
	srl $t3,$t1,1
	andi $t3,$t3,0xFFFF0000
	andi $t2,$t1,0xFFFF
	or $v0,$t3,$t2
	jr $ra