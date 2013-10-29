/* Verilog for cell 'FTC{sch}' from library 'wordlib8' */
/* Created on Fri Oct 25, 2013 21:56:14 */
/* Last revised on Fri Oct 25, 2013 22:27:32 */
/* Written on Tue Oct 29, 2013 15:50:09 by Electric VLSI Design System, version 8.06 */

module muddlib07__a2o1_1x(a, b, c, y);
  input a;
  input b;
  input c;
  output y;

  supply1 vdd;
  supply0 gnd;
  wire net_0, net_11, net_19;

  tranif1 nmos_0(gnd, net_19, a);
  tranif1 nmos_1(net_19, net_0, b);
  tranif1 nmos_2(gnd, net_0, c);
  tranif1 nmos_3(gnd, y, net_0);
  tranif0 pmos_0(net_0, net_11, c);
  tranif0 pmos_1(net_11, vdd, b);
  tranif0 pmos_2(net_11, vdd, a);
  tranif0 pmos_3(y, vdd, net_0);
endmodule   /* muddlib07__a2o1_1x */

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

module muddlib07__o2a1i_1x(a, b, c, y);
  input a;
  input b;
  input c;
  output y;

  supply1 vdd;
  supply0 gnd;
  wire net_35, net_7;

  tranif1 nmos_0(gnd, net_7, a);
  tranif1 nmos_1(gnd, net_7, b);
  tranif1 nmos_2(net_7, y, c);
  tranif0 pmos_0(y, net_35, b);
  tranif0 pmos_1(net_35, vdd, a);
  tranif0 pmos_3(y, vdd, c);
endmodule   /* muddlib07__o2a1i_1x */

module muddlib07__o22a2i_1x(a, b, c, d, y);
  input a;
  input b;
  input c;
  input d;
  output y;

  supply1 vdd;
  supply0 gnd;
  wire net_34, net_35, net_7;

  tranif1 nmos_0(gnd, net_7, a);
  tranif1 nmos_1(gnd, net_7, b);
  tranif1 nmos_2(net_7, y, c);
  tranif1 nmos_3(net_7, y, d);
  tranif0 pmos_0(y, net_35, b);
  tranif0 pmos_1(net_35, vdd, a);
  tranif0 pmos_2(y, net_34, d);
  tranif0 pmos_3(net_34, vdd, c);
endmodule   /* muddlib07__o22a2i_1x */

module muddlib07__xor2_2x(a, b, y);
  input a;
  input b;
  output y;

  supply1 vdd;
  supply0 gnd;
  wire ab, bb, net_3, net_4, net_5, net_7, net_8;

  tranif1 nmos_0(gnd, net_3, a);
  tranif1 nmos_1(gnd, net_4, ab);
  tranif1 nmos_2(net_3, net_5, bb);
  tranif1 nmos_3(net_4, net_5, b);
  tranif1 nmos_4(gnd, bb, b);
  tranif1 nmos_5(gnd, ab, a);
  tranif1 nmos_6(gnd, y, net_5);
  tranif0 pmos_0(net_5, net_7, b);
  tranif0 pmos_1(net_7, vdd, a);
  tranif0 pmos_2(net_5, net_8, bb);
  tranif0 pmos_3(net_8, vdd, ab);
  tranif0 pmos_4(bb, vdd, b);
  tranif0 pmos_5(ab, vdd, a);
  tranif0 pmos_6(y, vdd, net_5);
endmodule   /* muddlib07__xor2_2x */

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
  wire net_2, net_35, net_37, net_4, net_49, net_56;

  muddlib07__a2o1_1x a2o1_1x_0(.a(net_49), .b(Cin), .c(net_56), .y(C));
  muddlib07__nand2_1x nand2_1x_0(.a(I1), .b(I2), .y(net_4));
  muddlib07__nand2_1x nand2_1x_1(.a(I3), .b(I4), .y(net_2));
  muddlib07__nand2_1x nand2_1x_2(.a(net_4), .b(net_2), .y(Cout));
  muddlib07__o2a1i_1x o2a1i_1x_0(.a(I4), .b(I3), .c(net_2), .y(net_37));
  muddlib07__o2a1i_1x o2a1i_1x_1(.a(I2), .b(I1), .c(net_4), .y(net_35));
  muddlib07__o22a2i_1x o22a2i_1_0(.a(net_2), .b(net_4), .c(net_35), .d(net_37), 
      .y(net_56));
  muddlib07__xor2_2x xor2_2x_0(.a(net_37), .b(net_35), .y(net_49));
  muddlib07__xor2_2x xor2_2x_1(.a(net_49), .b(Cin), .y(S));
endmodule   /* FTC */
