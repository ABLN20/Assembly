loopstart:
bge s2, s1, exit	# check if i>=a and if so, exit
andi t1, s2, 0xA5	# t1 = i & 0xA5
beq t1, x0, else	# if i & 0xA5 == 0, go to else

# if statement
slli t0, s2, 8		# t0 = i << 8
xor s3, s3, t0		# r ^= i << 8;
addi s2, s2, 1		# incriment i by 1 each iteration
beq x0, x0, loopstart

# else statement
else:	
srli t0, s2, 4		# t0 = i >> 4
add s3, s3, t0		# r += i >> 4;
addi s2, s2, 1		# incriment i by 1 each iteration
beq x0, x0, loopstart

exit: