msort:
    addi 	sp, sp, -16   # Make space on stack for 4 registers (4 * 4 bytes each)

    sw 		ra, 0(sp)       # Save return address
    sw 		s0, 4(sp)       # Save s0 register
    sw 		s1, 8(sp)       # Save s1 register
    sw 		s2, 12(sp)      # Save s2 register


    lw 		s0, 0(a0)       # s0 = d (array to be sorted)
    lw		s1, 4(a0)       # s1 = n (size of the array)


    addi 	t1, x0, 1
    bge 	s1, done

    srli 	s2, s1, 1      # s2 = n / 2 (n1)
    add 	s2, s0, s2      # s2 = &d[n1]

    jal 	ra, msort       # msort(d, n1)
    add 	a0, s2, x0           # Set new arguments for the second recursive call
    sub 	a1, s1, s2      # n - n1
    jal 	ra, msort       # msort(&d[n1], n - n1)


    lw 		a0, 0(sp)        # Restore d
    lw 		a1, 8(sp)        # Restore n1
    lw 		a2, 12(sp)       # Restore &d[n1]
    jal 	ra, merge       # merge(c, d, n1, &d[n1], n - n1)


    lw 		a0, 0(sp)        # Restore d
    lw 		a1, 4(sp)        # Restore c
    lw 		a2, 8(sp)        # Restore n
    jal 	ra, copy        # copy(d, c, n)

    exit:
    lw 		ra, 0(sp)        # Restore return address
    lw 		s0, 4(sp)        # Restore s0 register
    lw 		s1, 8(sp)        # Restore s1 register
    lw 		s2, 12(sp)       # Restore s2 register

    addi sp, sp, 16
