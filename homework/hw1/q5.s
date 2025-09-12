# Write a RISC-V program that reads in a positive integer n and prints out the total stopping 
# time of n (the number of times we need to apply function f on n to reach 1).
# f(n) = n/2 if n is even or 3n+1 if n is odd

# ex. n = 9 => 19

main:
	addi 	a7, zero, 5	# read int from terminal
	ecall
	
	addi	s0, a0, 0	# s0 = n
	addi	s1, zero, 0	# count = 0
	addi	s2, zero, 1	# stop_num = 1, we stop when s0 = 1
	
	beq	zero, zero, loop_test
loop:
	andi	t0, s0, 1	# if t0 = 1, then n is even, otherwise odd
	beq	t0, s2, odd
even:
	srli	s0, s0, 1	# since n >= 1, shifting right divides by 2
	beq	zero, zero, increment
odd:
	addi	t0, s0, 0	# use t0 as a dummy variable
	slli	s0, s0, 1	# n = 2n
	add	s0, s0, t0	# n = 3n
	addi	s0, s0, 1	# n = 3n + 1
increment:
	addi	s1, s1, 1	# increment count by 1
loop_test:
	bne	s0, s2, loop	# if n != 1 keep looping
	
printing:
	# print count
	addi	a7, zero, 1
	addi	a0, s1, 0
	ecall

	
