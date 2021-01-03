`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:34:57 04/18/2018 
// Design Name: 
// Module Name:    EXWB 
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
module EXWB(
    input clk,
    input rst,
	
	 input regwrite,
	 input writesrc,
     input [7:0]add,
	 input [7:0]s,
	 input [2:0]write,
	 output reg [7:0]os,
	 output reg [7:0]outadd,
	 output reg [2:0]owrite,
	 output reg ow,

	 output reg osrc
    );
	 

	 reg [7:0]regadd;
	 reg [2:0]writereg;
	 reg [7:0]regs;
	 reg regw;
	 reg regsrc;



	 always@* 
	 begin 
	 if(rst==1) begin  regadd = 0; writereg = 0; regs = 0; regw =0; regsrc =0;  end
	 else begin regadd = add; writereg = write; regs = s; regw = regwrite; regsrc = writesrc;   end
	 end
	 
	 always@(posedge clk)
	 begin 
	
	 os = regs;
	 outadd = regadd;
	 owrite = writereg;
	 ow = regw;
	 osrc = regsrc;

	 end


endmodule
