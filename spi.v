module spi(clk,rstn,MISO,MOSI,SS_n,rx_data,rx_valid,tx_data,tx_valid);

input clk,rstn,MOSI,SS_n,tx_valid;
output reg [9:0] rx_data;
output reg MISO,rx_valid;
input [7:0] tx_data;
parameter IDLE=0;
parameter CHK_CMD=1;
parameter READ_DATA=2;
parameter READ_ADD=3;
parameter WRITE=4;

reg [2:0] cs,ns;
reg read_add_data;

reg [3:0] counter;
reg rst_counter;
reg [9:0] shift_reg;
reg dummy;

always@(SS_n,cs,MOSI)begin
	case(cs)
	IDLE:begin 
			if(SS_n==1)
				ns=IDLE;
			else
				ns=CHK_CMD;

	    end
	CHK_CMD:begin 
				if(SS_n==1)
					ns=IDLE;
				else if(SS_n==0 & MOSI==0)
					ns=WRITE;
				else if(SS_n==0 & MOSI==1 )
					begin casex(read_add_data)
					0:ns=READ_ADD;
					1:ns=READ_DATA;
					1'bx:ns=READ_ADD;
					endcase
					end
			end
	READ_DATA:begin 
				read_add_data=0;
				if(SS_n==0)
					ns=READ_DATA;
				else
					ns=IDLE;
			end
	READ_ADD:begin 
				read_add_data=1;
				if(SS_n==0)
					ns=READ_ADD;
				else
					ns=IDLE;
			end
	WRITE:begin 
				if(SS_n==0)
					ns=WRITE;
				else
					ns=IDLE;
			end

	endcase


end
always @(posedge clk or negedge rstn) begin
	if (rstn==0) begin
		cs<=IDLE;
		
	end

	else begin
	cs<=ns;
	end
end

always @(posedge clk)begin
	if(cs==IDLE)
	begin
	rx_valid=0;
	end


	if(cs==CHK_CMD)
	begin
	counter=0;
	shift_reg=0;
	dummy=0;
	end
	case(cs)
	
  	WRITE:begin
		    	shift_reg[9-counter]=MOSI;
	    		counter=counter+1;
	    		if (counter==10)
	    			begin 
	    			counter=0;
	    			rx_data=shift_reg;
	    			rx_valid=1;
	    			end
	 	  end
	READ_ADD:begin
				shift_reg[9-counter]=MOSI;
	    		counter=counter+1;
	    		if (counter==10)
	    			begin 
	    				counter=0;
	    				rx_data=shift_reg;
	    				rx_valid=1;
	    			end
			 end 
    READ_DATA:begin
    				
    				if(tx_valid==1) 
    				begin
    				rx_valid=0;
    				MISO=tx_data[7-counter];
    				counter=counter+1;
	    			if (counter==8)
	    			counter=0;
	    			end


	    			if(dummy==0)
	    			begin

	    			shift_reg[9-counter]=MOSI;
	    			counter=counter+1;
	    			if (counter==10)
	    			begin 
	    				counter=0;
	    				rx_data=shift_reg;
	    				rx_valid=1;
	    				dummy=1;
	    			end
	    			end

	    			
	    		
	    		
	    		
	    		
			 end 
	endcase


end

endmodule