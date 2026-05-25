`timescale 1ns/1ps
module TB;
    reg [7:0] A, B;
    reg [3:0] opcode;
    reg cin;
    wire [7:0] result;
    wire cout, zero;

    ALU INST(.A(A), .B(B), .opcode(opcode), .cin(cin), .result(result), .cout(cout), .zero(zero));

    initial begin
        A = 8'hFF; B = 8'h01; cin = 0;

        opcode = 4'b0000; #10;  // Addition:        FF+01=100 → result=00, cout=1
        opcode = 4'b0001; #10;  // Add with carry:  FF+01+0=1
        cin = 1;
        opcode = 4'b0001; #10;  // Add with carry:  FF+01+1=101 → result=01, cout=1
        cin = 0;

        A = 8'h05; B = 8'h03;
        opcode = 4'b0010; #10;  // Subtraction:     05-03=02
        A = 8'h03; B = 8'h05;
        opcode = 4'b0010; #10;  // Subtraction:     03-05, borrow=1

        A = 8'h01;
        opcode = 4'b0100; #10;  // Decrement: 01-1=00
        opcode = 4'b0101; #10;  // Increment: 01+1=02

        A = 8'hAB; B = 8'hCD;
        opcode = 4'b0110; #10;  // Transfer:  result=AB
        opcode = 4'b0111; #10;  // AND:       AB & CD
        opcode = 4'b1000; #10;  // OR:        AB | CD
        opcode = 4'b1001; #10;  // XOR:       AB ^ CD
        opcode = 4'b1010; #10;  // NOT:       ~AB

        A = 8'b10110001;
        opcode = 4'b1011; #10;  // Left shift:  → 01100010, cout=1
        opcode = 4'b1100; #10;  // Right shift: → 01011000, cout=1

        $display("Simulation Done");
        $finish;
    end

    initial
        $monitor("op=%b | A=%h B=%h cin=%b | result=%h cout=%b zero=%b", opcode, A, B, cin, result, cout, zero);
endmodule