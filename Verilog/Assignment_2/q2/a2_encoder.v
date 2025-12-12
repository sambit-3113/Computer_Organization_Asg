module encoder4to2 (input [3:0] a, output [1:0] o);
    assign o[1] = ~a[3] & a[2] & ~a[1] & ~a[0] | a[3] & ~a[2] & ~a[1] & ~a[0];
    assign o[0] = a[3] & ~a[2] & ~a[1] & ~a[0] | ~a[3] & ~a[2] & a[1] & ~a[0];
endmodule

module a2_encoder_tb();

	reg [3:0] A;
	wire [1:0] O;

	encoder4to2 E2 (A, O);
	
	initial begin
        $dumpfile("a2_encoder_tb.vcd");
        $dumpvars(0, a2_encoder_tb);

        A = 4'b0001; #10;
        A = 4'b0010; #10;
        A = 4'b0100; #10;
        A = 4'b1000; #10;        
	end

endmodule