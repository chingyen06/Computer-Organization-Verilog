`timescale 1ns/100ps
module TB;
	reg clk,reset;
	wire clk_out;
	
	ClockBy3 INST (clk,reset,clk_out);
	
	initial
		clk= 1'b0;
		
	always
		#5 clk=~clk;
		
	initial
		begin
			#5 reset=1'b1;
			#10 reset=1'b0;
			#500 $finish;
		end
	initial
		$monitor("clk=%b,reset=%b,clk_out=%b",clk,reset,clk_out);
		
		initial
			begin
				$dumpfile("TB.vcd");
				$dumpvars(0,TB);
			end
			
endmodule