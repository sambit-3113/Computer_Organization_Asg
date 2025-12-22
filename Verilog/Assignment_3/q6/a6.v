module memory (input clk, input we, input [6:0] address, input [15:0] din, output [15:0] dout);
    reg [15:0] mem [127:0];
    integer i;
    initial begin
        for(i = 0; i <= 127; i++)
            begin
                mem[i] = 0;
            end
    end
    always @(posedge clk)
        if (we) mem[address] <= din;
    
    assign dout = mem[address];
endmodule

module a6_tb();
    reg we;
    reg clk;
    reg [6:0] address;
    reg [15:0] din;
    wire [15:0] dout;
    
    memory M (.we(we), .clk(clk), .address(address), .din(din), .dout(dout));

    initial clk = 0;
    always begin
        #5;
        clk = ~clk;
    end

    initial begin
        $dumpfile("a6_tb.vcd");
        $dumpvars(0, a6_tb);

        we = 1; address = 7'b0101011; din = 16'd11243; #10 
        we = 1; address = 7'b1011111; din = 16'd40845; #10
        we = 1; address = 7'b1100110; din = 16'd5; #10
        we = 1; address = 7'b1011011; din = 16'd9734; #10
        we = 1; address = 7'b0001111; din = 16'd40927; #10
        we = 0; address = 7'b1000001; din = 16'd457; #10
        we = 0; address = 7'b0111011; din = 16'd20958; #10
        we = 0; address = 7'b1011011; din = 16'd14; #10
        we = 0; address = 7'b0100011; din = 16'd8; #10
    
        $finish;
    end
endmodule