//Design: Arithmetic & Logical Unit
//License: BSD-2-Clause

module ALU (x,y,a,b,opcode);

//inputs a,b,opcode
input[3:0]a,b,opcode;
//outputs x and y
output[3:0]x,y;

//always block to check for opcodes
always @(a,b,opcode)
    case (opcode) //check opcodes
        //Opcode 1 - 0000 - OR A
        4'b0000: x[0] = |a;
        //Opcode 2 - 0001 - AND A
        4'b0001: x[0] = &a;
        //Opcode 3 - 0010 - XOR A
        4'b0010: x[0] = ^a;
        //Opcode 4 - 0011 - A AND B
        4'b0011: x = a & b;
        //Opcode 5 - 0100 - A OR B
        4'b0100: x = a | b;
        //Opcode 6 - 0101 - A XOR B
        4'b0101: x = a ^ b;
        //Opcode 7 - 0110 - A > B;
        4'b0110: x[0] = a > b;
        //Opcode 8 - 0111 - A < B;
        4'b0111: x[0] = a < b;
        //Opcode 9 - 1000 - NOT A
        4'b1000: x[0] = !a;
        //Opcode 10 - 1001 - A == B
        4'b1001: x[0] = a==b;
        //Opcode 11 - 1010 - a + B
        4'b1010: {y[0],x} = a + b;
        //Opcode 12 - 1011 - A - B
        4'b1011: x = a - b;
        //Opcode 13 - 1100 - A * B
        4'b1100: {y,x} = a * b;
        //Opcode 14 - 1101 - A >> B
        4'b1101: {y,x} = a>>b;
        //Opcode 15 - 1110 - A << B
        4'b1110: {y,x} = a<<b;
        //Opcode 16 - 1111 - NOT A
        4'b1111: x = ~a; 
        default: $display("error");
endcase

endmodule
