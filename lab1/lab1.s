#       CSE 3666 Lab 1
#       TAG: 4b65a92624740b63b57e258

        # instructions are placed in the .text section
        .text
main:   

        # GCD examples:
        #     gcd(11, 121) = 11
        #     gcd(24, 60) = 12
        #     gcd(192, 270) = 6
        #     gcd(14, 97) = 1

        # read two positive integers from the console and 
        # save them in s1 and s2 

        # use system call 5 to read integers
        addi    a7, x0, 5
        ecall
        addi    s1, a0, 0       # a in s1

        addi    a7, x0, 5
        ecall
        addi    s2, a0, 0       # b in s2

        # no need to change lines above
        # TODO
        # Add you code here
        # compute GCD(a, b) and print it
        
        beq zero, zero, test # jump to test
        loop:
        	blt s2, s1, case2 # if b < a
        	
        	case1: # otherwise a > b
        		sub s2, s2, s1  # b = b - a
        		beq zero, zero test # jump to test
        	case2:
        		sub s1, s1, s2 # a = a - b
        test:
        	bne s1, s2, loop # while a != b
        
	add a0, zero, s1 # put the GCD into sysout
	addi a7, zero, 1 # print int syscall
	ecall
	
        # do not change this line and lines below
        # sys call to exit
exit:   addi    a7, x0, 10
        ecall
