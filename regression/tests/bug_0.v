module test (
	pi0, pi1, pi2, pi3
	po0, po1, po2, po3);
  	input pi0, pi1, pi2, pi3;
  	output po0, po1, po2, po3;
  	wire n1, n2, n3, n4;
	assign n1  = pi0 & pi1;
	assign n2  = pi1 | pi2;
	assign n3  = pi2 | pi3;

	assign n4  = n1 | n2;
	assign po0 = n1 & n2;
	assign po1 = n2 | n3;

	assign po2 = po1 & n3;
	assign po3 = n3 & pi2;

endmodule

//Note n4 = po0, and then:
//If po3 = n4  | pi2,  po3 = pi2 | n4, segmentation fault occurs
//If po3 = n3  | pi2,  po3 = pi2 | n3, no segmentation fault
//n3 is function of primary input, n4 is function of "n", not primary input
//If po3 = po0 | pi2, no segmentation fault occurs, but in the output of po2, po1 still exists, not the optimized one, although po0 is before po2.
//It seems the optimized po0 is not propagated to po2.


/*
	n1 =   i1

	    i2     0

	n2 =   i3

	    i4     0


	po0 =  i1

	    i2     0

	  i3    0    0

    i4   0     0    0
*/