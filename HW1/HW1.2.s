#       CSE 3666 Homework 1 Question 2

        .globl  main

        .text
main:   
        # use system call 5 to read integer
        addi    a7, x0, 5
        ecall
        addi    s2, a0, 0       # copy to s2
        
        #   reverse bits in s2 and save the results in s4
        andi t0, s2, -1
        add s4, x0, x0
        addi t2, x0, 1
        addi t3, x0, 5
        add s4, x0, x0
        
loopstart:
	beq t2, t3, loopdone	# jump to loopdone after 4 iterations
	addi t2, t2, 1 		# incriment iterator by 1 each time
	andi t4, t0, 255	# set t4 to LS BYTE of S2/T0
	slli s4, s4, 8
	add s4, s4, t4
	srli t0, t0, 8

	beq x0, x0, loopstart
        

loopdone:
        #   print s2 in hex, with a system call
        addi a7, x0, 34
        add a0, x0, s2
        ecall
        
        #   print newline
	addi a7, x0, 11		# syscall 11 to print ascii
        addi a0 , x0, 10	# set ascii value to 10 (newline)
        ecall			# execute syscall
        

        #   print s4 in hex, with a system call
        addi a7, x0, 34
        add a0, x0, s4
        ecall
        beq x0, x0, end # jump to end
        
          
end:
	#   print newline
	addi a7, x0, 11		# syscall 11 to print ascii
        addi a0 , x0, 10	# set ascii value to 10 (newline)
        ecall			# execute syscall
        
        # exit
exit:   addi    a7, x0, 10      
        ecall
