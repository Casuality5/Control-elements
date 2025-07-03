module TwotoOnemux(
    input wire a,
    input wire b,
    input wire sel,
    output wire out
);
    assign out = (a & ~b & ~sel) | (a & b) | (~a & b & sel);
    endmodule