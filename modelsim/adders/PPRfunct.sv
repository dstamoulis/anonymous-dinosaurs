
module testbenchPPRfunct();
  logic clk;
  logic [8:0] PP0,PP1,PP2,PP3;
  logic Sign0;
  logic Sign1;
  logic Sign2;
  logic C0;
  logic C1;
  logic C10;
  logic C11;
  logic C12;
  logic C2;
  logic C3;
  logic C4;
  logic C5;
  logic C6;
  logic C7;
  logic C8;
  logic C9;
  logic S0;
  logic S1;
  logic S10;
  logic S11;
  logic S12;
  logic S2;
  logic S3;
  logic S4;
  logic S5;
  logic S6;
  logic S7;
  logic S8;
  logic S9;
    
    logic [9:0] vectors[1023:0], currentvec;
    logic [11:0] vectornum, errors;
    integer outC;
    
    // The device under test
    functPPR dut(PP0, PP1, PP2, PP3, Sign0, Sign1, Sign2, C0, C1, C10, C11, C12, C2, 
      C3, C4, C5, C6, C7, C8, C9, S0, S1, S10, S11, S12, S2, S3, S4, S5, S6, 
      S7, S8, S9);
    
    // read test vector file and initialize test
    initial begin
       $readmemb("lakis.txt", vectors);
       outC = $fopen("checkOUT.txt","w");
       vectornum = 0; errors = 0;
    end
    // generate a clock to sequence tests
    always begin
       clk = 1; #10; clk = 0; #10;
    end
      
    // apply test
    always @(posedge clk) begin
       currentvec = vectors[vectornum];
       $display("%h%h%h%h%h%h%h%h%h%h", 
       currentvec[9], 
       currentvec[8] ,
       currentvec[7] ,
       currentvec[6] ,
       currentvec[5] ,
       currentvec[4] ,
       currentvec[3] ,
       currentvec[2] ,
       currentvec[1] ,
       currentvec[0] );
       // 3
       PP3[8] = 0;
       PP3[6] = 0;
       PP3[4] = 1;
       PP3[2] = 0;
       PP3[0] = 0;
       PP3[1] = 1;
       PP3[3] = 0;
       PP3[5] = 0;
       PP3[7] = 0;
       
       // 2
       Sign2= 1;
       PP2[8] = 0;
       PP2[6] = currentvec[9];
       PP2[4] = currentvec[8];
       PP2[2] = currentvec[7];
       PP2[0] = currentvec[6];
       PP2[1] = 1;
       PP2[3] = 1;
       PP2[5] = 1;
       PP2[7] = 1;
       // 1
       Sign1 = 0;
       PP1[8] = 0;
       PP1[6] = 0;
       PP1[4] = 1;
       PP1[2] = 0;
       PP1[0] = 0;
       PP1[1] = 1;
       PP1[3] = 0;
       PP1[5] = 0;
       PP1[7] = 0;
       // 0
       Sign0 = currentvec[5];
       PP0[8] = currentvec[4];
       PP0[6] = currentvec[3];
       PP0[4] = currentvec[2];
       PP0[2] = currentvec[1];
       PP0[0] = currentvec[0];
       PP0[1] = 0;
       PP0[3] = 0;
       PP0[5] = 0;
       PP0[7] = 1;
           
       
       if (vectornum === 1023) begin
         $display("Completed %d tests with %d errors.", 
                  vectornum, errors);
                  $fclose(outC);   
         $stop;
       end
    end
    
    // check if test was sucessful and apply next one
    always @(negedge clk) begin
       $fwrite(outC, "%h%h%h%h%h%h%h%h%h%h%h%h%h%h%h%h%h%h%h%h%h%h%h%h%h%h\n", 
      C0, C1, C10, C11, C12, C2, 
      C3, C4, C5, C6, C7, C8, C9, S0, S1, S10, S11, S12, S2, S3, S4, S5, S6, 
      S7, S8, S9);
       vectornum = vectornum + 1;
    end
endmodule


module functPPR(PP0, PP1, PP2, PP3, Sign0, Sign1, Sign2, C0, C1, C10, C11, C12, C2, 
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
  
  logic Cout0;
  logic Cout1;
  logic Cout2;
  logic Cout3;
  logic Cout4;
  logic Cout5;
  logic Cout6;
  logic Cout7;
  logic Cout8;
  logic Cout9;
  logic Cout10;
  logic Cout11;
  logic Cout12;

  supply0 zero;

FTCfunct FCT0(zero, PP0[2], PP1[0], zero, zero, C0, Cout0, S0);
FTCfunct FCT1(Cout0, PP0[3], PP1[1], zero, zero, C1, Cout1, S1);
FTCfunct FCT2(Cout1, PP0[4], PP1[2], PP2[0], zero, C2, Cout2, S2);
FTCfunct FCT3(Cout2, PP0[5], PP1[3], PP2[1], zero, C3, Cout3, S3);
FTCfunct FCT4(Cout3, PP0[6], PP1[4], PP2[2], PP3[0], C4, Cout4, S4);
FTCfunct FCT5(Cout4, PP0[7], PP1[5], PP2[3], PP3[1], C5, Cout5, S5);
FTCfunct FCT6(Cout5, PP0[8], PP1[6], PP2[4], PP3[2], C6, Cout6, S6);
FTCfunct FCT7(Cout6, Sign0, PP1[7], PP2[5], PP3[3], C7, Cout7, S7);
FTCfunct FCT8(Cout7, Sign0, PP1[8], PP2[6], PP3[4], C8, Cout8, S8);
FTCfunct FCT9(Cout8, Sign0, Sign1, PP2[7], PP3[5], C9, Cout9, S9);
FTCfunct FCT10(Cout9, Sign0, Sign1, PP2[8], PP3[6], C10, Cout10, S10);
FTCfunct FCT11(Cout10, Sign0, Sign1, Sign2, PP3[7], C11, Cout11, S11);
FTCfunct FCT12(Cout11, Sign0, Sign1, Sign2, PP3[8], C12, Cout12, S12);

endmodule


module FTCfunct(Cin, I1, I2, I3, I4, C, Cout, S);
  input Cin;
  input I1;
  input I2;
  input I3;
  input I4;
  output C;
  output Cout;
  output S;

 assign S = Cin ^ I1 ^ I2 ^ I3 ^ I4;
 assign C = ((I1 ^ I2 ^ I3) & I4) | ((I1 ^ I2 ^ I3) & Cin) | (I4 & Cin);
 assign Cout = (I1 & I2) | (I1 & I3) | (I2 & I3);
 
endmodule   /* FTC */




