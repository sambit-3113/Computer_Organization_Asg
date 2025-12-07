module mycomparator (input a, input b, input c, input d, input e, input f, input g, input h, output y);
    wire n1, n2, n3, n4, w1, w2;

    xnor(n1, a, b);
    xnor(n2, c, d);
    xnor(n3, e, f);
    xnor(n4, g, h);
    and(w1, n1, n2);
    and(w2, n3, w1);
    and(y, n4, w2);

endmodule;

module a2_tb();

	reg A, B, C, D, E, F, G, H;
	wire comp;

	mycomparator G1(A, B, C, D, E, F, G, H, comp);
	
	
	initial begin
        $dumpfile("a2_tb.vcd");
        $dumpvars(0, a2_tb);

        A = 0; B = 0; C = 0; D = 1; E = 0; F = 0; G = 0; H = 0;
        #10; A = 1; B = 0; C = 0; D = 0; E = 0; F = 0; G = 0; H = 0;
        #10; A = 0; B = 1; C = 0; D = 0; E = 0; F = 0; G = 0; H = 0;
        #10; A = 1; B = 1; C = 0; D = 0; E = 0; F = 0; G = 0; H = 0;
        #10; A = 0; B = 0; C = 1; D = 0; E = 0; F = 0; G = 0; H = 0;
        #10; A = 1; B = 0; C = 1; D = 1; E = 0; F = 0; G = 0; H = 0;
        #10; A = 0; B = 1; C = 1; D = 1; E = 0; F = 0; G = 0; H = 0;
        #10; A = 1; B = 1; C = 1; D = 1; E = 0; F = 0; G = 0; H = 0;
        #10;
	end

endmodule;