foo:
	add	s1, x0, x0	# count = s1 = 0
	add	s2, x0, x0	# i = s2 = 0
	add	s3, a0, x0	# d = s3 = a0
	add	s4, a1, x0	# n = s4 = a1
	
forloop:
	beq	s2, s4, done	# once looping done go to done
	
	slli	a0, s2, 2	# a0 = &d[i]
	sub	a1, s4, s2	# a1 = n-i
	add	s5, ra, x0	# save foo ra in s5 before bar call
	jal	ra, bar		# call bar after setting a0 and a1 first
	add	ra, s5, x0	# set ra back
	blt	x0, s6, incriment	# assume bar saves t to s6
	addi	s2, s2, 1	# i+=1
	beq	x0, x0, forloop

icriment:
	addi	s1, s1, 1	# count += 1
	addi	s2, s2, 1	# i+=1
	beq	x0, x0, forloop
	
done:
	jalr x0, ra, 0
