/* Verilog for cell 'FTC{sch}' from library 'wordlib8' */
/* Created on Sun Nov 03, 2013 18:07:48 */
/* Last revised on Sun Nov 03, 2013 19:29:01 */
/* Written on Sun Nov 03, 2013 19:33:51 by Electric VLSI Design System, version 8.06 */

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

module FTC(Cin, I1, I2, I3, I4, C, Cout, S);
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
endmodule   /* FTC */
