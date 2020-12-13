module bug_0 (
	pi0, pi1, pi2, pi3, pi4, pi5,
	po0, po1, po2, po3, po4);
  	input pi0, pi1, pi2, pi3, pi4, pi5;
  	output po0, po1, po2, po3, po4;
  	wire n1, n2, n3, n4;
	assign n1  = pi0 & pi1;
	assign n2  = pi2 | pi3;
	assign n3  = pi4 | pi5;

	assign n4  = n1 | n2; // need to handle sinkless nets; i.e. decrement fanout for fanin
	assign po0 = n1 & n2;
	assign po1 = n2 | n3;

	assign po2 = po1 & n1;
	assign po3 = n3 & pi2;
	assign po4 = n1 & pi2;

endmodule

// o1: i1 & i2 & (i3 | i4)
//	= Y4(i1, i2, 0, 1, 0, 0, i3, i4, 0, 0, 1, 1, 1, 0, 0)
// o2: i3 | i4 | i5 | i6 
//	= Y4(1, 1, 1, 1, 1, 1, i3, i4, i5, i6, 1, 1, 1, 1, 1)
// o3: (i3 | i4 | i5 | i6) & i1 & i2 
//	= Y6(1, 1, 1, 1, 1, 1, i3, i4, i5, i6, 1, 1, 1, 1, 1, i1, 0, 0, 0, 0, 0, i2, 0, 0, 0, 0, 0, 0)
// o4: i5->i6->i3 = Y3(1, i5, i6, 1, 1, 1, i3, 0, 0, 0)
// o5: i1->i2->i3 = Y2(i1, i2, 0, i3, 0, 0)

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
