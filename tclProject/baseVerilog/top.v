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

prm_LUTX1_Ca_4_5_5_chk512p0(
	.x(bufg_XWire_Out),
	.y(bufg_YWire_Out),
	.z(bufg_ZWire_Out),
	.edge_mask_512p0(edge_mask_512p0)
);

prm_LUTX1_Ca_4_5_5_chk512p1(
	.x(bufg_XWire_Out),
	.y(bufg_YWire_Out),
	.z(bufg_ZWire_Out),
	.edge_mask_512p1(edge_mask_512p1)
);

prm_LUTX1_Ca_4_5_5_chk512p2(
	.x(bufg_XWire_Out),
	.y(bufg_YWire_Out),
	.z(bufg_ZWire_Out),
	.edge_mask_512p2(edge_mask_512p2)
);

prm_LUTX1_Ca_4_5_5_chk512p3(
	.x(bufg_XWire_Out),
	.y(bufg_YWire_Out),
	.z(bufg_ZWire_Out),
	.edge_mask_512p3(edge_mask_512p3)
);

prm_LUTX1_Ca_4_5_5_chk512p4(
	.x(bufg_XWire_Out),
	.y(bufg_YWire_Out),
	.z(bufg_ZWire_Out),
	.edge_mask_512p4(edge_mask_512p4)
);

prm_LUTX1_Ca_4_5_5_chk512p5(
	.x(bufg_XWire_Out),
	.y(bufg_YWire_Out),
	.z(bufg_ZWire_Out),
	.edge_mask_512p5(edge_mask_512p5)
);

prm_LUTX1_Ca_4_5_5_chk512p6(
	.x(bufg_XWire_Out),
	.y(bufg_YWire_Out),
	.z(bufg_ZWire_Out),
	.edge_mask_512p6(edge_mask_512p6)
);

prm_LUTX1_Ca_4_5_5_chk512p7(
	.x(bufg_XWire_Out),
	.y(bufg_YWire_Out),
	.z(bufg_ZWire_Out),
	.edge_mask_512p7(edge_mask_512p7)
);

wire [`XW+`YW+`ZW-1 : 0] bufg_Wire_In = {X_Wire,Y_Wire,Z_Wire};
wire [`XW+`YW+`ZW-1 : 0] bufg_Wire_Out;



wire [`XW-1 : 0] bufg_XWire_Out;
wire [`YW-1 : 0] bufg_YWire_Out;
wire [`ZW-1 : 0] bufg_ZWire_Out;

assign {bufg_XWire_Out,bufg_YWire_Out,bufg_ZWire_Out} = bufg_Wire_Out;

genvar i;
generate 
for ( i = 0; i < (`XW+`YW+`ZW);i=i+1 )  begin
BUFG BUFG_inst (
      .O(bufg_Wire_Out[i]), // 1-bit output: Clock output
      .I(bufg_Wire_In[i])  // 1-bit input: Clock input
   );
end
endgenerate



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



