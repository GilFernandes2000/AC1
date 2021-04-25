# Mapa de registos
# p: $t0
# p* $t1
# lista+SIZE: $t2
# houve_troca: $t4
# i: $t5
# lista: $t6
# lista + i: $t7
 	.data
str1:	.asciiz ";"
str2:	.asciiz "\nIntroduza um numero\n"
	.eqv FALSE,0
 	.eqv TRUE,1
 	.eqv SIZE,10
 	.eqv read_int,5
 	.eqv print_int10,1
 	.eqv print_string,4
 	.align 2
lista:	.space 20
 	.text
 	.globl main
main: 	
	li $t5,0
while:	bge $t5,SIZE,endw1
	la $a0,str2
	li $v0,print_string
	syscall
	li $v0,read_int
	syscall
	la $t6,lista
	sll $t7,$t5,2
	addu $t7,$t7,$t6
	sw $v0,0($t7)
	addi $t5,$t5,1
	j while
endw1:	
	la $t6,lista
	 # código para leitura de valores
do: 		# do {
 	li $t4,FALSE # houve_troca = FALSE;
 	li $t5,0 # i = 0;
for: 	bge $t5,SIZE,endfor # while(i < SIZE-1){


if: 	sll $t7,$t5,2 # $t7 = i * 4
 	addu $t7,$t7,$t6 # $t7 = &lista[i]
 	lw $t8,0($t7) # $t8 = lista[i]
 	lw $t9,4($t7) # $t9 = lista[i+1]
 	ble $t8,$t9,endif # if(lista[i] > lista[i+1]){
 	sw $t8,4($t7) # lista[i+1] = $t8
 	sw $t9,0($t7) # lista[i] = $t9
 	li $t4,TRUE #
 		# }
endif: 	addi $t5,$t5,1 # i++;
	j for

endfor:	beq $t4,TRUE,do # } while(houve_troca == TRUE);

endw:	li $t2,SIZE
	sll $t2,$t2,2
	addu $t2,$t6,$t2	#lista + SIZE


while2:	bge $t0,$t2,endw2
	lw $t1,0($t6)
	or $a0,$0,$t1
	ori $v0,$0,print_int10
	syscall
	la $a0,str1
	li $v0,print_string
	syscall
	addiu $t6,$t6,4
	j while2
 		# conteudo do array
endw2:	jr $ra # termina o programa 
