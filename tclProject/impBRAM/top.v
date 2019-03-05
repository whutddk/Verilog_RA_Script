//////////////////////////////////////////////////////////////////////////////////
// Company:   
// Engineer: Ruige_Lee
// Create Date: 2019-03-05 09:59:40
// Last Modified by:   Ruige_Lee
// Last Modified time: 2019-03-05 14:34:07
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
	input [2:0] sel1,
	input [7:0] sel2,
	input [11:0] xyzInput,

	output [31:0] result_imp
);

wire [2:0] X_Wire;
wire [3:0] Y_Wire;
wire [3:0] Z_Wire;

wire [4095:0] edge_mask;


blk_mem_gen_0 rom (
	.addra({X_Wire,Y_Wire,Z_Wire}),
	.clka(CLK),
	.douta(edge_mask)
	);






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


endmodule



