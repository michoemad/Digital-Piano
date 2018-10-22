module key(input resetn,
			  input CLOCK_50,
			  input [35:0] columns, //columns
			  output [35:0] rows, //rows		  
			  output [31:0] keyPressed);

  wire enableShifter,enableReader;
  wire clk;
  
  rateDivider R(CLOCK_50,resetn,clk);
 
  control C (resetn, clk, enableShifter, enableReader);
  
  datapath D(resetn,
             clk,
             enableShifter,
             enableReader,
             columns[7:0],
             rows[3:0],
             keyPressed);
    

endmodule


