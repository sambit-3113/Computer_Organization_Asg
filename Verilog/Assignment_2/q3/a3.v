// module mymux8to1 (input [7:0] a, input [2:0] s, output o);
//     assign o = s[2] ? (s[1] ? (s[0] ? a[0] : a[1]) : (s[0] ? a[2] : a[3])) : (s[1] ? (s[0] ? a[4] : a[5]) : (s[0] ? a[6] : a[7]));
// endmodule


module mymux8to1 (input [7:0] a, input [2:0] s, output reg o);
    always @(*) begin
        case(s)
            3'b000: o = a[0];
            3'b001: o = a[1];
            3'b010: o = a[2];
            3'b011: o = a[3];
            3'b100: o = a[4];
            3'b101: o = a[5];
            3'b110: o = a[6];
            3'b111: o = a[7];
            default: o = 1'b0;
        endcase
    end
endmodule

module a3_tb();
    reg [7:0] a;
    reg [2:0] s;
    wire o;

    mymux8to1 mux1 (a, s, o);
    

    initial begin
        $dumpfile("a3_tb.vcd");
        $dumpvars(0, a3_tb);

       a = 8'b00010011; s = 3'b000; #10;
       a = 8'b10010011; s = 3'b001; #10;
       a = 8'b01010011; s = 3'b010; #10;
       a = 8'b01110001; s = 3'b011; #10;
       a = 8'b00010011; s = 3'b100; #10;
       a = 8'b10010001; s = 3'b101; #10;
    end
endmodule