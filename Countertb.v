`timescale 1ps/1ps
`include "Counter.v"


module Countertb;

reg clk;
reg reset;
reg load;
reg up;
reg [3:0] load_in;
reg enable;
wire [3:0] count_out;

Counter uut(
    .clk(clk),
    .reset(reset),
    .load(load),
    .load_in(load_in),
    .enable(enable),
    .up(up),
    .count_out(count_out)
);

initial begin
    $dumpfile("Countertb.vcd");
    $dumpvars(0, Countertb);
        $display("Clk | Reset | Load | Load_in | Enable | up | Count_out");
    $display("----------------------------------------------------------");
        // Initialize all signals
    clk = 0; reset = 0; load = 0; load_in = 4'b0000; enable = 0; up = 1; #5;
    $display("%1b   | %1b    | %1b   | %4b    | %1b     | %1b  | %4b", clk, reset, load, load_in, enable, up, count_out);

    // Apply reset
    reset = 1; #5; clk = 1; #5; clk = 0; reset = 0;
    $display("%1b   | %1b    | %1b   | %4b    | %1b     | %1b  | %4b", clk, reset, load, load_in, enable, up, count_out);

    // Enable counting up for 3 cycles
    enable = 1; up = 1;
    repeat (3) begin
        #5; clk = 1; #5; clk = 0;
        $display("%1b   | %1b    | %1b   | %4b    | %1b     | %1b  | %4b", clk, reset, load, load_in, enable, up, count_out);
    end

    // Load a value
    enable = 0; load = 1; load_in = 4'b1010;
    #5; clk = 1; #5; clk = 0; load = 0;
    $display("%1b   | %1b    | %1b   | %4b    | %1b     | %1b  | %4b", clk, reset, load, load_in, enable, up, count_out);

    // Count up for 2 cycles
    enable = 1; up = 1;
    repeat (2) begin
        #5; clk = 1; #5; clk = 0;
        $display("%1b   | %1b    | %1b   | %4b    | %1b     | %1b  | %4b", clk, reset, load, load_in, enable, up, count_out);
    end

    // Count down for 2 cycles
    up = 0;
    repeat (2) begin
        #5; clk = 1; #5; clk = 0;
        $display("%1b   | %1b    | %1b   | %4b    | %1b     | %1b  | %4b", clk, reset, load, load_in, enable, up, count_out);
    end

    // Test simultaneous load and enable (load should have priority)
    load = 1; load_in = 4'b0011; enable = 1; up = 0;
    #5; clk = 1; #5; clk = 0; load = 0;
    $display("%1b   | %1b    | %1b   | %4b    | %1b     | %1b  | %4b", clk, reset, load, load_in, enable, up, count_out);

    $finish;
    end


endmodule