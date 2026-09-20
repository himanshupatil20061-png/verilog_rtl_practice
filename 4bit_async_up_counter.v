module jk_ff (
    input J,
    input K,
    input CLK,
    output Q,
    output Qbar
);

wire N1, N2;

nand (N1, J, CLK, Qbar);
nand (N2, K, CLK, Q);

nand (Q, N1, Qbar);
nand (Qbar, N2, Q);

endmodule


module counter_4bit (
    input CLK,
    output Q0,
    output Q1,
    output Q2,
    output Q3
);

wire Q0bar, Q1bar, Q2bar, Q3bar;

jk_ff ff0(1'b1, 1'b1, CLK, Q0, Q0bar);
jk_ff ff1(1'b1, 1'b1, Q0,  Q1, Q1bar);
jk_ff ff2(1'b1, 1'b1, Q1,  Q2, Q2bar);
jk_ff ff3(1'b1, 1'b1, Q2,  Q3, Q3bar);

endmodule