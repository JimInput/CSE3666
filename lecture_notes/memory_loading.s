	.data # starts at 0x10010000
arrayA:	.word 100, 101, 102, 103, 104

	.text # starts at 0x00400000
	# load arrayA[0] into t1
	# 1) get &arrayA[0]
	lui t0, 0x10010
	addi t0, t0, 0x000
	
	lw t1, 0(t0)
	
	# 2) Get &arrayA[1]
	lw t2, 4(t0)
	
	