module RAM(din,rx_valid,tx_valid,clk,rstn,dout);
parameter MEM_WIDTH=8; 
parameter MEM_DEPTH=256; 
input clk,rstn,rx_valid;
input [9:0] din;
output reg [MEM_WIDTH-1:0] dout;
output reg tx_valid;
reg [7:0] address;
reg [MEM_WIDTH-1:0] mem [MEM_DEPTH-1:0];
always @(posedge clk ) begin
	if (!rstn) begin
		dout<=0;
		
	end
	else begin
			/* receive write address */
			if(rx_valid==1 && din[9:8]==2'b00 )
				address<=din[7:0];
			/* receive read address */
			else if ( rx_valid==1 && din[9:8]==2'b10)
				begin
				address<=din[7:0];
				tx_valid<=0;
				end
			/* receive data to be written in the hold address */
			else if (rx_valid==1 && din[9:8]==2'b01)
				mem[address]<=din[7:0];
			/* receive command to send data  */
			else if (rx_valid==1 && din[9:8]==2'b11)
				begin
					dout<=mem[address];
					tx_valid<=1;
				end
		
	 	end
end
endmodule