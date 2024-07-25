module InstructionDecode (
    input wire [18:0] instruction,
    input wire [18:0] instruction1,
    output reg [4:0] read_reg2, //r2
    output reg [4:0] read_reg3,  //r3
    output reg [3:0] write_reg,
    output reg [13:0] immediate,
    output reg [4:0] opcode,   // these are 5bit opcode, 7bit R1 and R2

    output reg [6:0] mem_add,value,

    output reg [4:0] B_read_reg1,
    output reg [4:0] B_read_reg2,
    output reg [4:0] B_write_reg, //R1
    output reg [3:0] B_opcode     // these are 4bit opcode, 5bit R1, R2 and addr for BNE and BEQ
);

    always @(*) begin
        opcode = instruction[18:14];
        read_reg3 = instruction[4:0];
        read_reg2 = instruction[9:5];
	write_reg = instruction[13:10];
        immediate = instruction[13:0];

	mem_add = instruction[13:7];
	value = instruction[6:0];

	B_opcode = instruction1[18:15];
        B_read_reg1 = instruction1[9:5];
        B_read_reg2 = instruction1[14:10];
	B_write_reg = instruction1[4:0];
    end
endmodule