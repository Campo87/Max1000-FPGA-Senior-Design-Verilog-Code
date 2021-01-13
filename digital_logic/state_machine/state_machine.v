// State Machine
// AUTHOR: James Starks
// DATE: 11/15/2019
// FROM: TXST SENIOR DESIGN PROJECT FALL 2019
// FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
//
// RTL example

module state_machine_rtl(
    // Output data stored in the state flip flop
    output  wire    [2:0]   out,
    
    // State machine control signals
    input   wire            dir,
    input   wire            rst,
    input   wire            clk
);

    // Assigned output states to have manageable names
    parameter s0 = 3'b000;
    parameter s1 = 3'b100;
    parameter s2 = 3'b110;
    parameter s3 = 3'b111;
    parameter s4 = 3'b101;
    parameter s5 = 3'b001;
    parameter s6 = 3'b011;
    parameter s7 = 3'b010;
    
    // Store current and next state
    reg [2:0] state;
    reg [2:0] next_state;
    
    // Combinational always block
    always@(*) begin
        // State transitional logic
        case(state)
            s0: next_state = (dir == 1'b0) ? s1 : s7;
            s1: next_state = (dir == 1'b0) ? s2 : s0;
            s2: next_state = (dir == 1'b0) ? s3 : s1;
            s3: next_state = (dir == 1'b0) ? s4 : s2;
            s4: next_state = (dir == 1'b0) ? s5 : s3;
            s5: next_state = (dir == 1'b0) ? s6 : s4;
            s6: next_state = (dir == 1'b0) ? s7 : s5;
            s7: next_state = (dir == 1'b0) ? s0 : s6;
        endcase
    end
    
    // Sequential always block
    always@(posedge clk) begin
        // State flip-flops w/ synchronous reset
        if(rst == 1'b0) 
            state <= s0;
        else
            state <= next_state;
    end
    
    assign out = state;
    
endmodule
