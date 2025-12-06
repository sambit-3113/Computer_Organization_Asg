module myor (input a, input b, input c, output y);
    wire w;
    or (w, a, b);
    or (y, c, w);
endmodule;

module myand (input a, input b, input c, output y);
    wire w;
    and (w, a, b);
    and (y, c, w);
endmodule;

module a1_tb();

	reg A, B, C;
	wire or_calc, and_calc;

	myor G1(A, B, C, or_calc);
	myand G2(A, B, C, and_calc);
	
	initial begin
        $dumpfile("a1_tb.vcd");
        $dumpvars(0, a1_tb);

        A = 0; B = 0; C = 0;
        #10; A = 1; B = 0; C = 0;
        #10; A = 0; B = 1; C = 0;
        #10; A = 1; B = 1; C = 0;
        #10; A = 0; B = 0; C = 1;
        #10; A = 1; B = 0; C = 1;
        #10; A = 0; B = 1; C = 1;
        #10; A = 1; B = 1; C = 1;
        #10;
	end

endmodule
