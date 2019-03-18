//////////////////////////////////////////////////////////////////////////////////
// Company:   
// Engineer: Ruige_Lee
// Create Date: 2019-02-13 11:04:50
// Last Modified by:   Ruige_Lee
// Last Modified time: 2019-03-05 17:44:12
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

module prm_chk_v1_0 
	(
		// Users to add ports here
		input CLK,
		input RST_n,

		input [2:0] sel1,
		input [7:0] sel2,

		input [13:0] xyzInput,

		output [3:0] x,
		output [4:0] y,
		output [4:0] z,

		output [4:0] data_sel,

		input [31:0] edge_mask,

		output [31:0] result_imp


	);

	reg [1023:0] edgeResult;
	reg [511:0] selReg;
	reg [13:0] slv_reg0;



always @(posedge CLK)begin
if (!RST_n) begin
    slv_reg0 <= 14'd0;
end
else begin
    slv_reg0 <= xyzInput;
end
end



always @(*) begin
	case(sel1)

		3'd0: selReg[511:0] <= edgeResult[511:0];
		3'd1: selReg[511:0] <= edgeResult[1023:512];
//		3'd2: selReg[511:0] <= edgeResult[1535:1024];
//		3'd3: selReg[511:0] <= edgeResult[2047:1536];
//		3'd4: selReg[511:0] <= edgeResult[2559:2048];
//		3'd5: selReg[511:0] <= edgeResult[3071:2560];
//		3'd6: selReg[511:0] <= edgeResult[3583:3072];
//		3'd7: selReg[511:0] <= edgeResult[4095:3584];
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




reg [4:0] data_sel_reg; 
reg [1023:0] fix_edgeMask;
	always @ ( posedge CLK ) begin

		if ( !RST_n ) begin
			edgeResult <= 1024'b0;
			data_sel_reg <= 5'd0;
			fix_edgeMask <= 1024'b0;
		end

		else begin
			if (data_sel_reg == 5'd0) begin
				data_sel_reg <= data_sel_reg + 5'd1;
				fix_edgeMask <= {992'b0,edge_mask};
				edgeResult <= edgeResult | fix_edgeMask;


			end
			else if (data_sel_reg == 5'd31) begin
				data_sel_reg <= 5'd0;
				fix_edgeMask <= (fix_edgeMask << 32) | edge_mask;
				edgeResult <= edgeResult;

			end
			else begin
				data_sel_reg <= data_sel_reg + 5'd1;
				fix_edgeMask <= (fix_edgeMask << 32) | edge_mask;
				edgeResult <= edgeResult;

			end

			

		end
	end


assign data_sel = data_sel_reg;

assign {x,y,z} = slv_reg0;





	endmodule
