module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    wire [7:0] ALessB;
    wire [7:0] CLessD;
    
    assign ALessB = (a < b ? a : b);
    assign CLessD = (c < d ? c : d);
    
    assign min = (ALessB < CLessD ? ALessB : CLessD);

endmodule
