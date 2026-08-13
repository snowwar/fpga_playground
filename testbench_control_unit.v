`timescale 1ps/1ps

module testbench_ch3_control_unit();

    reg [31:0] instr;

    ControlUnit uut(
        .instr(instr)
    );

    initial begin
        $dumpfile("control_unit.vcd");
        $dumpvars(0, testbench_ch3_control_unit);
        #5;
        $display("instruction                        opcode  status");
        instr <= 32'b0000000_0000000000_000_00000_1111111;
        #5;
        $display("%32b  %7b  %s", instr, uut.opcode, uut.opcode == 7'b1111111 ? "pass" : "fail");
        instr <= 32'b1111111_1111111111_111_11111_0000000;
        #5;
        $display("%32b  %7b  %s", instr, uut.opcode, uut.opcode == 7'b0000000 ? "pass" : "fail");
        #5;
        $display();
        $display("instruction                        funct3 status");
        $display("%32b  %7b  %s", instr, uut.opcode, uut.funct3 == 3'b111 ? "pass" : "fail");
        instr <= 32'b1111111_1111111111_000_11111_1111111;
        #5;
        $display("%32b  %7b  %s", instr, uut.opcode, uut.funct3 == 3'b000 ? "pass" : "fail");
        $display();
        $display("instruction                        funct7  status");
        $display("%32b  %7b  %s", instr, uut.opcode, uut.funct7 == 7'b1111111 ? "pass" : "fail");
        #5;
        instr <= 32'b0000000_1111111111_111_11111_1111111;
        #5;
        $display("%32b  %7b  %s", instr, uut.opcode, uut.funct7 == 7'b0000000 ? "pass" : "fail");
        #5;
        $finish;
    end
endmodule