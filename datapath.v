module datapath(input resetn,
                input clk,
					 input enableShifter,
                input enableReader,
                input [7:0] column_data,
                output [3:0] row_data,
                output reg [31:0] keyPressed);

  integer i;
  reg [7:0] inverter;
  reg [3:0] shiftReg;
  
  assign row_data = ~shiftReg;
	
  always@(posedge clk)
  begin
  
    if (!resetn)
    begin
      shiftReg <=4'b1000;
      keyPressed <= 32'd0;
    end
	 
    else if (enableShifter)
    begin	 
      if(shiftReg == 4'b0000)		
			shiftReg <= 4'b1000; //reset shiftReg	
		else
         shiftReg  <= (shiftReg >> 1); //right shift
    end
		
	 else if (enableReader)
	 begin
		case(row_data)
		   4'b1110: keyPressed[7:0] <= ~column_data[7:0];
		   4'b1101: keyPressed[15:8] <= ~column_data[7:0];
		   4'b1011: keyPressed[23:16] <= ~inverter[7:0];
			4'b0111: keyPressed[31:24] <= ~inverter[7:0];
			default:;
		endcase
	 end
 

  end 
  
  always@(*)
  begin
	for(i=0;i<=7;i=i+1)
	begin
		inverter[i] = column_data[7-i];
   end
  end
  
endmodule
