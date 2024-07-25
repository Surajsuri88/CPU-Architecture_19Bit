module ALU (
    input wire [18:0] op1,//R1
    input wire [18:0] op2,//R2
    input wire [18:0] op3,//R3
    input wire [4:0] alu_control,
    output reg [18:0] result
);
    integer i;
    reg [18:0] endata,dedata;
    always @(*) begin
        case (alu_control)
            5'b00000: result = op2 + op3; // ADD
		
            5'b00001: result = op2 - op3; // SUB
            5'b00010: result = op2 * op3; // MUL
            5'b00011: result = op2 / op3; // DIV
            5'b00100: result = op2 & op3; // AND
            5'b00101: result = op2 | op3; // OR
            5'b00110: result = op2 ^ op3; // XOR
            5'b00111: result = ~op2;      // NOT
            5'b01000: result = op1 + 1;   // INC
            5'b01001: result = op1 - 1;   // DEC

	    5'b10000:	begin 		// simple encryption xor
				for (i=18;i>=0;i=i-1)begin
					if  (i ==18)begin
						endata [i] = op2[i];	
					end
					else begin
						endata [i] = (op2[i] ^ op2[i+1]);
					end 
				end
			result = endata;
			end 		
            5'b10001: 	begin 		// simple decryption  xor
				for (i=18;i>=0;i=i-1)begin
					if  (i ==18)begin
						dedata [i] = op2[i];	
					end
					else begin
						dedata [i] = (dedata[i+1] ^ op2[i]);
					end 
				end
			result = dedata;
			end 	
	    
            default: result = 19'b0;
        endcase
    end
endmodule
