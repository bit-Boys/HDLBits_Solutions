module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    
    wire to_heat;
    wire to_cool;
    
    assign to_heat = mode && too_cold;
    assign to_cool = ~mode && too_hot;
    
    assign heater = to_heat;
    assign aircon = to_cool;
    assign fan = fan_on || to_heat || to_cool;

endmodule
