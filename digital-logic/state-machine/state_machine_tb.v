module state_machine_tb();

    reg        dir;
    reg        rst;
    reg        clk;
    wire [2:0] out;

    state_machine_rtl dut(
        .out(out),
        .dir(dir),
        .rst(rst),
        .clk(clk)
    );

    initial begin
        clk = 0;
        forever #2 clk = ~clk;
    end

    initial begin
        $monitor("rst:%b\tclk:%b\tdir:%b\tout:%b\ttime:%d", rst, clk, dir, out, $time);
        rst = 0; dir = 0;
        #4  rst = 1;
        #12 dir = 1;
        #4  dir = 0;
        #4  dir = 1;
        #12 dir = 0;
        #30 $finish();
    end

endmodule