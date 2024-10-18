//ff_toplevel.sv

	module ff_toplevel (
		 input logic D, CLK50M, button,    
		 output logic Q         
	);

		 logic debounced_CLK;
		 logic notQ;
		 
		 debouncer deb (
			  .A_noisy(button),   
			  .CLK50M(CLK50M),
			  .A(debounced_CLK)
		 );

		 d_ff flip_flop (
			  .D(D),         
			  .CLK(debounced_CLK),
			  .Q(Q),             
			  .notQ(notQ) 
		 );

	endmodule
