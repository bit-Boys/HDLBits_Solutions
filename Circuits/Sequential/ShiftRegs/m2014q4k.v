module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    
    reg [3:0] q = 4'h0;
    
    assign out = q[3];
    
    always @ (posedge clk) begin
        if(~resetn) begin
            q <= 4'b0;
            
            
        end else begin
            q[0] <= in;
            q[1] <= q[0];
            q[2] <= q[1];
            q[3] <= q[2];     
        end 
    end

endmodule
