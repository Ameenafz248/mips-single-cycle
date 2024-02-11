module tb;
reg clk;
reg reset;
integer i;
wire [63:0] writedata, dataadr, pc;
wire memwrite;
// instantiate device to be tested
top dut(clk, reset, writedata, dataadr, memwrite, pc);// initialize test
initial
begin
reset <= 1; # 5; reset <= 0;
end
// generate clock to sequence tests
always
begin
clk <= 1; # 5; clk <= 0; # 5;
end
// check results
initial
    #100 $finish;
endmodule