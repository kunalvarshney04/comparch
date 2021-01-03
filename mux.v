
module mux(
    input [7:0]in1,
    input [7:0]in2,
    input c,
    output [7:0]out
    );
	 
	 assign out = (c)?in2:in1;


endmodule
