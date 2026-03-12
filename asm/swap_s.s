.global swap_s

# a0 - int arr[]
# a1 - int i
# a2 - int j

swap_s:
    slli t0, a1, 2        # t0 = i * 4
    add  t0, a0, t0       # t0 = &arr[i]
    slli t1, a2, 2        # t1 = j * 4
    add  t1, a0, t1       # t1 = &arr[j]
    lw   t2, 0(t0)        # t2 = arr[i]
    lw   t3, 0(t1)        # t3 = arr[j]
    sw   t3, 0(t0)        # arr[i] = arr[j]
    sw   t2, 0(t1)        # arr[j] = arr[i]
    ret
