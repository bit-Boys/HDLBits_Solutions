module bcd_count (
    input clk,
    input reset,        // Synchronous active-high reset
    input enable,
    output [3:0] q,
	output lap);
    
    reg atNine;
    
    
    always @ (posedge clk) begin

        if(reset) begin
            q <= 4'b0000;
            
            lap <= 1'b0;
        end else begin
            if (~enable) begin
                q <= q;
            end else begin
                if(q[3] & q[0]) begin
                     q <= 4'b0000;
                     lap <= 1'b0;
                     
                end else if (q[3]) begin
                    lap <= 1'b1;
                    q <= q + 1;
                    
                end else begin
                    q <= q + 1;

                    lap <= 1'b0;
			    end
            end
        end
    end
endmodule


module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    wire ena1;
    wire ena2;
    wire ena3; 
    wire ena4;
    
    
    bcd_count count0(clk, reset, 1'b1, q[3:0], ena1);
    bcd_count count1(clk, reset, ena1, q[7:4], ena2);
    bcd_count count2(clk, reset, ena2 & ena1, q[11:8], ena3);
    bcd_count count3(clk, reset, ena3 & ena2 & ena1, q[15:12], ena4);
    
    assign ena[1] = ena1;
    assign ena[2] = ena2 & ena1;
    assign ena[3] = ena3 & ena2 & ena1;
    

endmodule
