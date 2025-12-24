module modular_2a_b_fsm (input reset, clk, a, b, output o);
	reg [1:0] state, nstate;
	parameter s0 = 4'b00;
	parameter s1 = 4'b01;
	parameter s2 = 4'b10;
	parameter s3 = 4'b11;
	
	initial state = s0;
	always @(posedge reset, posedge clk)
		if (reset) state <= s0;
		else state <= nstate;
	
	always @(*)
		nstate = state + 2 * a + b;
	
	assign o = (state == s1);	 
endmodule

module a4_tb();
	reg clk, reset, a, b;
	wire o;
	
	modular_2a_b_fsm ModularFSM (reset, clk, a, b, o);

	initial clk = 0;
	always begin
		#5;
		clk = ~clk;
	end

	initial begin
		$dumpfile("a4_tb.vcd");
		$dumpvars(0, a4_tb);


		$display("r|a|b|o");
		$display("-------");
		$monitor("%b|%b|%b|%b", reset, a, b, o);
		
		// s0
		reset = 0; a = 0; b = 1; #10; // s1    //output = 1
		reset = 0; a = 1; b = 0; #10; // s3   
		reset = 0; a = 1; b = 1; #10; // s2
		reset = 0; a = 1; b = 1; #10; // s1
		reset = 1; a = 0; b = 1; #15; // s0
		reset = 0; a = 1; b = 1; #10; // s3
		reset = 0; a = 1; b = 0; #10; // s1
		reset = 0; a = 0; b = 1; #10; // s2
		$finish;
	end
endmodule