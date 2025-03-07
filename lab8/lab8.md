# A RISC-V Simulator

**This lab is worth 200 points**. 150 points from the code graded by the auto
grader and 50 points from Lab8-test in HuskyCT.

**The coding component is mandatory.**

**Firm-deadline, for Lab8-test**: Monday, 4/8/2024. The questions do not depend
on your code. Please take it early. 

**Deadline, for code:** Monday, 4/8/2024

**Late Deadline, for code:** Friday, 4/26/2024. 

*If you work on a lab computer, save your files to cloud storage like OneDrive.
Otherwise, you may lose your files.*

## Learning Objectives

* Implement a single-cycle RISC-V processor in MyHDL 

* Build a processor from existing modules

## Description

In this lab, we complete the design of a single-cycle RISC-V processor,
following the diagram we have constructed. The diagram is Figure 4.21 in
textbook. A copy has been posted in HuskyCT.

### Instructions supported by the processor

The processor supports the subset of instructions we have studied.

```
ADD, SUB, AND, OR, LW, SW, BEQ
```

In addition, the ALU supports shift operations, although the shift operations
are done in a separator module in real processors. ImmGen, ALU control, and the
main control have been improved to support ALU operations with an immediate. 
Therefore, the following instructions are also supported, without changing the
diagram. 

```
ADDI, ANDI, ORI
SLLI, SRLI, SRAI
SLL, SRL, SRA
```

### Code

Implementing a processor requires a lot of work. However, we have done the
heavy lifting. The remaining work is limited to one file, or a few files if you
would like to improve the processor.

The files provided to you are in a single ZIP file. Descriptions of the files
in the package are in `README.md`. Read it carefully.

Note that the software is copyrighted to limit its distribution.  A lot of
efforts have been put in the design of the assignment so students can learn
from the code provided and also have opportunities to explore themselves.
Please limit the use of the code in this course. See `LICENSE.txt` in the
downloaded files for detail. 

### Tasks 

The main task is to complete the design of a single-cycle RISC-V core.  Since
all supporting modules are already provided, the main task is to follow Figure
4.21 in the textbook and put everything together. 

We will mainly work on `sc_core.py`. Read the code provided in `sc_core.py`
carefully.  Many packages are imported at the beginning of the file. From the
import statements, we can find out where to find the file for a particular
module. 

Study the signals in `sc_signals.py` and locate them in the diagram.

Starting from PC (already in the file), create the modules in the diagram one 
by one.  

* Find a module that are connected to the modules that are already created. For
  example, PC is already created, the next one would be the instruction memory.

* Find the interface of the module by reading the documentations and studying its
  source code.

* Instantiate the module with proper signals connected to it. This is the step
  where students make many mistakes. 

After the diagram is implemented in Python code, test the simulator. See
`README.md` for more instructions. Although some expected outputs are provided,
some programs generate different output when argument registers like `a0` and
`a1` are changed.  Run those programs with different initial values in
registers and explain the results from the simulator.

### Debugging

Start from small programs, for example, programs having only R-type
instructions. After the R-type instructions are working, move on to check other
types of instructions: shift instructions, I-type instructions, load, store, and
so on. 

Here are some steps we can follow for testing the simulator.

1.  Save the output of the simulator in a file.

2.  Compare it with expected output.

3.  Identify mismatched signals and check related modules. For example, if
    PC is correct but instruction is not correct, check instruction memory. 

## Deliverables

Submit `sc_core.py` and take Lab8-test in HuskyCT by the deadline. 

## Mistakes

Here are some mistakes students made in previous semesters. 

*   Did not check the simulator locally. Sometimes the submitted code does not
    terminate, or it does not print anything. It is easier to identify problems
    when running the simulator locally and comparing its output with the
    expected.

*   Missed some modules. Double check that the simulator has all the
    components. Probably print a hard copy of the diagram and mark a module 
    when it is placed in the simulator.

*   Did not connect correct signals to a module. Double check every signal connected
    to a module.
