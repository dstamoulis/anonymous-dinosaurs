
module testbenchFTCfunct();
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