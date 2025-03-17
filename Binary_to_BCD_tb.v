`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:58:23 03/02/2025
// Design Name:   Binary_to_BCD
// Module Name:   /home/mithu/xilinxpractice/Binary_to_BCD/Binary_to_BCD_tb.v
// Project Name:  Binary_to_BCD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Binary_to_BCD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Binary_to_BCD_tb;

reg [7:0] binary;  // 8-bit Binary Input
wire [3:0] hundreds, tens, ones;  // BCD Outputs

// Instantiate the Binary to BCD Converter
Binary_to_BCD uut (
    .binary(binary),
    .hundreds(hundreds),
    .tens(tens),
    .ones(ones)
);

initial begin
    $monitor("Binary = %b (%d) | BCD = %d%d%d",
             binary, binary, hundreds, tens, ones);

    // Test Cases
    binary = 8'b00001010; #10;  // Binary 10 -> BCD 010
    binary = 8'b00110011; #10;  // Binary 51 -> BCD 051
    binary = 8'b01100100; #10;  // Binary 100 -> BCD 100
    binary = 8'b10010110; #10;  // Binary 150 -> BCD 150
    binary = 8'b11001000; #10;  // Binary 200 -> BCD 200
    binary = 8'b11111001; #10;  // Binary 249 -> BCD 249
end

endmodule 