module summator
(input button2,
input button0,
input button1,
input [7:0]switch1,
input clk,
output [7:0] ledR1,
output [7:0] ledG,
output [6:0] hex4,
output [6:0] hex5,
output [6:0] hex6,
output [6:0] hex7,

output ledG8
);


reg[7:0] data;
reg[7:0] data2;
reg[7:0] data3;
assign ledR2=data2;
assign ledG8=perepoln;
wire [3:0]data11,data12,data21,data22,data31,data32;
reg flag;
reg [7:0] dcounter;
reg [7:0] counter;
reg [7:0] counter1;
assign data11={counter[3],counter[2],counter[1],counter[0]};
assign data12={dcounter[3],dcounter[2],dcounter[1],dcounter[0]};
assign data21={data[3],data[2],data[1],data[0]};
assign data22={data[7],data[6],data[5],data[4]};

hex2sev_segm hex2sev_segm(.hex(data11),.segm(hex6));
hex2sev_segm hex2sev_segm1(.hex(data12),.segm(hex7));
hex2sev_segm hex2sev_segm2(.hex(data21),.segm(hex4));
hex2sev_segm hex2sev_segm3(.hex(data22),.segm(hex5));

reg but_r,but_rr,but_r0,but_rr0; 
reg but_r2,but_rr2; 
wire push2=but_rr2 & ~but_r2;
wire push=but_rr & ~but_r;
wire push0=but_rr0 & ~but_r0;
reg perepoln;

reg d,c;
always @(posedge clk)
begin
	
	
	but_r2<=button2;
	but_rr2<=but_r2;
	but_r<=button1;
	but_rr<=but_r;
	but_r0<=button0;
	but_rr0<=but_r0;
	
	if(!button0) begin
		dcounter<=8'd0;
		data<=8'd0; 
		flag<=1'b0;
		counter<=8'd0;
		counter1<=8'd0;
		perepoln<=1'b0;
	end
	else begin
			if (push) begin
					data<=switch1;
					flag<=1'b;
					perepoln<=0;
					counter1<=0;
					dcounter<=0;
					counter<=0;
			end
			else
				if (flag==1'b1) begin
					if (data!=counter1) 	begin
							if (dcounter==8'd9 & counter==8'd9) begin
								dcounter<=8'd0;
								counter<=8'd0;
								perepoln<=1'b1;	
								counter1<=counter1+8'd1;	
							end
							else begin
								if (counter==8'd9) begin
									counter<=8'd0;
									dcounter<=dcounter+8'd1;	
									counter1<=counter1+8'd1;						
								end
								else begin
									counter<=counter+8'd1;
									counter1<=counter1+8'd1;
								end
							end
					end
					else 
						flag<=1'b0;
				end	
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
