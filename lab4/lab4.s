#       CSE 3666 Lab 4
#	TAG: 5fd71ac11b8a14746aa31ed0caf142197fb20839

	.data
	.align	2	
word_array:     .word
        0,   10,   20,  30,  40,  50,  60,  70,  80,  90, 
        100, 110, 120, 130, 140, 150, 160, 170, 180, 190,
        200, 210, 220, 230, 240, 250, 260, 270, 280, 290,
        300, 310, 320, 330, 340, 350, 360, 370, 380, 390,
        400, 410, 420, 430, 440, 450, 460, 470, 480, 490,
        500, 510, 520, 530, 540, 550, 560, 570, 580, 590,
        600, 610, 620, 630, 640, 650, 660, 670, 680, 690,
        700, 710, 720, 730, 740, 750, 760, 770, 780, 790,
        800, 810, 820, 830, 840, 850, 860, 870, 880, 890,
        900, 910, 920, 930, 940, 950, 960, 970, 980, 990

        # code
        .text
        .globl  main
main:   
	addi	s0, x0, -1
	addi	s4, x0, -1
	addi	s5, x0, -1
	addi	s6, x0, -1
	addi	s7, x0, -1

	# help to check if any saved registers are changed during the function call
	# could add more...

        # la      s1, word_array
        lui     s1, 0x10010      # starting addr of word_array in standard memory config
        addi    s2, x0, 100      # 100 elements in the array

        # read an integer from the console
        addi    a7, x0, 5
        ecall

        addi    s3, a0, 0       # keep a copy of v in s3
        
        # call binary search
        addi	a0, s1, 0
        addi	a1, s2, 0
        addi	a2, s3, 0
        jal	ra, binary_search

exit:   addi    a7, x0, 10      
        ecall

#### Do not change lines above
binary_search:
	addi 	sp, sp, -4
	sw 	ra, 0(sp)
	beq	a1, x0, Nis0	# check if array empty
	
	
	srli	t0, a1, 1	# t0 = n/2	half
	slli	t1, t0, 2
	add	t1, a0, t1	
	lw	t1, 0(t1)	# t1 = a[half]	half_v
	
	
	beq	t1, a2, if	# go if halfv = v
	blt	a2, t1, elseif	# go if v < halfv
	beq	x0, x0, else	# go if v > halfv
	

Nis0:
	addi	a0, x0, -1
	beq	x0, x0, f_exit
	
if:
	add	a0, x0, t0
	beq	x0, x0, f_exit
	
elseif:
	add	a1, x0, t0
	jal	ra, binary_search
	beq	x0, x0, f_exit
	
else:
	addi	t2, t0, 1	# t2 = left
	
	slli	t3, t2, 2	# t3 = &a[left] offset
	add	a0, a0, t3	# a0 = &a[left]
	
	sub	a1, a1, t2
	addi 	sp, sp, -4
	sw 	t2, 0(sp)
	jal	ra, binary_search
	lw 	t2, 0(sp)
	addi 	sp, sp, 4
	bge	a0, x0, addoffset
	beq	x0, x0, f_exit
addoffset:
	add	a0, a0, t2
	
f_exit:
	lw 	ra, 0(sp)
	addi 	sp, sp, 4
	jalr	x0, ra, 0
