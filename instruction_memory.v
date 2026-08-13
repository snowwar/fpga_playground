`define inst_words 256
`define test_prog "test_prog.mem"

module InstructionMemory (
    input [31:0] addr,
    output [31:0] instr
);

    reg [31:0] memory [`inst_words - 1:0];

    wire [31:0] word_addr;
    assign word_addr = addr[31:2];

    initial begin
        $readmemh(`test_prog, memory);
    end

    assign instr = memory[word_addr];
endmodule