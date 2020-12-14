module y1_01 (
    pi0, pi1, pi2, pi3, 
    po0);
    input pi0, pi1, pi2, pi3;
    output po0;
    wire n0, n1;
  assign n0 = pi0 & pi1;
  assign n1 = pi2 & ~n0;
  assign po0 = n1 & pi3;
endmodule

// pi3 == n13 in y1_0
