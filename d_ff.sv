//d_ff.sv
module d_ff (
    input logic D, CLK,      
    output logic Q, notQ     
);

    logic master_Q, master_notQ;

    d_latch master (
        .D(D),
        .CLK(~CLK),
        .Q(master_Q),
        .notQ(master_notQ)
    );

    d_latch slave (
        .D(master_Q),
        .CLK(CLK),
        .Q(Q),
        .notQ(notQ)
    );

endmodule
