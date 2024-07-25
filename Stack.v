module Stack (
    input wire clk,
    input wire reset,
    input wire push,
    input wire pop,
    input wire [18:0] push_data,
    output reg [18:0] pop_data,
    output reg empty,
    output reg full
);
    reg [18:0] stack [0:31];
    reg [4:0] sp;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sp <= 5'b0;
            empty <= 1;
            full <= 0;
        end else if (push && !full) begin
            stack[sp] <= push_data;
            sp <= sp + 1;
            empty <= 0;
            if (sp == 31)
                full <= 1;
        end else if (pop && !empty) begin
            sp <= sp - 1;
            pop_data <= stack[sp - 1];
            full <= 0;
            if (sp == 1)
                empty <= 1;
        end
    end
endmodule

