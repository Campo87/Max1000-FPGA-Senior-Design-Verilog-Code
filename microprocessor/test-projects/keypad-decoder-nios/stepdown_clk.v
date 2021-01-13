// stepdown_clk
// Stepdown 12MHz clock to 60Hz
// div = input_clk_freq / (2 * output_clk_freq)

module stepdown_clk(
	output  wire    clk_60_out,
	input   wire    clk_12m_in,
    input   wire    reset_b
);
    parameter div = 100000;
    
    reg[16:0] counter_ff;
    
    always@(posedge clk_12m_in or negedge reset_b)
    begin
        if(reset_b == 1'b0)
            counter_ff <= 17'd0;
        else if(counter_ff > div)
            counter_ff <= 17'd0;
        else 
            counter_ff <= counter_ff + 17'd1;
    end
    
endmodule
