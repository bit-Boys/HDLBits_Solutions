module A (input x, input y, output z);    
    assign z = (x && ~y);
endmodule


module B ( input x, input y, output z );    
    assign z = (x && y) || (~x && ~y);
endmodule


module top_module (input x, input y, output z);
    wire z1;
    wire z2;
    wire z3;
    wire z4;
    
    wire topOne;
    wire bottomOne;
    
    
    A A1 (.x(x),
          .y(y),
          .z(z1) );
    
    A A2 (.x(x),
          .y(y),
          .z(z3) );
    
    B B1 (.x(x),
          .y(y),
          .z(z2) );
    
    B B2 (.x(x),
          .y(y),
          .z(z4) );
    
    assign topOne = z1 || z2;
    assign bottomOne = z3 && z4;
    
    assign z = (topOne && ~bottomOne) || (~topOne && bottomOne);
endmodule
