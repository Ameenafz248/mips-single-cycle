module top (input clk, reset, output [63:0] writedata, dataaddr, output MemWrite, output [63:0] pc);
    wire [63:0] readdata;
    wire [31:0] instr;

    mips m(clk, reset, pc, instr, MemWrite, dataaddr, writedata, readdata);
    imem i(pc[7:2], instr);
    dmem d(clk, MemWrite, dataaddr, writedata, readdata);
endmodule