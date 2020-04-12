module stepdown_1209Hz(outclk, inclk);
    output reg outclk;
    input wire inclk;

    reg [8:0] count;

    initial begin count = 9'b0; outclk = 0; end

    always@(posedge inclk) begin
        count = count + 1;
        if (count == 414) begin
            outclk = ~outclk;
            count = 0;
        end
    end
endmodule
