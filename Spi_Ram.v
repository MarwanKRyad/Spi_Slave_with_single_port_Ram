module Spi_Ram(MOSI,MISO,SS_n,clk,rst_n);
input MOSI,clk,SS_n,rst_n;
output MISO;
wire [9:0] rx_data_internal;
wire rx_vaild_internal,tx_valid_internal;
wire [7:0] tx_data_internal;
spi DUT_spi(.clk(clk),.rstn(rst_n),.MISO(MISO),.MOSI(MOSI),.SS_n(SS_n),.rx_data(rx_data_internal),.rx_valid(rx_vaild_internal),.tx_data(tx_data_internal),.tx_valid(tx_valid_internal));
RAM DUT_RAM(.din(rx_data_internal),.rx_valid(rx_vaild_internal),.tx_valid(tx_valid_internal),.clk(clk),.rstn(rst_n),.dout(tx_data_internal));


endmodule