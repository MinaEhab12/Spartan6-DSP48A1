module FF_Mux (D,CLK,CEN,rst,Q);

	parameter W=18;
	parameter SEL=0;
	parameter RSTTYPE="SYNC";
	input [W-1:0] D;
	input CLK,rst,CEN;
	output [W-1:0] Q;

	reg [W-1:0] D_reg;

	generate 

	if (RSTTYPE=="ASYNC") begin
		always @(posedge CLK or posedge rst) begin
			if (rst) 
				D_reg<=0;
			else if (CEN)
				D_reg<=D;
		end
	end
	else if (RSTTYPE=="SYNC") begin
		always @(posedge CLK) begin
			if (rst) 
				D_reg<=0;
			else if (CEN)
				D_reg<=D;
		end
	end
	endgenerate 

	assign Q = (SEL)? D_reg : D ;

endmodule