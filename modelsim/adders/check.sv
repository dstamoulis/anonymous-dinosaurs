
module testbench();
    logic clk;
    logic a, b, y;
    logic [7:0] vectors[8:0], currentvec;
    logic [6:0] vectornum, errors;
    
    // The device under test
    // FTC dut(Cin, I1, I2, I3, I4, C, Cout, S);
    integer i;
    
    // read test vector file and initialize test
    initial begin
       $readmemb("FTC-vectors.txt", vectors);
       vectornum = 0; errors = 0;
    end
    // generate a clock to sequence tests
    //always begin
    //   clk = 1; #10; clk = 0; #10;
    //end
    
    // apply test
    always begin
       currentvec = vectors[vectornum];
        
        for (i=0; i < 8; i=i+1)
        $display("%h",currentvec[i]);
        

    end
endmodule

