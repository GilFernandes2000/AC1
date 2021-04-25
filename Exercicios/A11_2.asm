	.data
str1:	.asciiz "id: "
str2:	.asciiz "first _name: "
str3:	.asciiz "last_name: "
str4:	.asciiz "grade: "
str5:	.asciiz "MAX: "
	.eqv read_string,8
	.eqv read_int,5
	.eqv read_float,6
	.eqv print_string,4
	.eqv print_int,1
	.eqv print_char,11
	.eqv print_float,2
	.eqv S_First,18
	.eqv S_Last,15
	.eqv Max_Students,2
	.align 2
#student:
#	.space 4 	# id 1 word
#	.space 18
#	.asciiz "" 	# first_name 4º byte até 22º byte
#	.space 2
#	.space 15
#	.asciiz ""	# last_name 24º byte até 39º byte
#	.space 1
#	.float 0.0	
# espaço total 1+3+18+2+15+1+4 = 44
#tamanho do array: 44*4 = 176
arr_student:
	.space 176
	.text
	.globl main
	
read_data:
	move $t1,a0	#chamada da classe
	move $t2,$a1	#tamanho do array de estudantes
	li $t0,0	#arr_stdent[i]

forClass:
	bge $t0,$t2,endforClass
	
	la $a0,str1
	li $v0,print_string
	syscall
	li $v0,read_int
	syscall
	sw $v0,0($t1)
	
	la $a0,str2
	li $v0,print_string
	syscall
	addi $a0,$t1,4
	li $a1,S_First
	li $v0,read_string
	syscall
	sw $v0,4($t1)
	
	la $a0,str3
	li $v0,print_string
	syscall
	addi $a0,$t1,24
	li $a1,S_Last
	li $v0,read_string
	syscall
	sw $v0,24($t1)
	
	la $a0,str4
	li $v0,print_string
	syscall
	li $v0,read_float
	syscall
	move $f12,$f0,
	cvt.s.w $f12,$f12
	s.s $f12,40($t1)
	
	addi $t0,$t0,1
	
	addi $t1,$t1,44
	j forClass
	
endforClass:
	jr $ra
	
print_student:
	move $t0,$a0
	
	lw $a0,0($t0)
	li $v0,print_int
	syscall
	move $t3,$t0
	
	li $a0,'\n'
	li $v0,print_string
	syscall
	
	addi $a0,$t0,4
	li $v0,print_string
	syscall
	li $a0,'\n'
	li $v0,print_string
	syscall
	
	addi $a0,$t0,24
	li $v0,print_string
	syscall
	li $a0,'\n'
	li $v0,print_string
	syscall
	
	jr $ra
	