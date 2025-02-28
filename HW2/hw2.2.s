	# init iloop iterators
	addi 	s0, x0, 0		# s0=i=0
	addi 	s1, x0, 16		# s1=16
iloop:
	# init jloop iterators
	addi 	s2, x0, 0		# s2=j=0
	addi 	s3, x0, 8		# s3=8
jloop:
	slli	t0, s0, 8		# t0 = 256 * i
	add 	t0, t0, s2		# t0 = 256 * i + j
	
	# calculate offset
	slli	t1, s0, 5		# t1 = i * 8 * 4 = i offset
	slli	t2, s2, 2		# t2 = j * 4
	add	t1, t1, t2		# t1 = total offset = i offset + j offset
	add	t1, t1, s9		# t1 = address of T[i][j]
	sw	t0, 0(t1)		# T[i][j] = 256 * i + j;

	addi	s2, s2 1		# incriment j
	bne 	s2, s3 iloop		# jloop if j!=8
	
	addi	s0, s0 1		# incriment i
	bne 	s0, s1 iloop		# iloop if i!=16