module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss
); 

    // Helper task to reset time to 12:00:00 AM
    task reset_time;
    begin
        hh <= 8'h12;   
        mm <= 8'h00;
        ss <= 8'h00;
        pm <= 0;
    end
    endtask

    always @(posedge clk) begin
        if (reset) begin
            reset_time();
        end
        else if (ena) begin
            // Seconds
            if (ss[3:0] == 4'd9) begin
                ss[3:0] <= 4'd0;
                if (ss[7:4] == 4'd5) begin
                    ss[7:4] <= 4'd0;

                    // Minutes
                    if (mm[3:0] == 4'd9) begin
                        mm[3:0] <= 4'd0;
                        if (mm[7:4] == 4'd5) begin
                            mm[7:4] <= 4'd0;

                            // Hours
                            if (hh == 8'h11) begin  // 11 → 12 (toggle pm)
                                hh <= 8'h12;
                                pm <= ~pm;
                            end
                            else if (hh == 8'h12) begin  // 12 → 01 (no pm toggle)
                                hh <= 8'h01;
                            end
                            else begin
                                if (hh[3:0] == 4'd9) begin
                                    hh[3:0] <= 4'd0;
                                    hh[7:4] <= hh[7:4] + 1;
                                end
                                else begin
                                    hh[3:0] <= hh[3:0] + 1;
                                end
                            end

                        end else begin
                            mm[7:4] <= mm[7:4] + 1;
                        end
                    end else begin
                        mm[3:0] <= mm[3:0] + 1;
                    end

                end else begin
                    ss[7:4] <= ss[7:4] + 1;
                end
            end else begin
                ss[3:0] <= ss[3:0] + 1;
            end
        end
    end
endmodule
