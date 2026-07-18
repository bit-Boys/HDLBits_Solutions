module addr (
    input a, b, cin,
    output sum, cout
    
);
    
    assign {cout, sum} = a + b + cin;
    
    
endmodule


module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire [3:0] couts;
    
    addr modOne(
        .a (x[0]),
        .b (y[0]),
        .cin (1'b0),
        .sum (sum[0]), 
        .cout (couts[0]) 
          );
           
    addr modTwo(
        .a (x[1]),
        .b (y[1]),
        .cin (couts[0]),
           .sum (sum[1]), 
        .cout (couts[1]) 
          );
           
    addr modThree(
        .a (x[2]),
        .b (y[2]),
        .cin (couts[1]),
           .sum (sum[2]), 
        .cout (couts[2]) 
          );
           
     addr modFour(
         .a (x[3]),
         .b (y[3]),
         .cin (couts[2]),
          .sum (sum[3]), 
          .cout (sum[4]) 
           );

endmodule
