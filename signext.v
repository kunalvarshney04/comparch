module signext(
    input [2:0]in1,

	 output [7:0]out1
    );
	
	
	 assign out1 = (in1[2])?{{5{in1[2]}},in1}:in1;



endmodule
