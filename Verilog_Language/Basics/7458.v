module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
    wire p2aANDp2b;
    wire p2cANDp2d;
    wire p1ANDOne;
    wire p1ANDTwo;
    
    
    assign p2aANDp2b = p2a & p2b;
    assign p2cANDp2d = p2c & p2d;
    
    assign p1ANDOne = p1a & p1b & p1c;
    assign p1ANDTwo = p1d & p1e & p1f;
    
    assign p1y = p1ANDOne | p1ANDTwo;
    assign p2y = p2aANDp2b | p2cANDp2d;


endmodule
