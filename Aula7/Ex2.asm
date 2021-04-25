# Mapa de registos:
# str: $a0 -> $s0 (argumento é passado em $a0)
# p1: $s1 (registo callee-saved)
# p2: $s2 (registo callee-saved)
	.data
str1:	.asciiz "ITED -orievA ed edadisrevinU"
	.eqv print_string,4
	.text
	
strrev: addiu $sp,$sp,-16 	# reserva espaço na stack
 	sw $ra,0($sp) 		# guarda endereço de retorno
 	sw $s0,4($sp) 		# guarda valor dos registos
	sw $s1,8($sp) 		# $s0, $s1 e $s2
 	sw $s2,12($sp) 		#
 	move $s0,$a0 		# registo "callee-saved"
 	move $s1,$a0 		# p1 = str
 	move $s2,$a0 		# p2 = str
while1: 			# while( *p2 != '\0' ) {
 	lb $t0,0($s2)
 	beq $t0,'\0',endw1
 	addiu $s2,$s2,1 			# p2++;
 	j while 			# }
endw1:	sub $s2,$s2,-1 			# p2--;
while2: 
	bge $s1,$s2,endw2
	addi $sp,$sp,-12			# while(p1 < p2) {
 	sw $t0,8($sp)
 	sw $t1,4($sp)
 	sw $ra,0($sp)
 	move $a0,$t0 		#
 	move $a1,$t1 		#
 	jal exchange
 	lw $ra,0($sp)
 	lw $t1,4($sp)
 	lw $t0,8($sp)
 	addi $sp,$sp,12 		# exchange(p1,p2)
 	addiu $t0,$t0,1
 	addiu $t1,$t1,-1
 	j while2
endw2:				# }
			# liberta espaço da stack
 	jr $ra 			# termina a sub-rotina 

exchange:
	lb $t0,0($a0)
	lb $t1,0($a1)
	sb $t0,0($a1)
	sb $t1,0($a0)
