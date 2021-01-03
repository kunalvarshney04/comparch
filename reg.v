
module register(
    input [2:0]read_reg1,
    input [2:0]write_reg,
    input [7:0]write_data,
    input reset,
	input regwrite,
    output reg [7:0]read_data1
    );
	 
	 reg [7:0]regmem[7:0];
	 
	 always@(reset)
	 begin
	 if(reset==1) $readmemh("memreg.mem",regmem);
	 end
	 
	 always@*
	 begin 
	 read_data1 = regmem[read_reg1];
	 end
    
	 always@*
	 begin
	 if(regwrite==1) begin  regmem[write_reg] = write_data; end
	 end
	 

endmodule
