module grayupcounter (input up, input clk, output reg [2:0] q);
    initial q = 3'b000;
    always @(posedge clk)
        begin
            if (up)
                begin
                    q[2] <= q[0] ? q[2] : q[1];
                    q[1] <= q[0] ? ~q[2] : q[1];
                    q[0] <= ~(q[2] ^ q[1]);
                end
        end
endmodule

module a4_tb();
    reg up;
    reg clk;
    wire [2:0] q;

    grayupcounter GUC (.clk(clk), .up(up), .q(q));

    initial clk = 0;
    always begin
        #5;
        clk = ~clk;
    end

    initial begin
        $dumpfile("a4_tb.vcd");
        $dumpvars(0,a4_tb);

        up = 1; #37;
        up = 0; #10;
        up = 1; #33;

        $finish;
    end
endmodule
