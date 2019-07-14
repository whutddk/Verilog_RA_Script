//////////////////////////////////////////////////////////////////////////////////
// Company:   WUT
// Engineer: Ruige_Lee
// Create Date: 2019-07-14 15:47:09
// Last Modified by:   Ruige_Lee
// Last Modified time: 2019-07-14 16:19:43
// Email: 295054118@whut.edu.cn
// page: https://whutddk.github.io/
// Design Name:   
// Module Name: collideUnit
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
//
//////////////////////////////////////////////////////////////////////////////////


module collideUnit (
	input CLK,    // Clock
	input RST_n,  // Asynchronous reset active low
	
	input clear,
	input [8191:0] oneGridState,


	output reg [8191:0] edgeState


);


always@ ( posedge CLK ) begin
	if ( !RST_n or clear ) begin
		edgeState <= 8192'b0;
	end

	else begin
		edgeState <= edgeState | oneGridState;
	end

end







endmodule

