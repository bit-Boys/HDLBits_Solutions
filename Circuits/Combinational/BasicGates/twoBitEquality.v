module top_module ( input [1:0] A, input [1:0] B, output z ); 
    
    wire firstDigs;
    wire secDigs;
    
    assign firstDigs = (A[0] && B[0]) || (~A[0] && ~B[0]);
    assign secDigs = (A[1] && B[1]) || (~A[1] && ~B[1]);
    
    assign z = firstDigs && secDigs;

endmodule
