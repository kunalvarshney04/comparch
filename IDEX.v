
    input clk,
    input rst,
	 input regwrite,
	 input writesrc,
	 input [2:0]regs1,
	 input [7:0]r1,
	 input [7:0]s1,
	 input [2:0]writereg,
	 output reg [7:0]o1,
	 output reg [7:0]os1,
	 output reg [2:0]oreg1,
	 output reg [2:0]oreg,
	 output reg ow,
	 output reg osrc
    );
	 
	 reg [2:0]rd;
	 reg [7:0]reg1;
	 reg [7:0]regsin1;
	 reg [2:0]wrreg;
	 reg regw;
	 reg regsrc;


	 
	 always@*
	 begin 
	 if(rst==1) begin reg1 = 0; regsin1 = 0;  wrreg =0 ; rd =0; regw = 0; regsrc = 0; rd = 0;  end
	 else begin reg1 = r1;  regsin1 = s1;  wrreg = writereg; rd = regs1;  regw = regwrite; regsrc = writesrc;  end
	 end
	 
	 always@(posedge clk)
	 begin 
	 o1 = reg1;  
	 os1 = regsin1;
	 oreg = wrreg;
	 oreg1 = rd; 
	 ow = regw;
	 osrc = regsrc;
	 end
	 
	 


endmodule
