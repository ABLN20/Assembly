#       CSE 3666 Homework 1 Question 5

        .globl  main

        .text
main:   
        # use system call 5 to read integer
        addi    a7, x0, 5
        ecall
        addi    s1, a0, 0       # s1 = n
        addi	s2, x0, 1	# s2 = 1
        add 	s3, x0, x0	# s3 is count, init to zero
        
start:	beq 	s1, s2, finish	# check if n = 1, if so done
	andi 	t0, s1, 1	# check if n is even/odd
	beq	t0, s2, odd
	
	# even
	srli 	s1, s1, 1	# divide n by 2
	addi	s3, s3, 1	# incriment count
	beq	x0, x0, start
	
	# odd	
odd:	add 	t0, s1, s1	# t0 = 2*s1
	add	t0, t0, s1	# t0 = 3*s1
	addi	t0, t0, 1	# t0 = 3*s1 + 1
	add	s1, t0, x0	# update s1
	addi	s3, s3, 1	# incriment count
	beq	x0, x0, start
        
        
finish:
        #   print s3 with a system call
        addi a7, x0, 1
        add a0, x0, s3
        ecall
        
        
        # exit
exit:   addi    a7, x0, 10      
        ecall
