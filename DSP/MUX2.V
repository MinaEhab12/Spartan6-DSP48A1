module Mux (B,BCIN,CLK,CEB,RSTB,B0_MUX);
	
	parameter B_INPUT="DIRECT";
	parameter B0REG=0;
	parameter RSTTYPE="SYNC";

	input CLK,CEB,RSTB;
	input [17:0] B,BCIN;

	output [17:0]B0_MUX;


	generate
		if (B_INPUT == "DIRECT")
			FF_Mux #(.W(18),.SEL(B0REG),.RSTTYPE(RSTTYPE)) m5 (B,CLK,CEB,RSTB,B0_MUX);
		else if (B_INPUT == "CASCADE")
			FF_Mux #(.W(18),.SEL(B0REG),.RSTTYPE(RSTTYPE)) m5 (BCIN,CLK,CEB,RSTB,B0_MUX);
		else
			FF_Mux #(.W(18),.SEL(B0REG),.RSTTYPE(RSTTYPE)) m5 (18'b0000_0000_0000_0000_00,CLK,CEB,RSTB,B0_MUX);
	endgenerate 

endmodule