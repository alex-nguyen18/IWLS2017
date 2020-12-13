module test_2 (
	pi0, pi1, pi2, pi3,
	po0);
  	input pi0, pi1, pi2, pi3;
  	output po0;
  	wire n1, n2;
	assign n1 = pi0 | pi1;
	assign n2 = pi2 & pi3;
	assign po0 = n2 & n1;
endmodule

// Y4(i3, i4, 0, 1, 0, 0, i1, i2, 0, 0, 1, 1, 1, 0, 0)
