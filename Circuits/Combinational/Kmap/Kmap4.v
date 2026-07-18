module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    
    assign out = a ^ b ^ c ^ d; // good luck if you actually wrote it out

endmodule
