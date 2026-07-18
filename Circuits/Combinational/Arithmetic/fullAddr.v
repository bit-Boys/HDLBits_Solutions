module top_module( 
    input a, b, cin,
    output cout, sum );
    
    wire twoOnly;
    assign twoOnly = (a & (b ^ cin)) | (b & cin & ~a);
    
    assign cout = twoOnly | (a & b & cin);
    assign sum = (~twoOnly) & (a | b | cin);
    

endmodule
