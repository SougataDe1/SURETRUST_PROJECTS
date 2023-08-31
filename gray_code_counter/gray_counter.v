`timescale 1ns / 1ps
module gray_code_counter #(parameter N=4)(out,clk,rst);
output reg [N-1:0]out;
input clk,rst;
reg [N-1:0]q;

always @(posedge clk)
begin
if(rst)
q<='b0000;

else
q<=q+1;
`ifdef FOR_LOOP  
for (int i = 0; i < N-1; i= i+1) begin  
out[i] <= q[i+1] ^ q[i];  
end  
out[N-1] <= q[N-1];  
`else  
out <= {q[N-1], q[N-1:1] ^ q[N-2:0]};  
`endif
end
endmodule
