module ControlUnit (
    input wire [18:0] instruction,

    output reg [4:0] alu_control,
    output reg reg_write,
    output reg mem_read,
    output reg mem_write

);

    always @(*) begin
	if (instruction == 19'b0) begin
		reg_write = 0;
                mem_read = 0;
                mem_write = 0;
	end

	else begin
        case (instruction[18:14])
            5'b00000: begin // ADD
                alu_control = 5'b00000;
                reg_write = 1;
                mem_read = 0;
                mem_write = 0;

            end
	
            5'b00001: begin // SUBTRACTION
                alu_control = 5'b00001;
                reg_write = 1;
                mem_read = 0;
                mem_write = 0;

            end
	
            5'b00010: begin // MUL
                alu_control = 5'b00010;
                reg_write = 1;
                mem_read = 0;
                mem_write = 0;

            end

	
            5'b00011: begin // DIV
                alu_control = 5'b00011;
                reg_write = 1;
                mem_read = 0;
                mem_write = 0;

            end
	
	
            5'b00100: begin // AND
                alu_control = 5'b00100;
                reg_write = 1;
                mem_read = 0;
                mem_write = 0;

            end
	
            5'b00101: begin // OR
                alu_control = 5'b00101;
                reg_write = 1;
                mem_read = 0;
                mem_write = 0;

            end
	
            5'b00110: begin // XOR
                alu_control = 4'b00110;
                reg_write = 1;
                mem_read = 0;
                mem_write = 0;

            end
	
            5'b00111: begin // NOT
                alu_control = 4'b00111;
                reg_write = 1;
                mem_read = 0;
                mem_write = 0;

            end
	
            5'b01000: begin // INC
                alu_control = 5'b01000;
                reg_write = 1;
                mem_read = 0;
                mem_write = 0;

            end


            5'b01001: begin // DEC
                alu_control = 5'b01001;
                reg_write = 1;
                mem_read = 0;
                mem_write = 0;
 
            end

            5'b10000: begin // Encrypt
                alu_control = 5'b10000;
                reg_write = 1;
                mem_read = 0;
                mem_write = 0;
 
            end

	    5'b10001: begin // Decrypt
                alu_control = 5'b10001;
                reg_write = 1;
                mem_read = 0;
                mem_write = 0;
 
            end
      


	5'b01101: begin // LD
               
                reg_write = 1;
                mem_read = 1;
                mem_write = 0;
         
            end
	5'b01110: begin // ST
             
                reg_write = 0;
                mem_read = 0;
                mem_write = 1;

            end
           
            /*default: begin
                alu_control = 5'b00000;
                reg_write = 0;
                mem_read = 0;
                mem_write = 0;
             
                jump = 0;
                push = 0;
                pop = 0;
            end*/
        endcase
	end
    end
endmodule

