# CSE 3666
        
        .data                   #data segment
        .align 2

src:   .word   
  0,   1,   2,   3,   4,   5,   6,   7,   8,   9,
 10,  11,  12,  13,  14,  15,  16,  17,  18,  19,
 20,  21,  22,  23,  24,  25,  26,  27,  28,  29,
 30,  31,  32,  33,  34,  35,  36,  37,  38,  39,
 40,  41,  42,  43,  44,  45,  46,  47,  48,  49,
 50,  51,  52,  53,  54,  55,  56,  57,  58,  59,
 60,  61,  62,  63,  64,  65,  66,  67,  68,  69,
 70,  71,  72,  73,  74,  75,  76,  77,  78,  79,
 80,  81,  82,  83,  84,  85,  86,  87,  88,  89,
 90,  91,  92,  93,  94,  95,  96,  97,  98,  99,
100, 101, 102, 103, 104, 105, 106, 107, 108, 109,
110, 111, 112, 113, 114, 115, 116, 117, 118, 119,
120, 121, 122, 123, 124, 125, 126, 127

dst:    .space  1024

        .text
        .globl  main

main: 
        lui     s1, 0x10010     # hard-coded src address
        addi    s3, s1, 512     # s3 is the destination array

        # read n, the number of words to shuffle
        # n is even and 2 <= n <= 128
        addi    a7, x0, 5
        ecall

        # n is in a0
	srli 	t1, a0, 1
	slli	t2, t1, 2
	add	s2, s1, t2
        # TODO:
        # write a loop to shuffle n words
	add	t0, x0, x0	# t0 = 0 (iterator) # t1 = goal
	add	t2, x0, s1	# t2 = s1 (src)
	add	t3, x0, s3	# t3 = s3 (dst)
	add	t4, x0, s2	# t4 = s2 (right)
	
loop:	
	# left side
	lw	t6, 0(t2)
	sw	t6, 0(t3)
	
	# right side
	lw	t6, 0(t4)
	sw	t6, 4(t3)
	
	# incriment offsets/ iterator
	addi	t2, t2, 4
	addi	t3, t3, 8
	addi	t4, t4, 4
	addi	t0, t0, 1
	
	# check if done
	bne	t1, t0, loop
        # the address of the source array src is in s1
        # the address of the destination array dst is in s3
        # register s2 will store the address of the second half of src
        # the folloiwng code can use any t and a registers 


exit:   addi    a7, x0, 10      # syscall to exit
        ecall   
