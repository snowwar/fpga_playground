`timescale 1ns / 1ps

module testbench_instruction_momory_integrated();

    reg clk;

    Processor uut(
        .clk(clk)
    );

    task clock_tick();
    begin
        clk <= 0;
        #5;
        clk <= 1;
        #5;
    end
    endtask

    initial begin
        $dumpfile("instruction_memory_integrated.vcd");
        $dumpvars(0, testbench_instruction_momory_integrated);

        clk <= 0;
        #5;
        $display("%8x     %8x   %s", uut.pc_current, uut.instr, uut.instr == 32'hf0f0_a5a5 ? "pass" : "fail");
        clk <= 1;
        #5;

        $display("%8x     %8x   %s", uut.pc_current, uut.instr, uut.instr == 32'h0f0f_a5a5 ? "pass" : "fail");
        clock_tick();

        $display("%8x     %8x   %s", uut.pc_current, uut.instr, uut.instr == 32'hff00_ff00 ? "pass" : "fail");
        clock_tick();
        $display("%8x     %8x   %s", uut.pc_current, uut.instr, uut.instr == 32'h00ff_00ff ? "pass" : "fail");
        $finish;
    end
endmodule
