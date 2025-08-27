# 1. Evaluate z = (a + b) - (c + 4) with a = 10, b = 20, c = 3
addi t0, zero, 10 # a = 10
addi t1, zero, 20 # b = 20
addi t2, zero, 3 # c = 3

add t3, t0, t1 # a + b
addi t4, t2, 4 # c + 4

sub t5, t3, t4 # (a+b)-(c+4)

nop

# answer located in t5