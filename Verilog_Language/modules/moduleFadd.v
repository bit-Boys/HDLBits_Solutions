module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout;
    wire cout1;
    
    add16 lower(a[15:0], b[15:0], 1'b0, sum[15:0], cout); 
    add16 upper(a[31:16], b[31:16], cout, sum[31:16], cout1);
    
endmodule

module add1 ( input a, input b, input cin, output sum, output cout);
    
   	wire onlyTwo;
    
    assign onlyTwo = (a & b & ~cin) | (a & cin & ~b) | (cin & b & ~a);
    assign cout = onlyTwo | (a & b & cin);
    assign sum = ~onlyTwo & (a | b | cin);

endmodule
