# 2. Write RISC-V code to count down from 5 to 0 using a loop.

addi t0, zero, 5 # i = 5

loop:
    # this is where i would print its value (or something else)
    addi t0, t0, -1
    bge t0, zero, loop

loop_end:
    nop