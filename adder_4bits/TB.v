module TB;
	reg [3:0] a, b;
	reg cin;
	
	wire [3:0] s;
	wire c4;
	
	integer i, j, k;
	
	adder_4bits INST(c4, s, a, b, cin);
	
	initial 
	begin
		a = 4'b0000;
		b = 4'b0000;
		cin = 1'b0;
	end
	
	always
	begin
		for (i=0;i<2;i=i+1)
		begin
			for (j=0;j<16;j=j+1)
			begin
				for (k=0;k<16;k=k+1)
				begin
					#1
					a = j;
					b = k;
					cin = i;
				end
			end
		end
	end
	
endmodule