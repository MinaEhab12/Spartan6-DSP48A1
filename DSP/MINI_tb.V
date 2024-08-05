module DSP_tb();

    reg [17:0] A, B, D, BCIN;
    reg [47:0] C, PCIN;
    reg [7:0] OPMODE;
    reg CLK, CARRYIN, RSTA, RSTB, RSTM, RSTP, RSTC, RSTD, RSTCARRYIN, RSTOPMODE;
    reg CEA, CEB, CEM, CEP, CEC, CED, CECARRYIN, CEOPMODE;

    wire [17:0] BCOUT;
    wire [47:0] PCOUT, P;
    wire [35:0] M;
    wire CARRYOUT, CARRYOUTF;

    
    DSP DUT (A,B,D,C,CLK,CARRYIN,OPMODE,BCIN,RSTA,RSTB,RSTM,RSTP,RSTC,RSTD,RSTCARRYIN,RSTOPMODE,CEA,CEB,CEM,CEP,CEC,CED,CECARRYIN,CEOPMODE,PCIN,BCOUT,PCOUT,P,M,CARRYOUT,CARRYOUTF);

    initial begin
        CLK=0;
        forever
            #1 CLK = ~CLK;
    end

    integer i;
    initial begin
        // Initialize inputs
        A = 18'd0;
        B = 18'd0;
        D = 18'd0;
        BCIN = 18'd0;
        C = 48'd0;
        PCIN = 48'd0;
        OPMODE = 8'd0;
        CLK = 0;
        CARRYIN = 0;
        RSTA = 0;
        RSTB = 0;
        RSTM = 0;
        RSTP = 0;
        RSTC = 0;
        RSTD = 0;
        RSTCARRYIN = 0;
        RSTOPMODE = 0;
        CEA = 0;
        CEB = 0;
        CEM = 0;
        CEP = 0;
        CEC = 0;
        CED = 0;
        CECARRYIN = 0;
        CEOPMODE = 0;

        @(negedge CLK);

        RSTA = 1;
        RSTB = 1;
        RSTM = 1;
        RSTP = 1;
        RSTC = 1;
        RSTD = 1;
        RSTCARRYIN = 1;
        RSTOPMODE = 1;
        CEA = 1;
        CEB = 1;
        CEM = 1;
        CEP = 1;
        CEC = 1;
        CED = 1;
        CECARRYIN = 1;
        CEOPMODE = 1;

        #10;

        A = 18'h00123; B = 18'h00456; D = 18'h00000;
        C = 48'h0000000000; PCIN = 48'h0000000000;
        OPMODE = 8'h00; BCIN = 18'h00000; CARRYIN = 0;

        repeat(4)
            @(negedge CLK);


        for(i=0; i<100; i=i+1) begin
            A = $random;
            B = $random;
            D = $random;
            C = $random;
            OPMODE = $random;
            CECARRYIN = $random;
            CEOPMODE = $random;
            @(negedge CLK);

            if (PCOUT !== 0)begin
                $display("Test Failed");
                $stop;
            end
            if (P !== 0)begin
                $display("Test Failed");
                $stop;
            end
            if (M !== 0)begin
                $display("Test Failed");
                $stop;
            end
            if (CARRYOUT !== 0)begin
                $display("Test Failed");
                $stop;
            end
            if (CARRYOUTF !== 0)begin
            $display("Test Failed");
            $stop;
            end
        end
        
        RSTA = 0;
        RSTB = 0;
        RSTM = 0;
        RSTP = 0;
        RSTC = 0;
        RSTD = 0;
        RSTCARRYIN = 0;
        RSTOPMODE = 0;

        for(i=0; i<1000; i=i+1) begin
            A = $random;
            B = $random;
            D = $random;
            C = $random;
            OPMODE = $random;
            CECARRYIN = $random;
            CEOPMODE = $random;
            @(negedge CLK);
        end
        $stop;
    end

    initial begin
        $monitor("A= %d, B= %d, C= %d, D= %d, BCIN= %d, PCIN= %d, OPMODE= %b, BCOUT = %d, PCOUT = %d, P = %d, M = %d, CARRYOUT = %d, CARRYOUTF = %d",A,B,C,D,BCIN,PCIN,OPMODE,BCOUT,PCOUT,P,M,CARRYOUT,CARRYOUTF);
    end
endmodule