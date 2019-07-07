//////////////////////////////////////////////////////////////////////////////////
// Company:   
// Engineer: Ruige_Lee
// Create Date: 2019-02-13 11:04:50
// Last Modified by:   Ruige_Lee
// Last Modified time: 2019-03-05 13:45:18
// Email: 295054118@whut.edu.cn
// Design Name:   
// Module Name: prm_chk_v1_0
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


`timescale 1 ns / 1 ps

module prm_chk_v1_0 # 
	(
		parameter XW = 4,
		parameter YW = 5,
		parameter ZW = 5
	)
	(
		// Users to add ports here
		input CLK,
		input RST_n,

		input [2:0] sel1,
		input [7:0] sel2,

		input [XW+YW+ZW-1:0] xyzInput,

		output [XW-1:0] x,
		output [YW-1:0] y,
		output [ZW-1:0] z,
		input [511:0] edge_mask_512p0,
		input [511:0] edge_mask_512p1,
		input [511:0] edge_mask_512p2,
		input [511:0] edge_mask_512p3,
		input [511:0] edge_mask_512p4,
		input [511:0] edge_mask_512p5,
		input [511:0] edge_mask_512p6,
		input [511:0] edge_mask_512p7,

		output [31:0] result_imp


	);

	wire [4095:0] outputMask_Wire;

	reg [4095:0] edgeResult;
	reg [511:0] selReg;
	reg [XW+YW+ZW-1:0] slv_reg0;

always @(posedge CLK)begin
if (!RST_n) begin
    slv_reg0 <= {(XW+YW+ZW){1'd0}};
end
else begin
    slv_reg0 <= xyzInput;
end
end



always @(*) begin
	case(sel1)

		3'd0: selReg[511:0] <= edgeResult[511:0];
		3'd1: selReg[511:0] <= edgeResult[1023:512];
		3'd2: selReg[511:0] <= edgeResult[1535:1024];
		3'd3: selReg[511:0] <= edgeResult[2047:1536];
		3'd4: selReg[511:0] <= edgeResult[2559:2048];
		3'd5: selReg[511:0] <= edgeResult[3071:2560];
		3'd6: selReg[511:0] <= edgeResult[3583:3072];
		3'd7: selReg[511:0] <= edgeResult[4095:3584];

	default:selReg[511:0] <= 511'd0;
	endcase
end

reg [31:0] result_imp_reg;
assign result_imp = result_imp_reg;


always @(*) begin
	case(sel2)

		4'd0: result_imp_reg[31:0] <= selReg[31:0];
		4'd1: result_imp_reg[31:0] <= selReg[63:32];
		4'd2: result_imp_reg[31:0] <= selReg[95:64];
		4'd3: result_imp_reg[31:0] <= selReg[127:96];
		4'd4: result_imp_reg[31:0] <= selReg[159:128];
		4'd5: result_imp_reg[31:0] <= selReg[191:160];
		4'd6: result_imp_reg[31:0] <= selReg[223:192];
		4'd7: result_imp_reg[31:0] <= selReg[255:224];
		4'd8: result_imp_reg[31:0] <= selReg[287:256];
		4'd9: result_imp_reg[31:0] <= selReg[319:288];
		4'd10: result_imp_reg[31:0] <= selReg[351:320];
		4'd11: result_imp_reg[31:0] <= selReg[383:352];
		4'd12: result_imp_reg[31:0] <= selReg[415:384];
		4'd13: result_imp_reg[31:0] <= selReg[447:416];
		4'd14: result_imp_reg[31:0] <= selReg[479:448];
		4'd15: result_imp_reg[31:0] <= selReg[511:480];

	default:result_imp_reg[31:0] <= 32'd0;
	endcase
end



	always @ ( posedge CLK ) begin

		if ( !RST_n ) begin
			edgeResult <= 4096'b0;
			// inputX <= 4'b0;
			// inputY <= 5'b0;
			// inputZ <= 5'b0;
		end // if ( S_AXI_ARESETN == 1'b0 )

		else begin
			edgeResult <= edgeResult | outputMask_Wire;

		end // else
	end // always @ ( posedge S_AXI_ACLK )


assign outputMask_Wire = {edge_mask_512p7,edge_mask_512p6,edge_mask_512p5,edge_mask_512p4,edge_mask_512p3,edge_mask_512p2,edge_mask_512p1,edge_mask_512p0};
//assign outputMask_Wire = {edge_mask_512p3,edge_mask_512p2,edge_mask_512p1,edge_mask_512p0};

assign {x,y,z} = slv_reg0;











	// User logic ends

	endmodule
