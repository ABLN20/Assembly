#       CSE 3666 Lab 2

        .globl  main

        .text
main:   
        # use system call 5 to read integer
        addi    a7, x0, 5
        ecall
        addi    s1, a0, 0       # copy to s1

        # TODO
        # Add you code here
        #   reverse bits in s1 and save the results in s2
        andi t0, s1, -1
        add s2, x0, x0
        addi t2, x0, 1
        addi t3, x0, 33
        add s2, x0, x0
        
loopstart:
	beq t2, t3, loopdone	# jump to loopdone after 32 iterations
	addi t2, t2, 1 		# incriment iterator by 1 each time
	andi t4, t0, 1		# set t4 to LSB of S1/T0
	slli s2, s2, 1
	add s2, s2, t4
	srli t0, t0, 1

	beq x0, x0, loopstart
        

loopdone:
        #   print s1 in binary, with a system call
        addi a7, x0, 35
        add a0, x0, s1
        ecall
        
        #   print newline
	addi a7, x0, 11		# syscall 11 to print ascii
        addi a0 , x0, 10	# set ascii value to 10 (newline)
        ecall			# execute syscall
        
        #   print '=' if s1 is palindrome, otherwise print s2 in binary
        beq s1, s2, equal
        #   print s2 in binary, with a system call
        addi a7, x0, 35
        add a0, x0, s2
        ecall
        beq x0, x0, end # jump to end
        
          
equal:
	#   print '='
	addi a7, x0, 11		# syscall 11 to print ascii
        addi a0 , x0, 61	# set ascii value to 61 (=)
        ecall			# execute syscall
        
end:
	#   print newline
	addi a7, x0, 11		# syscall 11 to print ascii
        addi a0 , x0, 10	# set ascii value to 10 (newline)
        ecall			# execute syscall
        
        # exit
exit:   addi    a7, x0, 10      
        ecall
