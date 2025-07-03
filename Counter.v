module Counter(
    input clk,
    input reset,
    input enable,
    input up,
    input load,
    input [3:0] load_in,
    output reg [3:0] count_out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
        count_out<=4'b0000;
        else if (load)
        count_out<=load_in;
        else if (enable) begin
            if (up)
            count_out<=count_out+1;
            else
            count_out<=count_out-1;
        end
    end
    endmodule