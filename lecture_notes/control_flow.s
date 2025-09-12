	.text

main:
	addi t0, zero, 0 # t0 = sum = 0
	addi t1, zero, 0 # t1 = i = 0
	addi t3, zero, 100 # t3 = n = 100
	
	# Method 2: Test at bottom
	beq zero, zero, test
loop_top:
	add t0, t0, t1
	addi t1, t1, 1
test:
	blt t1, t3, loop_top
	
	# Method 1: Test at top
#while_top:
	#bge t1, t3, while_exit # while (i < n)
	#add t0, t0, t1 # sum += i
	#addi t1, t1, 1
	#beq zero, zero while_top
#while_exit:
	
	
	