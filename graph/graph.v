
`timescale 1 ns / 1 ns

////////////////////////////////////////////////////////////////////////////////
// Company: Wuhan university of technology 
// Engineer: Ruige LEE
//
// Create Date: 20181130
// Design Name: pkb-2019
// Module Name: flatten
// Target Device: <zynq7000-z020>
// Tool versions: <2018.02>
// Description:
//    
// Dependencies:
//    
// Revision:
//    0.1.0
// Additional Comments:
//    
////////////////////////////////////////////////////////////////////////////////
			
	
module flatten #(
	) 
(
	input CLK,
	input RST_n,
	input [1033:0] edgeMask,
	input [2:0] state,
	input [7:0] startPoint,
	input [7:0] endpoint,

	//RAM
	output [10:0] RAM_address,//0~1034
	input [65:0] RAM_routeLine,	//01100000000
);


reg [65:0] ActivePose;					//可达的点
reg [1033:0] edgeMask_reg;				//不可用的边（碰撞或已经使用）
reg [1033:0] edgeActive[0:10];				//激活的边
reg 【】 maxLever ;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		// reset
		
	end
	else if (INIT) begin
		ActivePose <= 65'b1 << startPoint;
		edgeMask_reg[1033:0] <= edgeMask[1033:0];

		edgeActive[0] <= 1034'b0;
		...
		edgeActive[10] <=1024'B0;

		RAM_address <= 10'd0;


		maxLever  = 10;
	end
	else if ( forward OR backward )begin
		
		// NEGEDGE
		// if( (ActivePose >> endpoint) &1'B1 == 1 ) begin
		// 	forward <= backward;
		// edgeMask_reg 《= edgeMask_reg | edgeActive[0] | edgeActive[1] |，，，| edgeActive[10]
		//maxLever <= poseLeverCnt
		//ActivePose <= 65'b1 << ENDPoint;
		// end


		IF ( poseLeverCnt < maxLever ) begin
			if ( RAM_address <= 1034 ) begin

				poseLeverCnt <= poseLeverCnt;
				RAM_address <= RAM_address + 1;

				if ( edgeMask_reg[RAM_address] != 1'b1 )begin //当前边可用
					if ( ((ActivePose & RAM_routeLine) ^) == 1'b1 ) begin //当前边满足要求，且激活点不重复
						edgeActive[poseLeverCnt] <= edgeActive[poseLeverCnt] | RAM_address;//之后不再查这条边
						ActivePose <= ActivePose | RAM_routeLine;//激活这个点


						IF (backward)begin
							poseLeverCnt <= poseLeverCnt + 1'd1;

							RAM_address <= 0;
							OUTPUT !
						end

					end
				end

			end

			else begin//一层扫完了
				poseLeverCnt <= poseLeverCnt + 1'd1;

				RAM_address <= 0;
			end

		end
		else begin //POSELEVERcNT>maxLever
			ERROR <= 1;
		end

		
		






	end
	else if ( backward) begin
		
	end

	else if ( PUTOUT ) begin
		
	end

	else //idel
	begin
		
	end
end



endmodule

