//---------------------------------------------------------
// nand2.sv
// Nathaniel Pinckney 08/06/07
//
// Model and testbench of NAND2 gate
//--------------------------------------------------------

module testbench();
    logic clk;
    logic a, b, y;
    logic [2:0] vectors[4:0], currentvec;
    logic [3:0] vectornum, errors;
    
    // The device under test
    nand2 dut(a, b, y);
    
    // read test vector file and initialize test
    initial begin
       $readmemb("nand2-vectors.txt", vectors);
       vectornum = 0; errors = 0;
    end
    // generate a clock to sequence tests
    always begin
       clk = 1; #10; clk = 0; #10;
    end
    // apply test
    always @(posedge clk) begin
       currentvec = vectors[vectornum];
       a = currentvec[1];
       b = currentvec[2];
       if (currentvec[0] === 1'bx) begin
         $display("Completed %d tests with %d errors.", 
                  vectornum, errors);
         $stop;
       end
    end
    // check if test was sucessful and apply next one
    always @(negedge clk) begin
       if ((y !== currentvec[0])) begin
          $display("Error: inputs were a=%h b=%h", a, b);
          $display("       output mismatches as %h (%h expected)", 
                   currentvec[0], y);
          errors = errors + 1;
       end
       vectornum = vectornum + 1;
    end
endmodule

module nand2(input  logic a,
             input  logic b,
             output logic y);
             
   assign #1 y = ~(a & b);    
endmodule

