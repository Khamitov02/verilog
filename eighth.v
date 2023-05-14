module secundomer
(input button2,
input button0,
input button1,
input button3,

input clk,
output [7:0] ledR1,
output [7:0] ledR2,
output [7:0] ledG,
output [6:0] hex1,

output [6:0] hex2,

output [6:0] hex3,
output [6:0] hex4,
output [6:0] hex5,

output ledG8
);




wire [3:0] dann2,dann3,dann1,dann4,dann5;
assign dann2={sec[3],sec[2],sec[1],sec[0]};
assign dann3={dsec[3],dsec[2],dsec[1],dsec[0]};
assign dann1={rsec[3],rsec[2],rsec[1],rsec[0]};
assign dann4={sec2[3],sec2[2],sec2[1],sec2[0]};
assign dann5={dsec2[3],dsec2[2],dsec2[1],dsec2[0]};
hex2sev_segm hex2sev_segm3(.hex(dann2),.segm(hex2));
hex2sev_segm hex2sev_segm4(.hex(dann3),.segm(hex3));
hex2sev_segm hex2sev_segm5(.hex(dann1),.segm(hex1));
hex2sev_segm hex2sev_segm6(.hex(dann4),.segm(hex4));
hex2sev_segm hex2sev_segm7(.hex(dann5),.segm(hex5));

reg but_r,but_rr,but_r0,but_rr0; 
reg but_r2,but_rr2; 
wire push2=but_rr2 & ~but_r2;
wire push=but_rr & ~but_r;
wire push0=but_rr0 & ~but_r0;
reg [8:0]perepoln;
reg [7:0]summ;

reg flag;
reg [25:0] counter;
reg [7:0] sec;
reg [7:0] dsec;
reg [7:0] rsec;
reg [7:0] sec2;
reg [7:0] dsec2;

assign ledG=summ;
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
	

	if(!button0) begin   
	flag<=1'b0;
	counter<=26'd0;
	dsec<=8'd0;
	rsec<=8'd0;
	sec<=8'd0;
	dsec2<=8'd0; 
	sec2<=8'd0;
	end
	
	if (push) 
		if (flag==1'b0) flag<=1'b1;
		else flag<=1'b0;
	else
	if (push2) begin
	if (flag==1'b0)
		begin
			sec2<=0;
			dsec2<=0;
		end
		else 
		begin
			sec2<=sec;
			dsec2<=dsec;
		end
	end
	
	if (flag==1'b1)
		counter<=counter+26'd1;
	
	if (counter==26'd5000000) begin
			rsec<=rsec+8'd1;
			counter<=26'd0;
			end
			else
	if (rsec==8'd10) begin
			rsec<=8'd0;
			sec<=sec+8'd1;
			
		end
		else
	if (sec==8'd10) begin
		sec<=8'd0;
		dsec<=dsec+8'd1;
		end
	if (dsec==8'd10) begin
		dsec<=8'd0;
		
	
	
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
