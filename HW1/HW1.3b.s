	addi 	s1, x0, 0	# s1 = 0
	add 	t0, x0, s0 	# make a copy so s0 is not changed
loop:
	bgeu	t0, x0, skip	# if t0 >= 0, MSB is 0, so skip
	addi 	s1, s1, 1 	# increment the counter
	
skip:
	slli 	t0, t0, 1	# shift t0 to the left
	bne 	t0, x0, loop	# run again if there are more bits that are "1"