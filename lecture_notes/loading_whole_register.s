	.text
main:
	#load 0xABCDE654 into a register
	lui t0, 0xABCDE
	addi t0, t0, 0x654
	
	#load ABCDEF54
	lui t0, 0xABCDF
	addi t0, t0, 0xFFFFFF54
	