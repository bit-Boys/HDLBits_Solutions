module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
    
    
    integer i;
    always @ (posedge clk or posedge areset) begin
        if (areset) begin
            q <= 8'b00;
        end else begin
        
        	for (i = 0; i < 8; i = i + 1) begin
            	q[i] <= d[i];
            
        	end
        end
    end

endmodule
