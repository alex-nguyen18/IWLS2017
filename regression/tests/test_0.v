module test_0 (
	pi0, pi1, pi2, pi3,
	po0);
  	input pi0, pi1, pi2, pi3;
  	output po0;
  	wire n1, n2;
	assign n1 = pi0 & pi1;
	assign n2 = pi2 & pi3;
	assign po0 = n1 & ~n2;
endmodule

// Y3(i1, i2, 0, i3, 0, 0, i4, 0, 0, 0)
