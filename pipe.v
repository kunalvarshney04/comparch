
module pipe(
    input clk,
    input rst
    );
	 
	 wire writesrc;
	 wire [7:0]inst_code;
	 wire [7:0]inst_code1;
	 wire [2:0]writereg;
	 wire [2:0]writereg1;
	 wire [7:0]write_data;
	 wire regwrite;
	 wire [7:0]r1;
	 wire [7:0]r2;
	 wire [7:0]s1;
	 wire [7:0]o1;
	 wire [7:0]o2;
	 wire [7:0]os1;
	 wire [2:0]rd;
	 wire [2:0]rs;
	 wire [7:0]out;
	 wire [7:0]load;
	 wire [7:0]alu;
	 wire forwarda;
	 wire forwardb;
	 wire ow;
	 wire osrc;
	 wire regw;
	 wire regsrc;
	 wire [7:0]ou1;
	 wire [7:0]ou2;
	
	 reg [7:0]PC;
	 reg [7:0]PC_1;
	 

	 
    	//PC module with jump 
	 always@(posedge rst,posedge clk)
	 begin 
	 if(rst==1) PC = 0;
	 else if(inst_code[7:6]==2'b11) 
	 begin
	 PC_1 = PC + 1;
	 PC = {{PC_1[7:6]},{inst_code[5:0]}};
	 end
	 else 
	 PC = PC+1;
	 end
	
	// instruction fetch
	 instfetch i1(PC,clk,rst,inst_code); 
	 //IF/ID Pipeline register
	 IFID p1(inst_code,clk,rst,inst_code1);
	 //Control Unit
	 control c1(inst_code1[7:6],regwrite,writesrc);
	 //Registers module
	 register r3(inst_code1[5:3],writereg,write_data,rst,regw,r1);
	 //Sign extension block
	 signext s3(inst_code1[2:0],s1);
   //ID/EX Pipeline register	
	 IDEX p2(clk,rst,regwrite,writesrc,inst_code1[5:3],r1,s1,inst_code1[5:3],o1,os1,rd,writereg1,ow,osrc);
	 //forwarda mux
	 mux m2(o1,write_data,forwarda,ou1);
	 //forwardb mux
	 //alu (add)
	 add a2(ou1,os1,out);
	 //EX/WB Pipeline register
	 EXWB p3(clk,rst,ow,osrc,out,os1,writereg1,load,alu,writereg,regw,regsrc);
	 //forwarding unit
	 forwarding f1(rd,osrc,writereg,regw,rst,forwarda);
	 //writesrc mux
	 mux m1(alu,load,regsrc,write_data);
	endmodule
