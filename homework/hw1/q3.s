# Compute the Hamming Weight (# of 1s) of s0, store result in s1.
	.text
test:
	lui	s0, 0xFFFF0
main:
	addi 	s1, x0, 0	# s1 = 0 
	add	t0, x0, s0	# make a copy so s0 is not changed
	
loop:
	bge	t0, zero, skip	# if t0 < zero, MSB = 1
	addi	s1, s1, 1	# increment counter
skip:
	slli	t0, t0, 1	# shift t0 to the left
	bne	t0, zero, loop	# if t0 == 0 we're done