module test_17 (
    pi0, pi1, pi2, pi3, pi4, pi5, pi6, pi7, pi8, pi9,
    po0);
    input pi0, pi1, pi2, pi3, pi4, pi5, pi6, pi7, pi8, pi9;
    output po0;
    wire n1, n2, n3, n4, n5, n6, n7, n8;
  assign n0 = ~pi0 & pi1;
  assign n1 = pi2 & ~pi3;
  assign n3 = ~n0 & ~n1
  assign n5 = ~pi4 & ~pi5;
  assign n6 = pi6 & pi7;
  assign n7 = pi8 & pi9;
  assign n7 = n6 & n7;
  assign n8 = n5 & n7;
  assign po0 = ~n3 | ~n8;
endmodule
