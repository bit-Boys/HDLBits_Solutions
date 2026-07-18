module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    
    wire xo;
    
    assign xo = (in1 && in2) || (~in1 && ~in2);
    
    assign out = (xo && ~in3) || (~xo && in3);

endmodule
