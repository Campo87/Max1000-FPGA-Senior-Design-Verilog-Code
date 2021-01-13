// Stepdown 1MHz input clock to 770Hz
//
// AUTHOR: JAMES STARKS
// DATE: 4/17/2020
// FROM: TXST SENIOR DESIGN FALL 2019-SPRING2020
// FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
// div = input_clk_freq / (2 * output_clk_freq)
// 
module stepdown_770Hz(
    output  reg     clk_770_out,
    input   wire    clk_1m_in,
    input   wire    reset_b
);
    parameter div = 649;
    
    reg[9:0] counter_ff;
    
    always@(posedge clk_1m_in or negedge reset_b)
    begin
        if(reset_b == 1'b0) begin
            counter_ff <= 10'd0;
            clk_770_out <= 1'b0;
        end
        else if(counter_ff > div) begin
            counter_ff <= 10'd0;
            clk_770_out <= ~clk_770_out;
        end
        else 
            counter_ff <= counter_ff + 10'd1;
    end
    
endmodule
