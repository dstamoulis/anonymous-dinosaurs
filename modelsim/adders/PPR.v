/* Verilog for cell 'PPR{sch}' from library 'wordlib8' */
/* Created on Sun Nov 03, 2013 19:07:25 */
/* Last revised on Sun Nov 03, 2013 21:35:17 */
/* Written on Sun Nov 03, 2013 21:35:28 by Electric VLSI Design System, version 8.06 */

module muddlib07__fulladder(a, b, c, cout, s);
  input a;
  input b;
  input c;
  output cout;
  output s;

  supply1 vdd;
  supply0 gnd;
  wire coutb, net_1, net_11, net_111, net_23, net_32, net_33, net_90, net_92;
  wire net_94, net_95, sb;

  tranif1 nmos_0(gnd, net_1, a);
  tranif1 nmos_1(gnd, net_1, b);
  tranif1 nmos_2(net_1, coutb, c);
  tranif1 nmos_3(gnd, net_11, a);
  tranif1 nmos_4(net_11, coutb, b);
  tranif1 nmos_5(gnd, net_23, a);
  tranif1 nmos_6(gnd, net_23, b);
  tranif1 nmos_7(gnd, net_23, c);
  tranif1 nmos_8(net_23, sb, coutb);
  tranif1 nmos_9(gnd, net_33, a);
  tranif1 nmos_10(net_33, net_32, b);
  tranif1 nmos_11(net_32, sb, c);
  tranif1 nmos_12(gnd, cout, coutb);
  tranif1 nmos_13(gnd, s, sb);
  tranif0 pmos_1(sb, net_92, c);
  tranif0 pmos_2(net_92, net_90, b);
  tranif0 pmos_3(net_90, vdd, a);
  tranif0 pmos_4(sb, net_94, coutb);
  tranif0 pmos_5(net_94, vdd, b);
  tranif0 pmos_6(net_94, vdd, c);
  tranif0 pmos_7(net_94, vdd, a);
  tranif0 pmos_8(cout, vdd, coutb);
  tranif0 pmos_9(net_95, vdd, a);
  tranif0 pmos_10(coutb, net_95, b);
  tranif0 pmos_11(net_111, vdd, a);
  tranif0 pmos_12(net_111, vdd, b);
  tranif0 pmos_13(coutb, net_111, c);
  tranif0 pmos_14(s, vdd, sb);
endmodule   /* muddlib07__fulladder */

module muddlib07__inv_1x(a, y);
  input a;
  output y;

  supply1 vdd;
  supply0 gnd;
  tranif1 nmos_0(gnd, y, a);
  tranif0 pmos_0(y, vdd, a);
endmodule   /* muddlib07__inv_1x */

module muddlib07__nand2_1x(a, b, y);
  input a;
  input b;
  output y;

  supply1 vdd;
  supply0 gnd;
  wire net_5;

  tranif1 nmos_0(net_5, y, b);
  tranif1 nmos_1(gnd, net_5, a);
  tranif0 pmos_0(y, vdd, b);
  tranif0 pmos_1(y, vdd, a);
endmodule   /* muddlib07__nand2_1x */

module muddlib07__xnor_ds(A, B, Y);
  input A;
  input B;
  output Y;

  supply1 vdd;
  supply0 gnd;
  wire net_0, net_1, net_11, net_28;

  tranif1 nmos_0(net_0, net_1, A);
  tranif1 nmos_1(gnd, net_0, B);
  tranif1 nmos_4(net_11, Y, A);
  tranif1 nmos_5(net_11, Y, B);
  tranif1 nmos_6(gnd, net_11, net_1);
  tranif0 pmos_0(net_1, vdd, A);
  tranif0 pmos_1(net_1, vdd, B);
  tranif0 pmos_2(Y, vdd, net_1);
  tranif0 pmos_3(net_28, vdd, B);
  tranif0 pmos_4(Y, net_28, A);
endmodule   /* muddlib07__xnor_ds */

module wordlib8__FTC(Cin, I1, I2, I3, I4, C, Cout, S);
  input Cin;
  input I1;
  input I2;
  input I3;
  input I4;
  output C;
  output Cout;
  output S;

  supply1 vdd;
  supply0 gnd;
  wire net_10, net_13, net_2, net_5, net_9;

  muddlib07__fulladder fulladde_0(.a(I2), .b(I1), .c(I3), .cout(Cout), 
      .s(net_2));
  muddlib07__inv_1x inv_1x_0(.a(net_5), .y(net_9));
  muddlib07__nand2_1x nand2_1x_0(.a(Cin), .b(I4), .y(net_13));
  muddlib07__nand2_1x nand2_1x_2(.a(net_2), .b(net_9), .y(net_10));
  muddlib07__nand2_1x nand2_1x_3(.a(net_10), .b(net_13), .y(C));
  muddlib07__xnor_ds xnor_ds_0(.A(Cin), .B(I4), .Y(net_5));
  muddlib07__xnor_ds xnor_ds_1(.A(net_5), .B(net_2), .Y(S));
endmodule   /* wordlib8__FTC */

module PPR(PP0, PP1, PP2, PP3, Sign0, Sign1, Sign2, C0, C1, C10, C11, C12, C2, 
      C3, C4, C5, C6, C7, C8, C9, S0, S1, S10, S11, S12, S2, S3, S4, S5, S6, 
      S7, S8, S9);
  input [8:0] PP0;
  input [8:0] PP1;
  input [8:0] PP2;
  input [8:0] PP3;
  input Sign0;
  input Sign1;
  input Sign2;
  output C0;
  output C1;
  output C10;
  output C11;
  output C12;
  output C2;
  output C3;
  output C4;
  output C5;
  output C6;
  output C7;
  output C8;
  output C9;
  output S0;
  output S1;
  output S10;
  output S11;
  output S12;
  output S2;
  output S3;
  output S4;
  output S5;
  output S6;
  output S7;
  output S8;
  output S9;

  supply1 vdd;
  supply0 gnd;
  wire FTC_19_Cout, net_202, net_214, net_221, net_226, net_239, net_244;
  wire net_253, net_262, net_271, net_284, net_364, net_366;

  wordlib8__FTC FTC_3(.Cin(gnd), .I1(PP0[2]), .I2(PP1[0]), .I3(gnd), .I4(gnd), 
      .C(C0), .Cout(net_364), .S(S0));
  wordlib8__FTC FTC_6(.Cin(net_364), .I1(PP0[3]), .I2(PP1[1]), .I3(gnd), 
      .I4(gnd), .C(C1), .Cout(net_366), .S(S1));
  wordlib8__FTC FTC_8(.Cin(net_366), .I1(PP0[4]), .I2(PP1[2]), .I3(PP2[0]), 
      .I4(gnd), .C(C2), .Cout(net_202), .S(S2));
  wordlib8__FTC FTC_9(.Cin(net_202), .I1(PP0[5]), .I2(PP1[3]), .I3(PP2[1]), 
      .I4(gnd), .C(C3), .Cout(net_214), .S(S3));
  wordlib8__FTC FTC_10(.Cin(net_214), .I1(PP0[6]), .I2(PP1[4]), .I3(PP2[2]), 
      .I4(PP3[0]), .C(C4), .Cout(net_221), .S(S4));
  wordlib8__FTC FTC_11(.Cin(net_221), .I1(PP0[7]), .I2(PP1[5]), .I3(PP2[3]), 
      .I4(PP3[1]), .C(C5), .Cout(net_226), .S(S5));
  wordlib8__FTC FTC_12(.Cin(net_226), .I1(PP0[8]), .I2(PP1[6]), .I3(PP2[4]), 
      .I4(PP3[2]), .C(C6), .Cout(net_239), .S(S6));
  wordlib8__FTC FTC_13(.Cin(net_239), .I1(Sign0), .I2(PP1[7]), .I3(PP2[5]), 
      .I4(PP3[3]), .C(C7), .Cout(net_244), .S(S7));
  wordlib8__FTC FTC_14(.Cin(net_244), .I1(Sign0), .I2(PP1[8]), .I3(PP2[6]), 
      .I4(PP3[4]), .C(C8), .Cout(net_253), .S(S8));
  wordlib8__FTC FTC_15(.Cin(net_253), .I1(Sign0), .I2(Sign1), .I3(PP2[7]), 
      .I4(PP3[5]), .C(C9), .Cout(net_262), .S(S9));
  wordlib8__FTC FTC_17(.Cin(net_262), .I1(Sign0), .I2(Sign1), .I3(PP2[8]), 
      .I4(PP3[6]), .C(C10), .Cout(net_271), .S(S10));
  wordlib8__FTC FTC_18(.Cin(net_271), .I1(Sign0), .I2(Sign1), .I3(Sign2), 
      .I4(PP3[7]), .C(C11), .Cout(net_284), .S(S11));
  wordlib8__FTC FTC_19(.Cin(net_284), .I1(Sign0), .I2(Sign1), .I3(Sign2), 
      .I4(PP3[8]), .C(C12), .Cout(FTC_19_Cout), .S(S12));
endmodule   /* PPR */
