
module testbench();
   logic clk;
    logic Cin, I1, I2, I3, I4, C, Cout, S;
    logic [7:0] vectors[31:0], currentvec;
    logic [6:0] vectornum, errors;
    

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
       C = currentvec[2];
       Cout = currentvec[1];
       S = currentvec[0];
       
       
       if (vectornum === 31) begin
         $display("Completed %d tests with %d errors.", 
                  vectornum, errors);
         $stop;
       end
    end
    
    // check if test was sucessful and apply next one
    always @(negedge clk) begin
         $display("%h%h%h%h%h%h%h%h", Cin, I1, I2, I3, I4, C, Cout, S);
      vectornum = vectornum + 1;
    end

endmodule

