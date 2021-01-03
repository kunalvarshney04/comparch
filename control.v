
module control(
    input [1:0]opcode,
    output reg regwrite,
    output reg writesrc
    );

	 
	 
	 always@(opcode)
	 begin 
	 case(opcode)
	 2'b00: begin regwrite=1; writesrc=1;  end
	 2'b01: begin regwrite=1; writesrc=0;  end
	 2'b11: begin regwrite=0; writesrc=0;  end
	 endcase
	 end

endmodule
