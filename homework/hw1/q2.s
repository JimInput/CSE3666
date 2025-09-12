# Write RISC-V instructions to reverse the order of bytes in register s2 and save the results in s4.  
# For example, if s2 is 0x12345678, the four bytes in s2 are 0x12, 0x34, 0x56, and 0x78.  
# Register s4 should be 0x78563412 after the execution of the instruction sequence.  
# Use temporary registers like t0 and t1 to save intermediate values.
	.data
str1:	.string "s2="
str2:	.string "s4="

	.text
main:
	lui	s2, 0x12345
	addi	s2, s2, 0x678
	
reverse:
	addi	t0, t0, 0xFF	# this is our movable mask
	
	and	s4, s2, t0	# mask the first 2 bytes of s2 and store them in s4
	
	slli	t0, t0, 8	# shift our mask to the next two bytes
	slli	s4, s4, 8	# shift our result to the next two bytes
	
	and	t1, s2, t0	# get the next byte and store it in t1
	srli	t1, t1, 8	# shift byte to start
	add	s4, s4, t1 	# combine prev bytes and new bytes
	
	# shift mask and result
	slli 	t0, t0, 8	
	slli	s4, s4, 8	
	
	# get next 2 bytes and combine into result
	and	t1, s2, t0
	srli	t1, t1, 16
	add	s4, s4, t1
	
	# shift mask and result
	slli 	t0, t0, 8
	slli	s4, s4, 8
	
	# get next 2 bytes and combine into result
	and	t1, s2, t0
	srli	t1, t1, 24
	add	s4, s4, t1
	
print:
	# print s2
	la 	a0, str1
	addi 	a7, zero, 4
	ecall
	
	add	a0, zero, s2
	addi 	a7, zero, 34
	ecall
	
	addi	a0, zero, '\n'
	addi 	a7, zero, 11
	ecall
	
	# print s4
	la 	a0, str2
	addi 	a7, zero, 4
	ecall
	
	add	a0, zero, s4
	addi 	a7, zero, 34
	ecall
	
	addi 	a7, zero, 10
	ecall
	