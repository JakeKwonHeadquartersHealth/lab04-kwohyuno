.global sumabs_s

# a0 - int* arr
# a1 - int len

# abs: returns absolute value of a0
abs:
    bge  a0, zero, abs_done
    neg  a0, a0
abs_done:
    ret

sumabs_s:
    addi sp, sp, -32
    sd   ra, 24(sp)
    sd   s0, 16(sp)
    sd   s1, 8(sp)
    sd   s2, 0(sp)

    mv   s0, a0            # s0 = arr
    mv   s1, a1            # s1 = len (counter)
    li   s2, 0             # s2 = sum

sumabs_loop:
    ble  s1, zero, sumabs_done
    lw   a0, 0(s0)         # a0 = *arr
    jal  abs                # a0 = abs(*arr)
    addw s2, s2, a0        # sum += abs(*arr)
    addi s0, s0, 4         # arr++
    addi s1, s1, -1        # len--
    j    sumabs_loop

sumabs_done:
    mv   a0, s2            # return sum
    ld   s2, 0(sp)
    ld   s1, 8(sp)
    ld   s0, 16(sp)
    ld   ra, 24(sp)
    addi sp, sp, 32
    ret
