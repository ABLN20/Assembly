#       CSE 3666 uint2decstr

        .globl  main

        .text
main:   
        # create an array of 128 bytes on the stack
        addi    sp, sp, -128

        # copy array's address to a0
        addi    a0, sp, 0

	# set all bytes in the buffer to 'A'
        addi    a1, x0, 0       # a1 is the index
	addi	a2, x0, 128
	addi	t2, x0, 'A'
clear:
        add     t0, a0, a1
	sb	t2, 0(t0)
        addi    a1, a1, 1
	bne	a1, a2, clear
	
        # change -1 to other numbers to test
        # you can use li load other numbers for testing
        # li      a1, 36663666
        addi	a1, zero, -1
	jal	ra, uint2decstr

        # print the string
        addi    a0, sp, 0
        addi    a7, x0, 4
        ecall

exit:   addi    a7, x0, 10      
        ecall

# char * uint2decstr(char *s, unsigned int v) 
# the function converts an unsigned 32-bit value to a decimal string
# Here are some examples:
# 0:    "0"
# 2022: "2022"
# -1:   "4294967295"
# -3666:   "4294963630"
uint2decstr:
    # Save the return address
    addi    sp, sp, -4
    sw  ra, 0(sp)

    # Check if v >= 10
    addi  t0,x0, 10      # Load immediate value 10

    # If v >= 10, perform recursive call
    # Divide v by 10
    divu    a2, a1, t0   # Divide v by 10
    add   a1, a0, x0         # Move s pointer to a1 for recursive call
    jal ra, uint2decstr  # Recursive call
    add  a0, a1, x0          # Move returned pointer to a0



    


