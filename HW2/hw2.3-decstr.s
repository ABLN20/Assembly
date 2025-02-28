# Addition of decimal strings

# strings are stored in global data section 
        .data   
dst:    .space  128
str1:   .space  128
str2:   .space  128

# instructions are in text section
        .text
main: 
        # load adresses of strings into s1, s2, and s3
        # s3 is dst, where we store the result 

        lui     s3, 0x10010 
        addi    s1, s3, 128
        addi    s2, s1, 128

        # read the first number as a string
        addi    a0, s1, 0
        addi    a1, x0, 100
        addi    a7, x0, 8
        ecall

        # read the second number as a string
        addi    a0, s2, 0
        addi    a1, x0, 100
        addi    a7, x0, 8
        ecall

        # useful constants
        addi    a4, x0, 0
        addi    a5, x0, 10

        #TODO
        # write a loop to find out the number of decimal digits in str1
        # the loop searches for the first character that is less than '0' 
        add	t0, x0, s1
count_digits:
	lb	t1, 0(t0)		# load current byte
	addi	t0, t0, 1
	bgt	t1, a4,	count_digits
	addi	t0, t0, -2
	sub	t0, t0, s1		# t0 = digits
	
	
	
	add	s4, t0, s3	# s4 = s3 address
	sb	a4, 0(s4)
	add	s1, t0, s1
	add	s2, t0, s2
	add	t5, x0, x0	# t5 = iterator
	add	s9, x0, x0	# x9 = carry
	addi	s1, s1, -1
	addi	s2, s2, -1
	addi	s4, s4, -1
addloop:
	beq	t5, t0, print
	# t1 = digit from s1
        lb	t1, 0(s1)
        addi	t1, t1, -48
        # t2 = digit from s2
        lb	t2, 0(s2)
	addi	t2, t2, -48
        # t3 = sum
        add	t3, t1, t2
        add	t3, t3, s9
        
	bge	t3, a5, carry
	addi	t3, t3, 48
	sb	t3, 0(s4)
	addi	s9, x0, 0
	beq	x0, x0, incriment

carry:
        addi	t3, t3, 38
        sb	t3, 0(s4)
	addi	s9, x0, 1

incriment:
	addi	s1, s1, -1
	addi	s2, s2, -1
	addi	s4, s4, -1
	addi	t5, t5, 1
	beq	x0, x0, addloop

print:
        addi    a0, s3, 0
        addi    a7, x0, 4
        ecall

        # exit
        addi    a7, x0, 10
        ecall
