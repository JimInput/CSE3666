	.data
st0:	.string "t0: "
st1:	.string "t1: "
st2:	.string "t2: "
	
	.text
main:
	addi t0, x0, -1
	addi t1, x0, 1
	
print_t0:
	la a0, st0
	addi a7, x0, 4
	ecall
	
	addi a0, t0, 0
	addi a7, x0, 35
	ecall
	
	addi a0, x0, '\n'
	addi a7, x0, 11
	ecall
	
print_t1:
	la a0, st1
	addi a7, x0, 4
	ecall
	
	addi a0, t1, 0
	addi a7, x0, 35
	ecall
	
	addi a0, x0, '\n'
	addi a7, x0, 11
	ecall
	
	blt t0, t1, L1
	addi a0, x0, 0 # false t0 < t1 not true
	
	
	
	beq x0, x0, skip

L1:
	addi a0, x0, 1	# true t0 < t1

skip:
	addi a7, x0, 1
	ecall
	
exit:
	addi a7, x0, 10
	ecall
