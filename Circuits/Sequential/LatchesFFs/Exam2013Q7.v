module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    
    always @ (posedge clk) begin
        if(j) begin
            if(k) begin
                Q <= ~Q;
            end else begin
                Q <= 1'b1;
            end
        end else begin
            if (k) begin
                Q <= 1'b0;
            end else begin
                Q <= Q;
             
            end
            
        end
        
    end

endmodule
