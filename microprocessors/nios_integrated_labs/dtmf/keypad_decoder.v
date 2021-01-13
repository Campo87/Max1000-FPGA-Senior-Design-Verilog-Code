//Keypad Decoder Module
// 
// AUTHOR: GABE GARVES
// EDITED BY: GRANT SELIGMAN
// DATE: 2/25/2020
// EDITED: 4/13/2020
// FROM: TXST SENIOR DESIGN PROJECT FALL 2019-SPRING 2020
// FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
// DESCRIPTION: A keypad is a matrix of pushbuttons with one lead connected to the rows
// 			 and the other connect to the column. When a button is pressed a connection
// 			 is made between a row and column. The way this decoder knows which button
// 			 has been pressed is by providing an active low signal to one row at a time.
// 			 This active low signal switch between rows with the clock. When a row is 
// 			 set low, the module will then check the column side for a low signal. This
// 			 will indicate which column has been pressed.
// 
// 			 For this project a 60Hz clock controls the speed at which the rows change. 
// 			 At 60Hz the keypad can be checked 15 times a second for a keypress!
// 
// 	Expected Pinout on 4x4 keypad and which wire they are expected to be mapped to.
// 	  column_in[3]	Input	PIN_K10
// 	  column_in[2]	Input	PIN_H5
// 	  column_in[1]	Input	PIN_J1
// 	  column_in[0]	Input	PIN_J2
// 	  ------------------------
// 	  row_out[3]	Output	PIN_K11
// 	  row_out[2]	Output	PIN_J13
// 	  row_out[1]	Output	PIN_J12
// 	  row_out[0]	Output	PIN_L12
// 
module keypad_decoder(
    input   wire            clk,
    input   wire    [3:0]   column,
    output  reg     [3:0]   row,
    output  reg     [3:0]   key
);
    
    always@(posedge clk) begin
        case (row)
            4'b0111: 
                if      (column[0] == 1'b0) key <= 4'b0001;		
                else if (column[1] == 1'b0) key <= 4'b0010;
                else if (column[2] == 1'b0) key <= 4'b0011;
                else if (column[3] == 1'b0) key <= 4'b1010;
                else row = 4'b1011;
                
            4'b1011: 
                if      (column[0] == 1'b0) key <= 4'B0100;
                else if (column[1] == 1'b0) key <= 4'b0101;
                else if (column[2] == 1'b0) key <= 4'b0110;
                else if (column[3] == 1'b0) key <= 4'b1011;
                else row = 4'b1101;
                
            4'b1101: 
                if      (column[0] == 1'b0) key <= 4'b011;
                else if (column[1] == 1'b0) key <= 4'b1000;
                else if (column[2] == 1'b0) key <= 4'b1001;
                else if (column[3] == 1'b0) key <= 4'b1100;
                else row = 4'b1110;
                
            4'b1110: 
                if      (column[0] == 1'b0) key <= 4'b1110;
                else if (column[1] == 1'b0) key <= 4'b0000;
                else if (column[2] == 1'b0) key <= 4'b1111;
                else if (column[3] == 1'b0) key <= 4'b1101;
                else row <= 4'b0111;
                
            default: row <= 4'b0111;
            
        endcase
    end
endmodule
        