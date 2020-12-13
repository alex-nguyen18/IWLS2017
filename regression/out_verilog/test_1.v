module test_1( pi0, pi1, pi2, pi3, po0 );
  input pi0, pi1, pi2, pi3;
  output po0;
  wire tmp0;
  assign tmp0 = 1'b1;
  wire tmp1;
  assign tmp1 = pi0;
  wire tmp2;
  assign tmp2 = pi1;
  wire tmp3;
  assign tmp3 = (tmp0 & tmp1) | (tmp0 & tmp2) | (tmp1 & tmp2); // == n1 = pi0 | pi1
  wire tmp4;
  assign tmp4 = pi0;
  wire tmp5;
  assign tmp5 = 1'b1;
  wire tmp6;
  assign tmp6 = 1'b1;
  wire tmp7;
  assign tmp7 = (tmp4 & tmp5) | (tmp4 & tmp6) | (tmp5 & tmp6); // always 1
  wire tmp8;
  assign tmp8 = pi1;
  wire tmp9;
  assign tmp9 = 1'b1;
  wire tmp10;
  assign tmp10 = 1'b1;
  wire tmp11;
  assign tmp11 = (tmp8 & tmp9) | (tmp8 & tmp10) | (tmp9 & tmp10); // always 1
  wire tmp12;
  assign tmp12 = (tmp3 & tmp7) | (tmp3 & tmp11) | (tmp7 & tmp11); // == Y1(n1, 1, 1) == always 1
  wire tmp13;
  assign tmp13 = pi0;
  wire tmp14;
  assign tmp14 = 1'b1;
  wire tmp15;
  assign tmp15 = 1'b1;
  wire tmp16;
  assign tmp16 = (tmp13 & tmp14) | (tmp13 & tmp15) | (tmp14 & tmp15); // always 1
  wire tmp17;
  assign tmp17 = 1'b1;
  wire tmp18;
  assign tmp18 = pi2;
  wire tmp19;
  assign tmp19 = 1'b0;
  wire tmp20;
  assign tmp20 = (tmp17 & tmp18) | (tmp17 & tmp19) | (tmp18 & tmp19); // == pi2
  wire tmp21;
  assign tmp21 = 1'b1;
  wire tmp22;
  assign tmp22 = 1'b0;
  wire tmp23;
  assign tmp23 = 1'b0;
  wire tmp24;
  assign tmp24 = (tmp21 & tmp22) | (tmp21 & tmp23) | (tmp22 & tmp23); // always 0
  wire tmp25;
  assign tmp25 = (tmp16 & tmp20) | (tmp16 & tmp24) | (tmp20 & tmp24); // == Y1(1, pi2, 0) == pi2
  wire tmp26;
  assign tmp26 = pi1;
  wire tmp27;
  assign tmp27 = 1'b1;
  wire tmp28;
  assign tmp28 = 1'b1;
  wire tmp29;
  assign tmp29 = (tmp26 & tmp27) | (tmp26 & tmp28) | (tmp27 & tmp28); // always 1
  wire tmp30;
  assign tmp30 = 1'b1;
  wire tmp31;
  assign tmp31 = 1'b0;
  wire tmp32;
  assign tmp32 = 1'b0;
  wire tmp33;
  assign tmp33 = (tmp30 & tmp31) | (tmp30 & tmp32) | (tmp31 & tmp32); // always 0
  wire tmp34;
  assign tmp34 = 1'b1;
  wire tmp35;
  assign tmp35 = 1'b0;
  wire tmp36;
  assign tmp36 = 1'b0;
  wire tmp37;
  assign tmp37 = (tmp34 & tmp35) | (tmp34 & tmp36) | (tmp35 & tmp36); // always 0
  wire tmp38;
  assign tmp38 = (tmp29 & tmp33) | (tmp29 & tmp37) | (tmp33 & tmp37); // == Y1(1, 0, 0) == always 0
  wire tmp39;
  assign tmp39 = (tmp12 & tmp25) | (tmp12 & tmp38) | (tmp25 & tmp38); // == Y1(1, pi2, 0) == pi2
  wire tmp40;
  assign tmp40 = pi0;
  wire tmp41;
  assign tmp41 = 1'b1;
  wire tmp42;
  assign tmp42 = 1'b1;
  wire tmp43;
  assign tmp43 = (tmp40 & tmp41) | (tmp40 & tmp42) | (tmp41 & tmp42); // always 1
  wire tmp44;
  assign tmp44 = 1'b1;
  wire tmp45;
  assign tmp45 = pi2;
  wire tmp46;
  assign tmp46 = 1'b0;
  wire tmp47;
  assign tmp47 = (tmp44 & tmp45) | (tmp44 & tmp46) | (tmp45 & tmp46); // == pi2
  wire tmp48;
  assign tmp48 = 1'b1;
  wire tmp49;
  assign tmp49 = 1'b0;
  wire tmp50;
  assign tmp50 = 1'b0;
  wire tmp51;
  assign tmp51 = (tmp48 & tmp49) | (tmp48 & tmp50) | (tmp49 & tmp50); // always 0
  wire tmp52;
  assign tmp52 = (tmp43 & tmp47) | (tmp43 & tmp51) | (tmp47 & tmp51); // == Y1(1, pi2, 0) == pi2
  wire tmp53;
  assign tmp53 = 1'b1;
  wire tmp54;
  assign tmp54 = pi2;
  wire tmp55;
  assign tmp55 = 1'b0;
  wire tmp56;
  assign tmp56 = (tmp53 & tmp54) | (tmp53 & tmp55) | (tmp54 & tmp55); // == pi2
  wire tmp57;
  assign tmp57 = pi2;
  wire tmp58;
  assign tmp58 = pi3;
  wire tmp59;
  assign tmp59 = 1'b0;
  wire tmp60;
  assign tmp60 = (tmp57 & tmp58) | (tmp57 & tmp59) | (tmp58 & tmp59); // == n2 = pi2 & pi3
  wire tmp61;
  assign tmp61 = 1'b0;
  wire tmp62;
  assign tmp62 = 1'b0;
  wire tmp63;
  assign tmp63 = 1'b0;
  wire tmp64;
  assign tmp64 = (tmp61 & tmp62) | (tmp61 & tmp63) | (tmp62 & tmp63); // always 0
  wire tmp65;
  assign tmp65 = (tmp56 & tmp60) | (tmp56 & tmp64) | (tmp60 & tmp64); // == Y1(pi2, n2, 0)
  wire tmp66;
  assign tmp66 = 1'b1;
  wire tmp67;
  assign tmp67 = 1'b0;
  wire tmp68;
  assign tmp68 = 1'b0;
  wire tmp69;
  assign tmp69 = (tmp66 & tmp67) | (tmp66 & tmp68) | (tmp67 & tmp68); // always 0
  wire tmp70;
  assign tmp70 = 1'b0;
  wire tmp71;
  assign tmp71 = 1'b0;
  wire tmp72;
  assign tmp72 = 1'b0;
  wire tmp73;
  assign tmp73 = (tmp70 & tmp71) | (tmp70 & tmp72) | (tmp71 & tmp72); // always 0
  wire tmp74;
  assign tmp74 = 1'b0;
  wire tmp75;
  assign tmp75 = 1'b0;
  wire tmp76;
  assign tmp76 = 1'b0;
  wire tmp77;
  assign tmp77 = (tmp74 & tmp75) | (tmp74 & tmp76) | (tmp75 & tmp76); // always 0
  wire tmp78;
  assign tmp78 = (tmp69 & tmp73) | (tmp69 & tmp77) | (tmp73 & tmp77); // always 0
  wire tmp79;
  assign tmp79 = (tmp52 & tmp65) | (tmp52 & tmp78) | (tmp65 & tmp78); // == Y1(pi2, tmp65, 0)
  wire tmp80;
  assign tmp80 = pi1;
  wire tmp81;
  assign tmp81 = 1'b1;
  wire tmp82;
  assign tmp82 = 1'b1;
  wire tmp83;
  assign tmp83 = (tmp80 & tmp81) | (tmp80 & tmp82) | (tmp81 & tmp82); // always 1
  wire tmp84;
  assign tmp84 = 1'b1;
  wire tmp85;
  assign tmp85 = 1'b0;
  wire tmp86;
  assign tmp86 = 1'b0;
  wire tmp87;
  assign tmp87 = (tmp84 & tmp85) | (tmp84 & tmp86) | (tmp85 & tmp86); // always 0
  wire tmp88;
  assign tmp88 = 1'b1;
  wire tmp89;
  assign tmp89 = 1'b0;
  wire tmp90;
  assign tmp90 = 1'b0;
  wire tmp91;
  assign tmp91 = (tmp88 & tmp89) | (tmp88 & tmp90) | (tmp89 & tmp90); // always 0
  wire tmp92;
  assign tmp92 = (tmp83 & tmp87) | (tmp83 & tmp91) | (tmp87 & tmp91); // always 0
  wire tmp93;
  assign tmp93 = 1'b1;
  wire tmp94;
  assign tmp94 = 1'b0;
  wire tmp95;
  assign tmp95 = 1'b0;
  wire tmp96;
  assign tmp96 = (tmp93 & tmp94) | (tmp93 & tmp95) | (tmp94 & tmp95); // always 0
  wire tmp97;
  assign tmp97 = 1'b0;
  wire tmp98;
  assign tmp98 = 1'b0;
  wire tmp99;
  assign tmp99 = 1'b0;
  wire tmp100;
  assign tmp100 = (tmp97 & tmp98) | (tmp97 & tmp99) | (tmp98 & tmp99); // always 0
  wire tmp101;
  assign tmp101 = 1'b0;
  wire tmp102;
  assign tmp102 = 1'b0;
  wire tmp103;
  assign tmp103 = 1'b0;
  wire tmp104;
  assign tmp104 = (tmp101 & tmp102) | (tmp101 & tmp103) | (tmp102 & tmp103); // always 0
  wire tmp105;
  assign tmp105 = (tmp96 & tmp100) | (tmp96 & tmp104) | (tmp100 & tmp104); // always 0
  wire tmp106;
  assign tmp106 = 1'b1;
  wire tmp107;
  assign tmp107 = 1'b0;
  wire tmp108;
  assign tmp108 = 1'b0;
  wire tmp109;
  assign tmp109 = (tmp106 & tmp107) | (tmp106 & tmp108) | (tmp107 & tmp108); // always 0
  wire tmp110;
  assign tmp110 = 1'b0;
  wire tmp111;
  assign tmp111 = 1'b0;
  wire tmp112;
  assign tmp112 = 1'b0;
  wire tmp113;
  assign tmp113 = (tmp110 & tmp111) | (tmp110 & tmp112) | (tmp111 & tmp112); // always 0
  wire tmp114;
  assign tmp114 = 1'b0;
  wire tmp115;
  assign tmp115 = 1'b0;
  wire tmp116;
  assign tmp116 = 1'b0;
  wire tmp117;
  assign tmp117 = (tmp114 & tmp115) | (tmp114 & tmp116) | (tmp115 & tmp116); // always 0
  wire tmp118;
  assign tmp118 = (tmp109 & tmp113) | (tmp109 & tmp117) | (tmp113 & tmp117); // always 0
  wire tmp119;
  assign tmp119 = (tmp92 & tmp105) | (tmp92 & tmp118) | (tmp105 & tmp118); // always 0
  wire tmp120;
  assign tmp120 = (tmp39 & tmp79) | (tmp39 & tmp119) | (tmp79 & tmp119); // == Y1(pi2, tmp79, 0)
  assign po0 = tmp120;
endmodule // test_1
