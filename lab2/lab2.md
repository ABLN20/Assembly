# Reverse bits

**Deadline:** Friday, 2/2/2024

*If you work on a lab computer, save your files to cloud storage like OneDrive.
Otherwise, you may lose your files.*

Write concise comments in code.

## Learning Objectives

* Logical and bit-wise operations 

* Binary representation of signed integers

* ASCII characters

## Description

In this lab, we write RISC-V code to reverse the order of the bits in a
register. The skeleton code, in `lab2.s`, reads an integer and saves it
in `s1`. 

Implement the following steps with RISC-V instructions.

*   Write a loop to reverse the bits in `s1` and save the results in `s2`. 

    Think aobut the strategy/algorithm first and then implement the method
    provided at the bottom of this page. Note that we are working on bits in
    registers and do not interprete them as signed values.

*   Use a system call to print `s1` in binary. 

    Find the system call number in RARS's help.

*   Use a system call to print a newline character (ASCII value 10). 

    We also need to find the system call number for printing a character.

    Tips: We can use `'\n'` as the immediate in instructions. 

*   If `s1` is a binary palindrome (i.e., bits are the same from left to right,
    and from right to left), print character `=`. Otherwise, use a system call
    to print `s2` in binary. 

*   Use a system call to print a newline character.   

Here are some example inputs/outputs of the program. 

```
170
00000000000000000000000010101010
01010101000000000000000000000000

20232023
00000001001101001011011101010111
11101010111011010010110010000000

1431655765
01010101010101010101010101010101
10101010101010101010101010101010

-3666
11111111111111111111000110101110
01110101100011111111111111111111

-2010819982
10001000001001010101001001110010
01001110010010101010010000010001

0
00000000000000000000000000000000
=

-1
11111111111111111111111111111111
=

1342545930
01010000000001011010000000001010
=

```

## Deliverables

Please submit "lab2.s" and take lab2-test in HuskyCT by the deadline.

## Pseudocode 

Here is one of the algorithms that reverse bits. 

```
1.  t0 = s1         // copy s1 to t0
2.  s2 = 0
2.  FOR (i = 0; i < 32; i += 1)  // repeat 32 times
        // copy the the LSB in t0 to s2 
        s2 <<= 1            // s2 = s2 << 1
        s2 |= (t0 & 1)
        t0 >>= 1            
```
