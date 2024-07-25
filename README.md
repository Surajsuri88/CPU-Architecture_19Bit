# CPU-Architecture_19Bit

## Overview
The purpose of this project is to design and implement a specialized 19-bit CPU architecture tailored for applications requiring efficient data processing and control. This architecture is intended to support a custom instruction set that caters to specific computational needs.

## Features
1. Specialized 19 Bit Instruction set
2. Performs Arithmetic Instructions
3. Performs Logical Instructions
4. Performs Control Flow Instructions
5. Performs Memory Access Instructions
6. Performs Custom Instructions as below
   A. Encryption
   B. Decryption

## Architecture includes
1. Program Counter
2. Program Counter Adder
3. Instruction Fetching
4. Instruction Decoding
5. Register
6. Memory
7. Control Unit
8. Arithmetic and Logic Unit
9. Jump Control
10. Branch Control

### Instruction Set to perform different operations
**Inst**    **opcode**
1. ADD   00000
2. SUB   00001
3. MUL   00010
4. DIV   00011
5. AND   00100
6. OR    00101
7. XOR   00110
8. NOT   00111
9. INC   01000
10. DEC  01001
11. JUMP 01010
12. CALL 01011
13. LD   01101
14. ST   01110
15. ENC  10000
16. DEC  10001
17. BEQ  1001
18. BNE  1010

## Getting Started
#### Different TestBench are created to demonstrate different operation
1. CPU_ALU_testbench.v __________*Run this file to perform all Arithmetic and logical operations*
2. CPU_jump_testbench.v _________*Run this file to perform jump operation*
3. CPU_CallRet_testbench.v ______*Run this file to perform CALL and RET operation*
4. CPU_Branch_testbench.v _______*Run this file to perform BEQ operation*
5. CPU_BranchBne_testbench.v ____*Run this file to perform BEQ operation*
6. CPU_EnDecrypt_testbench.v ____*Run this file to perform Encryption and Decryption*
7. CPU_Store_testbench.v ________*Run this file to perform ST operation*
   
###### *Outputs are expected to observe in transcript window*
###### *HDL used here is Verilog and successfully performed the above operations in software called **Questa Sim-64 10.6c***

#### Pipeline Stages
1. Fetch
2. Decode
3. Execute
4. Memory Access
5. Write Back

### Brief explanation on Modules used:
#### 1. Instruction_Fetch
**Instruction Memory** which is 32 Bit register each of 19 Bit. 
This is used to store the instruction according to the **program counter (PC)** one of the input.
This module returns the output Instruction used for ALU and Instruction1 used for Branching instructions

#### 2. Instruction_decode
This module receives the inputs like **Instruction, Instruction1, opcode** and returns the multiple outputs like **Read_reg1, Read_reg2, Read_reg3** which are address of registers that the operations has to perform.
**opcode** are very important as it guides to perform what has to be executed.

### 3. Register_File
This module contains **Register** as memory 32 Bit register each of 19 Bit to store the data into it.
This module mainly retrieve the inputs like flag, address of each registers **(reg1, reg2, reg3)** and data mainly used to store the data into a particular address.
This module returns with the main output i.e **data1,data2,data3** which are further used to perform arithmetic and logical operations.

### 4. Control Unit
Basically **control unit** acts as brain of this Architecture as it has ability to check the **instruction** and rise the **flags** accordingly to perform multiple operation

