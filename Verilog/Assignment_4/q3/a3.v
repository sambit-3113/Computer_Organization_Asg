module sequencematcher (input reset, clk, x, output o);
	reg [3:0] state, nstate;
	parameter s0 = 3'b000;
	parameter s1 = 3'b001;
	parameter s2 = 3'b010;
	parameter s3 = 3'b011;
	parameter s4 = 3'b100;
	
	initial state = s0;	
	always @(posedge clk, posedge reset)
		if(reset) state <= s0;
		else state <= nstate;
	
	always @(*)
		case(state)
			s0: nstate = x ? s1 : s0;
			s1: nstate = x ? s2 : s0;
			s2: nstate = ~x ? s3 : s2;
			s3: nstate = x ? s4 : s0;
			s4: nstate = s4;
			default nstate = s0;
		endcase

	assign o = (state == s4);
endmodule

module a3_tb();
	reg reset, clk, x;
	wire o;
	
	sequencematcher SM (reset, clk, x, o);	

	initial clk = 0;
	always begin
		#5;
		clk = ~clk;
	end

	initial begin
		$dumpfile("a3_tb.vcd");
		$dumpvars(0,a3_tb);

		$display("r|x|o");
		$display("-----");
		$monitor("%b|%b|%b", reset, x, o);
		
		// s0
		reset = 0; x = 0; #10; // s0
 		reset = 0; x = 1; #10; // s1
 		reset = 0; x = 1; #10; // s2
		reset = 0; x = 1; #10; // s2
		reset = 0; x = 0; #10; // s3
		reset = 0; x = 1; #10; // s4
		reset = 0; x = 1; #10; // s4
		reset = 1; x = 1; #10; // s0
		reset = 1; x = 1; #10; // s0
		reset = 0; x = 1; #10; // s1
	 

		$finish;

	end
endmodule