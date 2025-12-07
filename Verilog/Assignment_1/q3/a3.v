module myhalfadder (input a, input b, output sum, output carry);
    xor (sum, a, b);
    and (carry, a, b);
endmodule

module myhalfsubtractor (input a, input b, output diff, output borrow);
    wire na;
    not (na , a);
    xor (diff, a, b);
    and (borrow, na, b);
endmodule

module a3_tb();

    reg A, B;
    wire sum, carry;
    wire diff, borrow;
    myhalfadder G1 (A, B, sum, carry);
    myhalfsubtractor G2 (A, B, diff, borrow);

    initial begin
        $dumpfile("a3_tb.vcd");
        $dumpvars(0, a3_tb);

        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
        
    end

endmodule
