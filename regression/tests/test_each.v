module test_each (
    pi0, pi1, pi2, pi3, pi4, pi5,
    po0, po1, po2, po3, po4, po5);
    input pi0, pi1, pi2, pi3, pi4, pi5;
    output po0, po1, po2, po3, po4, po5;
    wire n1, n2;
    assign n1 = pi2 & pi3;
    assign n2 = pi4 | pi5;
    assign po0 = pi0 & pi1;
	assign po1 = pi0 | pi1;
	assign po2 = po0 & n1;
	assign po3 = po1 | n2;
	assign po4 = n1 & n2;
	assign po5 = n1 | n2;
endmodule

//po0 = pi0 & pi1
//	= Y1(i1, i2, 0)
//po1 = pi0 | pi1 
//	= Y2(1, i1, i2, 1, 1, 1)
//po2 = pi0 & pi1 & pi2 & pi3
//	= Y3(i1, i2, 0, i3, 0, 0, i4, 0, 0, 0)
//po3 = pi0 | pi1 | pi4 | pi5
//	= Y4(1, 1, 1, 1, 1, 1, i1, i2, i5, i6, 1, 1, 1, 1, 1)
//po4 =  pi2 & pi3 & (pi4 | pi5)
//	= Y4(i3, i4, 0, 1, 0, 0, i5, i6, 0, 0, 1, 1, 1, 0, 0)
//po5 = (pi2 & pi3) | pi4 | pi5
