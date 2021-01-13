// Stepdown 1MHz input clock to 60Hz
// 
// AUTHOR: JAMES STARKS
// DATE: 4/17/2020
// FROM: TXST SENIOR DESIGN FALL 2019-SPRING2020
// FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
// div = input_clk_freq / (2 * output_clk_freq)
// 
module stepdown_60Hz(
    output  reg     clk_60_out,
    input   wire    clk_1m_in,
    input   wire    reset_b
);
    parameter div = 8333;
    
    reg[13:0] counter_ff;
    
    always@(posedge clk_1m_in or negedge reset_b)
    begin
        if(reset_b == 1'b0) begin
            counter_ff <= 14'd0;
            clk_60_out <= 1'b0;
        end
        else if(counter_ff > div) begin
            counter_ff <= 14'd0;
            clk_60_out <= ~clk_60_out;
        end
        else 
            counter_ff <= counter_ff + 14'd1;
    end
    
endmodule
