module y1_00 (
    pi0, pi1, pi2, pi3, pi4, pi5, pi6, pi7, pi8, pi9, pi10, pi11, pi12, pi13, pi14, pi15,
    po0);
    input pi0, pi1, pi2, pi3, pi4, pi5, pi6, pi7, pi8, pi9, pi10, pi11, pi12, pi13, pi14, pi15;
    output po0;
    wire n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  assign n2 = pi3 & ~pi4;
  assign n3 = pi5 & ~pi6;
  assign n4 = n2 & n3;
  assign n5 = ~pi7 & n4;
  assign n6 = ~pi8 & pi9;
  assign n7 = pi10 & n6;
  assign n8 = ~pi11 & n7;
  assign n9 = n5 & n8;
  assign n10 = ~pi12 & ~pi13;
  assign n11 = pi14 & ~pi15;
  assign n12 = n10 & n11;
  assign po0 = n9 & n12;
endmodule

// po0 == n13 in y1_0
