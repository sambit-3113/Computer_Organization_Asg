module mymux2to1 (input a, input b, input s, output y);
    wire w1, w2, s;
    not(ns, s);
    and(w1, a, ns);
    and(w2, b, s);
    or(y, w1, w2);
endmodule

module mymux4to1 (input a, input b, input c, input d, input s, input t, output y);
    wire w1, w2;
    mymux2to1 M1 (.a(a), .b(b), .s(t), .y(w1));
    mymux2to1 M2 (.a(c), .b(d), .s(t), .y(w2));
    mymux2to1 M3 (.a(w1), .b(w2), .s(s), .y(y));
endmodule

module mymux8to1 (input a, input b, input c, input d, input e, input f, input g, input h, input [2:0] s, output y);
    wire w1, w2;
    mymux4to1 M1 (.a(a), .b(b), .c(c), .d(d), .s(s[1]), .t(s[0]), .y(w1));
    mymux4to1 M2 (.a(e), .b(f), .c(g), .d(h), .s(s[1]), .t(s[0]), .y(w2));
    mymux2to1 M3 (.a(w1), .b(w2), .s(s[2]), .y(y));
endmodule    

module myhalfadder (input a, input b, output sum, output carry);
    xor(sum, a, b);
    and(carry, a, b);
endmodule

module myhalfsubtractor (input a, input b, output diff, output borrow);
    wire na;
    not (na, a);
    xor(diff, a, b);
    and(borrow, na, b);
endmodule

module mymultiplier (input a, input b, output c);
    and(c, a, b);
endmodule


module myALU (input a, input b, input [2:0] OC, output o1, output o2);
    wire y1_sum, y1_carry, y2_diff, y2_borrow, y3, y4, y5, y6;
    myhalfadder addition (.a(a), .b(b), .sum(y1_sum), .carry(y1_carry));
    myhalfsubtractor subtraction (.a(a), .b(b), .diff(y2_diff), .borrow(y2_borrow));
    mymultiplier multiplication (.a(a), .b(b), .c(y3));
    or(y4, a, b);
    and(y5, a, b);
    xor(y6, a, b);

    mymux8to1 MUX1 (.a(y1_sum), .b(y2_diff), .c(y3), .d(y4), .e(y5), .f(y6), .g(1'bz), .h(1'bz), .s(OC), .y(o1));
    mymux8to1 MUX2 (.a(y1_carry), .b(y2_borrow), .c(1'bz), .d(1'bz), .e(1'bz), .f(1'bz), .g(1'bz), .h(1'bz), .s(OC), .y(o2)); 
endmodule

module a6_tb();

    reg a, b;
    reg [2:0] OC;
    wire o1, o2;

    myALU ALU (a, b, OC, o1, o2);

    initial begin
        $dumpfile("a6_tb.vcd");
        $dumpvars(0,a6_tb);

        a = 1; b = 1; OC = 3'b000; #10;
        a = 1; b = 0; OC = 3'b001; #10;
        a = 0; b = 1; OC = 3'b010; #10;
        a = 0; b = 1; OC = 3'b011; #10;
        a = 1; b = 0; OC = 3'b100; #10;
        a = 1; b = 0; OC = 3'b101; #10;
        a = 1; b = 1; OC = 3'b110; #10;
        a = 1; b = 1; OC = 3'b111; #10;
    end

endmodule