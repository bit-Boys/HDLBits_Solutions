module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);
    integer i;
    always @(negedge clk) begin
        if (reset) begin
            q <= 8'h34;
        end else begin
            for(i = 0; i < 8; i = i + 1) begin
                q[i] <= d[i];
            end
            
        end
        
    end

endmodule
