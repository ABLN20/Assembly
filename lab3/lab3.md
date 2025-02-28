# Perfect Shuffle

**Deadline:** Friday, 2/9/2024

## Learning Objectives

Access word arrays in our code, more specifically, read/write word arrays in a
loop.

## Description

Perfect shuffle is a method of shuffling cards. It includes two steps. Suppose
there are $n$ cards, and $n$ is even. 

*   Divide the cards into halves, left and right.

*   Starting from the left half, take one card from each half alternately until
    all cards are taken.

Let us take $n = 8$ as an example. Supposed the cards are numbered from 0 to 7
and saved in an word array (of 8 words). The following shows how cards are
drawn from left and right halves and placed in the destination array. In the
original array, numbers 4, 5, 6, and 7 are in the right half.

```
The original array:    0 1 2 3 4 5 6 7
The destination array: 0 4                  # one card is taken from each half
The destination array: 0 4 1 5              # two cards are taken from each half
The destination array: 0 4 1 5 2 6          # three cards are taken from each half
The destination array: 0 4 1 5 2 6 3 7      # four cards are taken from each half 
```

Write RISC-V code to shuffle the words/cards in the array `src` and place the
shuffled words in another word array `dst`. In `lab3.s`, the address of `src`
is in `s1` and the address of `dst` is in `s3`.

Although `src` has 128 words, we do not need to shuffle all of them. The number
of words to be shuffled is entered by the user. We assume the user always
enters a positive even number that is not larger than 128. 

The program does not print anything to the console. To check the results, we
examine the memory content in the "Data Segment" window.  For example, if we
enter 8, we should see `0 4 1 5 2 6 3 7` in `dst`. To find `dst`, make sure we
are viewing ".data" section. We may also need to use the green arrows to adjust
the starting addresses. 

## Deliverables

Please submit `lab3.s` and take lab3-test in HuskyCT by the deadline.

Note that the auto grader checks values in some registers and in some memory
areas, in addition to any output.

## Pseudocode

```
// s1 is the starting address of src
// s1 is also the address of the left half
// s3 is the starting address of dst

Place the starting address of the right half in s2

for (i = 0; i < n/2; i += 1) {
    dst[i+i] = left[i]
    dst[i+i+1] = right[i]
}
```

## Tips

Contruct a table to keep track of mapping between variable and registers.
Here is an example.

| Variables     | Registers |
| ------------- | --------- |
| src           | s1        |
| right         | s2        |
| dst           | s3        |
| ...           | ...       |
