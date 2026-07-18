module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    
    wire [9:0] first;

    assign first = sel*4;
    assign out = in[first +: 4];

endmodule
