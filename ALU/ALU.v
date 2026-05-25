module ALU(A, B, opcode, cin, result, cout, zero);
    input [7:0] A, B;
    input [3:0] opcode;
    input cin;
    output [7:0] result;
    output cout, zero;

    reg [7:0] result;
	 reg cout;

    assign zero = (result == 8'b0);

    always @(*) begin
        result = 8'b0;
        cout   = 1'b0;

        if (opcode == 4'b0000)       // Addition
            {cout, result} = {1'b0, A} + {1'b0, B};

        else if (opcode == 4'b0001)  // Addition with carry
            {cout, result} = {1'b0, A} + {1'b0, B} + cin;

        else if (opcode == 4'b0010) begin  // Subtraction
            result = A - B;
            cout   = (A < B) ? 1'b1 : 1'b0;  // borrow
        end

        else if (opcode == 4'b0011) begin  // Subtraction with borrow
            result = A - B - cin;
            cout   = (A < (B + cin)) ? 1'b1 : 1'b0;
        end

        else if (opcode == 4'b0100) begin  // Decrement
            result = A - 1;
            cout   = (A == 8'b0) ? 1'b1 : 1'b0;  // underflow
        end

        else if (opcode == 4'b0101)  // Increment
            {cout, result} = {1'b0, A} + 1;

        else if (opcode == 4'b0110)  // Transfer
            result = A;

        else if (opcode == 4'b0111)  // AND
            result = A & B;

        else if (opcode == 4'b1000)  // OR
            result = A | B;

        else if (opcode == 4'b1001)  // XOR
            result = A ^ B;

        else if (opcode == 4'b1010)  // NOT
            result = ~A;

        else if (opcode == 4'b1011) begin  // Left shift
            result = A << 1;
            cout   = A[7];  // 移出的 MSB
        end

        else if (opcode == 4'b1100) begin  // Right shift
            result = A >> 1;
            cout   = A[0];  // 移出的 LSB
        end

        else begin
            result = 8'b0;
        end
    end

endmodule