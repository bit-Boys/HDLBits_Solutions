module top_module (input a, input b, input c, output out);//
	
    wire outAnd;
    andgate inst1 ( .a(a), .b(b), .c(c), .out(outAnd), .d(1'b1), .e(1'b1));
    
    assign out = ~outAnd;

endmodule
