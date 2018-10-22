module rateDivider(input inclk,
                   input resetn,
						 output reg outclk);
						 
  reg [15:0] Q;
  
  always@(posedge inclk)
  
		if (!resetn)	
		begin
			Q <= 5E4;
			outclk <= 1'b0;
		end
		
		else if (Q==0)
		begin
			Q <= 5E4;
			outclk <= ~outclk;
		end
		
		else
			Q <= Q-1'b1;

endmodule