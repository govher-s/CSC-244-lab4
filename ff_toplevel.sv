//ff_toplevel.sv

	module ff_toplevel (
		 input logic CLK50M, button, j ,k,    
		 output logic Q, notQ         
	);

		 logic debounced_CLK;
		 //logic notQ;
		 
		 debouncer deb (
			  .A_noisy(button),   
			  .CLK50M(CLK50M),
			  .A(debounced_CLK)
		 );

		/* d_ff flip_flop (
			  .D(D),         
			  .CLK(debounced_CLK),
			  .Q(Q),             
			  .notQ(notQ) 
		 ); */
		 
		/* t_ff (
			.T(D),
			.CLK50M(debounced_CLK),
			.Q(Q),
			.notQ(notQ)
		 
		 ); */
		 
		 jk_ff(
		 
			.J(j),
			.K(k),
			.Q(Q),
			.notQ(notQ),
			.CLK50M(debounced_CLK)
		 
		 );

	endmodule
