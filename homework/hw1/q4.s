# for (i = 0; i < a; i += 1) 
# 	if ((i & 0xA5) != 0) 
#		r ^= i << 8;  // r = r xor (i <<8)
#	else  
#		r += i >> 4;  // r = r += (i >>4)
	.text
test:
	addi	s0, zero, 5 # a = 5
	addi	s1, zero, 0 # i = 0
	addi 	s2, zero, 155 # r = 120
	

main:	# start of translation
	beq 	zero, zero loop_test
loop:
	andi	t0, s1, 0xA5	# using t0 as a temp variable
	beq	t0, zero, else	# jump to else when if not true
if:
	slli	t0, s1, 8	# perform the operation shown in example
	xor	s2, s2, t0
	beq	zero, zero, increment # must jump to increment after both if and else
else:
	srli	t0, s1, 4	# perform the operation shown in example
	add	s2, s2, t0
increment:
	addi	s1, s1, 1	# increment i and test condition again
loop_test:
	blt	s1, s0, loop
