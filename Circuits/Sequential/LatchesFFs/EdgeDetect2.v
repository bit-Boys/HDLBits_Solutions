module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    
    integer i;
    reg [7:0] inOld;
    
    
    always @ (posedge clk) begin
        
        for(i = 0; i < 8; i = i + 1) begin
            anyedge[i] <= inOld[i] ^ in[i];
            
            
            inOld[i] <= in[i];
        end
        
    end

endmodule
