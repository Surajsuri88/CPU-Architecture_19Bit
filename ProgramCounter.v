module ProgramCounter (
    input wire [18:0] pc_in,
    input wire clk,
    input wire reset,
    output reg [18:0] pc_out
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_out <= 19'b0;
        else
            pc_out <= pc_in;
    end
endmodule
