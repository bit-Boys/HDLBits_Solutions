module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss
);
    
    wire ena_ss_msb = ena && (ss[3:0] == 4'h9);
    wire ena_mm_lsb = ena && (ss == 8'h59);
    wire ena_mm_msb = ena && (ss == 8'h59) && (mm[3:0] == 4'h9);
    wire ena_hh     = ena && (ss == 8'h59) && (mm == 8'h59);
    
   
    wire toggle_pm  = ena && (ss == 8'h59) && (mm == 8'h59) && (hh == 8'h11);

    // Seconds LSB
    always @(posedge clk) begin
        if (reset) begin
            ss[3:0] <= 4'h0;
        end else if (ena) begin
            if (ss[3:0] == 4'h9)
                ss[3:0] <= 4'h0;
            else
                ss[3:0] <= ss[3:0] + 4'h1;
        end
    end

    // Second MSB 0 -> 5
    always @(posedge clk) begin
        if (reset) begin
            ss[7:4] <= 4'h0;
        end else if (ena_ss_msb) begin
            if (ss[7:4] == 4'h5)
                ss[7:4] <= 4'h0;
            else
                ss[7:4] <= ss[7:4] + 4'h1;
        end
    end

    // Minutes LSB 0 -> 9
    always @(posedge clk) begin
        if (reset) begin
            mm[3:0] <= 4'h0;
        end else if (ena_mm_lsb) begin
            if (mm[3:0] == 4'h9)
                mm[3:0] <= 4'h0;
            else
                mm[3:0] <= mm[3:0] + 4'h1;
        end
    end

    // Minutes MSB 0 -> 5
    always @(posedge clk) begin
        if (reset) begin
            mm[7:4] <= 4'h0;
        end else if (ena_mm_msb) begin
            if (mm[7:4] == 4'h5)
                mm[7:4] <= 4'h0;
            else
                mm[7:4] <= mm[7:4] + 4'h1;
        end
    end

    // 12 -> 01 ... 11 -> 12
    always @(posedge clk) begin
        if (reset) begin
            hh <= 8'h12; 
        end else if (ena_hh) begin
            if (hh == 8'h12) begin
                hh <= 8'h01; 
            end else if (hh[3:0] == 4'h9) begin
                hh[3:0] <= 4'h0;
                hh[7:4] <= 4'h1; 
            end else begin
                hh[3:0] <= hh[3:0] + 4'h1;
            end
        end
    end

    // AM PM
    always @(posedge clk) begin
        if (reset) begin
            pm <= 1'b0; 
        end else if (toggle_pm) begin
            pm <= ~pm;  
        end
    end

endmodule
