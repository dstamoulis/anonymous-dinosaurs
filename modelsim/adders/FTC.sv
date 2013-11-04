
module testbenchFTC();
    logic clk;
    logic Cin, I1, I2, I3, I4, C, Cout, S;
    logic [7:0] vectors[31:0], currentvec;
    logic [6:0] vectornum, errors;
    
    // The device under test
    FTC dut(Cin, I1, I2, I3, I4, C, Cout, S);
    
    // read test vector file and initialize test
    initial begin
       $readmemb("FTC-vectors.txt", vectors);
       vectornum = 0; errors = 0;
    end
    // generate a clock to sequence tests
    always begin
       clk = 1; #10; clk = 0; #10;
    end
    // apply test
    always @(posedge clk) begin
       currentvec = vectors[vectornum];
       Cin = currentvec[7];
       I1 = currentvec[6];
       I2 = currentvec[5];
       I3 = currentvec[4];
       I4 = currentvec[3];
       
       if (vectornum === 31) begin
         $display("Completed %d tests with %d errors.", 
                  vectornum, errors);
         $stop;
       end
    end
    
    // check if test was sucessful and apply next one
    always @(negedge clk) begin
       if ((S !== currentvec[0]) || (Cout !== currentvec[1]) || ( C !== currentvec[2])) begin
          $display("Error: inputs were Cin=%h I1=%h I2=%h I3=%h I4=%h", Cin, I1, I2, I3, I4);
          $display("Check C : %h (%h expected), Cout %h (%h expected), 
          S %h (%h expected)", C , currentvec[2], Cout, currentvec[1], S, currentvec[0]);
          errors = errors + 1;
       end
       vectornum = vectornum + 1;
    end
endmodule




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



