`timescale 1ns / 1ps

module tb_seq_1101;

    reg clk;
reg rst;
reg in;
wire out;

// Instantiate DUT
seq_1101 uut (
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out)
);

// Clock generation (10ns period)
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus
initial begin
    rst = 1;
    in = 0;

    #20;
    rst = 0;

    // Apply inputs slightly before posedge
    #7  in = 1;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;
    #10 in = 1;
    #10 in = 0;
    #10 in = 1;

    #40;
    $finish;
end

endmodule
