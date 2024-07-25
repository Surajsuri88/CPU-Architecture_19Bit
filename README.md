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

#### 1. Instruction Fetch
**Instruction Memory** which is 

