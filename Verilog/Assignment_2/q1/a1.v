module multby2 (input [3:0] a, output [4:0] y);
    assign y[4] = a[3];
    assign y[3] = a[2];
    assign y[2] = a[1];
    assign y[1] = a[0];
    assign y[0] = 1'b0;
endmodule

module a1_tb();

	reg [3:0] A;
	wire [4:0] Y;

	multby2 m2 (A, Y);
	
	initial begin
        $dumpfile("a1_tb.vcd");
        $dumpvars(0, a1_tb);

        A = 4'b0000; #10;
        A = 4'b0001; #10;
        A = 4'b1010; #10;
        A = 4'b0101; #10;
        
	end

endmodule
