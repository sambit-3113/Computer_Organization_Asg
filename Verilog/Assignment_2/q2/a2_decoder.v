module decoder2to4 (input [1:0] a, output [3:0] o);
    assign o[0] = ~a[1] & ~a[0];
    assign o[1] = ~a[1] & a[0];
    assign o[2] = a[1] & ~a[0];
    assign o[3] = a[1] & a[0];
endmodule

module a2_decoder_tb();
    reg [1:0] A;
	wire [3:0] O;

	decoder2to4 D2 (A, O);
	
	initial begin
        $dumpfile("a2_decoder_tb.vcd");
        $dumpvars(0, a2_decoder_tb);

        A = 2'b00; #10;
        A = 2'b01; #10;
        A = 2'b10; #10;
        A = 2'b11; #10;    
	end

endmodule