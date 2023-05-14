module registr
(input button2,
input switch0,
input switch1,
input switch2,
input switch3,
input switch4,
input switch5,
input switch6,
input switch7,
input switch8,
input button0,
input button1,
input clk,
output [7:0] ledR,
output [7:0] ledG,
output [6:0] hex,
output [6:0] hex2
);

reg[7:0] dann;
reg[7:0] dann2;
assign ledG=dann2;
wire [3:0] zn1;
wire [3:0] zn2;
hex2sev_segm hex2sev_segm(.hex(zn1),.segm(hex));
hex2sev_segm hex2sev_segm2(.hex(zn2),.segm(hex2));
reg but_r,but_rr,but_r0,but_rr0; 
reg but_r2,but_rr2; 
wire push2=but_rr2 & ~but_r2;
wire push=but_rr & ~but_r;
wire push0=but_rr0 & ~but_r0;

assign ledR=dann;
reg flag;
assign zn1={dann[3],dann[2],dann[1],dann[0]};
assign zn2={dann[7],dann[6],dann[5],dann[4]};
reg [2:0] countt;
reg d,c;
always @(posedge clk)
begin
	
	
	but_r2<=button2;
	but_rr2<=but_r2;
	but_r<=button1;
	but_rr<=but_r;
	but_r0<=button0;
	but_rr0<=but_r0;
	
	
	if(!button0) begin dann<=8'd0; dann2<=8'd0; end
	else
	if (push) begin
		dann<={switch7,switch6,switch5,switch4,switch3,switch2,switch1,switch0};

	
	end
	else
	if (push2) begin
		if (dann[0])
		dann2<=(dann2>>1)|8'b10000000;
		else
		dann2<=(dann2>>1);
		dann<=(dann>>1'b1)|{switch8,{7{1'b0}}};
	
	end
	
	
	
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
