module test_6( pi0, pi1, pi2, pi3, po0 );
  input pi0, pi1, pi2, pi3;
  output po0;
  wire tmp0;
  assign tmp0 = 1'b1;
  wire tmp1;
  assign tmp1 = pi0;
  wire tmp2;
  assign tmp2 = pi1;
  wire tmp3;
  assign tmp3 = (tmp0 & tmp1) | (tmp0 & tmp2) | (tmp1 & tmp2);
  wire tmp4;
  assign tmp4 = pi0;
  wire tmp5;
  assign tmp5 = 1'b1;
  wire tmp6;
  assign tmp6 = 1'b1;
  wire tmp7;
  assign tmp7 = (tmp4 & tmp5) | (tmp4 & tmp6) | (tmp5 & tmp6);
  wire tmp8;
  assign tmp8 = pi1;
  wire tmp9;
  assign tmp9 = 1'b1;
  wire tmp10;
  assign tmp10 = 1'b0;
  wire tmp11;
  assign tmp11 = (tmp8 & tmp9) | (tmp8 & tmp10) | (tmp9 & tmp10);
  wire tmp12;
  assign tmp12 = (tmp3 & tmp7) | (tmp3 & tmp11) | (tmp7 & tmp11);
  wire tmp13;
  assign tmp13 = pi0;
  wire tmp14;
  assign tmp14 = 1'b1;
  wire tmp15;
  assign tmp15 = 1'b1;
  wire tmp16;
  assign tmp16 = (tmp13 & tmp14) | (tmp13 & tmp15) | (tmp14 & tmp15);
  wire tmp17;
  assign tmp17 = 1'b1;
  wire tmp18;
  assign tmp18 = 1'b1;
  wire tmp19;
  assign tmp19 = 1'b0;
  wire tmp20;
  assign tmp20 = (tmp17 & tmp18) | (tmp17 & tmp19) | (tmp18 & tmp19);
  wire tmp21;
  assign tmp21 = 1'b1;
  wire tmp22;
  assign tmp22 = 1'b0;
  wire tmp23;
  assign tmp23 = 1'b0;
  wire tmp24;
  assign tmp24 = (tmp21 & tmp22) | (tmp21 & tmp23) | (tmp22 & tmp23);
  wire tmp25;
  assign tmp25 = (tmp16 & tmp20) | (tmp16 & tmp24) | (tmp20 & tmp24);
  wire tmp26;
  assign tmp26 = pi1;
  wire tmp27;
  assign tmp27 = 1'b1;
  wire tmp28;
  assign tmp28 = 1'b0;
  wire tmp29;
  assign tmp29 = (tmp26 & tmp27) | (tmp26 & tmp28) | (tmp27 & tmp28);
  wire tmp30;
  assign tmp30 = 1'b1;
  wire tmp31;
  assign tmp31 = 1'b0;
  wire tmp32;
  assign tmp32 = 1'b0;
  wire tmp33;
  assign tmp33 = (tmp30 & tmp31) | (tmp30 & tmp32) | (tmp31 & tmp32);
  wire tmp34;
  assign tmp34 = 1'b0;
  wire tmp35;
  assign tmp35 = 1'b0;
  wire tmp36;
  assign tmp36 = 1'b0;
  wire tmp37;
  assign tmp37 = (tmp34 & tmp35) | (tmp34 & tmp36) | (tmp35 & tmp36);
  wire tmp38;
  assign tmp38 = (tmp29 & tmp33) | (tmp29 & tmp37) | (tmp33 & tmp37);
  wire tmp39;
  assign tmp39 = (tmp12 & tmp25) | (tmp12 & tmp38) | (tmp25 & tmp38);
  wire tmp40;
  assign tmp40 = pi0;
  wire tmp41;
  assign tmp41 = 1'b1;
  wire tmp42;
  assign tmp42 = 1'b1;
  wire tmp43;
  assign tmp43 = (tmp40 & tmp41) | (tmp40 & tmp42) | (tmp41 & tmp42);
  wire tmp44;
  assign tmp44 = 1'b1;
  wire tmp45;
  assign tmp45 = 1'b1;
  wire tmp46;
  assign tmp46 = 1'b0;
  wire tmp47;
  assign tmp47 = (tmp44 & tmp45) | (tmp44 & tmp46) | (tmp45 & tmp46);
  wire tmp48;
  assign tmp48 = 1'b1;
  wire tmp49;
  assign tmp49 = 1'b0;
  wire tmp50;
  assign tmp50 = 1'b0;
  wire tmp51;
  assign tmp51 = (tmp48 & tmp49) | (tmp48 & tmp50) | (tmp49 & tmp50);
  wire tmp52;
  assign tmp52 = (tmp43 & tmp47) | (tmp43 & tmp51) | (tmp47 & tmp51);
  wire tmp53;
  assign tmp53 = 1'b1;
  wire tmp54;
  assign tmp54 = 1'b1;
  wire tmp55;
  assign tmp55 = 1'b0;
  wire tmp56;
  assign tmp56 = (tmp53 & tmp54) | (tmp53 & tmp55) | (tmp54 & tmp55);
  wire tmp57;
  assign tmp57 = 1'b1;
  wire tmp58;
  assign tmp58 = ~pi2;
  wire tmp59;
  assign tmp59 = ~pi3;
  wire tmp60;
  assign tmp60 = (tmp57 & tmp58) | (tmp57 & tmp59) | (tmp58 & tmp59);
  wire tmp61;
  assign tmp61 = 1'b0;
  wire tmp62;
  assign tmp62 = ~pi3;
  wire tmp63;
  assign tmp63 = 1'b0;
  wire tmp64;
  assign tmp64 = (tmp61 & tmp62) | (tmp61 & tmp63) | (tmp62 & tmp63);
  wire tmp65;
  assign tmp65 = (tmp56 & tmp60) | (tmp56 & tmp64) | (tmp60 & tmp64);
  wire tmp66;
  assign tmp66 = 1'b1;
  wire tmp67;
  assign tmp67 = 1'b0;
  wire tmp68;
  assign tmp68 = 1'b0;
  wire tmp69;
  assign tmp69 = (tmp66 & tmp67) | (tmp66 & tmp68) | (tmp67 & tmp68);
  wire tmp70;
  assign tmp70 = 1'b0;
  wire tmp71;
  assign tmp71 = ~pi3;
  wire tmp72;
  assign tmp72 = 1'b0;
  wire tmp73;
  assign tmp73 = (tmp70 & tmp71) | (tmp70 & tmp72) | (tmp71 & tmp72);
  wire tmp74;
  assign tmp74 = 1'b0;
  wire tmp75;
  assign tmp75 = 1'b0;
  wire tmp76;
  assign tmp76 = 1'b0;
  wire tmp77;
  assign tmp77 = (tmp74 & tmp75) | (tmp74 & tmp76) | (tmp75 & tmp76);
  wire tmp78;
  assign tmp78 = (tmp69 & tmp73) | (tmp69 & tmp77) | (tmp73 & tmp77);
  wire tmp79;
  assign tmp79 = (tmp52 & tmp65) | (tmp52 & tmp78) | (tmp65 & tmp78);
  wire tmp80;
  assign tmp80 = pi1;
  wire tmp81;
  assign tmp81 = 1'b1;
  wire tmp82;
  assign tmp82 = 1'b0;
  wire tmp83;
  assign tmp83 = (tmp80 & tmp81) | (tmp80 & tmp82) | (tmp81 & tmp82);
  wire tmp84;
  assign tmp84 = 1'b1;
  wire tmp85;
  assign tmp85 = 1'b0;
  wire tmp86;
  assign tmp86 = 1'b0;
  wire tmp87;
  assign tmp87 = (tmp84 & tmp85) | (tmp84 & tmp86) | (tmp85 & tmp86);
  wire tmp88;
  assign tmp88 = 1'b0;
  wire tmp89;
  assign tmp89 = 1'b0;
  wire tmp90;
  assign tmp90 = 1'b0;
  wire tmp91;
  assign tmp91 = (tmp88 & tmp89) | (tmp88 & tmp90) | (tmp89 & tmp90);
  wire tmp92;
  assign tmp92 = (tmp83 & tmp87) | (tmp83 & tmp91) | (tmp87 & tmp91);
  wire tmp93;
  assign tmp93 = 1'b1;
  wire tmp94;
  assign tmp94 = 1'b0;
  wire tmp95;
  assign tmp95 = 1'b0;
  wire tmp96;
  assign tmp96 = (tmp93 & tmp94) | (tmp93 & tmp95) | (tmp94 & tmp95);
  wire tmp97;
  assign tmp97 = 1'b0;
  wire tmp98;
  assign tmp98 = ~pi3;
  wire tmp99;
  assign tmp99 = 1'b0;
  wire tmp100;
  assign tmp100 = (tmp97 & tmp98) | (tmp97 & tmp99) | (tmp98 & tmp99);
  wire tmp101;
  assign tmp101 = 1'b0;
  wire tmp102;
  assign tmp102 = 1'b0;
  wire tmp103;
  assign tmp103 = 1'b0;
  wire tmp104;
  assign tmp104 = (tmp101 & tmp102) | (tmp101 & tmp103) | (tmp102 & tmp103);
  wire tmp105;
  assign tmp105 = (tmp96 & tmp100) | (tmp96 & tmp104) | (tmp100 & tmp104);
  wire tmp106;
  assign tmp106 = 1'b0;
  wire tmp107;
  assign tmp107 = 1'b0;
  wire tmp108;
  assign tmp108 = 1'b0;
  wire tmp109;
  assign tmp109 = (tmp106 & tmp107) | (tmp106 & tmp108) | (tmp107 & tmp108);
  wire tmp110;
  assign tmp110 = 1'b0;
  wire tmp111;
  assign tmp111 = 1'b0;
  wire tmp112;
  assign tmp112 = 1'b0;
  wire tmp113;
  assign tmp113 = (tmp110 & tmp111) | (tmp110 & tmp112) | (tmp111 & tmp112);
  wire tmp114;
  assign tmp114 = 1'b0;
  wire tmp115;
  assign tmp115 = 1'b0;
  wire tmp116;
  assign tmp116 = 1'b0;
  wire tmp117;
  assign tmp117 = (tmp114 & tmp115) | (tmp114 & tmp116) | (tmp115 & tmp116);
  wire tmp118;
  assign tmp118 = (tmp109 & tmp113) | (tmp109 & tmp117) | (tmp113 & tmp117);
  wire tmp119;
  assign tmp119 = (tmp92 & tmp105) | (tmp92 & tmp118) | (tmp105 & tmp118);
  wire tmp120;
  assign tmp120 = (tmp39 & tmp79) | (tmp39 & tmp119) | (tmp79 & tmp119);
  wire tmp121;
  assign tmp121 = pi0;
  wire tmp122;
  assign tmp122 = 1'b1;
  wire tmp123;
  assign tmp123 = 1'b1;
  wire tmp124;
  assign tmp124 = (tmp121 & tmp122) | (tmp121 & tmp123) | (tmp122 & tmp123);
  wire tmp125;
  assign tmp125 = 1'b1;
  wire tmp126;
  assign tmp126 = 1'b1;
  wire tmp127;
  assign tmp127 = 1'b0;
  wire tmp128;
  assign tmp128 = (tmp125 & tmp126) | (tmp125 & tmp127) | (tmp126 & tmp127);
  wire tmp129;
  assign tmp129 = 1'b1;
  wire tmp130;
  assign tmp130 = 1'b0;
  wire tmp131;
  assign tmp131 = 1'b0;
  wire tmp132;
  assign tmp132 = (tmp129 & tmp130) | (tmp129 & tmp131) | (tmp130 & tmp131);
  wire tmp133;
  assign tmp133 = (tmp124 & tmp128) | (tmp124 & tmp132) | (tmp128 & tmp132);
  wire tmp134;
  assign tmp134 = 1'b1;
  wire tmp135;
  assign tmp135 = 1'b1;
  wire tmp136;
  assign tmp136 = 1'b0;
  wire tmp137;
  assign tmp137 = (tmp134 & tmp135) | (tmp134 & tmp136) | (tmp135 & tmp136);
  wire tmp138;
  assign tmp138 = 1'b1;
  wire tmp139;
  assign tmp139 = ~pi2;
  wire tmp140;
  assign tmp140 = ~pi3;
  wire tmp141;
  assign tmp141 = (tmp138 & tmp139) | (tmp138 & tmp140) | (tmp139 & tmp140);
  wire tmp142;
  assign tmp142 = 1'b0;
  wire tmp143;
  assign tmp143 = ~pi3;
  wire tmp144;
  assign tmp144 = 1'b0;
  wire tmp145;
  assign tmp145 = (tmp142 & tmp143) | (tmp142 & tmp144) | (tmp143 & tmp144);
  wire tmp146;
  assign tmp146 = (tmp137 & tmp141) | (tmp137 & tmp145) | (tmp141 & tmp145);
  wire tmp147;
  assign tmp147 = 1'b1;
  wire tmp148;
  assign tmp148 = 1'b0;
  wire tmp149;
  assign tmp149 = 1'b0;
  wire tmp150;
  assign tmp150 = (tmp147 & tmp148) | (tmp147 & tmp149) | (tmp148 & tmp149);
  wire tmp151;
  assign tmp151 = 1'b0;
  wire tmp152;
  assign tmp152 = ~pi3;
  wire tmp153;
  assign tmp153 = 1'b0;
  wire tmp154;
  assign tmp154 = (tmp151 & tmp152) | (tmp151 & tmp153) | (tmp152 & tmp153);
  wire tmp155;
  assign tmp155 = 1'b0;
  wire tmp156;
  assign tmp156 = 1'b0;
  wire tmp157;
  assign tmp157 = 1'b0;
  wire tmp158;
  assign tmp158 = (tmp155 & tmp156) | (tmp155 & tmp157) | (tmp156 & tmp157);
  wire tmp159;
  assign tmp159 = (tmp150 & tmp154) | (tmp150 & tmp158) | (tmp154 & tmp158);
  wire tmp160;
  assign tmp160 = (tmp133 & tmp146) | (tmp133 & tmp159) | (tmp146 & tmp159);
  wire tmp161;
  assign tmp161 = 1'b1;
  wire tmp162;
  assign tmp162 = 1'b1;
  wire tmp163;
  assign tmp163 = 1'b0;
  wire tmp164;
  assign tmp164 = (tmp161 & tmp162) | (tmp161 & tmp163) | (tmp162 & tmp163);
  wire tmp165;
  assign tmp165 = 1'b1;
  wire tmp166;
  assign tmp166 = ~pi2;
  wire tmp167;
  assign tmp167 = ~pi3;
  wire tmp168;
  assign tmp168 = (tmp165 & tmp166) | (tmp165 & tmp167) | (tmp166 & tmp167);
  wire tmp169;
  assign tmp169 = 1'b0;
  wire tmp170;
  assign tmp170 = ~pi3;
  wire tmp171;
  assign tmp171 = 1'b0;
  wire tmp172;
  assign tmp172 = (tmp169 & tmp170) | (tmp169 & tmp171) | (tmp170 & tmp171);
  wire tmp173;
  assign tmp173 = (tmp164 & tmp168) | (tmp164 & tmp172) | (tmp168 & tmp172);
  wire tmp174;
  assign tmp174 = 1'b1;
  wire tmp175;
  assign tmp175 = ~pi2;
  wire tmp176;
  assign tmp176 = ~pi3;
  wire tmp177;
  assign tmp177 = (tmp174 & tmp175) | (tmp174 & tmp176) | (tmp175 & tmp176);
  wire tmp178;
  assign tmp178 = ~pi2;
  wire tmp179;
  assign tmp179 = 1'b1;
  wire tmp180;
  assign tmp180 = 1'b1;
  wire tmp181;
  assign tmp181 = (tmp178 & tmp179) | (tmp178 & tmp180) | (tmp179 & tmp180);
  wire tmp182;
  assign tmp182 = ~pi3;
  wire tmp183;
  assign tmp183 = 1'b1;
  wire tmp184;
  assign tmp184 = 1'b0;
  wire tmp185;
  assign tmp185 = (tmp182 & tmp183) | (tmp182 & tmp184) | (tmp183 & tmp184);
  wire tmp186;
  assign tmp186 = (tmp177 & tmp181) | (tmp177 & tmp185) | (tmp181 & tmp185);
  wire tmp187;
  assign tmp187 = 1'b0;
  wire tmp188;
  assign tmp188 = ~pi3;
  wire tmp189;
  assign tmp189 = 1'b0;
  wire tmp190;
  assign tmp190 = (tmp187 & tmp188) | (tmp187 & tmp189) | (tmp188 & tmp189);
  wire tmp191;
  assign tmp191 = ~pi3;
  wire tmp192;
  assign tmp192 = 1'b1;
  wire tmp193;
  assign tmp193 = 1'b0;
  wire tmp194;
  assign tmp194 = (tmp191 & tmp192) | (tmp191 & tmp193) | (tmp192 & tmp193);
  wire tmp195;
  assign tmp195 = 1'b0;
  wire tmp196;
  assign tmp196 = 1'b0;
  wire tmp197;
  assign tmp197 = 1'b0;
  wire tmp198;
  assign tmp198 = (tmp195 & tmp196) | (tmp195 & tmp197) | (tmp196 & tmp197);
  wire tmp199;
  assign tmp199 = (tmp190 & tmp194) | (tmp190 & tmp198) | (tmp194 & tmp198);
  wire tmp200;
  assign tmp200 = (tmp173 & tmp186) | (tmp173 & tmp199) | (tmp186 & tmp199);
  wire tmp201;
  assign tmp201 = 1'b1;
  wire tmp202;
  assign tmp202 = 1'b0;
  wire tmp203;
  assign tmp203 = 1'b0;
  wire tmp204;
  assign tmp204 = (tmp201 & tmp202) | (tmp201 & tmp203) | (tmp202 & tmp203);
  wire tmp205;
  assign tmp205 = 1'b0;
  wire tmp206;
  assign tmp206 = ~pi3;
  wire tmp207;
  assign tmp207 = 1'b0;
  wire tmp208;
  assign tmp208 = (tmp205 & tmp206) | (tmp205 & tmp207) | (tmp206 & tmp207);
  wire tmp209;
  assign tmp209 = 1'b0;
  wire tmp210;
  assign tmp210 = 1'b0;
  wire tmp211;
  assign tmp211 = 1'b0;
  wire tmp212;
  assign tmp212 = (tmp209 & tmp210) | (tmp209 & tmp211) | (tmp210 & tmp211);
  wire tmp213;
  assign tmp213 = (tmp204 & tmp208) | (tmp204 & tmp212) | (tmp208 & tmp212);
  wire tmp214;
  assign tmp214 = 1'b0;
  wire tmp215;
  assign tmp215 = ~pi3;
  wire tmp216;
  assign tmp216 = 1'b0;
  wire tmp217;
  assign tmp217 = (tmp214 & tmp215) | (tmp214 & tmp216) | (tmp215 & tmp216);
  wire tmp218;
  assign tmp218 = ~pi3;
  wire tmp219;
  assign tmp219 = 1'b1;
  wire tmp220;
  assign tmp220 = 1'b0;
  wire tmp221;
  assign tmp221 = (tmp218 & tmp219) | (tmp218 & tmp220) | (tmp219 & tmp220);
  wire tmp222;
  assign tmp222 = 1'b0;
  wire tmp223;
  assign tmp223 = 1'b0;
  wire tmp224;
  assign tmp224 = 1'b0;
  wire tmp225;
  assign tmp225 = (tmp222 & tmp223) | (tmp222 & tmp224) | (tmp223 & tmp224);
  wire tmp226;
  assign tmp226 = (tmp217 & tmp221) | (tmp217 & tmp225) | (tmp221 & tmp225);
  wire tmp227;
  assign tmp227 = 1'b0;
  wire tmp228;
  assign tmp228 = 1'b0;
  wire tmp229;
  assign tmp229 = 1'b0;
  wire tmp230;
  assign tmp230 = (tmp227 & tmp228) | (tmp227 & tmp229) | (tmp228 & tmp229);
  wire tmp231;
  assign tmp231 = 1'b0;
  wire tmp232;
  assign tmp232 = 1'b0;
  wire tmp233;
  assign tmp233 = 1'b0;
  wire tmp234;
  assign tmp234 = (tmp231 & tmp232) | (tmp231 & tmp233) | (tmp232 & tmp233);
  wire tmp235;
  assign tmp235 = 1'b0;
  wire tmp236;
  assign tmp236 = 1'b0;
  wire tmp237;
  assign tmp237 = 1'b0;
  wire tmp238;
  assign tmp238 = (tmp235 & tmp236) | (tmp235 & tmp237) | (tmp236 & tmp237);
  wire tmp239;
  assign tmp239 = (tmp230 & tmp234) | (tmp230 & tmp238) | (tmp234 & tmp238);
  wire tmp240;
  assign tmp240 = (tmp213 & tmp226) | (tmp213 & tmp239) | (tmp226 & tmp239);
  wire tmp241;
  assign tmp241 = (tmp160 & tmp200) | (tmp160 & tmp240) | (tmp200 & tmp240);
  wire tmp242;
  assign tmp242 = pi1;
  wire tmp243;
  assign tmp243 = 1'b1;
  wire tmp244;
  assign tmp244 = 1'b0;
  wire tmp245;
  assign tmp245 = (tmp242 & tmp243) | (tmp242 & tmp244) | (tmp243 & tmp244);
  wire tmp246;
  assign tmp246 = 1'b1;
  wire tmp247;
  assign tmp247 = 1'b0;
  wire tmp248;
  assign tmp248 = 1'b0;
  wire tmp249;
  assign tmp249 = (tmp246 & tmp247) | (tmp246 & tmp248) | (tmp247 & tmp248);
  wire tmp250;
  assign tmp250 = 1'b0;
  wire tmp251;
  assign tmp251 = 1'b0;
  wire tmp252;
  assign tmp252 = 1'b0;
  wire tmp253;
  assign tmp253 = (tmp250 & tmp251) | (tmp250 & tmp252) | (tmp251 & tmp252);
  wire tmp254;
  assign tmp254 = (tmp245 & tmp249) | (tmp245 & tmp253) | (tmp249 & tmp253);
  wire tmp255;
  assign tmp255 = 1'b1;
  wire tmp256;
  assign tmp256 = 1'b0;
  wire tmp257;
  assign tmp257 = 1'b0;
  wire tmp258;
  assign tmp258 = (tmp255 & tmp256) | (tmp255 & tmp257) | (tmp256 & tmp257);
  wire tmp259;
  assign tmp259 = 1'b0;
  wire tmp260;
  assign tmp260 = ~pi3;
  wire tmp261;
  assign tmp261 = 1'b0;
  wire tmp262;
  assign tmp262 = (tmp259 & tmp260) | (tmp259 & tmp261) | (tmp260 & tmp261);
  wire tmp263;
  assign tmp263 = 1'b0;
  wire tmp264;
  assign tmp264 = 1'b0;
  wire tmp265;
  assign tmp265 = 1'b0;
  wire tmp266;
  assign tmp266 = (tmp263 & tmp264) | (tmp263 & tmp265) | (tmp264 & tmp265);
  wire tmp267;
  assign tmp267 = (tmp258 & tmp262) | (tmp258 & tmp266) | (tmp262 & tmp266);
  wire tmp268;
  assign tmp268 = 1'b0;
  wire tmp269;
  assign tmp269 = 1'b0;
  wire tmp270;
  assign tmp270 = 1'b0;
  wire tmp271;
  assign tmp271 = (tmp268 & tmp269) | (tmp268 & tmp270) | (tmp269 & tmp270);
  wire tmp272;
  assign tmp272 = 1'b0;
  wire tmp273;
  assign tmp273 = 1'b0;
  wire tmp274;
  assign tmp274 = 1'b0;
  wire tmp275;
  assign tmp275 = (tmp272 & tmp273) | (tmp272 & tmp274) | (tmp273 & tmp274);
  wire tmp276;
  assign tmp276 = 1'b0;
  wire tmp277;
  assign tmp277 = 1'b0;
  wire tmp278;
  assign tmp278 = 1'b0;
  wire tmp279;
  assign tmp279 = (tmp276 & tmp277) | (tmp276 & tmp278) | (tmp277 & tmp278);
  wire tmp280;
  assign tmp280 = (tmp271 & tmp275) | (tmp271 & tmp279) | (tmp275 & tmp279);
  wire tmp281;
  assign tmp281 = (tmp254 & tmp267) | (tmp254 & tmp280) | (tmp267 & tmp280);
  wire tmp282;
  assign tmp282 = 1'b1;
  wire tmp283;
  assign tmp283 = 1'b0;
  wire tmp284;
  assign tmp284 = 1'b0;
  wire tmp285;
  assign tmp285 = (tmp282 & tmp283) | (tmp282 & tmp284) | (tmp283 & tmp284);
  wire tmp286;
  assign tmp286 = 1'b0;
  wire tmp287;
  assign tmp287 = ~pi3;
  wire tmp288;
  assign tmp288 = 1'b0;
  wire tmp289;
  assign tmp289 = (tmp286 & tmp287) | (tmp286 & tmp288) | (tmp287 & tmp288);
  wire tmp290;
  assign tmp290 = 1'b0;
  wire tmp291;
  assign tmp291 = 1'b0;
  wire tmp292;
  assign tmp292 = 1'b0;
  wire tmp293;
  assign tmp293 = (tmp290 & tmp291) | (tmp290 & tmp292) | (tmp291 & tmp292);
  wire tmp294;
  assign tmp294 = (tmp285 & tmp289) | (tmp285 & tmp293) | (tmp289 & tmp293);
  wire tmp295;
  assign tmp295 = 1'b0;
  wire tmp296;
  assign tmp296 = ~pi3;
  wire tmp297;
  assign tmp297 = 1'b0;
  wire tmp298;
  assign tmp298 = (tmp295 & tmp296) | (tmp295 & tmp297) | (tmp296 & tmp297);
  wire tmp299;
  assign tmp299 = ~pi3;
  wire tmp300;
  assign tmp300 = 1'b1;
  wire tmp301;
  assign tmp301 = 1'b0;
  wire tmp302;
  assign tmp302 = (tmp299 & tmp300) | (tmp299 & tmp301) | (tmp300 & tmp301);
  wire tmp303;
  assign tmp303 = 1'b0;
  wire tmp304;
  assign tmp304 = 1'b0;
  wire tmp305;
  assign tmp305 = 1'b0;
  wire tmp306;
  assign tmp306 = (tmp303 & tmp304) | (tmp303 & tmp305) | (tmp304 & tmp305);
  wire tmp307;
  assign tmp307 = (tmp298 & tmp302) | (tmp298 & tmp306) | (tmp302 & tmp306);
  wire tmp308;
  assign tmp308 = 1'b0;
  wire tmp309;
  assign tmp309 = 1'b0;
  wire tmp310;
  assign tmp310 = 1'b0;
  wire tmp311;
  assign tmp311 = (tmp308 & tmp309) | (tmp308 & tmp310) | (tmp309 & tmp310);
  wire tmp312;
  assign tmp312 = 1'b0;
  wire tmp313;
  assign tmp313 = 1'b0;
  wire tmp314;
  assign tmp314 = 1'b0;
  wire tmp315;
  assign tmp315 = (tmp312 & tmp313) | (tmp312 & tmp314) | (tmp313 & tmp314);
  wire tmp316;
  assign tmp316 = 1'b0;
  wire tmp317;
  assign tmp317 = 1'b0;
  wire tmp318;
  assign tmp318 = 1'b0;
  wire tmp319;
  assign tmp319 = (tmp316 & tmp317) | (tmp316 & tmp318) | (tmp317 & tmp318);
  wire tmp320;
  assign tmp320 = (tmp311 & tmp315) | (tmp311 & tmp319) | (tmp315 & tmp319);
  wire tmp321;
  assign tmp321 = (tmp294 & tmp307) | (tmp294 & tmp320) | (tmp307 & tmp320);
  wire tmp322;
  assign tmp322 = 1'b0;
  wire tmp323;
  assign tmp323 = 1'b0;
  wire tmp324;
  assign tmp324 = 1'b0;
  wire tmp325;
  assign tmp325 = (tmp322 & tmp323) | (tmp322 & tmp324) | (tmp323 & tmp324);
  wire tmp326;
  assign tmp326 = 1'b0;
  wire tmp327;
  assign tmp327 = 1'b0;
  wire tmp328;
  assign tmp328 = 1'b0;
  wire tmp329;
  assign tmp329 = (tmp326 & tmp327) | (tmp326 & tmp328) | (tmp327 & tmp328);
  wire tmp330;
  assign tmp330 = 1'b0;
  wire tmp331;
  assign tmp331 = 1'b0;
  wire tmp332;
  assign tmp332 = 1'b0;
  wire tmp333;
  assign tmp333 = (tmp330 & tmp331) | (tmp330 & tmp332) | (tmp331 & tmp332);
  wire tmp334;
  assign tmp334 = (tmp325 & tmp329) | (tmp325 & tmp333) | (tmp329 & tmp333);
  wire tmp335;
  assign tmp335 = 1'b0;
  wire tmp336;
  assign tmp336 = 1'b0;
  wire tmp337;
  assign tmp337 = 1'b0;
  wire tmp338;
  assign tmp338 = (tmp335 & tmp336) | (tmp335 & tmp337) | (tmp336 & tmp337);
  wire tmp339;
  assign tmp339 = 1'b0;
  wire tmp340;
  assign tmp340 = 1'b0;
  wire tmp341;
  assign tmp341 = 1'b0;
  wire tmp342;
  assign tmp342 = (tmp339 & tmp340) | (tmp339 & tmp341) | (tmp340 & tmp341);
  wire tmp343;
  assign tmp343 = 1'b0;
  wire tmp344;
  assign tmp344 = 1'b0;
  wire tmp345;
  assign tmp345 = 1'b0;
  wire tmp346;
  assign tmp346 = (tmp343 & tmp344) | (tmp343 & tmp345) | (tmp344 & tmp345);
  wire tmp347;
  assign tmp347 = (tmp338 & tmp342) | (tmp338 & tmp346) | (tmp342 & tmp346);
  wire tmp348;
  assign tmp348 = 1'b0;
  wire tmp349;
  assign tmp349 = 1'b0;
  wire tmp350;
  assign tmp350 = 1'b0;
  wire tmp351;
  assign tmp351 = (tmp348 & tmp349) | (tmp348 & tmp350) | (tmp349 & tmp350);
  wire tmp352;
  assign tmp352 = 1'b0;
  wire tmp353;
  assign tmp353 = 1'b0;
  wire tmp354;
  assign tmp354 = 1'b0;
  wire tmp355;
  assign tmp355 = (tmp352 & tmp353) | (tmp352 & tmp354) | (tmp353 & tmp354);
  wire tmp356;
  assign tmp356 = 1'b0;
  wire tmp357;
  assign tmp357 = 1'b0;
  wire tmp358;
  assign tmp358 = 1'b0;
  wire tmp359;
  assign tmp359 = (tmp356 & tmp357) | (tmp356 & tmp358) | (tmp357 & tmp358);
  wire tmp360;
  assign tmp360 = (tmp351 & tmp355) | (tmp351 & tmp359) | (tmp355 & tmp359);
  wire tmp361;
  assign tmp361 = (tmp334 & tmp347) | (tmp334 & tmp360) | (tmp347 & tmp360);
  wire tmp362;
  assign tmp362 = (tmp281 & tmp321) | (tmp281 & tmp361) | (tmp321 & tmp361);
  wire tmp363;
  assign tmp363 = (tmp120 & tmp241) | (tmp120 & tmp362) | (tmp241 & tmp362);
  assign po0 = tmp363;
endmodule // test_6
