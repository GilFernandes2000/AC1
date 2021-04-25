	.data
	.align 2
	.eqv read_int,5
	.eqv print_string,4
	.eqv print_int10,1
	.eqv print_float,2
	.eqv read_string,8
	.eqv read_float,6
student:
	.space 4
	.space 18
	.space 15
	.space 3
	.space 4
nmec:	.asciiz "\nN. Mec: "
nome:	.asciiz "\nNome: "
vir:	.asciiz ","
nota:	.asciiz "\nNota: "
pNome:	.asciiz "\n Primeiro Nome: "
uNome:	.asciiz "\n Ultimo nome: "
	.text
	.globl main

main:	la $s0,student 	#????
	
	la $a0,nmec
	li $v0,print_string	# print da strng "nmec"
	syscall
	
	li $v0,read_int
	syscall		#ler um int p que é associado ao nmec
	sw $v0,0($s0)	#começa a guardar os valores lidos do teclado
	
	la $a0,pNome
	li $v0,print_string
	syscall			#print da string pNome
	
	addi $a0,$s0,4	#adiciona 4 por causa do numero lido acima
	li $a1,17	#string de tamanho 17 deixando um para o terminador
	li $v0,read_string
	syscall
	
	la $a0,uNome
	li $v0,print_string	#print da string uNome
	syscall
	
	addi $a0,$s0,22	# 4+18 = 22(numero + string)
	li $a1,14	#tamanho da string menos o terminador
	li $v0,read_string
	syscall
	
	la $a0,nota
	li $v0,print_string	#print da string nota
	syscall
	
	li $v0,6	#le a nota, que neste caso é um float
	syscall
	
	s.s $f0,40($s0) #ultimo valor a ser guardado
	
	la $a0,nmec
	li $v0,print_string
	syscall
	
	lw $a0,0($s0) #print do primeiro valor do registo $0
	li $v0,print_int10
	syscall
	
	la $a0,nome
	li $v0,print_string
	syscall
	
	lw $a0,4($s0)
	li $v0,print_string	#vai buscar a proxima word, neste caso como o int ocupa 4 a proxima encontra-se em 4($s0)
	syscall
	
	la $a0,vir
	li $v0,print_string	#print da string virgula
	syscall 
	
	lw $a0,22($s0)		#vai buscar a proxima word. A anterior ocupa 18 espaços, logo 18 + 4 = 22, daí 22($s0)
	li $v0,print_string
	syscall
	
	la $a0,nota
	li $v0,print_string
	syscall
	
	l.s $f12,40($s0)	#vai buscar a proxima word.
	li $v0,print_float
	syscall
	
	li $v0,0
	jr $ra	