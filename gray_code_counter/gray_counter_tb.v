`timescale 1ns / 1ps
module gray_counter_tb();
wire [3:0]out;
reg clk,rst;
gray_code_counter dut(out,clk,rst);
initial
begin
rst=1;
clk=0;
#20 rst=0;
#200 $finish();
end
always #10 clk=~clk;
endmodule
