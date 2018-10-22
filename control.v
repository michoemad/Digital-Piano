module control(input resetn,
               input clk,
               output reg enableShifter,
               output reg enableReader);
  
  localparam S_WRITE = 1'b0,
		       S_READ  = 1'b1;	 
  
  reg next_state, current_state; 
  
  //transitions
  always@(*)
  begin: state_table
      case(current_state)
        S_WRITE: next_state = S_READ;
        S_READ: next_state = S_WRITE;     
        default: next_state = S_WRITE;
      endcase     
  end
     
  //datapath actions
  always@(*)
  begin
      enableShifter = 1'b0;
      enableReader = 1'b0;
      case(current_state)
        S_WRITE: enableShifter = 1'b1;
        S_READ: enableReader = 1'b1;
      endcase          
  end
  
  always@(posedge clk)
    if (!resetn)
      current_state <= S_WRITE;
    else
      current_state <= next_state;
        
endmodule
