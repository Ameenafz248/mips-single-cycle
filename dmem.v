module dmem(input clk, we, input [63:0] a, wd, output [63:0] rd);
    reg [63:0] MEM [63:0];
    assign rd = MEM[a[31:2]];

    initial begin 
        $readmemh("/home/ameenafz248/dev/mips-single-cycle/data.txt", MEM, 0, 63);
    end

    always @(posedge clk) begin
        if (we) begin
            MEM[a[31:2]] = wd;
        end
        $writememh("/home/ameenafz248/dev/mips-single-cycle/data.txt", MEM, 0, 63);
    end
endmodule