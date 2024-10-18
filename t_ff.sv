//t_ff.sv
	module t_ff (
		 input logic T, button, CLK50M,
		 output logic Q, notQ
	);

		 logic debounced_CLK;
		 logic notT, and1, and2, or1;
		 
		 debouncer deb (
			  .A_noisy(button),
			  .CLK50M(CLK50M),
			  .A(debounced_CLK)       
		 );
		 
		 assign notT = ~T;

		 assign and1 = notT & Q;     
		 assign and2 = T & notQ;
		 assign or1 = and1 | and2;

		 d_ff flip_flop (
			  .D(or1),
			  .CLK(debounced_CLK),
			  .Q(Q),
			  .notQ(notQ)
		 );

	endmodule
