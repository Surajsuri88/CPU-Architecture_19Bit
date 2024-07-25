module CPU_EnDecrypt_testbench;
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


	uut.ifetch.instruction_memory[0] = 19'b10000_0001_00010_00000;// xor cipher encryption
	uut.ifetch.instruction_memory[1] = 19'b10001_0011_00001_00000;// xor cipher decryption
	
 
	
 	
	

  // Initialize register file for testing
  
	uut.rf.registers[2] = 19'b0000000000000010101; // input data  
    
        // Run the simulation for a specific period
        #150;

        // Check register values

	$display("Input data : %b			Encrypted data : %b   		encryption", uut.rf.registers[2],uut.rf.registers[1]);  
	$display("Encrypted data : %b  			Decrypted data : %b		decryption", uut.rf.registers[1],uut.rf.registers[3]); 

	
	
	


        // End simulation
        $finish;
    end
endmodule