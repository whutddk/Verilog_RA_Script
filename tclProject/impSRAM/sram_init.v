//////////////////////////////////////////////////////////////////////////////////
// Company:   
// Engineer: Ruige_Lee
// Create Date: 2019-03-05 16:30:05
// Last Modified by:   Ruige_Lee
// Last Modified time: 2019-03-05 17:29:10
// Email: 295054118@whut.edu.cn
// Design Name:   
// Module Name: sram_init
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

module sram_init (
	input CLK,    // Clock
	input RSTn,  // Asynchronous reset active low
	
	input enable,
	input [31:0] data,

	output reg [18:0] SRAM_ADDR_Stream,
	output reg [31:0] SRAM_DATA_IN_Stream
);

reg [1:0] selCnt;
reg [31:0] data_out;

always @(posedge CLK)begin

	if (!RSTn) begin
		SRAM_ADDR_Stream <= 19'b0;
		SRAM_DATA_IN_Stream  <= 32'b0;
		selCnt <= 2'b0;
		data_out <= 32'd0;
	end
	else begin
		if ( enable == 1'b0 ) begin 
			SRAM_ADDR_Stream <= 19'b0;
			SRAM_DATA_IN_Stream  <= 32'b0;
			selCnt <= 2'b0;
			data_out <= 32'd0;
		end

		else begin
			
			case (selCnt)
				2'b00:begin
//					selCnt <= 2'b01;
					SRAM_ADDR_Stream <= SRAM_ADDR_Stream;
					SRAM_DATA_IN_Stream <= data_out;
					data_out <= data;
				end
//				2'b01:begin
//					selCnt <= 2'b10;
//					SRAM_ADDR_Stream <= SRAM_ADDR_Stream;
//					SRAM_DATA_IN_Stream <= SRAM_DATA_IN_Stream;
//					data_out <= (data_out << 32 | (data));
//				end
//				2'b10:begin
//					selCnt <= 2'b11;
//					SRAM_ADDR_Stream <= SRAM_ADDR_Stream;
//					SRAM_DATA_IN_Stream <= SRAM_DATA_IN_Stream;
//					data_out <= (data_out << 32 | (data));
//				end
//				2'b01:begin
//					selCnt <= 2'b00;
//					SRAM_ADDR_Stream <= SRAM_ADDR_Stream + 19'd1;
//					SRAM_DATA_IN_Stream <= SRAM_DATA_IN_Stream;
//					data_out <= (data_out << 32 | (data));
//				end
			endcase // selCnt

		end
	end
end



endmodule



