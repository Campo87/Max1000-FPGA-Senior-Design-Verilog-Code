// Keypad to 7 segment display
// Gabe Garves
// hex[7] = A
//
// Pinout on 4x4 keypad and which wire they are expected to be mapped to.
// R1 - row[0]
// R2 - row[1]
// R3 - row[2]
// R4 - row[3]
// C1 - column[0]
// C2 - column[1]
// C3 - column[2]
// C4 - column[3]
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
