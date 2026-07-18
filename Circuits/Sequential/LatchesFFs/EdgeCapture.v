module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    
    integer i;
    reg [31:0] prev;
    
    always @ (posedge clk) begin
        for(i = 0; i < 32; i = i + 1) begin
            if (reset) begin
                out[i] <= 1'b0;
            end else begin
                out[i] <= (out[i]) | (prev[i] & ~in[i]);
                
            end
            
            prev[i] <= in[i];
            
        end
        
    end

endmodule
