module myhalfadder (input a, input b, output reg sum, output reg carry);
    always @(*) begin
        sum   = a ^ b;
        carry = a & b;
    end
endmodule

module myfulladder (input  a, input  b, input  cin, output reg sum, output reg carry);
    always @(*) begin
        sum   = a ^ b ^ cin;
        carry = (a & b) | (b & cin) | (a & cin);
    end
endmodule

module myWTM4bit (input [3:0] a, input [3:0] b, output [7:0] o);
    wire [15:0] w;
    wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12;
    wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12;

    assign w[0] = a[0] & b[0]; 
    assign w[1] = a[1] & b[0];
    assign w[2] = a[0] & b[1];
    assign w[3] = a[2] & b[0];
    assign w[4] = a[1] & b[1];
    assign w[5] = a[0] & b[2];
    assign w[6] = a[3] & b[0];
    assign w[7] = a[2] & b[1];
    assign w[8] = a[1] & b[2];
    assign w[9] = a[0] & b[3];
    assign w[10] = a[3] & b[1];
    assign w[11] = a[2] & b[2];
    assign w[12] = a[1] & b[3];
    assign w[13] = a[3] & b[2];
    assign w[14] = a[2] & b[3];
    assign w[15] = a[3] & b[3];

    myhalfadder HA1 (.a(w[6]), .b(w[7]), .sum(s1), .carry(c1));
    myhalfadder HA2 (.a(w[10]), .b(w[11]), .sum(s2), .carry(c2));
    myfulladder FA4 (.a(w[8]), .b(w[9]), .cin(s1), .sum(s4), .carry(c4));
    myfulladder FA5 (.a(s2), .b(c1), .cin(w[12]), .sum(s5), .carry(c5));
    myfulladder FA6 (.a(w[13]), .b(w[14]), .cin(c2), .sum(s6), .carry(c6));


    myhalfadder HA3 (.a(w[3]), .b(w[4]), .sum(s3), .carry(c3));
    myhalfadder HA7 (.a(w[1]), .b(w[2]), .sum(s7), .carry(c7)); 
    myfulladder FA8 (.a(s3), .b(c7), .cin(w[5]), .sum(s8), .carry(c8)); 
    myfulladder FA9 (.a(c3), .b(s4), .cin(c8), .sum(s9), .carry(c9)); 
    myfulladder FA10 (.a(c9), .b(s5), .cin(c4), .sum(s10), .carry(c10)); 
    myfulladder FA11 (.a(c10), .b(s6), .cin(c5), .sum(s11), .carry(c11)); 
    myfulladder FA12 (.a(c6), .b(c11), .cin(w[15]), .sum(s12), .carry(c12)); 

    assign o[0] = w[0];
    assign o[1] = s7;
    assign o[2] = s8;
    assign o[3] = s9;
    assign o[4] = s10;
    assign o[5] = s11;
    assign o[6] = s12;
    assign o[7] = c12;
endmodule

module a6_tb();
    reg [3:0] a, b;
    wire [7:0] o;

    myWTM4bit w (
        .a(a),
        .b(b),
        .o(o)
    );

    initial begin
        $dumpfile("a6_tb.vcd");
        $dumpvars(0, a6_tb);
        a = 4'b1001; b = 4'b0110; #10;  
        a = 4'b1111; b = 4'b1111; #10;  
        a = 4'b0111; b = 4'b0011; #10;  
        a = 4'b1100; b = 4'b0101; #10;  
        a = 4'b0001; b = 4'b1111; #10;
        a = 4'b1110; b = 4'b0001; #10;
        a = 4'b1010; b = 4'b0101; #10;
        a = 4'b1000; b = 4'b1000; #10;
        a = 4'b0110; b = 4'b0110; #10;
        a = 4'b1111; b = 4'b0000; #10;
        
    end
endmodule
