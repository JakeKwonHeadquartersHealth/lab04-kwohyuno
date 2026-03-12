.global sort_s

# a0 - int arr[]
# a1 - int len
#
# Insertion sort: calls swap_s

sort_s:
    addi sp, sp, -40
    sd   ra, 32(sp)
    sd   s0, 24(sp)
    sd   s1, 16(sp)
    sd   s2, 8(sp)
    sd   s3, 0(sp)

    mv   s0, a0            # s0 = arr
    mv   s1, a1            # s1 = len
    li   s2, 1             # s2 = i = 1

sort_outer:
    bge  s2, s1, sort_done # if i >= len, done
    mv   s3, s2            # j = i

sort_inner:
    ble  s3, zero, sort_next_i  # if j <= 0, next i

    # compare arr[j-1] and arr[j]
    addi t0, s3, -1        # t0 = j - 1
    slli t1, t0, 2         # t1 = (j-1) * 4
    add  t1, s0, t1        # t1 = &arr[j-1]
    lw   t2, 0(t1)         # t2 = arr[j-1]
    lw   t3, 4(t1)         # t3 = arr[j]
    ble  t2, t3, sort_next_i  # if arr[j-1] <= arr[j], break

    # swap(arr, j-1, j)
    mv   a0, s0
    addi a1, s3, -1
    mv   a2, s3
    jal  swap_s

    addi s3, s3, -1        # j--
    j    sort_inner

sort_next_i:
    addi s2, s2, 1         # i++
    j    sort_outer

sort_done:
    ld   s3, 0(sp)
    ld   s2, 8(sp)
    ld   s1, 16(sp)
    ld   s0, 24(sp)
    ld   ra, 32(sp)
    addi sp, sp, 40
    ret
