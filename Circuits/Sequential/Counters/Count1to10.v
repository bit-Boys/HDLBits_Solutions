module top_module (
    input clk,
    input reset,
    output [3:0] q);
    
    always @ (posedge clk) begin
        if(reset) begin
            q <= 4'b0001;
        end else begin
            if(q[3] & q[1]) begin
                q <= 4'b0001;
            end else begin
                q <= q + 1;
            end
            
            
        end
        
    end

endmodule
