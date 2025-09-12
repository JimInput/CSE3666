# Write RISC-V instructions to reverse the order of bytes in register s2 and save the results in s4.  
# For example, if s2 is 0x12345678, the four bytes in s2 are 0x12, 0x34, 0x56, and 0x78.  
# Register s4 should be 0x78563412 after the execution of the instruction sequence.  
# Use temporary registers like t0 and t1 to save intermediate values.
	.text
main:
	lui	s2, 0x12345
	addi	s2, s2, 0x678
	
reverse:
	andi	s4, s2, 0xFF	# mask the first 2 bytes of s2 and store them in s4
	srli	t0, s2, 8	# shift our copy of s2 to put next two bytes first
	
loop:
	slli	s4, s4, 8	# shift s4 over to make space for next 2 bytes
	andi	t1, t0, 0xFF	# mask the next 2 bytes from our copy of s2
	add	s4, s4, t1	# store the next 2 bytes in our result
	srli	t0, t0, 8	# shift our copy over 2 bytes to put the next bytes first.
	bne 	t0, zero, loop	# if t0 is empty (we've gone through all bytes) exit otherwise loop.

