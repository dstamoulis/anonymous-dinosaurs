module testbenchXNOR();
    logic clk;
    logic A, B, Y;
    logic [2:0] vectors[4:0], currentvec;
    logic [3:0] vectornum, errors;
    
    // The device under test
    xnor_ds dut(A, B, Y);
    
    // read test vector file and initialize test
    initial begin
       $readmemb("xnor-vectors.txt", vectors);
       vectornum = 0; errors = 0;
    end
    // generate a clock to sequence tests
    always begin
       clk = 1; #10; clk = 0; #10;
    end
    // apply test
    always @(posedge clk) begin
       currentvec = vectors[vectornum];
       A = currentvec[1];
       B = currentvec[2];
       if (currentvec[0] === 1'bx) begin
         $display("Completed %d tests with %d errors.", 
                  vectornum, errors);
         $stop;
       end
    end
    // check if test was sucessful and apply next one
    always @(negedge clk) begin
       if ((Y !== currentvec[0])) begin
          $display("Error: inputs were a=%h b=%h", A, B);
          $display("       output mismatches as %h (%h expected)", 
                   currentvec[0], Y);
          errors = errors + 1;
       end
       vectornum = vectornum + 1;
    end
endmodule


module xnor_ds(A, B, Y);
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
endmodule   /* xnor_ds */

