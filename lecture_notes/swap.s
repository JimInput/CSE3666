	.data
A:	.word 200, 300, 400, 500, 600, 700, 800

	.text
main:
	# zero out array A
	# for i in range(len(A)):
	#	A[i] = 0;

	addi	t0, x0, 0 	# i = 0
	addi	t1, x0, 8	# t1 = MAX = 8
	lui	t2, 0x10010
	addi	t2, t2, 0x000	# t2 = &A
	beq 	x0, x0, test
loop:
	# get address of A[i]
	# i have address of A[0] in t2
	# A is a word-array, so the address of A[i] = &A + 4*i
	slli	t3, t0, 2	# t3 = i << 2 = 4*i
	add	t3, t2, t3	# t3 = &A[i]
	sw	x0, 0(t3)	# A[i] = 0
	addi	t0, t0, 1
test:
	blt t0, t1, loop
	