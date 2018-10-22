module sinWaveAllKeys(input [31:0] keyPressed,
                      input resetn,
               		 input clk,
			             output signed[31:0] sound,
							 output [9:0] hello);
					
//this module will be instantiated in top level

	wire [383:0] sounds;
	
	assign hello = sounds[11:2];
	
//	reg [31:0] PARAM_ARRAY = {5'd31,5'd30,5'd29,5'd28,5'd27,5'd26,5'd25,5'd24,5'd23,5'd22,5'd21,5'd20,5'd19,5'd18,5'd17,5'd16,5'd15, 5'd14,5'd13,5'd12,5'd11,5'd10,5'd9,5'd8,5'd7,5'd6,5'd5,5'd4,5'd3,5'd2,5'd1,5'd0};
//  
//  //instantiate below modules
//	genvar i;
//	generate
//	for(i=0;i<=31;i=i+1)begin: sinWave
//		sinWaveOneKey S(.index(PARAM_ARRAY[i]),.resetn(resetn),
//			      .s(keyPressed[i]),.clk(clk),.osound(sounds[(12*i) + 11:12*i]));
//	end
//	endgenerate

sinWaveOneKey S0 (.index(5'd0),.resetn(resetn), .s(keyPressed[0]), .clk(clk),.osound(sounds[11:0]));

sinWaveOneKey S1 (.index(5'd1),.resetn(resetn), .s(keyPressed[1]), .clk(clk),.osound(sounds[23:12]));
 
sinWaveOneKey S2 (.index(5'd2),.resetn(resetn), .s(keyPressed[2]), .clk(clk),.osound(sounds[35:24]));

sinWaveOneKey S3 (.index(5'd3),.resetn(resetn), .s(keyPressed[3]), .clk(clk),.osound(sounds[47:36]));

sinWaveOneKey S4 (.index(5'd4),.resetn(resetn), .s(keyPressed[4]), .clk(clk),.osound(sounds[59:48]));

sinWaveOneKey S5 (.index(5'd5),.resetn(resetn), .s(keyPressed[5]), .clk(clk),.osound(sounds[71:60]));

sinWaveOneKey S6 (.index(5'd6),.resetn(resetn), .s(keyPressed[6]), .clk(clk),.osound(sounds[83:72]));

sinWaveOneKey S7 (.index(5'd7),.resetn(resetn), .s(keyPressed[7]), .clk(clk),.osound(sounds[95:84]));

sinWaveOneKey S8 (.index(5'd8),.resetn(resetn), .s(keyPressed[8]), .clk(clk),.osound(sounds[107:96]));

sinWaveOneKey S9 (.index(5'd9),.resetn(resetn), .s(keyPressed[9]), .clk(clk),.osound(sounds[119:108]));

sinWaveOneKey S10 (.index(5'd10),.resetn(resetn), .s(keyPressed[10]), .clk(clk),.osound(sounds[131:120]));

sinWaveOneKey S11 (.index(5'd11),.resetn(resetn), .s(keyPressed[11]), .clk(clk),.osound(sounds[143:132]));

sinWaveOneKey S12 (.index(5'd12),.resetn(resetn), .s(keyPressed[12]), .clk(clk),.osound(sounds[155:144]));

sinWaveOneKey S13 (.index(5'd13),.resetn(resetn), .s(keyPressed[13]),.clk(clk),.osound(sounds[167:156]));

sinWaveOneKey S14 (.index(5'd14),.resetn(resetn), .s(keyPressed[14]),.clk(clk),.osound(sounds[179:168]));

sinWaveOneKey S15 (.index(5'd15),.resetn(resetn), .s(keyPressed[15]),.clk(clk),.osound(sounds[191:180]));

sinWaveOneKey S16 (.index(5'd16),.resetn(resetn), .s(keyPressed[16]),.clk(clk),.osound(sounds[203:192]));

sinWaveOneKey S17 (.index(5'd17),.resetn(resetn), .s(keyPressed[17]),.clk(clk),.osound(sounds[215:204]));

sinWaveOneKey S18 (.index(5'd18),.resetn(resetn), .s(keyPressed[18]),.clk(clk),.osound(sounds[227:216]));

sinWaveOneKey S19 (.index(5'd19),.resetn(resetn), .s(keyPressed[19]),.clk(clk),.osound(sounds[239:228]));

sinWaveOneKey S20 (.index(5'd20),.resetn(resetn), .s(keyPressed[20]),.clk(clk),.osound(sounds[251:240]));

sinWaveOneKey S21 (.index(5'd21),.resetn(resetn), .s(keyPressed[21]),.clk(clk),.osound(sounds[263:252]));

sinWaveOneKey S22 (.index(5'd22),.resetn(resetn), .s(keyPressed[22]),.clk(clk),.osound(sounds[275:264]));

sinWaveOneKey S23 (.index(5'd23),.resetn(resetn), .s(keyPressed[23]),.clk(clk),.osound(sounds[287:276]));

sinWaveOneKey S24 (.index(5'd24),.resetn(resetn), .s(keyPressed[24]),.clk(clk),.osound(sounds[299:288]));

sinWaveOneKey S25 (.index(5'd25),.resetn(resetn), .s(keyPressed[25]),.clk(clk),.osound(sounds[311:300]));

sinWaveOneKey S26 (.index(5'd26),.resetn(resetn), .s(keyPressed[26]),.clk(clk),.osound(sounds[323:312]));

sinWaveOneKey S27 (.index(5'd27),.resetn(resetn), .s(keyPressed[27]),.clk(clk),.osound(sounds[335:324]));

sinWaveOneKey S28 (.index(5'd28),.resetn(resetn), .s(keyPressed[28]),.clk(clk),.osound(sounds[347:336]));

sinWaveOneKey S29 (.index(5'd29),.resetn(resetn), .s(keyPressed[29]),.clk(clk),.osound(sounds[359:348]));

sinWaveOneKey S30 (.index(5'd30),.resetn(resetn), .s(keyPressed[30]),.clk(clk),.osound(sounds[371:360]));

sinWaveOneKey S31 (.index(5'd31),.resetn(resetn), .s(keyPressed[31]),.clk(clk),.osound(sounds[383:372]));


  //the output sound 32 bits go to audio controller in top level module
	adder A(sounds,sound);
  

endmodule 

//here we're adding sounds[11:0] + sounds[23:11] ... and so on as SIGNED Numbers
//we have 32 keys => 32 sound outpurs to be added
module adder(input [383:0] sounds,
             output signed [31:0]sound);
				 
	integer i;
	reg signed[31:0] temp_data;
	wire signed[11:0] multiple;
	
	assign multiple = 12'd4000;
	
	always @(*)
	begin
		temp_data = 0;
		for(i=0;i<32;i=i+1)
		begin
			temp_data = temp_data + $signed(sounds[12*i +: 12]);
		end
	end
	assign sound = temp_data*multiple;

endmodule


//OTHER MODULES THAT WILL BE INSTANTIATED IN SINWAVE MODULE: increment <= 17'd

module itoincrement(input [4:0] index,
                    output reg [16:0] increment);
		  
 	//multiplexer
	always@(*)
	case(index)
		5'd0: increment <= 17'd14999;
		5'd1: increment <= 17'd15891;
		5'd2: increment <= 17'd16836;
		5'd3: increment <= 17'd17837;
		5'd4: increment <= 17'd18898;
		5'd5: increment <= 17'd20022;
		5'd6: increment <= 17'd21212;
		5'd7: increment <= 17'd22474;
		5'd8: increment <= 17'd23810;
		5'd9: increment <= 17'd25226;
		5'd10: increment <= 17'd26726;
		5'd11: increment <= 17'd28315;
		5'd12: increment <= 17'd29998;
		5'd13: increment <= 17'd31782;
		5'd14: increment <= 17'd33672;
		5'd15: increment <= 17'd35674;
		5'd16: increment <= 17'd37796;
		5'd17: increment <= 17'd40043;
		5'd18: increment <= 17'd42424;
		5'd19: increment <= 17'd44947;
		5'd20: increment <= 17'd47620;
		5'd21: increment <= 17'd50451;
		5'd22: increment <= 17'd53451;
		5'd23: increment <= 17'd56630;
		5'd24: increment <= 17'd59997;
		5'd25: increment <= 17'd63565;
		5'd26: increment <= 17'd67344;
		5'd27: increment <= 17'd71349;
		5'd28: increment <= 17'd75591;
		5'd29: increment <= 17'd80086;
		5'd30: increment <= 17'd84849;
		5'd31: increment <= 17'd89894;	
		default: ;
	endcase
 
endmodule

module counter32bit(input clk,
                    input resetn,
                    input [16:0] increment,
		              output [7:0] address);
						  
   reg [31:0] bigCounter;
						  
	always@(posedge clk)
			
		if(!resetn)
			bigCounter <= 0;
		else
			bigCounter <= bigCounter + increment;
				
		assign address = bigCounter[31:24];		  

endmodule						  
					
module sinWaveOneKey(input [4:0] index,
                     input s,
						 	input resetn,
			            input clk, 
							output signed [11:0] osound);
							
	wire [16:0] increment;
	wire [7:0] address;
	wire signed [11:0] psound;
	
	itoincrement I(index,increment);
	
	counter32bit C(.clk(clk), .resetn(resetn),.increment(increment),.address(address));
	
	sin12x256 sine(.address(address), .clock(clk), .q(psound));
	
	assign osound = s ? psound: 12'd0;
	
endmodule
					