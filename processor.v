module Processor (
    input clk
);

reg [31:0] pc_current;
wire [31:0] pc_next;

initial begin
    pc_current <= 0;
end

always @(posedge clk) begin
    pc_current <= pc_next;
end

assign pc_next = pc_current + 4;

endmodule