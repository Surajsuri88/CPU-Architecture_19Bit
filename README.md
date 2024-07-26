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
**Instruction** - - -**opcode**
1. ADD - - - 00000
2. SUB - - - 00001
3. MUL - - - 00010
4. DIV - - - 00011
5. AND - - - 00100
6. OR  - - - 00101
7. XOR - - - 00110
8. NOT - - - 00111
9. INC - - - 01000
10. DEC - - -01001
11. JUMP - - 01010
12. CALL - - 01011
13. LD - - - 01101
14. ST - - - 01110
15. ENC - - - 10000
16. DEC - - - 10001
17. BEQ - - - 1001
18. BNE - - - 1010

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

#### 3. Register_File
This module contains **Register** as memory 32 Bit register each of 19 Bit to store the data into it.
This module mainly retrieve the inputs like flag, address of each registers **(reg1, reg2, reg3)** and data mainly used to store the data into a particular address.
This module returns with the main output i.e **data1,data2,data3** which are further used to perform arithmetic and logical operations.

#### 4. Control Unit
Basically **control unit** acts as **Brain** of this Architecture as it has ability to check the **instruction and opcode** and rise the **flags** accordingly to perform multiple operation.

#### 5. ALU
In this module the inputs like **data1,data2,data3** are used to perform Arithmetic and logical instructions based on the received **opcode** and returns the the performed output called **ALU_result**.

#### 6. MemoryInterface
This module is basically for storing the data into the memory it has a **memory register** to store the data permanently.

#### 7.CPU 
Finally, this module can also be called as **Main Body** of the Architecture because this module is responsible for each and every connection that is neccessarily to connect different other modules.

### Instruction Syntax:
Arithmetic operation : 5'b Opcode _ 4'b R1 _ 5'b R2 _ 5'b R3;
Branch opration : 4'b Opcode _ 5'b R1 _ 5'b R2 _ 5'b branch addr;
Jump operation : 5'b Opcode _ 14'b jump addr;
Encryption and Decryption operation : 5'b Opcode _ 4'b Encrypted/Decrypted addr _ 5'b Input /Encrypted addr  _ 5'b 0;
### Example Instruction Set:
19'b00000_0001_00010_00011;//add r1,r2,r3  : r1 = r2 + r3 : r1 = 20 + 10 = 30
19'b00001_0001_00010_00011;//sub r1,r2,r3  : r1 = r2 - r3 : r1 = 20 - 10 = 10
19'b00001_0001_00010_00011;//and r1,r2,r3  : r1 = r2 & r3 : r1 = 1 & 0 = 0
19'b00001_0001_00010_00011;//or r1,r2,r3   : r1 = r2 | r3 : r1 = 1 | 0 = 1

19'b1001_00001_00010_00101;//BEQ : r1 :3 and r2 :3 both are equal, PC branches to PC 5
19'b1010_00001_00010_01001;//BNE : r1 : 3 and r2 :5 both are not equal therefore PC branches to PC 9


---------------------------------------------------------------------------------------------------------------------------


## Contact:
Email: surajg606suraj@gmail.com

