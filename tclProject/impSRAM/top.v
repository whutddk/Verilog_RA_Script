//////////////////////////////////////////////////////////////////////////////////
// Company:   
// Engineer: Ruige_Lee
// Create Date: 2019-03-05 09:59:40
// Last Modified by:   Ruige_Lee
// Last Modified time: 2019-03-05 16:29:53
// Email: 295054118@whut.edu.cn
// Design Name:   
// Module Name: top
// Project Name:   
// Target Devices:   
// Tool Versions:   
// Description:   
// 
// Dependencies:   
// 
// Revision:  
// Revision:    -   
// Additional Comments:  
// 
//////////////////////////////////////////////////////////////////////////////////



module top (

	input CLK,
	input [1:0] sel1,
	input [7:0] sel2,
	input [11:0] xyzInput,

	output [31:0] result_imp,

////////////////////////////////
	
	

//sram port

	input mode_set,
	output i_mode,

	output [3:0] i_SRAM_WR,
	output [3:0] i_SRAM_CS,

	output [18:0] i_SRAM_ADDR,
	inout [127:0] i_SRAM_DATA

);

wire [3:0] X_Wire;
wire [3:0] Y_Wire;
wire [3:0] Z_Wire;

wire [2047:0] edge_mask;


wire [127:0] SRAM_DATA_IN_Pin;
wire [127:0] SRAM_DATA_OUT_Pin;

assign i_SRAM_DATA = (mode_set == 1'b1) ? 127'bz : SRAM_DATA_IN_Pin; //read mode ? 
assign SRAM_DATA_OUT_Pin = i_SRAM_DATA;



prm_chk_v1_0 i_prm_sel
	(
		.CLK(CLK),
		.RST_n(1'b1),

		.sel1(sel1),
		.sel2(sel2),

		.xyzInput(xyzInput),

		.x(X_Wire),
		.y(Y_Wire),
		.z(Z_Wire),

		.edge_mask(edge_mask),

		.result_imp(result_imp)

	);



genvar i;
generate 





for ( i = 0; i < 4 ;i=i+1 )  begin

perip_SRAM # (
	.ADDRW(19),
	.DATAW(32)
	)
	i_sram
	( 
		.CLK(CLK),
		.RSTn(RSTn),

		.mode_R1_W0(i_mode),
		.SRAM_ADDR_Stream,
		.SRAM_DATA_IN_Stream,
		.SRAM_DATA_OUT_Stream,


		//driver pin
		.SRAM_OE_Pin(),
		.SRAM_WR_Pin(i_SRAM_WR[i]),
		.SRAM_CS_Pin(i_SRAM_CS[i]),

		.SRAM_ADDR_Pin(i_SRAM_ADDR),
		.SRAM_DATA_IN_Pin(SRAM_DATA_IN_Pin[32*i+31:32*i]),
		.SRAM_DATA_OUT_Pin(SRAM_DATA_OUT_Pin[32*i+31:32*i])
		);


end




endgenerate
		


endmodule



