module mymealyFSM (input a, b, clk, reset, output o);
	reg [1:0] state, nstate;
	parameter s0 = 2'b00;
	parameter s1 = 2'b01;
	parameter s2 = 2'b10;
	
	initial state = s0;

	always @(posedge clk, posedge reset)
		begin
			if(reset) state <= s0;
			else state <= nstate;
		end

	always @(*)
		begin
			case(state)
				s0: nstate = a ? s1 : s0;
				s1: nstate = b ? s2 : s0;
				s2: nstate = (a & b) ? s2 : s0;
			endcase
		end

	assign o = (state == s2 & (a & b));			
endmodule

module a2_tb();
	reg a, b, reset, clk;
	wire o;

	mymealyFSM Mealy (a, b, clk, reset, o);

	initial clk = 0;
	always begin
		#5;
		clk = ~clk;
	end

	initial begin
		$dumpfile("a2_tb.vcd");
		$dumpvars(0,a2_tb);
		$display("r|a|b|o");
		$display("-------");
		$monitor("%b|%b|%b|%b", reset, a, b, o);
		
		reset = 0; a = 1; b = 0; #10;
		reset = 0; a = 1; b = 1; #10;
		reset = 0; a = 1; b = 1; #10;
		reset = 1; a = 1; b = 1; #10;
  		reset = 0; a = 1; b = 0; #10;
		reset = 0; a = 1; b = 1; #10;
		reset = 0; a = 0; b = 1; #10;
		$finish;
	end
endmodule



	