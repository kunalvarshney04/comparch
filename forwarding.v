
module forwarding(
		input [2:0]rd,
		input osrc,
		input [2:0]writereg,
		input regwrite,
		input rst,
		output reg forwarda
    );
	 
	 always@(rst)
	 begin
	 if(rst==1)begin forwarda = 0;end
	 end
	 
	 always@*
	 begin 
	 if(regwrite==1 && rd == writereg)
	 begin 
	 if(osrc == 0) begin forwarda = 1; end
	 else if(osrc == 1) begin forwarda = 0; end
	 end
	 else begin forwarda = 0; end 
	 end
	 	 
endmodule
