module CPU_BranchBne_testbench;
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

	uut.ifetch.instruction_memory[0] = 19'b0000_0000_00000_00000;
	uut.ifetch.instruction_memory[2] = 19'b00000_0000_00000_00000;
	uut.ifetch.instruction_memory[3] = 19'b00000_0000_00000_00000;
	uut.ifetch.instruction_memory[4] = 19'b00000_0000_00000_00000;
		
	uut.ifetch.instruction_memory[6] = 19'b00000_0000_00000_00000;
	
	uut.ifetch.instruction_memory[7] = 19'b1010_00011_00101_01001;//BNE : r1 : 3 and r2 :5 both are not equal therefore PC branches to PC 9
	uut.ifetch.instruction_memory[8] = 19'b00000_0000_00000_00000;
	
	uut.ifetch.instruction_memory[9] = 19'b1010_00011_00100_01100;//BNE : r1 : 3 and r2 :5 both are equal therefore PC will not branches to PC 12
	
	uut.ifetch.instruction_memory[10] = 19'b00000_0000_00000_00000;
	uut.ifetch.instruction_memory[11] = 19'b00000_0000_00000_00000;
	uut.ifetch.instruction_memory[12] = 19'b01100_00000000000000;
	
 
	
 	        // Run the simulation for a specific period
        #150;	

  //Closely observe PC in transcript window
	
	// initializing register

		uut.rf.registers[3] = 3;
        	uut.rf.registers[4] = 3; //Both registers 3 and 4 are equal

		uut.rf.registers[5] = 5;
	

        // End simulation
        $finish;
    end
endmodule