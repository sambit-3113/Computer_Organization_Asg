module nbitbidshifter #(parameter N = 4) (input clk, input s, input n0, output reg [N-1:0] a);
    initial a = 3'b101;
    always @(posedge clk)
        begin
            if (s)
                begin
                    a <= a >> 1;
                    a[N-1] <= n0;
                end

            else    
                begin
                    a <= a << 1;
                    a[0] <= n0;
                end 
        end
endmodule

module a5_tb();
    reg s;
    reg clk;
    reg n0;
    wire [3:0] a;
    
    nbitbidshifter NBBS (.s(s), .clk(clk), .n0(n0), .a(a));

    initial clk = 0;
    always begin
        #5;
        clk = ~clk;
    end

    initial begin
        $dumpfile("a5_tb.vcd");
        $dumpvars(0, a5_tb);

        s = 0; n0 = 0; #11        
        s = 0; n0 = 1; #11        
        s = 1; n0 = 0; #11        
        s = 1; n0 = 1; #11        
        $finish;
    end
endmodule
