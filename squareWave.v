
module singlekeytosound(input [4:0] index,
                        input s,
			               input clk, 
								output [1:0] osound);
								
								
	wire [31:0] delay;
	reg [31:0] delay_cnt;
	reg snd;	
	
	itodelay converter(.i(index),.delay(delay));
	
	always@(posedge clk)
	
		if (s) begin
			if (delay_cnt == delay)begin
				delay_cnt <= 32'd0;
				snd <= ~snd;
			end
			else
				delay_cnt<= delay_cnt+1'b1;
			end
		else begin
			snd <= 1'b0;
			delay_cnt<=32'd0;
		end
		
	assign osound = (s==1'b0) ? 2'd0 : (snd)?  2'd1:-2'd1;
		
	
endmodule

// multiplexer
module itodelay(input [4:0] i, output reg [31:0] delay);
	always@(*)
	begin
	 case(i)
		5'd0: delay<=32'd143173;
		5'd1: delay<=32'd135137; 
		5'd2: delay<=32'd127552;
		5'd3: delay<=32'd120394;
		5'd4: delay<=32'd113636;
		5'd5: delay<=32'd107258;
		5'd6: delay<=32'd101238;
		5'd7: delay<=32'd95556;
		5'd8: delay<=32'd90193;
		5'd9: delay<=32'd85131;
		5'd10: delay<=32'd80353;
		5'd11: delay<=32'd75843;
		5'd12: delay<=32'd71586;
		5'd13: delay<=32'd67569;
		5'd14: delay<=32'd63776;
		5'd15: delay<=32'd60197;
		5'd16: delay<=32'd56818;
		5'd17: delay<=32'd53629;
		5'd18: delay<=32'd50619;
		5'd19: delay<=32'd47778;
		5'd20: delay<=32'd45097;
		5'd21: delay<=32'd42566;
		5'd22: delay<=32'd40177;
		5'd23: delay<=32'd37922;
		5'd24: delay<=32'd35793;
		5'd25: delay<=32'd33784;
		5'd26: delay<=32'd31888;
		5'd27: delay<=32'd30098;
		5'd28: delay<=32'd28409;
		5'd29: delay<=32'd26815;
		5'd30: delay<=32'd25310;
		5'd31: delay<=32'd23889;
		default:;
	 endcase
	end
endmodule

module allkeystosound(input [31:0] keyPressed,
		                input clk,
							 output [31:0] sound);
							 
	wire [63:0] sounds;
	
	singlekeytosound M0(.index(5'd0),.s(keyPressed[0]), .clk(clk), .osound(sounds[1:0]) );

   singlekeytosound M1(.index(5'd1),.s(keyPressed[1]), .clk(clk), .osound(sounds[3:2]) );
 
   singlekeytosound M2(.index(5'd2),.s(keyPressed[2]), .clk(clk), .osound(sounds[5:4]) );

   singlekeytosound M3(.index(5'd3),.s(keyPressed[3]), .clk(clk), .osound(sounds[7:6]) );

   singlekeytosound M4(.index(5'd4),.s(keyPressed[4]), .clk(clk), .osound(sounds[9:8]) );

   singlekeytosound M5(.index(5'd5),.s(keyPressed[5]), .clk(clk), .osound(sounds[11:10]) );

   singlekeytosound M6(.index(5'd6),.s(keyPressed[6]), .clk(clk), .osound(sounds[13:12]) );

   singlekeytosound M7(.index(5'd7),.s(keyPressed[7]), .clk(clk), .osound(sounds[15:14]) );

   singlekeytosound M8(.index(5'd8),.s(keyPressed[8]), .clk(clk), .osound(sounds[17:16]) );

   singlekeytosound M9(.index(5'd9),.s(keyPressed[9]), .clk(clk), .osound(sounds[19:18]) );

	singlekeytosound M10(.index(5'd10),.s(keyPressed[10]), .clk(clk), .osound(sounds[21:20]) );

	singlekeytosound M11(.index(5'd11),.s(keyPressed[11]), .clk(clk), .osound(sounds[23:22]) );

	singlekeytosound M12(.index(5'd12),.s(keyPressed[12]), .clk(clk), .osound(sounds[25:24]) );
	
	singlekeytosound M13(.index(5'd13),.s(keyPressed[13]), .clk(clk), .osound(sounds[27:26]) );

	singlekeytosound M14(.index(5'd14),.s(keyPressed[14]), .clk(clk), .osound(sounds[29:28]) );
	
	singlekeytosound M15(.index(5'd15),.s(keyPressed[15]), .clk(clk), .osound(sounds[31:30]) );

	singlekeytosound M16(.index(5'd16),.s(keyPressed[16]), .clk(clk), .osound(sounds[33:32]) );

	singlekeytosound M17(.index(5'd17),.s(keyPressed[17]), .clk(clk), .osound(sounds[35:34]) );

	singlekeytosound M18(.index(5'd18),.s(keyPressed[18]), .clk(clk), .osound(sounds[37:36]) );

	singlekeytosound M19(.index(5'd19),.s(keyPressed[19]), .clk(clk), .osound(sounds[39:38]) );

	singlekeytosound M20(.index(5'd20),.s(keyPressed[20]), .clk(clk), .osound(sounds[41:40]) );
	
	singlekeytosound M21(.index(5'd21),.s(keyPressed[21]), .clk(clk), .osound(sounds[43:42]) );

	singlekeytosound M22(.index(5'd22),.s(keyPressed[22]), .clk(clk), .osound(sounds[45:44]) );

	singlekeytosound M23(.index(5'd23),.s(keyPressed[23]), .clk(clk), .osound(sounds[47:46]) );

	singlekeytosound M24(.index(5'd24),.s(keyPressed[24]), .clk(clk), .osound(sounds[49:48]) );

	singlekeytosound M25(.index(5'd25),.s(keyPressed[25]), .clk(clk), .osound(sounds[51:50]) );

	singlekeytosound M26(.index(5'd26),.s(keyPressed[26]), .clk(clk), .osound(sounds[53:52]) );

	singlekeytosound M27(.index(5'd27),.s(keyPressed[27]), .clk(clk), .osound(sounds[55:54]) );

	singlekeytosound M28(.index(5'd28),.s(keyPressed[28]), .clk(clk), .osound(sounds[57:56]) );
	
	singlekeytosound M29(.index(5'd29),.s(keyPressed[29]), .clk(clk), .osound(sounds[59:58]) );

	singlekeytosound M30(.index(5'd30),.s(keyPressed[30]), .clk(clk), .osound(sounds[61:60]) );

	singlekeytosound M31(.index(5'd31),.s(keyPressed[31]), .clk(clk), .osound(sounds[63:62]) );
     
	//add the ouputs coming from sounds
	//we do this by adding all the bits in sounds then scaling by the amplitude

	assign sound = ($signed(sounds[1:0])+$signed(sounds[3:2]) 
			+ $signed(sounds[5:4]) + $signed(sounds[7:6])
			+ $signed(sounds[9:8]) + $signed(sounds[11:10])
			+ $signed(sounds[13:12]) + $signed(sounds[15:14])
			+ $signed(sounds[17:16]) + $signed(sounds[19:18])
			+ $signed(sounds[21:20]) + $signed(sounds[23:22])
			+ $signed(sounds[25:24]) + $signed(sounds[27:26])
			+ $signed(sounds[29:28]) + $signed(sounds[31:30])
			+ $signed(sounds[33:32]) + $signed(sounds[35:34]) 
			+ $signed(sounds[37:36]) + $signed(sounds[39:38])
			+ $signed(sounds[41:40]) + $signed(sounds[43:42])
			+ $signed(sounds[45:44]) + $signed(sounds[47:46])
			+ $signed(sounds[49:48])  + $signed(sounds[51:50])
			+ $signed(sounds[53:52]) + $signed(sounds[55:54]) 
			+ $signed(sounds[57:56]) + $signed(sounds[59:58])
			+ $signed(sounds[61:60]) + $signed(sounds[63:62]))*32'd10000000;

endmodule
