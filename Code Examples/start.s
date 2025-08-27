        .data
nl:     .asciz  "\n"

        .text
        .globl  main
main:
        li      s1, 0           # i = 0
        li      s2, 5           # n = 5

loop:
        bge     s1, s2, loop_end

        addi    s1, s1, 1       # i++
        li      a7, 1           # print_int
        mv      a0, s1
        ecall

        la      a0, nl          # print newline
        li      a7, 4           # print_string
        ecall

        j       loop

loop_end:
        li      a7, 10          # exit
        ecall
