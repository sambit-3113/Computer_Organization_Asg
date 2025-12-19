module downcounter (input clk, output reg [2:0] q);
    initial q = 3'b000;
    always @(posedge clk)
        begin
            q <= q-1;
        end
endmodule

module a3_tb();
    reg clk;
    wire [2:0] q;

    downcounter DC (.clk(clk), .q(q));

    initial clk = 0;
    always begin
        #5;
        clk = ~clk;
    end

    initial begin
        $dumpfile("a3_tb.vcd");
        $dumpvars(0,a3_tb);

        #90;
        $finish;
    end
endmodule