These projects use the NIOS II/f softcore processor on the Max1000 FPGA using the Arrow Max1000 IoT board. 

Note: Before you are able to download an elf application file from Eclipse to NIOS, you must change the JTAG TCK. Intel UART JTAG IP input clock needs to be at least double (2x) the operating frequency of JTAG TCK on board. For instruction on how to set the JTAG TCK naviagte to C:\intelFPGA_lite\17.0\nios2eds and run the Nios II Command Shell.bat then run jtagconfig --setparam <cable number> JtagClock <frequency><unit prefix>
  
