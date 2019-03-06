//////////////////////////////////////////////////////////////////////////////////
// Company:   
// Engineer: Ruige_Lee
// Create Date: 2019-03-05 09:59:40
// Last Modified by:   Ruige_Lee
// Last Modified time: 2019-03-05 14:14:34
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

`define XW 4
`define YW 5
`define ZW 5

module top (

	input CLK,
	input [2:0] sel1,
	input [7:0] sel2,
	input [`XW+`YW+`ZW-1:0] xyzInput,

	output [31:0] result_imp
);

wire [`XW-1:0] X_Wire;
wire [`YW-1:0] Y_Wire;
wire [`ZW-1:0] Z_Wire;

wire [511:0] edge_mask_512p0;
wire [511:0] edge_mask_512p1;
wire [511:0] edge_mask_512p2;
wire [511:0] edge_mask_512p3;

wire [511:0] edge_mask_512p4;
wire [511:0] edge_mask_512p5;
wire [511:0] edge_mask_512p6;
wire [511:0] edge_mask_512p7;

prm_LUTX1_Po_3_4_4_chk512p0(
	.x(X_Wire),
	.y(Y_Wire),
	.z(Z_Wire),
	.edge_mask_512p0(edge_mask_512p0)
);

prm_LUTX1_Po_3_4_4_chk512p1(
	.x(X_Wire),
	.y(Y_Wire),
	.z(Z_Wire),
	.edge_mask_512p1(edge_mask_512p1)
);

prm_LUTX1_Po_3_4_4_chk512p2(
	.x(X_Wire),
	.y(Y_Wire),
	.z(Z_Wire),
	.edge_mask_512p2(edge_mask_512p2)
);

prm_LUTX1_Po_3_4_4_chk512p3(
	.x(X_Wire),
	.y(Y_Wire),
	.z(Z_Wire),
	.edge_mask_512p3(edge_mask_512p3)
);

prm_LUTX1_Po_3_4_4_chk512p4(
	.x(X_Wire),
	.y(Y_Wire),
	.z(Z_Wire),
	.edge_mask_512p4(edge_mask_512p4)
);

prm_LUTX1_Po_3_4_4_chk512p5(
	.x(X_Wire),
	.y(Y_Wire),
	.z(Z_Wire),
	.edge_mask_512p5(edge_mask_512p5)
);

prm_LUTX1_Po_3_4_4_chk512p6(
	.x(X_Wire),
	.y(Y_Wire),
	.z(Z_Wire),
	.edge_mask_512p6(edge_mask_512p6)
);

prm_LUTX1_Po_3_4_4_chk512p7(
	.x(X_Wire),
	.y(Y_Wire),
	.z(Z_Wire),
	.edge_mask_512p7(edge_mask_512p7)
);



prm_chk_v1_0  # (
	.XW(`XW),
	.YW(`YW),
	.ZW(`ZW)
	) i_prm_sel
	(
		.CLK(CLK),
		.RST_n(1'b1),

		.sel1(sel1),
		.sel2(sel2),

		.xyzInput(xyzInput),

		.x(X_Wire),
		.y(Y_Wire),
		.z(Z_Wire),

		.edge_mask_512p0(edge_mask_512p0),
		.edge_mask_512p1(edge_mask_512p1),
		.edge_mask_512p2(edge_mask_512p2),
		.edge_mask_512p3(edge_mask_512p3),
		.edge_mask_512p4(edge_mask_512p4),
		.edge_mask_512p5(edge_mask_512p5),
		.edge_mask_512p6(edge_mask_512p6),
		.edge_mask_512p7(edge_mask_512p7),

		.result_imp(result_imp)


	);


endmodule



