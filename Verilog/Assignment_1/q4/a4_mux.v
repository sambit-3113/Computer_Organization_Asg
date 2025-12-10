module mymux2to1 (input a, input b, input s, output y);
    wire w1, w2, ns;
    not(ns, s);
    and(w1, a, ns);
    and(w2, b, s);
    or(y, w1, w2);
endmodule

module mymux4to1 (input a, input b, input c, input d, input s, input t, output y);
    wire w3, w4;
    mymux2to1 M1 (.a(a), .b(b), .s(t), .y(w3));
    mymux2to1 M2 (.a(c), .b(d), .s(t), .y(w4));
    mymux2to1 M3 (.a(w3), .b(w4), .s(s), .y(y));
endmodule
     
module a4_mux_tb();

	reg A, B, C, D, E, F;
	wire Y;

	mymux4to1 G1(A, B, C, D, E, F, Y);
	
	
	initial begin
        $dumpfile("a4_mux_tb.vcd");
        $dumpvars(0, a4_mux_tb);

        A = 0; B = 0; C = 0; D = 1; E = 0; F = 0;
        #10; A = 1; B = 0; C = 0; D = 0; E = 0; F = 0;
        #10; A = 0; B = 1; C = 0; D = 0; E = 0; F = 0;
        #10; A = 1; B = 1; C = 0; D = 0; E = 0; F = 1;
        #10; A = 0; B = 0; C = 1; D = 0; E = 0; F = 0;
        #10; A = 1; B = 0; C = 1; D = 1; E = 1; F = 0;
        #10; A = 0; B = 1; C = 1; D = 1; E = 0; F = 0;
        #10; A = 1; B = 1; C = 1; D = 1; E = 1; F = 1;
        #10;
	end

endmodule;