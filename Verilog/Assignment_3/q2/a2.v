`timescale 1ns/1ps
module improvedDLatch (input D, input clk, output reg q);
    initial q = 1'b0;
    reg nc, w1, w2;
    always @(clk, D)
        begin
            #1 nc <= ~clk;
               w1 <= D & clk;
            #1 w2 <= nc & q;
            #1 q <= w1 | w2;
        end
endmodule

module a2_tb();
    reg D, clk;
    wire q;

    improvedDLatch latch (.D(D), .clk(clk), .q(q));

    initial clk = 0;
    always begin
        #5;
        clk = ~clk;
    end

    initial begin
        $dumpfile("a2_tb.vcd");
        $dumpvars(0,a2_tb);

        D = 0; #10;
        D = 1; #7;
        D = 0; #5;
        D = 1; #13;
        D = 0; #15;
        D = 1; #8;
        D = 0; #3;
        D = 1; #18;
        
        $finish;
    end

endmodule