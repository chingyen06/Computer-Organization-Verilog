module VendingMachine(clk, reset, coin10, coin50, sell20, sell50, item20, item50, change);
    input clk, reset, coin10, coin50, sell20, sell50;
    output item20, item50, change;
    reg item20, item50, change;
    reg [1:0] state, nextstate;
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;

    always @ (posedge clk, posedge reset)
        if (reset) 
            state <= S0;
        else 
            state <= nextstate;

    always @ (*)
    begin 
        nextstate = state;
        item50 = 0;
        item20 = 0;
        change = 0;

        case (state)
            S0:
            begin
                if (coin10)
                    nextstate = S1;
                else if (coin50)
                    nextstate = S3;
            end

            S1:
            begin
                if (coin10)
                    nextstate = S2;
                else if (coin50)
                    nextstate = S3;
            end

            S2:
            begin
                if (sell20) 
                begin
                    nextstate = S0;
                    item20 = 1;
                end
            end

            S3:
            begin
                if (sell20) 
                begin
                    nextstate = S0;
                    item20 = 1;
                    change = 1;
                end
                else if (sell50)
                begin
                    nextstate = S0;
                    item50 = 1;
                end
            end

            default: nextstate = S0;
        endcase
    end
endmodule