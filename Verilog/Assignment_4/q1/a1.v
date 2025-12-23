module mymooreFSM (input reset, input a, b, clk, output o);
    reg [1:0] state, nstate;

    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;

    // FSM logic
    always @(posedge clk, posedge reset)
        if (reset) state <= s0;
        else state <= nstate;


    // next state logic (nstate)
    always @(*)
        begin 
            case(state)
                s0: nstate = a ? s1 : s0;
                s1: nstate = b ? s2 : s0;
                default: nstate = s0;
            endcase
        end

    assign o = (state == s2);
endmodule

module a1_tb();
    reg reset, a, b, clk;
    wire o;

    mymooreFSM Moore (reset, a, b, clk, o);

    initial clk = 0;
    always begin
        #5;
        clk = ~clk;
    end

    initial begin
        $dumpfile("a1_tb.vcd");
        $dumpvars(0,a1_tb);

        // S0
        reset = 0; a = 1; b = 0; #10;  // S1
        reset = 0; a = 1; b = 1; #10;  // S2
        reset = 1; a = 0; b = 0; #10;  // S0
        reset = 0; a = 1; b = 0; #10;  // S1
        reset = 0; a = 1; b = 1; #10;  // S2
        reset = 0; a = 0; b = 0; #10;  // S0
        $finish;
    end


endmodule