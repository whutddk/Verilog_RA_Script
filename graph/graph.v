
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
	input [1023:0] edgeMask,
	input [2:0] state,
	input [7:0] startPoint,
	input [7:0] endpoint,


	output [10:0] activeRoute
)

// reg flattenSearchButton = 1'b0;

wire  [63:0] Point_wire;
reg [63:0] Pointstart_reg;
reg [1023:0] activeRoute_Positive;
reg [1023:0] activeRoute_Negedge;


always @(negedge clk ) begin
	if (!RST_n) begin
		
	end
	else begin
		if ( INIT )begin
			Pointstart_reg[63:0] = 64'b0;
			Pointstart_reg[startPoint] <= 1'b1;
			edgeMask_Posedge_reg[1023:0] <= edgeMask[1023:0];
			edgeMask_Negedge_reg[1023:0] <= edgeMask[1023:0];
		end

		else if ( anti_Flow ) begin
			Pointstart_reg[endPoint] <= 1'b1;
			edgeMask_Posedge_reg[1023:0] <= edgeMask[1023:0] | ~activeRoute_Positive[1023:0];
			edgeMask_Negedge_reg[1023:0] <= edgeMask[1023:0] | ~activeRoute_Negedge[1023:0];
		end



	end
end

assign complete = Point_wire[endpoint];

// assign Activeroute0 = Point[] | Point[] | Point[];
assign Point_wire[0] = Activeroute[] | Activeroute[] | Activeroute[] | ... | Pointstart_reg[0];
assign 
....
assign Point_wire[64] = ;

//edge 0
always @(posedge CLK ) begin
	if (!RST_n ) begin
		// reset	
	end
	else if ( complete == 1'b0 && activeRoute_Negedge[0] == 1'b0 && edgeMask_Posedge_reg[0] != 1'b1 )begin
			Activeroute_Positive[0] <= Point_wire[];
	end
	else begin//(complete == 0)

	end


		
	end
end

//edge0 
always @(negedge CLK) begin
	if ( !RST_n )begin
		
	end
	else if ( complete == 1'b0 && activeRoute_Positive[0] == 1'b0 && edgeMask_Negedge)reg[0] != 1'b1)begin
		activeRoute_Negedge[0] <= Point_wire[];
		
	end
end


endmodule


//本身就是双向的传输


