module test
(
input button0,
input button1,
input clk,
output reg[6:0] led
);
wire[3:0] switch1;
reg flag;
reg[3:0] dann;
hex2sev_segm hex2sev_segm(.hex(dann),.segm(led));
reg but_r,but_rr; 
wire push=but_rr & ~but_r;
wire push2;
always @(posedge clk)
begin
if (flag != 1'b1 | glag !=1'b0)
flag
	but_r<=button;
	but_rr<=but_r;
	switch1<=switch1+1;
end
always @(posedge clk)
	
	if (push2) dann<=switch1;;
endmodule




module hex2sev_segm
(
input [3:0] hex,
output [6:0] segm,

);
assign segm=(hex==4'h0)?7'b1000000:
		(hex==4'h1)?7'b1111001:
		(hex==4'h2)?7'b0100100:
		(hex==4'h3)?7'b0110000:
		(hex==4'h4)?7'b0011001:
		(hex==4'h5)?7'b0010010:
		(hex==4'h6)?7'b0000010:
		(hex==4'h7)?7'b1111000:
		(hex==4'h8)?7'b0000000:
		(hex==4'h9)?7'b0010000:
		(hex==4'hA)?7'b0001000:
		(hex==4'hB)?7'b0000011:
		(hex==4'hC)?7'b1000110:
		(hex==4'hD)?7'b0100001:
		(hex==4'hE)?7'b0000110:
		(hex==4'hF)?7'b0001110:7'b0111111;
		
endmodule