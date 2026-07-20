module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    
    always @ (posedge clk) begin
        if(load) begin
        	q <= data;
            a
        end else if(ena) begin
            if(~amount[0] & ~amount[1]) begin // left one
                q <= q  << 1;
            end
            
            if(amount[0] & ~amount[1]) begin // left 8
                q <= q << 8;
            end
            
            if(~amount[0] & amount[1]) begin // right one
                q <= $signed(q) >>> 1; // sign to force arithmetic sign expansion (unsigned won't by default)
            end
            
            if(amount[0] & amount[1]) begin // right 8
                q <= $signed(q) >>> 8;
            end
            
        end
            
        
    end

endmodule
