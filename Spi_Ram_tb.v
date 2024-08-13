module Spi_Ram_tb();

reg MOSI_tb,clk_tb,SS_n_tb,rstn_tb;
wire MISO_tb;
Spi_Ram DUT_tb (MOSI_tb,MISO_tb,SS_n_tb,clk_tb,rstn_tb);





initial begin
clk_tb=0;
forever
#4 clk_tb=~clk_tb;
end

/* test write address */
initial begin
$readmemh("mem.dat",DUT_tb.DUT_RAM.mem);

rstn_tb=0; MOSI_tb=0; SS_n_tb=1; 
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
//0011010101
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);

rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);

rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
/* return to idle */
rstn_tb=1; MOSI_tb=1; SS_n_tb=1;
@(negedge clk_tb);
@(negedge clk_tb);


/* test write data */
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
//01 10010101
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);

rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);

rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=1;
@(negedge clk_tb);
@(negedge clk_tb);

/*........................ test read address where the data is 0 ........... */
rstn_tb=1; MOSI_tb=1; SS_n_tb=0; 
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
//1010000111
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);

rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);

rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=1;
@(negedge clk_tb);
@(negedge clk_tb);

/*............................test read data from zero place..................... */
rstn_tb=1; MOSI_tb=1; SS_n_tb=0; 
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
//1100000000
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);

/* dummy data */
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);

@(negedge clk_tb); // another clock for ram to process the data because it's sequential 

rstn_tb=1; MOSI_tb=1; SS_n_tb=0; 
@(negedge clk_tb);
@(negedge clk_tb);
@(negedge clk_tb);
@(negedge clk_tb);
@(negedge clk_tb);
@(negedge clk_tb);
@(negedge clk_tb);
@(negedge clk_tb);

//return to idle 
rstn_tb=1; MOSI_tb=0; SS_n_tb=1;
@(negedge clk_tb);






/*........................ test read address where the data is exists........... */
rstn_tb=1; MOSI_tb=1; SS_n_tb=0; 
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
//1011010101
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);

rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);

rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
/* return to idle */
rstn_tb=1; MOSI_tb=1; SS_n_tb=1;
@(negedge clk_tb);
@(negedge clk_tb);














/*............................test read data from the filled place..................... */
rstn_tb=1; MOSI_tb=1; SS_n_tb=0; 
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
//1100000000
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=1; SS_n_tb=0;
@(negedge clk_tb);

/* dummy data */
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);
rstn_tb=1; MOSI_tb=0; SS_n_tb=0;
@(negedge clk_tb);

@(negedge clk_tb); // another clock for ram to process the data because it's sequential 

rstn_tb=1; MOSI_tb=1; SS_n_tb=0; 
@(negedge clk_tb);
@(negedge clk_tb);
@(negedge clk_tb);
@(negedge clk_tb);
@(negedge clk_tb);
@(negedge clk_tb);
@(negedge clk_tb);
@(negedge clk_tb);

//return to idle 
rstn_tb=1; MOSI_tb=0; SS_n_tb=1;
@(negedge clk_tb);



$stop;
end

endmodule