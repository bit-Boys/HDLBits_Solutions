module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    
    always @ (posedge clk) begin
        if(reset) begin
            q <= 4'b0;
        end else begin
            if(slowena) begin
                if(q[3] & q[0]) begin
                     q <= 4'b0;
                    
                end else begin
                    q <= q + 1;
                end
                
            end
        end
    end

endmodule
