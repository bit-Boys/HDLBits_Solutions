module adder(
    input a,
    input b,
    input cin, 
    output cout,
    output sum);
    
    wire twoOnly;
    
    assign twoOnly = (a & b & ~cin) | (a & ~b & cin) | (~a & b & cin);
    
    assign cout = twoOnly | (a & b & cin);
    assign sum = ~twoOnly & (a | b | cin);
endmodule


module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    adder frst(
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .cout(cout[0]),
        .sum(sum[0]) 
              );
           
    
    
    genvar i; 

    generate
        for (i = 1; i < 100; i = i + 1) begin : gen_inv_loop
            adder adr(
                .a(a[i]),
                .b(b[i]),
                .cin(cout[i-1]),
                .cout(cout[i]),
                   .sum(sum[i])       
            );
        end
    endgenerate
endmodule
