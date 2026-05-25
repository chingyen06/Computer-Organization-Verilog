`timescale 1ns/1ps
module TB;
    reg clk, reset, coin10, coin50, sell20, sell50;
    wire item20, item50, change;
    VendingMachine INST(clk, reset, coin10, coin50, sell20, sell50, item20, item50, change);
    
    initial
        clk= 1'b0;
    always
        #5 clk=~clk;
    
	 initial
    begin
        {reset, coin10, coin50, sell20, sell50} = 5'b00000;
        #5 reset=1'b1;
        #10 reset=1'b0;
        $display("\n=== Case1: coin10+coin10, sell20 ===");
        @(posedge clk); #1 coin10 = 1'b1;
        @(posedge clk); #1 coin10 = 1'b0;
        @(posedge clk); #1 coin10 = 1'b1;
        @(posedge clk); #1 coin10 = 1'b0;
        @(posedge clk); #1 sell20 = 1'b1;
        @(posedge clk); #1 sell20 = 1'b0;
        $display("\n=== Case2: coin50, sell50 ===");
        @(posedge clk); #1 coin50 = 1'b1;
        @(posedge clk); #1 coin50 = 1'b0;
        @(posedge clk); #1 sell50 = 1'b1;
        @(posedge clk); #1 sell50 = 1'b0;
        $display("\n=== Case3: coin50, sell20 (change) ===");
        @(posedge clk); #1 coin50 = 1'b1;
        @(posedge clk); #1 coin50 = 1'b0;
        @(posedge clk); #1 sell20 = 1'b1;
        @(posedge clk); #1 sell20 = 1'b0;
        $display("\n=== Case4: coin10+coin50, sell50 ===");
        @(posedge clk); #1 coin10 = 1'b1;
        @(posedge clk); #1 coin10 = 1'b0;
        @(posedge clk); #1 coin50 = 1'b1;
        @(posedge clk); #1 coin50 = 1'b0;
        @(posedge clk); #1 sell50 = 1'b1;
        @(posedge clk); #1 sell50 = 1'b0;
        #20;
        $display("\n=== Simulation Done ===");
		  $finish;
    end
    initial
        $monitor("clk=%b, reset=%b | in: c10=%b c50=%b s20=%b s50=%b | out: item20=%b item50=%b change=%b",
            clk, reset, coin10, coin50, sell20, sell50, item20, item50, change);
    initial
    begin
        $dumpfile("TB.vcd");
        $dumpvars(0, TB);
    end
endmodule