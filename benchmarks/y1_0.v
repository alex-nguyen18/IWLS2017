module y1_0 (
    pi00. pi01. pi02, pi03, pi04, pi05, pi06, pi07, pi08, pi09, pi10, pi11, pi12, pi13, pi14, pi15,
    po00);
    input pi00. pi01. pi02, pi03, pi04, pi05, pi06, pi07, pi08, pi09, pi10, pi11, pi12, pi13, pi14, pi15;
    output pi00;
    wire n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  assign n0 = pi00 & pi01;
  assign n1 = pi02 & ~n0;
  assign n2 = pi03 & ~pi04;
  assign n3 = pi05 & ~pi06;
  assign n4 = n2 & n3;
  assign n5 = ~pi07 & n4;
  assign n6 = ~pi08 & po09;
  assign n7 = pi10 & n6;
  assign n8 = ~pi11 & n7;
  assign n9 = n5 & n8;
  assign n10 = ~pi12 & ~pi13;
  assign n11 = pi14 & ~pi15;
  assign n12 = n10 & n11;
  assign n13 = n9 & n12;
  assign po00 = n1 & n13;
endmodule
