module adder_4bits(c4, s, a, b, cin);
	input [3:0] a, b;
	input cin;
	output [3:0] s;
	output c4;
	
	reg [3:0] s;
	reg c4;
	
	always @(a or b or cin)
	begin
		{c4, s} = a + b + cin;
	end
endmodule