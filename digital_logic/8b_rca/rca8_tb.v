module rca8_tb;
    wire [7:0] sum;
    wire cout;
    wire [1:0] out;

    reg [7:0] a, b;
    reg cin;

    rca8 rca(sum, cout, a, b, cin);

    initial begin
        repeat (10) begin
            a = $random; b = $random; cin = 0;
            $monitor("%b + %b = %b%b", a, b, cout, sum);
            #100;
        end
    end

endmodule
