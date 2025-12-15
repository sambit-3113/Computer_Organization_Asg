module mypriorityencoder (
    input  [7:0] a,        
    output reg v,          
    output reg [2:0] o     
);
    always @(*) begin
        if (a[7] == 1'b1) begin
            o = 3'b111;
            v = 1'b1;
        end
        else if (a[6] == 1'b1) begin
            o = 3'b110;
            v = 1'b1;
        end
        else if (a[5] == 1'b1) begin
            o = 3'b101;
            v = 1'b1;
        end
        else if (a[4] == 1'b1) begin
            o = 3'b100;
            v = 1'b1;
        end
        else if (a[3] == 1'b1) begin
            o = 3'b011;
            v = 1'b1;
        end
        else if (a[2] == 1'b1) begin
            o = 3'b010;
            v = 1'b1;
        end
        else if (a[1] == 1'b1) begin
            o = 3'b001;
            v = 1'b1;
        end
        else if (a[0] == 1'b1) begin
            o = 3'b000;
            v = 1'b1;
        end
        else begin
            o = 3'b000;   
            v = 1'b0;     
        end
    end
endmodule


module a4_tb();
    reg [7:0] a;       
    wire [2:0] o;      
    wire v;            

    mypriorityencoder PE1 (a, v, o);
    
    initial begin
        $dumpfile("a4_tb.vcd");
        $dumpvars(0, a4_tb);

        a = 8'b00000010; #10; 
        a = 8'b00001000; #10;  
        a = 8'b00010101; #10;  
        a = 8'b01111111; #10;  
        a = 8'b11111111; #10;  
        a = 8'b00100000; #10;  
        a = 8'b00000000; #10;   
        
    end
endmodule
