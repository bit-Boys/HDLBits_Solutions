module top_module( 
    input [99:0] in,
    output [99:0] out
);	

    integer i;
    integer j;
    
    always @* begin  
        j = 99;
        
        for (i = 0; i < 100; i = i + 1) begin
            
            out[i] = in[j];
            j = j - 1;
        end 
    end
endmodule
