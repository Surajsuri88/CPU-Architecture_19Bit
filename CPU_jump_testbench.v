module CPU_jump_testbench;
    reg clk;
    reg reset;

    // Instantiate the CPU
    CPU uut (
        .clk(clk),
        .reset(reset)
    );

    // Clock generation
    always #5 clk = ~clk;

initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        #10 reset = 0;
        //10 reset = 1;

	uut.ifetch.instruction_memory[0] = 19'b00000_0000_00000_00000;
	uut.ifetch.instruction_memory[1] = 19'b01010_00000000000110;//jump addr  : jumps to PC:6
	uut.ifetch.instruction_memory[2] = 19'b00000_0000_00000_00000;
	uut.ifetch.instruction_memory[3] = 19'b00000_0000_00000_00000;
	uut.ifetch.instruction_memory[4] = 19'b00000_0000_00000_00000;
	uut.ifetch.instruction_memory[5] = 19'b00000_0000_00000_00000;
	uut.ifetch.instruction_memory[6] = 19'b00000_0000_00000_00000;
	uut.ifetch.instruction_memory[7] = 19'b00000_0000_00000_00000;
	uut.ifetch.instruction_memory[8] = 19'b00000_0000_00000_00000;
	
 
	
 	        // Run the simulation for a specific period
        #150;	
	
	// observe PC in the transcript window


        // End simulation
        $finish;
    end
endmodule