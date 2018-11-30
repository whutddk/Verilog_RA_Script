
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

reg flattenSearchButton = 1'b0;
wire  [63:0] Point_wire;
reg [63:0] PointStart
reg [1023:0] activeRoute_Positive;
reg [1023:0] activeRoute_Negedge;


always @(negedge clk ) begin
	if (!RST_n) begin
		PointStart[startPoint] <= 1'b1;
	end
	else begin



	end
end

assign complete = Point_wire[endpoint];

// assign Activeroute0 = Point[] | Point[] | Point[];
assign Point_wire[0] = Activeroute[] | Activeroute[] | Activeroute[] | ... | PointStart[0];
assign 
....
assign Point_wire[64] = ;

//edge 0
always @(posedge CLK ) begin
	if (RST_n ) begin
		// reset
		
	end
	else begin
		if ( complete == 1'b0 )begin
			Activeroute[0] <= Point_wire[];
			Activeroute[] <= Point_wire[];
			Activeroute[] <= Point_wire[];
			Activeroute[] <= Point_wire[];
			Activeroute[] <= Point_wire[];
			Activeroute[] <= Point_wire[];
			Activeroute[] <= Point_wire[];
			Activeroute[] <= Point_wire[];
			Activeroute[] <= Point_wire[];
			Activeroute[] <= Point_wire[];
			Activeroute[] <= Point_wire[];
			Activeroute[] <= Point_wire[];
			Activeroute[] <= Point_wire[];
			....2048...
			Activeroute[2047] <= Point_wire[];

		end
		else begin//(complete == 0)
			{

			}
		end

	end
		
	end
end

//edge1


endmodule


//本身就是双向的传输


