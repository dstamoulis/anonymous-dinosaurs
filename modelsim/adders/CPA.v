/* Verilog for cell 'CPA{sch}' from library 'wordlib8' */
/* Created on Tue Oct 29, 2013 21:14:41 */
/* Last revised on Wed Oct 30, 2013 16:29:53 */
/* Written on Mon Nov 04, 2013 19:07:39 by Electric VLSI Design System, version 8.06 */

module muddlib07__and2_1x(a, b, y);
  input a;
  input b;
  output y;

  supply1 vdd;
  supply0 gnd;
  wire net_1, net_2;

  tranif1 nmos_0(net_1, net_2, b);
  tranif1 nmos_1(gnd, net_1, a);
  tranif1 nmos_2(gnd, y, net_2);
  tranif0 pmos_0(net_2, vdd, b);
  tranif0 pmos_1(net_2, vdd, a);
  tranif0 pmos_2(y, vdd, net_2);
endmodule   /* muddlib07__and2_1x */

module muddlib07__xor2_1x(a, b, y);
  input a;
  input b;
  output y;

  supply1 vdd;
  supply0 gnd;
  wire ab, bb, net_3, net_4, net_7, net_8;

  tranif1 nmos_0(gnd, net_3, a);
  tranif1 nmos_1(gnd, net_4, ab);
  tranif1 nmos_2(net_3, y, b);
  tranif1 nmos_3(net_4, y, bb);
  tranif1 nmos_4(gnd, bb, b);
  tranif1 nmos_5(gnd, ab, a);
  tranif0 pmos_0(y, net_7, b);
  tranif0 pmos_1(net_7, vdd, ab);
  tranif0 pmos_2(y, net_8, bb);
  tranif0 pmos_3(net_8, vdd, a);
  tranif0 pmos_4(bb, vdd, b);
  tranif0 pmos_5(ab, vdd, a);
endmodule   /* muddlib07__xor2_1x */

module wordlib8__HalfAdder(a, b, Cout, s);
  input a;
  input b;
  output Cout;
  output s;

  supply1 vdd;
  supply0 gnd;
  muddlib07__and2_1x and2_1x_0(.a(a), .b(b), .y(Cout));
  muddlib07__xor2_1x xor2_1x_0(.a(a), .b(b), .y(s));
endmodule   /* wordlib8__HalfAdder */

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

module CPA(a0, a1, a10, a11, a12, a2, a3, a4, a5, a6, a7, a8, a9, b0, b1, b10, 
      b11, b12, b2, b3, b4, b5, b6, b7, b8, b9, cout, overflow, s0, s1, s10, 
      s11, s12, s2, s3, s4, s5, s6, s7, s8, s9);
      
  input a0;
  input a1;
  input a10;
  input a11;
  input a12;
  input a2;
  input a3;
  input a4;
  input a5;
  input a6;
  input a7;
  input a8;
  input a9;
  input b0;
  input b1;
  input b10;
  input b11;
  input b12;
  input b2;
  input b3;
  input b4;
  input b5;
  input b6;
  input b7;
  input b8;
  input b9;
  output cout;
  output overflow;
  output s0;
  output s1;
  output s10;
  output s11;
  output s12;
  output s2;
  output s3;
  output s4;
  output s5;
  output s6;
  output s7;
  output s8;
  output s9;

  supply1 vdd;
  supply0 gnd;
  wire net_0, net_1, net_10, net_11, net_2, net_3, net_4, net_5, net_6, net_7;
  wire net_8, net_9;

  wordlib8__HalfAdder HalfAdde_0(.a(a0), .b(b0), .Cout(net_0), .s(s0));
  muddlib07__fulladder fulladde_0(.a(a1), .b(b1), .c(net_0), .cout(net_1), 
      .s(s1));
  muddlib07__fulladder fulladde_1(.a(a2), .b(b2), .c(net_1), .cout(net_2), 
      .s(s2));
  muddlib07__fulladder fulladde_2(.a(a3), .b(b3), .c(net_2), .cout(net_3), 
      .s(s3));
  muddlib07__fulladder fulladde_3(.a(a4), .b(b4), .c(net_3), .cout(net_4), 
      .s(s4));
  muddlib07__fulladder fulladde_4(.a(a5), .b(b5), .c(net_4), .cout(net_5), 
      .s(s5));
  muddlib07__fulladder fulladde_5(.a(a6), .b(b6), .c(net_5), .cout(net_6), 
      .s(s6));
  muddlib07__fulladder fulladde_6(.a(a7), .b(b7), .c(net_6), .cout(net_7), 
      .s(s7));
  muddlib07__fulladder fulladde_7(.a(a8), .b(b8), .c(net_7), .cout(net_8), 
      .s(s8));
  muddlib07__fulladder fulladde_8(.a(a9), .b(b9), .c(net_8), .cout(net_9), 
      .s(s9));
  muddlib07__fulladder fulladde_9(.a(a10), .b(b10), .c(net_9), .cout(net_10), 
      .s(s10));
  muddlib07__fulladder fulladde_10(.a(a11), .b(b11), .c(net_10), .cout(net_11), 
      .s(s11));
  muddlib07__fulladder fulladde_11(.a(a12), .b(b12), .c(net_11), .cout(cout), 
      .s(s12));
  muddlib07__xor2_1x xor2_1x_0(.a(net_11), .b(cout), .y(overflow));
endmodule   /* CPA */
