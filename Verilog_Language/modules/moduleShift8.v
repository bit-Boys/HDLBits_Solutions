module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    
    wire [7:0] q0;
    wire [7:0] q1;
    wire [7:0] q2;
    
    
    my_dff8 myDffOne(clk, d, q0);
    my_dff8 myDffTwo(clk, q0, q1);
    my_dff8 myDffThree(clk, q1, q2);
    
    always @* begin
        if (sel[0] == 1'b0 && sel[1] == 1'b0) begin
            q[7:0] = d[7:0];
        end
        
        else if (sel[0] == 1'b1 && sel[1] == 1'b0) begin
            q[7:0] = q0[7:0];
            
        end
        
        else if (sel[0] == 1'b0 && sel[1] == 1'b1) begin
            q[7:0] = q1[7:0];
        end
        
        else if (sel[0] == 1'b1 && sel[1] == 1'b1) begin
            q[7:0] = q2[7:0];
        end
        
    end
        
        
        

endmodule
