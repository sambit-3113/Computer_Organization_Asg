
module srlatch_are (input AE, AR, S, R, output reg Q);
    initial Q = 1'b0;
    always @(AR, AE, S, R)
        begin
            if (AR) Q <= 0;
            else 
                begin
                    if (AE == 1)
                        begin
                            if (S == 0 & R == 0) Q <= 1'bx;
                            else if (S == 0 & R == 1) Q <= 0;
                            else if (S == 1 & R == 0) Q <= 1;
                        end
                end
        end
endmodule

module a1_tb();
    reg AE, AR, S, R;
    wire Q;

    srlatch_are SR (.AE(AE), .AR(AR), .S(S), .R(R), .Q(Q));

    initial begin
        $dumpfile("a1_tb.vcd");
        $dumpvars(0,a1_tb);
        
        AR = 1; AE = 0; S = 1; R = 1; #10;
        AR = 1; AE = 1; S = 0; R = 1; #10;
        AR = 1; AE = 1; S = 1; R = 1; #10;
        AR = 0; AE = 0; S = 0; R = 1; #10;
        AR = 0; AE = 0; S = 1; R = 0; #10;
        AR = 0; AE = 0; S = 1; R = 1; #10;
        AR = 0; AE = 1; S = 0; R = 0; #10;
        AR = 0; AE = 1; S = 0; R = 1; #10;
        AR = 0; AE = 1; S = 1; R = 0; #10;
        AR = 0; AE = 1; S = 1; R = 1; #10;
        
        $finish;
    end

endmodule