# Translate this C code into assembly:
# int i = 0;
# while (i < 5) {
#   i = i + 2;
# }

addi t0, zero, 0 # i = 0
addi t1, zero, 5 # n = 5

bge t0, t1, end

loop:
    addi t0, t0, 2
    blt t0, t1, loop

end:
    nop