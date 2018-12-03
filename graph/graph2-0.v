
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
	input [2:0] control,
	input [7:0] startPose,
	input [7:0] endPose,

	//RAM
	output reg [10:0] ramAddress,
	input [15:0] RAMData,

	output reg [1033:0] edgeMask_Reg,
	output reg [109:0] selectEdge,


	output reg [2:0] state

);

parameter FORWARD_INIT = 3'd0;
parameter FORWARD_WORK = 3'd1;
parameter BACKWARD_INIT = 3'd2;
parameter BACKWARD_WORK = 3'd3;
parameter FAIL = 3'd4;
parameter FINISH = 3'd5;


wire [7:0] firstPose = RAMData[15:8];
wire [7:0] secondPose = RAMData[7:0];
wire [15:0] routeLine = (66'b1 << firstPose) | (66'b1 << secondPose);


reg [65:0] activePose;
reg [1033:0] activeEdge[0:9];
// reg [1033:0] edgeMask_Reg;


reg [3:0] maxLever;
reg [3:0] leverCnt;



always @(posedge CLK ) begin
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

		activePose <= (65'b1 << startPose);
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

		activePose <= (65'b1 << endPose);
	end

	else if ( state == FORWARD_WORK) begin

		if ( ramAddress <= 11'd1034 ) begin

			leverCnt <= leverCnt;
			ramAddress <= ramAddress + 11'd1;

			if ( edgeMask_Reg[ramAddress] != 1'b1 ) begin //this edge has passed the collision check

				if ( (^(activePose & routeLine)) == 1'b1 ) begin //this edge can connect，and the connected pose is not active
					
					activePose <= activePose | routeLine;//mark the pose to 1 to active it			
					activeEdge[leverCnt] <= activeEdge[leverCnt] | (1034'b1 << ramAddress);//do not check this edge in the forward state //(prevent anti-flow)
				end
				else begin
				end
			end
			else begin
			end
		end
		else begin//�?层扫完了 ramAddress > 11'd1034
			leverCnt <= leverCnt + 1'd1;
			ramAddress <= 0;
		end
	end

	else if (state == BACKWARD_WORK)  begin
		
		if ( ramAddress <= 11'd1034 ) begin

			leverCnt <= leverCnt;
			ramAddress <= ramAddress + 11'd1;

			if ( edgeMask_Reg[ramAddress] != 1'b1 ) begin //this edge has passed the collision check

				if ( (^(activePose & routeLine)) == 1'b1 ) begin //this edge can connect，and the connected pose is not active
					
					activePose <= activePose | routeLine;//mark the pose to 1 to active it
	
					leverCnt <= leverCnt + 1'd1;

					ramAddress <= 11'd0;
					selectEdge[leverCnt*11+:11] <= ramAddress;

				end
				else begin
				end
			end
			else begin
			end
		end
		else begin//�?层扫完了 ramAddress > 11'd1034
		end
	end

end



//state INIT FORWARD BACKWARD 
always @(negedge CLK) begin
	if (!RST_n) begin
		maxLever <= 4'd10;
		state <= FORWARD_INIT;
		
	end


	else if ( state == FORWARD_INIT ) begin
		maxLever <= 4'd10;

		edgeMask_Reg[1033:0] <= edgeMask[1033:0];

		if ( control == 3'b010  ) begin
			state <= FORWARD_WORK;
		end

	end

	else if (state == FORWARD_WORK) begin
		if( (activePose >> endPose) & 1'B1 == 1 ) begin
			state <= BACKWARD_INIT;
			edgeMask_Reg <= edgeMask_Reg | 
							~( activeEdge[0] | activeEdge[1] | activeEdge[2] | activeEdge[3]
							| activeEdge[4] | activeEdge[5] | activeEdge[6] | activeEdge[7]
							| activeEdge[8] | activeEdge[9] );	//only active edge in forward would be considered
			maxLever <= leverCnt;	//only 
			
		end
		else begin
			state <= FORWARD_WORK;
		end

		if ( leverCnt == maxLever ) begin

			state <= FAIL;

		end // if ( leverCnt == maxLever )
	end

	else if ( state == BACKWARD_INIT )begin
		if ( control == 3'b100 ) begin
			state <= BACKWARD_WORK;
		end
	end

	else if ( state == BACKWARD_WORK )begin
		if ( leverCnt == maxLever ) begin

			state <= FINISH;
		end
	end

	else begin//idle


	end


end

endmodule

