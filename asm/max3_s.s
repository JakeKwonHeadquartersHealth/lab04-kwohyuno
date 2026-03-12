.global max3_s

# a0 - int a
# a1 - int b
# a2 - int c

# max2: returns max of a0 and a1 in a0
max2:
    bge a0, a1, max2_done
    mv a0, a1
max2_done:
    ret

max3_s:
    addi sp, sp, -16
    sd   ra, 8(sp)
    sd   s0, 0(sp)

    mv   s0, a2          # save c
    jal  max2             # a0 = max(a, b)
    mv   a1, s0           # a1 = c
    jal  max2             # a0 = max(max(a,b), c)

    ld   s0, 0(sp)
    ld   ra, 8(sp)
    addi sp, sp, 16
    ret
