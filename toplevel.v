
module toplevel (
	
	CLOCK_50,
	KEY,	
	GPIO_0,
	GPIO_1,
	SW,
	LEDR,
	
	AUD_ADCDAT,
	AUD_BCLK,
	AUD_ADCLRCK,
	AUD_DACLRCK,
	FPGA_I2C_SDAT,
	AUD_XCK,
	AUD_DACDAT,
	FPGA_I2C_SCLK,
);

// Inputs
input	CLOCK_50;
input	[3:0]	KEY;
input [35:0] GPIO_0;
output [35:0] GPIO_1;
input [9:0]SW;
output [9:0] LEDR;

input	AUD_ADCDAT;
inout	AUD_BCLK;
inout	AUD_ADCLRCK;
inout	AUD_DACLRCK;
inout	FPGA_I2C_SDAT;
output AUD_XCK;
output AUD_DACDAT;
output FPGA_I2C_SCLK;

wire audio_in_available;
wire [31:0]	left_channel_audio_in;
wire [31:0]	right_channel_audio_in;
wire read_audio_in;
wire write_audio_out;
wire audio_out_allowed;
assign write_audio_out = audio_in_available & audio_out_allowed;
assign read_audio_in	= audio_in_available & audio_out_allowed;

//our audio output
wire		[31:0]	left_channel_audio_out;
wire		[31:0]	right_channel_audio_out;
assign left_channel_audio_out	= left_channel_audio_in + sound;
assign right_channel_audio_out	= right_channel_audio_in + sound;

wire [31:0]  inkeys;
wire [31:0] sound;
wire [31:0] squareSound;
wire [31:0] sinWaveSound;

assign sound = SW[0] ? squareSound : sinWaveSound;

//get square wave sound
allkeystosound A(inkeys, CLOCK_50, squareSound);

//get sin wave sound
sinWaveAllKeys S(inkeys, KEY[0], CLOCK_50, sinWaveSound, LEDR[9:0]);


//get key(s) pressed
key K (KEY[0], CLOCK_50, GPIO_0, GPIO_1, inkeys);


Audio_Controller Audio_Controller (
	// Inputs
	.CLOCK_50 (CLOCK_50),
	.reset (~KEY[0]),
	.clear_audio_in_memory (),
	.read_audio_in	(read_audio_in),
	.clear_audio_out_memory	(),
	.left_channel_audio_out (left_channel_audio_out),
	.right_channel_audio_out (right_channel_audio_out),
	.write_audio_out (write_audio_out),
	.AUD_ADCDAT	(AUD_ADCDAT),
	.AUD_BCLK (AUD_BCLK),
	.AUD_ADCLRCK (AUD_ADCLRCK),
	.AUD_DACLRCK (AUD_DACLRCK),
	.audio_in_available (audio_in_available),
	.left_channel_audio_in (left_channel_audio_in),
	.right_channel_audio_in	(right_channel_audio_in),
	.audio_out_allowed (audio_out_allowed),
	.AUD_XCK	(AUD_XCK),
	.AUD_DACDAT	(AUD_DACDAT)
);

avconf #(.USE_MIC_INPUT(1)) avc (
	.FPGA_I2C_SCLK	(FPGA_I2C_SCLK),
	.FPGA_I2C_SDAT	(FPGA_I2C_SDAT),
	.CLOCK_50 (CLOCK_50),
	.reset (~KEY[0])
);

endmodule