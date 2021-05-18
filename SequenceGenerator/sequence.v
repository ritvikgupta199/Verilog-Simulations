module DFlipFlop(D, clk, reset, Q);
    input D, clk, reset;
    output reg Q;

    always @ (posedge clk or posedge reset)
        Q <= D;
endmodule

module SequenceGenerator(Xin ,clk, reset, Yout);
    input Xin, clk, reset;
    output Yout;

    wire [2:0] Q;
    wire [2:0] D;

    assign D[0] = Q[1];
    assign D[1] = Q[2];
    assign D[2] = Q[3];

    DFlipFlop d0 (D[0], clk, reset, init[0], Q[0]);
    DFlipFlop d1 (D[1], clk, reset, init[1], Q[1]);
    DFlipFlop d2 (D[2], clk, reset, init[2], Q[2]);

    assign Yout = Q;
endmodule