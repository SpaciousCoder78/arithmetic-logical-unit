//Design: Arithmetic & Logical Unit
//License: BSD-2-Clause

module arithmetic_logic_unit (
    input [3:0] a,
    input [3:0] b, 
    input [3:0] opcode,
    output reg [3:0] x,
    output reg [3:0] y
);

//always block to check for opcodes
always @(*) begin
    // Default assignments
    x = 4'b0;
    y = 4'b0;
    
    case (opcode)
        //Opcode 1 - 0000 - OR A (reduction OR)
        4'b0000: x = {3'b0, |a};
        //Opcode 2 - 0001 - AND A (reduction AND)
        4'b0001: x = {3'b0, &a};
        //Opcode 3 - 0010 - XOR A (reduction XOR)
        4'b0010: x = {3'b0, ^a};
        //Opcode 4 - 0011 - A AND B
        4'b0011: x = a & b;
        //Opcode 5 - 0100 - A OR B
        4'b0100: x = a | b;
        //Opcode 6 - 0101 - A XOR B
        4'b0101: x = a ^ b;
        //Opcode 7 - 0110 - A > B
        4'b0110: x = {3'b0, a > b};
        //Opcode 8 - 0111 - A < B
        4'b0111: x = {3'b0, a < b};
        //Opcode 9 - 1000 - NOT A (logical NOT)
        4'b1000: x = {3'b0, !a};
        //Opcode 10 - 1001 - A == B
        4'b1001: x = {3'b0, a == b};
        //Opcode 11 - 1010 - A + B
        4'b1010: {y, x} = a + b;
        //Opcode 12 - 1011 - A - B
        4'b1011: x = a - b;
        //Opcode 13 - 1100 - A * B
        4'b1100: {y, x} = a * b;
        //Opcode 14 - 1101 - A >> B
        4'b1101: {y, x} = a >> b;
        //Opcode 15 - 1110 - A << B
        4'b1110: {y, x} = a << b;
        //Opcode 16 - 1111 - NOT A (bitwise NOT)
        4'b1111: x = ~a;
        default: begin
            x = 4'b0;
            y = 4'b0;
        end
    endcase
end

endmodule
