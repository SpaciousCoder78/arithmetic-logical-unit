//Design: Testbench of ALU
//License: BSD-2-Clause

module arithmetic_logic_unit_tb;
    reg [3:0] a, b, opcode;
    wire [3:0] x, y;
    
    // Instantiate the unit under test
    arithmetic_logic_unit DUT (
        .a(a),
        .b(b),
        .opcode(opcode),
        .x(x),
        .y(y)
    );
    
    initial begin
        // Initialize VCD dumping
        $dumpfile("dump.vcd");
        $dumpvars(0, arithmetic_logic_unit_tb); // Dump all variables in this module
        
        // Initialize inputs
        a = 4'b0;
        b = 4'b0;
        opcode = 4'b0;
        
        // Monitor changes
        $monitor("Time=%0t a=%b b=%b opcode=%b x=%b y=%b", 
                 $time, a, b, opcode, x, y);
        
        // Test cases
        #10 a = 4'b1100; b = 4'b1010; opcode = 4'b0011; // AND
        #10 opcode = 4'b0100; // OR
        #10 opcode = 4'b0101; // XOR
        #10 opcode = 4'b1010; // ADD
        #10 opcode = 4'b1011; // SUB
        #10 opcode = 4'b1100; // MUL
        #10 a = 4'b1000; opcode = 4'b1101; // SHR
        #10 opcode = 4'b1110; // SHL
        #10 opcode = 4'b1111; // NOT
        #10 a = 4'b1111; opcode = 4'b0000; // Reduction OR
        #10 opcode = 4'b0001; // Reduction AND
        #10 opcode = 4'b0010; // Reduction XOR
        #10 a = 4'b0110; b = 4'b0101; opcode = 4'b0110; // A > B
        #10 opcode = 4'b0111; // A < B
        #10 opcode = 4'b1001; // A == B
        #10 a = 4'b0101; b = 4'b0101; opcode = 4'b1001; // A == B (equal)
        
        #10 $finish;
    end
endmodule
