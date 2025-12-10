module my1BLshifter (input A, input B, input C, input D, output a, output b, output c, output d);
    buf(a, B);
    buf(b, C);
    buf(c, D);
    buf(d, A);
endmodule

module my1BRshifter (input A, input B, input C, input D, output e, output f, output g, output h);
    buf(e, D);
    buf(f, A);
    buf(g, B);
    buf(h, C);
endmodule

module my2BLshifter (input A, input B, input C, input D, output i, output j, output k, output l);
    buf(i, C);
    buf(j, D);
    buf(k, A);
    buf(l, B);
endmodule

module my2BRshifter (input A, input B, input C, input D, output m, output n, output o, output p);
    buf(m, C);
    buf(n, D);
    buf(o, A);
    buf(p, B);
endmodule

module a5_tb();
    reg A,B,C,D;
    wire a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;

    my1BLshifter BS1 (A, B, C, D, a, b, c, d);
    my1BRshifter BS2 (A, B, C, D, e, f, g, h);
    my2BLshifter BS3 (A, B, C, D, i, j, k, l);
    my2BRshifter BS4 (A, B, C, D, m, n, o, p);

    initial begin
        $dumpfile("a5_tb.vcd");
        $dumpvars(0, a5_tb);

        A=0; B=0; C=0; D=0; #10;
        A=0; B=0; C=0; D=1; #10;
        A=0; B=0; C=1; D=0; #10;
        A=0; B=0; C=1; D=1; #10;
    
        A=0; B=1; C=0; D=0; #10;
        A=0; B=1; C=0; D=1; #10;
        A=0; B=1; C=1; D=0; #10;
        A=0; B=1; C=1; D=1; #10;
    
        A=1; B=0; C=0; D=0; #10;
        A=1; B=0; C=0; D=1; #10;
        A=1; B=0; C=1; D=0; #10;
        A=1; B=0; C=1; D=1; #10;
    
        A=1; B=1; C=0; D=0; #10;
        A=1; B=1; C=0; D=1; #10;
        A=1; B=1; C=1; D=0; #10;
        A=1; B=1; C=1; D=1; #10;

    end
endmodule