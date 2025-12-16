module myCLA4bit (input [3:0] a, input [3:0] b, input cin, output [3:0] s, output cout);
    wire [3:0] g, p;
    wire [2:0] c;
    assign g[0] = a[0] & b[0];
    assign g[1] = a[1] & b[1];      // g = a&b;
    assign g[2] = a[2] & b[2];
    assign g[3] = a[3] & b[3];

    assign p[0] = a[0] ^ b[0];
    assign p[1] = a[1] ^ b[1];
    assign p[2] = a[2] ^ b[2];      // p = a^b;
    assign p[3] = a[3] ^ b[3];

    assign c[0] = g[0] | (p[0] & cin);
    assign c[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    
    assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);

    assign s[0] = p[0] ^ cin;
    assign s[1] = p[1] ^ c[0];
    assign s[2] = p[2] ^ c[1];
    assign s[3] = p[3] ^ c[2];
endmodule

module a5_tb();
    reg  [3:0] a, b;
    reg  cin;
    wire [3:0] s;
    wire cout;

        myCLA4bit uut (.a(a),.b(b),.cin(cin),.s(s),.cout(cout));

    initial begin
        $dumpfile("a5_tb.vcd");
        $dumpvars(0, a5_tb);

        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        a = 4'b0001; b = 4'b0010; cin = 0; #10;
        a = 4'b0101; b = 4'b0011; cin = 0; #10;
        a = 4'b0111; b = 4'b1000; cin = 1; #10;
        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        a = 4'b1010; b = 4'b1010; cin = 1; #10;
        a = 4'b1111; b = 4'b1111; cin = 1; #10;
    end
endmodule

