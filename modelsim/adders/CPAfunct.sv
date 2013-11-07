module testbenchCPAfunct();
 
  logic a0;
  logic a1;
  logic a10;
  logic a11;
  logic a12;
  logic a2;
  logic a3;
  logic a4;
  logic a5;
  logic a6;
  logic a7;
  logic a8;
  logic a9;
  logic b0;
  logic b1;
  logic b10;
  logic b11;
  logic b12;
  logic b2;
  logic b3;
  logic b4;
  logic b5;
  logic b6;
  logic b7;
  logic b8;
  logic b9;
  logic cout;
  logic overflow;
  logic s0;
  logic s1;
  logic s10;
  logic s11;
  logic s12;
  logic s2;
  logic s3;
  logic s4;
  logic s5;
  logic s6;
  logic s7;
  logic s8;
  logic s9;
  
    logic clk;
    logic [9:0] vectors[1023:0], currentvec;
    logic [11:0] vectornum, errors;
    integer outC;
    
    // The device under test
    functCPA dut(a0, a1, a10, a11, a12, a2, a3, a4, a5, a6, a7, a8, a9, b0, b1, b10, 
      b11, b12, b2, b3, b4, b5, b6, b7, b8, b9, cout, overflow, s0, s1, s10, 
      s11, s12, s2, s3, s4, s5, s6, s7, s8, s9);
    
    // read test vector file and initialize test
    initial begin
       $readmemb("lakis.txt", vectors);
       outC = $fopen("CPAcheckOUT.txt","w");
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
       
       a0 = currentvec[9];
       a1 = 0;
       a10 = currentvec[8];
       a11 = 1;
       a12 = currentvec[7];
       a2 = currentvec[6];
       a3 = 1;
       a4 = 1;
       a5 = 0;
       a6 = 1;
       a7 = currentvec[5];
       a8 = 1;
       a9 = 1;
       b0 = currentvec[4];
       b1 = currentvec[3];
       b10 = 1;
       b11 = 1;
       b12 = 1;
       b2 = currentvec[1];
       b3 = 0;
       b4 = currentvec[0];
       b5 = 0;
       b6 = 0;
       b7 = 0;
       b8 = currentvec[2];
       b9 = 1;
       
       
       
       if (vectornum === 1023) begin
         $display("Completed %d tests with %d errors.", 
                  vectornum, errors);
                  $fclose(outC);   
         $stop;
       end
    end
    
    // check if test was sucessful and apply next one
    always @(negedge clk) begin
       $fwrite(outC, "%h%h%h%h%h%h%h%h%h%h%h%h%h%h%h\n", 
       cout, overflow, s0, s1, s10, 
      s11, s12, s2, s3, s4, s5, s6, s7, s8, s9);
       vectornum = vectornum + 1;
    end
endmodule


module functCPA(a0, a1, a10, a11, a12, a2, a3, a4, a5, a6, a7, a8, a9, b0, b1, b10, 
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


HAfunct HA0(a0, b0, s0, Cout0);
FAfunct FA0(Cout1, s1, a1, b1, Cout0 );
FAfunct FA1(Cout2, s2, a2, b2, Cout1 );
FAfunct FA2(Cout3, s3, a3, b3, Cout2 );
FAfunct FA3(Cout4, s4, a4, b4, Cout3 );
FAfunct FA4(Cout5, s5, a5, b5, Cout4 );
FAfunct FA5(Cout6, s6, a6, b6, Cout5 );
FAfunct FA6(Cout7, s7, a7, b7, Cout6 );
FAfunct FA7(Cout8, s8, a8, b8, Cout7 );
FAfunct FA8(Cout9, s9, a9, b9, Cout8 );
FAfunct FA9(Cout10, s10, a10, b10, Cout9 );
FAfunct FA10(Cout11, s11, a11, b11, Cout10 );
FAfunct FA11(Cout12, s12, a12, b12, Cout11);

assign overflow = (Cout12 ^ Cout11);
assign cout = Cout12;

endmodule


module FAfunct (co, s, a, b, c);
input a, b ,c ;
output co, s ;
xor (n1, a, b) ;
xor (s, n1, c) ;
nand (n2, a, b) ;
nand (n3,n1, c) ;
nand (co, n3,n2) ;
endmodule


module HAfunct(a, b, sum, carry);

input a;
input b;
output sum;
output carry;
assign carry=a&b;                           
assign sum=a^b;         
                    
endmodule

