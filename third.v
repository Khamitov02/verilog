module third
(input button2,
input switch0,
input switch1,
input button0,
input button1,
input clk,
output [7:0] led
);

reg[7:0] dann;
//hex2sev_segm hex2sev_segm(.hex(dann),.segm(led));
reg but_r,but_rr,but_r0,but_rr0; 
reg but_r2,but_rr2; 
wire push2=but_rr2 & ~but_r2;
wire push=but_rr & ~but_r;
wire push0=but_rr0 & ~but_r0;

assign led=dann;
reg flag;

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
	
	
	if(!button0)  dann<=8'd0;
	else
	if (push) begin
		if (switch0 ) begin
			
			else
			dann<=(dann<<1'b1)|8'd1;
		end
		else begin
		if (dann==8'd0)
				dann<=8'd0;
		else
			dann<=dann<<1;		
			end
			
			
		
		
	end else
	if (push2) begin
		if (switch1) begin
			dann<=(dann>>1'b1)|8'b10000000;
		
		
		
		end
		else
			dann<=dann>>1'b1;
	
	
	
	
	
	
	
	end
	
	
	
	
end
	
endmodule




