.global fibrec_s

# a0 - int n
# returns fib(n) where fib(0)=0, fib(1)=1

fibrec_s:
    li   t0, 1
    ble  a0, t0, fibrec_base  # if n <= 1, return n

    addi sp, sp, -24
    sd   ra, 16(sp)
    sd   s0, 8(sp)
    sd   s1, 0(sp)

    mv   s0, a0               # s0 = n
    addi a0, s0, -1            # a0 = n - 1
    jal  fibrec_s              # a0 = fib(n-1)
    mv   s1, a0               # s1 = fib(n-1)

    addi a0, s0, -2            # a0 = n - 2
    jal  fibrec_s              # a0 = fib(n-2)

    addw a0, s1, a0            # a0 = fib(n-1) + fib(n-2)

    ld   s1, 0(sp)
    ld   s0, 8(sp)
    ld   ra, 16(sp)
    addi sp, sp, 24
    ret

fibrec_base:
    ret                        # a0 already = n (0 or 1)
