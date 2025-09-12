#       CSE 3666 Lab 2 DIVU
#       TAG: 7e565c9c03f7747a25fb

        # instructions are placed in the .text section
        .text
main:   

        # DIV examples
        # 10 // 5 = 2 r 0
        # 15 // 1 = 15 r 0
        # 100 // 3 = 33 r 1
        # read two positive integers from the console and 
        # save them in s1 and s2 

        # use system call 5 to read integers
        addi    a7, x0, 5
        ecall
        addi    s1, a0, 0       # n in s1

        addi    a7, x0, 5
        ecall
        addi    s2, a0, 0       # d in s2

        # TODO
        # Add you code here
        # compute 
        #       s3: q = n // d
        #       s4: r = n % d 
        # and print them
start:
	slli	s2, s2, 16	# d <<= 16
	addi 	s3, zero, 0	# q = 0
	add	s4, s1, zero	# r = n
	addi	t1, zero, 0	# i = 0
	addi	s5, zero, 16	# bound for the loop = 16
	beq	zero, zero, loop_test
loop:
	srli	s2, s2, 1	# d >>= 1	
	slli	s3, s3, 1	# q <<= 1
	# if r >= d
	blt	s4, s2, increment
	
	sub	s4, s4, s2	# r -= d
	ori	s3, s3, 1	# q |= 1
increment:
	addi	t1, t1, 1	# i++
loop_test:
	blt	t1, s5, loop	# i < 16
	
printing:
	# print d
	addi	a7, zero, 1
	addi	a0, s3, 0
	ecall
	
	# print '\n'
	addi	a7, zero, 11
	addi	a0, zero, '\n'
	ecall
	
	# print r
	addi 	a7, zero, 1
	addi	a0, s4, 0
	ecall
	
	# print '\n'
	addi	a7, zero, 11
	addi	a0, zero, '\n'
	ecall

        # no need to change lines below
        # sys call to exit
exit:   addi    a7, x0, 10
        ecall
