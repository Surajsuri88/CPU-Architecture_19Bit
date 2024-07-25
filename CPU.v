module CPU (
    input wire clk,
    input wire reset
);
    // Internal wires
    wire [18:0] pc, next_pc, instruction, instruction1, value_data;
    wire [4:0] read_reg2, read_reg3;
    wire [3:0] write_reg;
    wire [18:0] read_data1, read_data2, read_data3, B_read_data1, B_read_data2, write_data;
    wire [4:0] opcode, alu_control;
    wire reg_write, mem_read, mem_write, B_branch, jump, push, pop;
    wire [18:0] alu_result, mem_data, stack_data, pc1;
    wire stack_empty, stack_full;
    wire [13:0] immediate;
    wire [3:0] B_opcode;
    wire [4:0] B_read_reg1, B_read_reg2, B_write_reg;
    wire [6:0] mem_add,value;


    // Instantiate components
    ProgramCounter pc_inst (
        .pc_in(next_pc),
        .clk(clk),
        .reset(reset),
        .pc_out(pc)
    );

    PCAdder pc_adder (
        .from_pc(pc),
	.immediate(immediate),
	.B_branch(B_branch),
	.B_write_reg(B_write_reg),
	.jump(jump),
	.push(push),
	.pop(pop),
	.alu_zero(alu_result == 19'b0),
        .pc_added(next_pc)
    );

    RegisterFile rf (
        .clk(clk),
        .reset(reset),
        .read_reg3(read_reg3),
        .read_reg2(read_reg2),
        .write_reg(write_reg),
	
	.value(value),

	.B_read_reg1(B_read_reg1),
	.B_read_reg2(B_read_reg2),

        .write_data(write_data),
        .reg_write(reg_write),
        .read_data1(read_data1),
        .read_data2(read_data2),
	.read_data3(read_data3),

	.B_read_data1(B_read_data1),
	.B_read_data2(B_read_data2),
	.value_data(value_data)
    );

    ALU alu (
        .op1(read_data1),
        .op2(read_data2),
	.op3(read_data3),
        .alu_control(alu_control),
        .result(alu_result)
    );

    ControlUnit cu (
        .instruction(instruction),
        .alu_control(alu_control),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write)

    );

Jump_control Jcu (
	.instruction(instruction),
	.instruction1(instruction1),

	.jump(jump),
	.push(push),
	.pop(pop)
);

 B_ControlUnit B_cu(
        .instruction1(instruction1),
        .B_read_data1(B_read_data1),
        .B_read_data2(B_read_data2),
        .B_branch(B_branch)
);

    InstructionFetch ifetch (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .instruction(instruction),
	.instruction1(instruction1),
	.pc1(pc1)
    );

    InstructionDecode idecode (
        .instruction(instruction),
	.instruction1(instruction1),
        .read_reg3(read_reg3),
        .read_reg2(read_reg2),
        .write_reg(write_reg),
        .immediate(immediate),
        .opcode(opcode),
	.mem_add(mem_add),
	.value(value),
	.B_read_reg1(B_read_reg1),
        .B_read_reg2(B_read_reg2),
        .B_write_reg(B_write_reg),
	.B_opcode(B_opcode)
    );

    MemoryInterface mem (
        .clk(clk),
        .reset(reset),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .mem_add(mem_add),
	.value(value),
        .value_data(value_data),
        .read_data(mem_data)
    );



    assign write_data = mem_read ? mem_data : alu_result;

always @(posedge clk) begin
        $display("PC: %d, Instruction: %b ", pc, instruction);
    end
endmodule

