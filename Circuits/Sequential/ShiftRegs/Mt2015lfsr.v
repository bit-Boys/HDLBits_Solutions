module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    
    reg [2:0] Q;
    
    assign Q = SW;
    
    always @ (posedge KEY[0]) begin
        if(KEY[1]) begin
            LEDR[0] <= Q[0];
            LEDR[1] <= Q[1];
            LEDR[2] <= Q[2];
            
        end else begin
            LEDR[0] <= LEDR[2];
            LEDR[1] <= LEDR[0];
            LEDR[2] <= LEDR[2] ^ LEDR[1];
            
        end
        
    end


endmodule
