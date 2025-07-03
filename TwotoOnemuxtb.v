`timescale 1ns/1ns
`include "TwotoOnemux.v"

module TwotoOnemuxtb;
    reg a, b, sel;
    wire out;


    TwotoOnemux uut(
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("TwotoOnemuxtb.vcd");
        $dumpvars(0, TwotoOnemuxtb);

        a=0; b=1; sel=0; #20;
        a=1; b=0; sel=1; #20;
        a=1; b=1; sel=0; #20;
        $finish;
    end
endmodule
