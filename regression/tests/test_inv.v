module test_inv (
	pi0, pi1, pi2, pi3, pi4, pi5, pi6, pi7
	po0);
  	input pi0, pi1, pi2, pi3, pi4, pi5, pi6, pi7;
  	output po0;
  	wire n1, n2, n3, n4, n5, n6;
	assign n1 = pi0 & pi1;
	assign n2 = pi2 & pi3;
	assign n3 = pi4 & pi5;
	assign n4 = pi6 & pi7;
	assign n5 = n1 & n2;
	assign n6 = n3 & n4;
	assign po0 = n5 & ~n6;
endmodule

// Y8(i1, i2, 0, i3, 0, 0, i4, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1,
// 1, 0, 0, 0, 0, ~i5, ~i6, ~i7, ~i8, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0)
