//jk_ff

module jk_ff (
    input logic J, K, button, CLK50M,
	 output logic Q, notQ
);

    logic DCLK;
    logic notK, and1, and2, or1;


    debouncer deb (
        .A_noisy(button),
        .CLK50M(CLK50M),
        .A(DCLK)
    );


    assign notK = ~K;

    assign and1 = J & notQ;
    assign and2 = notK & Q; 
    assign or1 = and1 | and2;

    d_ff flip_flop (
        .D(or1),
        .CLK(DCLK),
        .Q(Q),
        .notQ(notQ)
    );

endmodule
