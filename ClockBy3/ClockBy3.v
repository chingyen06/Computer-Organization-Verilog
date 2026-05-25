module ClockBy3(clk,reset,clk_out);
	input clk;
	input reset;
	output clk_out;
	
	reg [1:0] pos_count, neg_count;
	
	assign clk_out = ((pos_count == 2) | (neg_count == 2));
	always @(posedge clk)
		if (reset)
			pos_count <=0;
		else if (pos_count ==2) 
			pos_count <= 0;
		else 
			pos_count<= pos_count +1;
	always @(negedge clk)
		if (reset)
			neg_count <=0;
		else if (neg_count ==2) 
			neg_count <= 0;
		else 
			neg_count<= neg_count +1;
			
endmodule