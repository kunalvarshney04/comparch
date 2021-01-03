
module instfetch(
    input [7:0]PC,
	input clk,
    input rst,
    output [7:0]instruction_code
    );
	 
	 

	 reg [7:0]mem[36:0];
	 
	 always@(rst)
	 begin
    if(rst==1) $readmemh("Mem.mem",mem);
	 end
	 
	 assign instruction_code = mem[PC];


endmodule
