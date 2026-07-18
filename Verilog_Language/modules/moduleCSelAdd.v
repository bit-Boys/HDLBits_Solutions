module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    wire  coutSel;
    wire coutOneFirst;
    wire coutOneSecond;
    
    wire [15:0] sumZeroCinZero;
    wire [15:0] sumZeroCinOne;
    
    add16 lower(a[15:0], b[15:0], 1'b0, sum[15:0] , coutSel);
    add16 upperOne(a[31:16], b[31:16], 1'b0, sumZeroCinZero,coutOneFirst );
    add16 upperTwo(a[31:16], b[31:16], 1'b1, sumZeroCinOne,coutOneSecond );
    
    always @* begin
        if(coutSel == 1'b0) begin
            sum[31:16] = sumZeroCinZero;
        end
        
        else if(coutSel == 1'b1) begin
            sum[31:16] = sumZeroCinOne;
            
        end
        
    end

endmodule
