module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    
    wire [31:0] bXORSub;
    wire [31:0] subVec;
    
    assign subVec = {32{sub}};
    assign bXORSub = subVec ^ b;
    
    wire cout;
    wire none;
    
    
    add16 (a[15:0],bXORSub[15:0],sub, sum[15:0], cout);
    add16 (a[31:16],bXORSub[31:16],cout, sum[31:16], none);
        

endmodule
