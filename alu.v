module  ALU(
    input [31:0] a,
    input [31:0] b,
    input [3:0] alu_op,
    output reg [31:0] result
);

    always @(*) 
    begin
        case(alu_op)
        4'b0000: result = a + b;
        4'b1000: result = a - b;
        4'b0001: result = a << b[4:0];
        4'b0010: result = $signed(a) < $signed(b) ? 32'd1 : 32'd0;
        4'b0011: result = a < b ? 32'd1 : 32'd0;
        4'b0100: result = a ^ b;
        4'b0101: result = a >> b[4:0];
        4'b1101: result = $signed(a) >>> b[4:0];
        4'b0110: result = a | b;
        4'b0111: result = a & b;
        default: result = a + b;
        endcase
    end
endmodule