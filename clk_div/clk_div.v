module clk_div (clk_in, enable,reset, clk_out);
    input clk_in;
    input reset;
    input enable;
    output clk_out;
    
    wire clk_in;
    wire enable;
    
    reg clk_out;
    
    always @ (posedge clk_in)
        if (reset)
            clk_out <= 1'b0;
        else if (enable)
            clk_out <= ! clk_out;
endmodule