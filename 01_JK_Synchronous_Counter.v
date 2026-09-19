module jk_ff 
(
    input J, K, CLK,
    output Q, Qbar
);

wire N1, N2;

// NAND gates
nand(N1, Qbar, J, CLK);
nand(N2, Q, K, CLK);

// Outputs Q and Qbar
nand(Q, N1, Qbar);
nand(Qbar, N2, Q);

endmodule