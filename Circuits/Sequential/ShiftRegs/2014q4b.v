module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    
    MUXDFF modOne(KEY[0], KEY[3], KEY[1], KEY[2], SW[3], LEDR[3]);
    MUXDFF modTwo(KEY[0], LEDR[3], KEY[1], KEY[2], SW[2], LEDR[2]);
    MUXDFF modThree(KEY[0], LEDR[2], KEY[1], KEY[2], SW[1], LEDR[1]);
    MUXDFF modFour(KEY[0], LEDR[1], KEY[1], KEY[2], SW[0], LEDR[0]); // kind of ugly to positional map, prolly should use port mapping


endmodule

module MUXDFF (input clk, input w, input E, input L, input R, output reg Q);
    always @ (posedge clk) begin
        if(L) begin
            Q <= R; 
        end else if(E) begin
            Q <= w;
        end else begin
            Q <= Q;
        end
    end

endmodule
