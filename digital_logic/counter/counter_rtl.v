// 4-Bit Counter
//
// AUTHOR: James Starks
// DATE: 11/15/2019
// FROM: TXST SENIOR DESIGN PROJECT FALL 2019
// FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
//
// RTL example

module counter_rtl(
    // Output data stored in the state flip flop
    output  wire    [3:0]     out,
    
    // Counter control signals
    input   wire              rst,
    input   wire              clk
);
    // Assigned output states to have manageable names
    parameter s0 = 4'b0011;
    parameter s1 = 4'b0110;
    parameter s2 = 4'b1100;
    parameter s3 = 4'b1001;
    
    // Store current state
    reg [3:0] state;
    
    // Enter at every positive edge of clk
    always@(posedge clk)
        // Reset state to s0
        if (rst == 1'b0)
            state <= s0;
        // Increment to next state
        else
            case(state)
                // If state is at s0 change state to s1 (if (4'b0011) state = 4'b0110)
                s0: state <= s1;
                s1: state <= s2;
                s2: state <= s3;
                s3: state <= s0;
            endcase
    
    // Drive out to state
    assign out = state;
    
endmodule
