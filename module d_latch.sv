// d_latch.sv

	module d_latch(

		input logic D, CLK,
		output logic Q, notQ
		);
		
		logic s, r;
		
		sr_latch(
			.S(s),
			.R(r),
			.Q(Q),
			.notQ(notQ)
		);
		
		assign r = ~D & CLK;
		assign s = D & CLK;

	endmodule
