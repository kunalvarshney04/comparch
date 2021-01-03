
module IFID(
    input [7:0]inst,
    input clk,
    input rst,
    output reg [7:0]outinst
    );
	 
	 reg [7:0]regins;

	 
	 always@*
	 begin
	 if(rst==1) begin regins = 0;  end
	 else begin  regins = inst; end
	 end
	 
	 always@(posedge clk)
	 begin 
	 outinst = regins;
	 end
	 


endmodule
