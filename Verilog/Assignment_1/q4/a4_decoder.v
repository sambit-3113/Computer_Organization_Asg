module my3inputand (input a, input b, input c, output y);
    wire w;
    and(w, a, b);
    and(y, c, w);
endmodule    

module mydecoder3to8 (input a, input b, input c, output s, output t, output u, output v, output w, output x, output y, output z);
    wire na, nb, nc;
    not(na, a);
    not(nb, b);
    not(nc, c);
    my3inputand and1 (.a(na), .b(nb), .c(nc), .y(s));
    my3inputand and2 (.a(na), .b(nb), .c(c), .y(t));
    my3inputand and3 (.a(na), .b(b), .c(nc), .y(u));
    my3inputand and4 (.a(na), .b(b), .c(c), .y(v));
    my3inputand and5 (.a(a), .b(nb), .c(nc), .y(w));
    my3inputand and6 (.a(a), .b(nb), .c(c), .y(x));
    my3inputand and7 (.a(a), .b(b), .c(nc), .y(y));
    my3inputand and8 (.a(a), .b(b), .c(c), .y(z));
endmodule

module a4_decoder_tb();

	reg A, B, C;
	wire  D, E, F, G, H, I, J, K;

	mydecoder3to8 D1(A, B, C, D, E, F, G, H, I, J, K);
	
	
	initial begin
        $dumpfile("a4_decoder_tb.vcd");
        $dumpvars(0, a4_decoder_tb);

        A = 0; B = 0; C = 0;
        #10; A = 0; B = 0; C = 1;
        #10; A = 0; B = 1; C = 0;
        #10; A = 0; B = 1; C = 1;
        #10; A = 1; B = 0; C = 0;
        #10; A = 1; B = 0; C = 1;
        #10; A = 1; B = 1; C = 0;
        #10; A = 1; B = 1; C = 1;
        #10;
	end

endmodule