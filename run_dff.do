vlib work
vlog spi.v RAM.v Spi_Ram.v Spi_Ram_tb.v 
vsim -voptargs=+acc work.Spi_Ram_tb
add wave *
run -all
#quit -sim