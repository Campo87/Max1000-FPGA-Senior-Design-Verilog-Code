// Stepdown 1MHz input clock to 852Hz
// 
// AUTHOR: JAMES STARKS
// DATE: 4/17/2020
// FROM: TXST SENIOR DESIGN FALL 2019-SPRING2020
// FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
// div = input_clk_freq / (2 * output_clk_freq)
//
module stepdown_852Hz(
    output  reg     clk_852_out,
    input   wire    clk_1m_in,
    input   wire    reset_b
);
    parameter div = 587;
    
    reg[9:0] counter_ff;
    
    always@(posedge clk_1m_in or negedge reset_b)
    begin
        if(reset_b == 1'b0) begin
            counter_ff <= 10'd0;
            clk_852_out <= 1'b0;
        end
        else if(counter_ff > div) begin
            counter_ff <= 10'd0;
            clk_852_out <= ~clk_852_out;
        end
        else 
            counter_ff <= counter_ff + 10'd1;
    end
    
endmodule
