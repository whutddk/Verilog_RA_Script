
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


)


reg [65:0] ActivePose = 66'b0;




always @(posedge clk or posedge rst) begin
	if (rst) begin
		// reset
		
	end
	else if (INIT) begin
		
	end
	else if ( forward )begin
		
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

