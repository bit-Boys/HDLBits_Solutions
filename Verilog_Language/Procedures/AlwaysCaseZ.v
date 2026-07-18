module top_module (
    input [7:0] in,
    output reg [2:0] pos );
    
    always @* begin
        
        casez (in[7:0])
            8'b0zzzzzzz1: pos = 3'd0;
            8'b0zzzzzz10: pos = 3'd1;
            8'b0zzzzz100: pos = 3'd2;
            8'b0zzzz1000: pos = 3'd3;
            8'b0zzz10000: pos = 3'd4;
            8'b0zz100000: pos = 3'd5;
            8'b0z1000000: pos = 3'd6;
            8'b010000000: pos = 3'd7;
            default: pos = 3'd0;        
        endcase
    end
endmodule
