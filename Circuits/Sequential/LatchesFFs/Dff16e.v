module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    integer i;
    integer j;
    
    always @(posedge clk) begin
        if (~resetn) begin
            q <= 8'h00;
        end else begin
            if(byteena[1]) begin
                for(j = 8; j < 16; j = j + 1) begin
                    q[j] <= d[j];
                end
            end
            
            if(byteena[0]) begin
                for(i = 0; i < 8; i = i + 1) begin
                    q[i] <= d[i];
                end
            end
            
        end
        
        
    end

endmodule
