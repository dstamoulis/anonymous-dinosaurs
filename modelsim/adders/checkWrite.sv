

module testbenchCHECK();
   logic clk;
    logic Cin, I1, I2, I3, I4, C, Cout, S;
    logic [4:0] vectors[31:0], currentvec;
    logic [6:0] vectornum, errors;
    integer outC;
    
    // The device under test
    FTC dut(Cin, I1, I2, I3, I4, C, Cout, S);
    
    // read test vector file and initialize test
    initial begin
       $readmemb("input-vectors.txt", vectors);
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
       Cin = currentvec[4];
       I1 = currentvec[3];
       I2 = currentvec[2];
       I3 = currentvec[1];
       I4 = currentvec[0];
       
       
       if (vectornum === 32) begin
         $display("Completed %d tests with %d errors.", 
                  vectornum, errors);
         $fclose(outC);         
         $stop;
       end
    end
    
    // check if test was sucessful and apply next one
    always @(negedge clk) begin
         $fwrite(outC, "%h%h%h%h%h%h%h%h\n", Cin, I1, I2, I3, I4, C, Cout, S);
      vectornum = vectornum + 1;
    end

endmodule




module FTC(Cin, I1, I2, I3, I4, C, Cout, S);
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
