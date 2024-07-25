module InstructionFetch (
    input wire clk,
    input wire reset,
    input wire [18:0] pc,
    output reg [18:0] instruction,
    output reg [18:0] instruction1,
    output [18:0]pc1
);
    reg [18:0] instruction_memory [0:31]; // Simple instruction memory
    assign pc1=pc+1;
    always @(posedge clk or posedge reset) begin
        if (reset)
            instruction <= 19'b0;
        else
            instruction <= instruction_memory[pc];
	    instruction1 <= instruction_memory[pc+1];
    end
endmodule
