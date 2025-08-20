module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    // Heater on if in heating mode and too cold
    assign heater = mode & too_cold;

    // Air conditioner on if in cooling mode and too hot
    assign aircon = ~mode & too_hot;

    // Fan on if heater or aircon on, or user requested
    assign fan = heater | aircon | fan_on;
endmodule
