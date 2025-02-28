# RISC-V code
	addi 	s4, x0, 100
	addi 	s1, x0, 0

loop:
	slli 	t0, s1, 2 	# t0 = i * 4
	add 	t2, t0, s2 	# compute addr of A[i]
	lw 	t1, 0(t2)
	addi	t1, t1, 4	# add 4 to A[i]
	add 	t3, t0, s3 	# compute addr of B[i]
	sw 	t1, 0(t3)
	addi 	s1, s1, 1
	
test: 	bne s1, s4, loop 	# 8 instructions in the loop
