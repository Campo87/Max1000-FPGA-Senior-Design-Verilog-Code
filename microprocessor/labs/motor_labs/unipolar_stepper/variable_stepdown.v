// 
// AUTHOR: JAMES STARKS
// DATE: 4/24/2020
// FROM: TXST SENRIOR DESIGN PROJECT FALL 2019-SPRING 2020
// FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
// DESCRIPTION: This module is exactly like the previous stepdown
//              clock dividers except the division factor is a
//              16bit value that can be set by another module (in
//              this case, NIOS).
// 
module variable_stepdown(
    output reg          clk_out,
	input wire [15:0]   div,
    input wire          in_clk,
    input wire          reset_b
);

    reg [15:0] count_ff;

    always@(posedge in_clk) begin
        if(reset_b == 1'b0) begin
            counter_ff <= 16'd0
            clk_out <= 1'b0;
        end
        else if(counter_ff > div) begin
            counter_ff <= 16'd0
            clk_out <= ~clk_out;
        end
        else
            counter_ff <= counter_ff + 16'd1;
    end
endmodule
