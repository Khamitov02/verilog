module fff
(input button2,
input button0,
input button1,
input clk,
output [7:0] led
);

reg[2:0] dann;
//hex2sev_segm hex2sev_segm(.hex(dann),.segm(led));
reg but_r,but_rr,but_r0,but_rr0; 
reg but_r2,but_rr2; 
wire push2=but_rr2 & ~but_r2;
wire push=but_rr & ~but_r;
wire push0=but_rr0 & ~but_r0;

genvar Gi;
generate for (Gi =0; Gi<7;Gi=Gi+1)
begin:loop
	assign led[Gi]=(dann > Gi);
end
endgenerate
reg flag;
always @(posedge clk)
begin
	if (flag!=1 | flag!=0) flag<=1;
	
	but_r2<=button2;
	but_rr2<=but_r2;
	but_r<=button1;
	but_rr<=but_r;
	but_r0<=button0;
	but_rr0<=but_r0;
	if ((dann<3'd0 | dann>3'd7)&flag) begin dann<=3'd0; flag<=1'd0; end
	
	if(!button0)  dann<=3'd0;
	else 
	if (push)  dann<=dann+1;
	else
	
	if (push2 ) dann<=dann-1;

	
end
	
endmodule




module hex2sev_segm
(
input [3:0] hex,
output [6:0] segm
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
