
`timescale 1 ns / 1 ns

////////////////////////////////////////////////////////////////////////////////
// Company: Wuhan university of technology 
// Engineer: Ruige LEE
//
// Create Date: 20181202
// Design Name: pkb-2019
// Module Name: flatten
// Target Device: <zynq7000-z020>
// Tool versions: <2018.02>
// Description:
// 	activePose	& with edge (only 2 active pose)  used to connect the graph ,
// 	^ to make sure active pose will not be connect again,shortest one!
//    
//    ones the shortest node chain has been found,no loop exist for ^ used
//    only active edge will be searched again,as a result,anti-flow will rebuild the only chain. 
// Dependencies:
//    
// Revision:
//    0.2.0
// Additional Comments:
//    
////////////////////////////////////////////////////////////////////////////////
			

module graph
(
	input CLK,
	input RST_n,
	input [1033:0] edgeMask,
	input [7:0] startPose,
	input [7:0] endPose,

	//RAM
	output reg [10:0] ramAddress,
	input [15:0] RAMData,

	output 
);

wire [7:0] firstPose = RAMData[15:8];
wire [7:0] secondPose = RAMData[7:0];
wire [15:0] routeLine = (66'b1 << firstPose) | (66'b1 << secondPose);


reg [2:0] state;

reg [65:0] activePose;
reg [1033:0] activeEdge[0:10];
reg [1033:0] edgeMask_Reg;


reg [3:0] maxLever;
reg [3:0] leverCnt;


always @(posedge CLK or !RST_n) begin
	if (!RST_n) begin
		ramAddress <= 10'd0;
		leverCnt <= 4'd0;

		activeEdge[0] <= 1034'b0;
		activeEdge[1] <= 1034'b0;
		activeEdge[2] <= 1034'b0;
		activeEdge[3] <= 1034'b0;
		activeEdge[4] <= 1034'b0;
		activeEdge[5] <= 1034'b0;
		activeEdge[6] <= 1034'b0;
		activeEdge[7] <= 1034'b0;
		activeEdge[8] <= 1034'b0;
		activeEdge[9] <= 1034'b0;

		activePose <= 65'b0;
	end

	else if ( state == FORWARD_INIT )begin

		ramAddress <= 10'd0;
		leverCnt <= 4'd0;
		activeEdge[0] <= 1034'b0;
		activeEdge[1] <= 1034'b0;
		activeEdge[2] <= 1034'b0;
		activeEdge[3] <= 1034'b0;
		activeEdge[4] <= 1034'b0;
		activeEdge[5] <= 1034'b0;
		activeEdge[6] <= 1034'b0;
		activeEdge[7] <= 1034'b0;
		activeEdge[8] <= 1034'b0;
		activeEdge[9] <= 1034'b0;

		activePose <= (65'b1 << startPoint);
	end

	else if ( state == BACKWARD_INIT ) begin

		ramAddress <= 10'd0;
		leverCnt <= 4'd0;
		activeEdge[0] <= 1034'b0;
		activeEdge[1] <= 1034'b0;
		activeEdge[2] <= 1034'b0;
		activeEdge[3] <= 1034'b0;
		activeEdge[4] <= 1034'b0;
		activeEdge[5] <= 1034'b0;
		activeEdge[6] <= 1034'b0;
		activeEdge[7] <= 1034'b0;
		activeEdge[8] <= 1034'b0;
		activeEdge[9] <= 1034'b0;

		activePose <= (65'b1 << ENDPoint);
	end

	else if ( state == FORWARD_WORK) begin

		if ( ramAddress <= 11'd1034 ) begin

			leverCnt <= leverCnt;
			ramAddress <= ramAddress + 11'd1;

			if ( edgeMask_reg[ramAddress] != 1'b1 ) begin //this edge has passed the collision check

				if ( ((activePose & routeLine) ^) == 1'b1 ) begin //this edge can connect，and the connected pose is not active
					
					activePose <= activePose | routeLine;//mark the pose to 1 to active it			
					activeEdge[leverCnt] <= activeEdge[leverCnt] | (1034'b1 << ramAddress);//do not check this edge in the forward state //(prevent anti-flow)
				end
				else begin
				end
			end
			else begin
			end
		end
		else begin//一层扫完了 ramAddress > 11'd1034
			leverCnt <= leverCnt + 1'd1;
			ramAddress <= 0;
		end
	end

	else if (state == BACKWARD_WORK)  begin
		
		if ( ramAddress <= 11'd1034 ) begin

			leverCnt <= leverCnt;
			ramAddress <= ramAddress + 11'd1;

			if ( edgeMask_reg[ramAddress] != 1'b1 ) begin //this edge has passed the collision check

				if ( ((activePose & routeLine) ^) == 1'b1 ) begin //this edge can connect，and the connected pose is not active
					
					activePose <= activePose | routeLine;//mark the pose to 1 to active it
	
					leverCnt <= leverCnt + 1'd1;

					ramAddress <= 11'd0;
					OUTPUT <= ramAddress;

				end
				else begin
				end
			end
			else begin
			end
		end
		else begin//一层扫完了 ramAddress > 11'd1034
			__ERROR__
		end
	end
	end
		


end



//state INIT FORWARD BACKWARD 
always @(negedge CLK or !RST_n) begin
	if (!RST_n) begin
		maxLever <= 4'd10;
		state <= FORWARD_INIT;
		
	end
	else if ( state == FORWARD_INIT ) begin
		maxLever <= 4'd10;

		edgeMask_reg[1033:0] <= edgeMask[1033:0];

		state <= FORWARD_WORK;

	end

	else if (state == FORWARD_WORK) begin
		if( (activePose >> endpoint) & 1'B1 == 1 ) begin
			state <= BACKWARD_INIT;
			edgeMask_reg <= edgeMask_reg | 
							~( activeEdge[0] | activeEdge[1] | activeEdge[2] | activeEdge[3]
							| activeEdge[4] | activeEdge[5] | activeEdge[6] | activeEdge[7]
							| activeEdge[8] | activeEdge[9] );	//only active edge in forward would be considered
			maxLever <= leverCnt;	//only 
			
		end

		if ( leverCnt == maxLever ) begin

			__ERROR__

		end // if ( leverCnt == maxLever )

		else begin
			state <= FORWARD_WORK;
		end

	end

	else if ( state == BACKWARD_WORK )begin
		if ( leverCnt == maxLever ) begin

			__FINISH__
	end

	else begin//idle


	end


end

endmodule

