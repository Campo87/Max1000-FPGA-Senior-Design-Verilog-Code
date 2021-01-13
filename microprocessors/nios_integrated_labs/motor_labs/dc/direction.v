// Variable speed controller for DC motor.
// 
// AUTHOR: GRANT SELIGMAN
// DATE: 4/3/2020
// EDITED BY: JAMES STARKS
// DATE: 3/3/2020
// FROM: TXST SENIOR DESIGN FALL 2019-SPRING 2020
// FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTIOR USE
// DESCRIPTION: This module sets the direction in which the
//              motor will spin. The motor driver inputs 
//              connect the the inputs of the SN754410 A1 & A2.
//              motor_driver_inputs[0] -> A1
//              motor_driver_inputs[1] -> A2
//              Look at the SN754410 documentation to see how 
//              Motor Driver Input (A) Truth 
//                                       |A1|A2|
//                  ----------------------------
//                  Clockwise            |0 |1 |
//                  Counter-Clockwise    |1 |0 |
// 
module direction(
    output reg [1:0] motor_driver_inputs;
    input wire          select_direction;
);

    assign motor_driver_inputs (select)

    always@(select_direction) begin
        case(select_direction)
            1'b0:    motor_driver_inputs = 2'b10;	// Clockwise
            1'b1:    motor_driver_inputs = 2'b01;	// Counter-Clockwise
        endcase
    end
endmodule
