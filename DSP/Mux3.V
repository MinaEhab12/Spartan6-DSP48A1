module mux2 (CARRYIN,OPMODE_MUX5,CYI);
	

	input OPMODE_MUX5,CARRYIN;

	output reg CYI;

	parameter CARRYINSEL="OPMODE5";

    always @(*) begin
		if (CARRYINSEL == "OPMODE5")
			CYI = OPMODE_MUX5;
		else if (CARRYINSEL == "CARRYIN")
			CYI = CARRYIN;
		else
			CYI = 0;
	end

endmodule