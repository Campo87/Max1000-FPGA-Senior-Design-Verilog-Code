// Stepdown 1MHz input clock to 1633Hz
// 
// AUTHOR: JAMES STARKS
// DATE: 4/17/2020
// FROM: TXST SENIOR DESIGN FALL 2019-SPRING2020
// FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
// // div = input_clk_freq / (2 * output_clk_freq)
//
module stepdown_1633Hz(
    output  reg     clk_1633_out,
    input   wire    clk_1m_in,
    input   wire    reset_b
);
    parameter div = 306;
    
    reg[8:0] counter_ff;
    
    always@(posedge clk_1m_in or negedge reset_b)
    begin
        if(reset_b == 1'b0) begin
            counter_ff <= 9'd0;
            clk_1633_out <= 1'b0;
        end
        else if(counter_ff > div) begin
            counter_ff <= 9'd0;
            clk_1633_out <= ~clk_1633_out;
        end
        else 
            counter_ff <= counter_ff + 9'd1;
    end
    
endmodule
