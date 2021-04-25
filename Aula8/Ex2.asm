	.data
	.text
	.globl strrev
	
	
itoa:	addiu $sp,$sp,-16
	sw $s0,12($sp)
	sw $s1,8($sp)
	sw $s2,4($sp)
	sw $ra,0($sp)
	
	move $s0,$a0
	move $s1,$a1
	move $s2,$a2
	move $s3,$a2
	
do:	rem $t0,$s0,$s1
	div $s0,$s0,$s1
	move $a0,$t0
	jal toascii
	sb $v0,4($s3)
	bgt $s0,0,do
	sb $0,0($s3)
	move $a0,$s3
	jal strrev
	move $v0,$v0
	lw $s0,12($sp)
	lw $s1,8($sp)
	lw $s2,4($sp)
	lw $ra,0($sp)
	addiu $sp,$sp,16
	jr $ra
	
toascii:
	addiu $a0,$a0,'0'

if:	ble $a0,'9'.endif
	addiu $a0,$a0,7
endif:	move $v0,$a0
	jr $ra