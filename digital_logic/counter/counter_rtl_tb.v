module counter_tb();

    reg clk, rst;
    wire [3:0] out;

    counter_rtl dut(out, rst, clk);

    initial begin
        clk = 0;
        forever #2 clk = ~clk;
    end

    initial begin
        $monitor("rst:%b\tclk:%b\tout:%b\ttime:%d", rst, clk, out, $time);
        rst = 0;
        #10 rst = 1;
        #30 $finish();
    end


endmodule
