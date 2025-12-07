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

module myfulladder (input a, input b, input c, output sum, output carry);
    wire w1, w2, w3; 
    myhalfadder HA1 (.a(a), .b(b), .sum(w2), .carry(w1));
    myhalfadder HA2 (.a(w2), .b(c), .sum(sum), .carry(w3));
    or(carry, w1, w3);
endmodule

module myfullsubtractor (input a, input b, input c, output diff, output borrow);
    wire w1, w2, w3; 
    myhalfsubtractor HS1 (.a(a), .b(b), .diff(w2), .borrow(w1));
    myhalfsubtractor HS2 (.a(w2), .b(c), .diff(diff), .borrow(w3));
    or(borrow, w1, w3);
endmodule

module a3_FAFS_tb();
    reg A, B, C;
    wire sum, carry;
    wire diff, borrow;
    myfulladder FA1 (A, B, C, sum, carry);
    myfullsubtractor FS2 (A, B, C, diff, borrow);

    initial begin
        $dumpfile("a3_FAFS_tb.vcd");
        $dumpvars(0, a3_FAFS_tb);

        A = 0; B = 0; C = 0; #10;
        A = 0; B = 0; C = 1; #10;
        A = 0; B = 1; C = 0; #10;
        A = 0; B = 1; C = 1; #10;
        A = 1; B = 0; C = 0; #10;
        A = 1; B = 0; C = 1; #10;
        A = 1; B = 1; C = 0; #10;
        A = 1; B = 1; C = 1; #10;   
    end
endmodule
