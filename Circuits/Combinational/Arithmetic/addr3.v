module addr( 
    input a, b, cin,
    output cout, sum );
    
    wire twoOnly;
    assign twoOnly = (a & (b ^ cin)) | (b & cin & ~a);
    
    assign cout = twoOnly | (a & b & cin);
    assign sum = (~twoOnly) & (a | b | cin);
    

endmodule



module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    addr modOne(
        .a    (a[0]),
        .b    (b[0]),
        .cin  (cin),
        .cout (cout[0]),
        .sum  (sum[0])
    );
    
    
        addr modTwo(
            .a    (a[1]),
            .b    (b[1]),
            .cin  (cout[0]),
            .cout (cout[1]),
            .sum  (sum[1])
    );
    
    
        addr modThree(
            .a    (a[2]),
            .b    (b[2]),
            .cin  (cout[1]),
            .cout (cout[2]),
            .sum  (sum[2])
    );

endmodule
