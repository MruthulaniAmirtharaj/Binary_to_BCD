`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:57:45 03/02/2025 
// Design Name: 
// Module Name:    Binary_to_BCD 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Binary_to_BCD (
    input [7:0] binary,  // 8-bit Binary Input
    output reg [3:0] hundreds, tens, ones  // 3-digit BCD Output
);

integer i;
reg [19:0] shift_reg;  // 20-bit register for processing (8-bit binary + 3*4-bit BCD)

always @(binary) begin
    // Initialize shift register
    shift_reg = {12'b0, binary};  // [Hundreds|Tens|Ones|Binary]

    // Double Dabble Algorithm
    for (i = 0; i < 8; i = i + 1) begin
        // Adjust BCD digits if ≥ 5
        if (shift_reg[15:12] >= 5) shift_reg[15:12] = shift_reg[15:12] + 3;
        if (shift_reg[11:8] >= 5) shift_reg[11:8] = shift_reg[11:8] + 3;
        if (shift_reg[7:4] >= 5) shift_reg[7:4] = shift_reg[7:4] + 3;

        // Shift left by 1 bit
        shift_reg = shift_reg << 1;
    end

    // Extract BCD digits
    hundreds = shift_reg[15:12];
    tens = shift_reg[11:8];
    ones = shift_reg[7:4];
end

endmodule
