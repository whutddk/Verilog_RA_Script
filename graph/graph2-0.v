
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
// 	activepose	& with edge (only 2 active pose)  used to connect the graph ,
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

);


//state Ram:0-1024
//state lever 0-10
always @(posedge CLK or !RST_n) begin
	if (!RST_n) begin
		// reset		
	end
	else if ( state == INIT ) begin
		RAM_address <= 10'd0;
	end

	// else if ( state == IDEL ) begin
	// end // else if ( state == IDEL )

	if (state == BACKWARD) begin
		poseLeverCnt <= poseLeverCnt + 1'd1;

		RAM_address <= 0;
		OUTPUT !
	end

	else if ( state == FORWARD )begin
		if ( RAM_address == 10'd1034 ) begin
			RAM_address <= 10'd0;
			if ( poseLeverCnt < maxLever ) begin
				poseLeverCnt <= poseLeverCnt + 4'd1;
			end 
			else begin
				poseLeverCnt <= 4'd0;
			end 
		end
		else begin
			RAM_address <= RAM_address + 10'd1;
		end
	end
end



always @(posedge CLK or !RST_n) begin
	if (!RST_n) begin
		// reset
		
	end

	else if ( state == INIT )begin

		RAM_address <= 10'd0;
	end // else if ( state == INIT )

	else if ( (state == FORWARD) || (state == BACKWARD) ) begin
		if ( poseLeverCnt < maxLever ) begin
			if ( RAM_address <= 11'd1034 ) begin

				poseLeverCnt <= poseLeverCnt;
				RAM_address <= RAM_address + 11'd1;

				if ( edgeMask_reg[RAM_address] != 1'b1 ) begin //当前边可用
					if ( ((ActivePose & RAM_routeLine) ^) == 1'b1 ) begin //当前边满足要求，且激活点不重复
						edgeActive[poseLeverCnt] <= edgeActive[poseLeverCnt] | (1034'b1 << RAM_address);//之后不再查这条边
						ActivePose <= ActivePose | RAM_routeLine;//激活这个点

						if ( state == BACKWARD ) begin
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

end



//state INIT FORWARD BACKWARD 
always @(negedge CLK or !RST_n) begin
	if (!RST_n) begin
		// reset
		
	end
	else if ( state == INIT ) begin
		maxLever <= 4'D10;
		ActivePose <= (65'b1 << startPoint);
		edgeMask_reg[1033:0] <= edgeMask[1033:0];

		edgeActive[0] <= 1034'b0;
		edgeActive[1] <= 1034'b0;
		edgeActive[2] <= 1034'b0;
		edgeActive[3] <= 1034'b0;
		edgeActive[4] <= 1034'b0;
		edgeActive[5] <= 1034'b0;
		edgeActive[6] <= 1034'b0;
		edgeActive[7] <= 1034'b0;
		edgeActive[8] <= 1034'b0;
		edgeActive[9] <= 1034'b0;


		state <= FORWARD;

	end

	else if (state == FORWARD) begin
		if( (ActivePose >> endpoint) & 1'B1 == 1 ) begin
			state <= BACKWARD;
			edgeMask_reg <= edgeMask_reg | 
							~( edgeActive[0] | edgeActive[1] | edgeActive[2] | edgeActive[3]
							| edgeActive[4] | edgeActive[5] | edgeActive[6] | edgeActive[7]
							| edgeActive[8] | edgeActive[9] );	//only active edge in forward would be considered
			maxLever <= poseLeverCnt;	//only 
			ActivePose <= (65'b1 << ENDPoint);
		end

		if ( poseLeverCnt == maxLever ) begin

			__ERROR__

		end // if ( poseLeverCnt == maxLever )

		else begin
			state <= FORWARD;
		end

	end

	else if ( state == BACKWARD )begin
		
	end

	else begin//idle


	end


end

endmodule

