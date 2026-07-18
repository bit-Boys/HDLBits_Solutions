`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    
    wire AandB;
    wire CandD;
    wire abORcd;
    
    assign AandB = a & b;
    assign CandD = c & d;
    assign abORcd = AandB | CandD;
    
    assign out = abORcd;
    assign out_n = ~abORcd;

endmodule
