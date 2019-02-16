
//////////////////////////////////////////////////////////////////////////////////
// Company:    
// Engineer: 29505
// Create Date: 2019-02-13 11:04:50
// Last Modified by:   29505
// Last Modified time: 2019-02-16 08:09:35
// Email: 295054118@whut.edu.cn
// Design Name: prm_chk_v1_0_S00_AXI.v  
// Module Name:  
// Project Name:  
// Target Devices:  
// Tool Versions:  
// Description:  
// 
// Dependencies:   
// 
// Revision:  
// Revision  
// Additional Comments:   
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns / 1 ps

	module prm_chk_v1_0_S00_AXI #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		// Width of S_AXI address bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 8
	)
	(
		// Users to add ports here
		output [3:0] x,
		output [4:0] y,
		output [4:0] z,

		input [511:0] edge_mask_512p0,
		input [511:0] edge_mask_512p1,
		input [511:0] edge_mask_512p2,
		input [511:0] edge_mask_512p3,
		input [511:0] edge_mask_512p4,
		input [511:0] edge_mask_512p5,
		input [511:0] edge_mask_512p6,
		input [511:0] edge_mask_512p7,

		// User ports ends
		// Do not modify the ports beyond this line

		// Global Clock Signal
		input wire  S_AXI_ACLK,
		// Global Reset Signal. This Signal is Active LOW
		input wire  S_AXI_ARESETN,
		// Write address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
		// Write channel Protection type. This signal indicates the
			// privilege and security level of the transaction, and whether
			// the transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_AWPROT,
		// Write address valid. This signal indicates that the master signaling
			// valid write address and control information.
		input wire  S_AXI_AWVALID,
		// Write address ready. This signal indicates that the slave is ready
			// to accept an address and associated control signals.
		output wire  S_AXI_AWREADY,
		// Write data (issued by master, acceped by Slave) 
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
		// Write strobes. This signal indicates which byte lanes hold
			// valid data. There is one write strobe bit for each eight
			// bits of the write data bus.    
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
		// Write valid. This signal indicates that valid write
			// data and strobes are available.
		input wire  S_AXI_WVALID,
		// Write ready. This signal indicates that the slave
			// can accept the write data.
		output wire  S_AXI_WREADY,
		// Write response. This signal indicates the status
			// of the write transaction.
		output wire [1 : 0] S_AXI_BRESP,
		// Write response valid. This signal indicates that the channel
			// is signaling a valid write response.
		output wire  S_AXI_BVALID,
		// Response ready. This signal indicates that the master
			// can accept a write response.
		input wire  S_AXI_BREADY,
		// Read address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
		// Protection type. This signal indicates the privilege
			// and security level of the transaction, and whether the
			// transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_ARPROT,
		// Read address valid. This signal indicates that the channel
			// is signaling valid read address and control information.
		input wire  S_AXI_ARVALID,
		// Read address ready. This signal indicates that the slave is
			// ready to accept an address and associated control signals.
		output wire  S_AXI_ARREADY,
		// Read data (issued by slave)
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
		// Read response. This signal indicates the status of the
			// read transfer.
		output wire [1 : 0] S_AXI_RRESP,
		// Read valid. This signal indicates that the channel is
			// signaling the required read data.
		output wire  S_AXI_RVALID,
		// Read ready. This signal indicates that the master can
			// accept the read data and response information.
		input wire  S_AXI_RREADY
	);

	// AXI4LITE signals
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg  	axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
	reg  	axi_rvalid;

	// Example-specific design signals
	// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	// ADDR_LSB is used for addressing 32/64 bit registers/memories
	// ADDR_LSB = 2 for 32 bits (n downto 2)
	// ADDR_LSB = 3 for 64 bits (n downto 3)
	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
	localparam integer OPT_MEM_ADDR_BITS = 5;
	//----------------------------------------------
	//-- Signals for user logic register space example
	//------------------------------------------------
	//-- Number of Slave Registers 50
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg0;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg1;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg2;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg3;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg4;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg5;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg6;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg7;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg8;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg9;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg10;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg11;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg12;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg13;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg14;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg15;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg16;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg17;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg18;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg19;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg20;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg21;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg22;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg23;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg24;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg25;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg26;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg27;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg28;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg29;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg30;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg31;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg32;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg33;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg34;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg35;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg36;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg37;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg38;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg39;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg40;
	// reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg41;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg42;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg43;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg44;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg45;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg46;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg47;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg48;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg49;
	wire	 slv_reg_rden;
	wire	 slv_reg_wren;
	reg [C_S_AXI_DATA_WIDTH-1:0]	 reg_data_out;
	integer	 byte_index;
	reg	 aw_en;

/******************************user register***************************/
	reg [511:0] availableEdge;
/******************************user register***************************/


	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	= axi_rdata;
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RVALID	= axi_rvalid;
	// Implement axi_awready generation
	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	// de-asserted when reset is low.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
		begin
		  axi_awready <= 1'b0;
		  aw_en <= 1'b1;
		end 
	  else
		begin    
		  if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
			begin
			  // slave is ready to accept write address when 
			  // there is a valid write address and write data
			  // on the write address and data bus. This design 
			  // expects no outstanding transactions. 
			  axi_awready <= 1'b1;
			  aw_en <= 1'b0;
			end
			else if (S_AXI_BREADY && axi_bvalid)
				begin
				  aw_en <= 1'b1;
				  axi_awready <= 1'b0;
				end
		  else           
			begin
			  axi_awready <= 1'b0;
			end
		end 
	end       

	// Implement axi_awaddr latching
	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
		begin
		  axi_awaddr <= 0;
		end 
	  else
		begin    
		  if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
			begin
			  // Write Address latching 
			  axi_awaddr <= S_AXI_AWADDR;
			end
		end 
	end       

	// Implement axi_wready generation
	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
		begin
		  axi_wready <= 1'b0;
		end 
	  else
		begin    
		  if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID && aw_en )
			begin
			  // slave is ready to accept write data when 
			  // there is a valid write address and write data
			  // on the write address and data bus. This design 
			  // expects no outstanding transactions. 
			  axi_wready <= 1'b1;
			end
		  else
			begin
			  axi_wready <= 1'b0;
			end
		end 
	end       

	// Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
	// and the slave is ready to accept the write address and write data.
	assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
		begin
		  slv_reg0 <= 0;
		  slv_reg1 <= 0;
		  slv_reg2 <= 0;
		  slv_reg3 <= 0;
		  slv_reg4 <= 0;
		  slv_reg5 <= 0;
		  slv_reg6 <= 0;
		  slv_reg7 <= 0;
		  slv_reg8 <= 0;
		  slv_reg9 <= 0;
		  // slv_reg10 <= 0;
		  // slv_reg11 <= 0;
		  // slv_reg12 <= 0;
		  // slv_reg13 <= 0;
		  // slv_reg14 <= 0;
		  // slv_reg15 <= 0;
		  // slv_reg16 <= 0;
		  // slv_reg17 <= 0;
		  // slv_reg18 <= 0;
		  // slv_reg19 <= 0;
		  // slv_reg20 <= 0;
		  // slv_reg21 <= 0;
		  // slv_reg22 <= 0;
		  // slv_reg23 <= 0;
		  // slv_reg24 <= 0;
		  // slv_reg25 <= 0;
		  // slv_reg26 <= 0;
		  // slv_reg27 <= 0;
		  // slv_reg28 <= 0;
		  // slv_reg29 <= 0;
		  // slv_reg30 <= 0;
		  // slv_reg31 <= 0;
		  // slv_reg32 <= 0;
		  // slv_reg33 <= 0;
		  // slv_reg34 <= 0;
		  // slv_reg35 <= 0;
		  // slv_reg36 <= 0;
		  // slv_reg37 <= 0;
		  // slv_reg38 <= 0;
		  // slv_reg39 <= 0;
		  // slv_reg40 <= 0;
		  // slv_reg41 <= 0;
		  slv_reg42 <= 0;
		  slv_reg43 <= 0;
		  slv_reg44 <= 0;
		  slv_reg45 <= 0;
		  slv_reg46 <= 0;
		  slv_reg47 <= 0;
		  slv_reg48 <= 0;
		  slv_reg49 <= 0;
		end 
	  else begin
		if (slv_reg_wren)
		  begin
			case ( axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
			  6'h00:
				for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				  if ( S_AXI_WSTRB[byte_index] == 1 ) begin
					// Respective byte enables are asserted as per write strobes 
					// Slave register 0
					slv_reg0[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				  end  
			  6'h01:
				for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				  if ( S_AXI_WSTRB[byte_index] == 1 ) begin
					// Respective byte enables are asserted as per write strobes 
					// Slave register 1
					slv_reg1[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				  end  
			  6'h02:
				for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				  if ( S_AXI_WSTRB[byte_index] == 1 ) begin
					// Respective byte enables are asserted as per write strobes 
					// Slave register 2
					slv_reg2[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				  end  
			  6'h03:
				for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				  if ( S_AXI_WSTRB[byte_index] == 1 ) begin
					// Respective byte enables are asserted as per write strobes 
					// Slave register 3
					slv_reg3[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				  end  
			  6'h04:
				for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				  if ( S_AXI_WSTRB[byte_index] == 1 ) begin
					// Respective byte enables are asserted as per write strobes 
					// Slave register 4
					slv_reg4[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				  end  
			  6'h05:
				for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				  if ( S_AXI_WSTRB[byte_index] == 1 ) begin
					// Respective byte enables are asserted as per write strobes 
					// Slave register 5
					slv_reg5[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				  end  
			  6'h06:
				for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				  if ( S_AXI_WSTRB[byte_index] == 1 ) begin
					// Respective byte enables are asserted as per write strobes 
					// Slave register 6
					slv_reg6[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				  end  
			  6'h07:
				for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				  if ( S_AXI_WSTRB[byte_index] == 1 ) begin
					// Respective byte enables are asserted as per write strobes 
					// Slave register 7
					slv_reg7[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				  end  
			  6'h08:
				for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				  if ( S_AXI_WSTRB[byte_index] == 1 ) begin
					// Respective byte enables are asserted as per write strobes 
					// Slave register 8
					slv_reg8[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				  end  
			  6'h09:
				for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				  if ( S_AXI_WSTRB[byte_index] == 1 ) begin
					// Respective byte enables are asserted as per write strobes 
					// Slave register 9
					slv_reg9[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				  end  
			 //  6'h0A:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 10
				// 	slv_reg10[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h0B:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 11
				// 	slv_reg11[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h0C:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 12
				// 	slv_reg12[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h0D:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 13
				// 	slv_reg13[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h0E:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 14
				// 	slv_reg14[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h0F:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 15
				// 	slv_reg15[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h10:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 16
				// 	slv_reg16[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h11:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 17
				// 	slv_reg17[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h12:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 18
				// 	slv_reg18[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h13:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 19
				// 	slv_reg19[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h14:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 20
				// 	slv_reg20[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h15:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 21
				// 	slv_reg21[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h16:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 22
				// 	slv_reg22[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h17:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 23
				// 	slv_reg23[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h18:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 24
				// 	slv_reg24[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h19:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 25
				// 	slv_reg25[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h1A:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 26
				// 	slv_reg26[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h1B:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 27
				// 	slv_reg27[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h1C:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 28
				// 	slv_reg28[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h1D:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 29
				// 	slv_reg29[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h1E:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 30
				// 	slv_reg30[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h1F:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 31
				// 	slv_reg31[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h20:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 32
				// 	slv_reg32[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h21:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 33
				// 	slv_reg33[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h22:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 34
				// 	slv_reg34[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h23:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 35
				// 	slv_reg35[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h24:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 36
				// 	slv_reg36[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h25:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 37
				// 	slv_reg37[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h26:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 38
				// 	slv_reg38[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h27:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 39
				// 	slv_reg39[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h28:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 40
				// 	slv_reg40[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			 //  6'h29:
				// for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				//   if ( S_AXI_WSTRB[byte_index] == 1 ) begin
				// 	// Respective byte enables are asserted as per write strobes 
				// 	// Slave register 41
				// 	slv_reg41[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				//   end  
			  6'h2A:
				for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				  if ( S_AXI_WSTRB[byte_index] == 1 ) begin
					// Respective byte enables are asserted as per write strobes 
					// Slave register 42
					slv_reg42[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				  end  
			  6'h2B:
				for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				  if ( S_AXI_WSTRB[byte_index] == 1 ) begin
					// Respective byte enables are asserted as per write strobes 
					// Slave register 43
					slv_reg43[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				  end  
			  6'h2C:
				for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				  if ( S_AXI_WSTRB[byte_index] == 1 ) begin
					// Respective byte enables are asserted as per write strobes 
					// Slave register 44
					slv_reg44[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				  end  
			  6'h2D:
				for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				  if ( S_AXI_WSTRB[byte_index] == 1 ) begin
					// Respective byte enables are asserted as per write strobes 
					// Slave register 45
					slv_reg45[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				  end  
			  6'h2E:
				for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				  if ( S_AXI_WSTRB[byte_index] == 1 ) begin
					// Respective byte enables are asserted as per write strobes 
					// Slave register 46
					slv_reg46[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				  end  
			  6'h2F:
				for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				  if ( S_AXI_WSTRB[byte_index] == 1 ) begin
					// Respective byte enables are asserted as per write strobes 
					// Slave register 47
					slv_reg47[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				  end  
			  6'h30:
				for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				  if ( S_AXI_WSTRB[byte_index] == 1 ) begin
					// Respective byte enables are asserted as per write strobes 
					// Slave register 48
					slv_reg48[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				  end  
			  6'h31:
				for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
				  if ( S_AXI_WSTRB[byte_index] == 1 ) begin
					// Respective byte enables are asserted as per write strobes 
					// Slave register 49
					slv_reg49[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
				  end  
			  default : begin
						  slv_reg0 <= slv_reg0;
						  slv_reg1 <= slv_reg1;
						  slv_reg2 <= slv_reg2;
						  slv_reg3 <= slv_reg3;
						  slv_reg4 <= slv_reg4;
						  slv_reg5 <= slv_reg5;
						  slv_reg6 <= slv_reg6;
						  slv_reg7 <= slv_reg7;
						  slv_reg8 <= slv_reg8;
						  slv_reg9 <= slv_reg9;
						  // slv_reg10 <= slv_reg10;
						  // slv_reg11 <= slv_reg11;
						  // slv_reg12 <= slv_reg12;
						  // slv_reg13 <= slv_reg13;
						  // slv_reg14 <= slv_reg14;
						  // slv_reg15 <= slv_reg15;
						  // slv_reg16 <= slv_reg16;
						  // slv_reg17 <= slv_reg17;
						  // slv_reg18 <= slv_reg18;
						  // slv_reg19 <= slv_reg19;
						  // slv_reg20 <= slv_reg20;
						  // slv_reg21 <= slv_reg21;
						  // slv_reg22 <= slv_reg22;
						  // slv_reg23 <= slv_reg23;
						  // slv_reg24 <= slv_reg24;
						  // slv_reg25 <= slv_reg25;
						  // slv_reg26 <= slv_reg26;
						  // slv_reg27 <= slv_reg27;
						  // slv_reg28 <= slv_reg28;
						  // slv_reg29 <= slv_reg29;
						  // slv_reg30 <= slv_reg30;
						  // slv_reg31 <= slv_reg31;
						  // slv_reg32 <= slv_reg32;
						  // slv_reg33 <= slv_reg33;
						  // slv_reg34 <= slv_reg34;
						  // slv_reg35 <= slv_reg35;
						  // slv_reg36 <= slv_reg36;
						  // slv_reg37 <= slv_reg37;
						  // slv_reg38 <= slv_reg38;
						  // slv_reg39 <= slv_reg39;
						  // slv_reg40 <= slv_reg40;
						  // slv_reg41 <= slv_reg41;
						  slv_reg42 <= slv_reg42;
						  slv_reg43 <= slv_reg43;
						  slv_reg44 <= slv_reg44;
						  slv_reg45 <= slv_reg45;
						  slv_reg46 <= slv_reg46;
						  slv_reg47 <= slv_reg47;
						  slv_reg48 <= slv_reg48;
						  slv_reg49 <= slv_reg49;
						end
			endcase
		  end
	  end
	end    

	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
		begin
		  axi_bvalid  <= 0;
		  axi_bresp   <= 2'b0;
		end 
	  else
		begin    
		  if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
			begin
			  // indicates a valid write response is available
			  axi_bvalid <= 1'b1;
			  axi_bresp  <= 2'b0; // 'OKAY' response 
			end                   // work error responses in future
		  else
			begin
			  if (S_AXI_BREADY && axi_bvalid) 
				//check if bready is asserted while bvalid is high) 
				//(there is a possibility that bready is always asserted high)   
				begin
				  axi_bvalid <= 1'b0; 
				end  
			end
		end
	end   

	// Implement axi_arready generation
	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
		begin
		  axi_arready <= 1'b0;
		  axi_araddr  <= 32'b0;
		end 
	  else
		begin    
		  if (~axi_arready && S_AXI_ARVALID)
			begin
			  // indicates that the slave has acceped the valid read address
			  axi_arready <= 1'b1;
			  // Read address latching
			  axi_araddr  <= S_AXI_ARADDR;
			end
		  else
			begin
			  axi_arready <= 1'b0;
			end
		end 
	end       

	// Implement axi_arvalid generation
	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
		begin
		  axi_rvalid <= 0;
		  axi_rresp  <= 0;
		end 
	  else
		begin    
		  if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
			begin
			  // Valid read data is available at the read data bus
			  axi_rvalid <= 1'b1;
			  axi_rresp  <= 2'b0; // 'OKAY' response
			end   
		  else if (axi_rvalid && S_AXI_RREADY)
			begin
			  // Read data is accepted by the master
			  axi_rvalid <= 1'b0;
			end                
		end
	end    

	// Implement memory mapped register select and read logic generation
	// Slave register read enable is asserted when valid address is available
	// and the slave is ready to accept the read address.
	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
	always @(*)
	begin
		  // Address decoding for reading registers
		  case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
			6'h00   : reg_data_out <= slv_reg0;
			6'h01   : reg_data_out <= slv_reg1;
			6'h02   : reg_data_out <= slv_reg2;
			6'h03   : reg_data_out <= slv_reg3;
			6'h04   : reg_data_out <= slv_reg4;
			6'h05   : reg_data_out <= slv_reg5;
			6'h06   : reg_data_out <= slv_reg6;
			6'h07   : reg_data_out <= slv_reg7;
			6'h08   : reg_data_out <= slv_reg8;
			6'h09   : reg_data_out <= slv_reg9;
			6'h0A   : reg_data_out <= availableEdge[31:0];	//0
			6'h0B   : reg_data_out <= availableEdge[63:32];	//1
			6'h0C   : reg_data_out <= availableEdge[95:64];//2
			6'h0D   : reg_data_out <= availableEdge[127:96];//3
			6'h0E   : reg_data_out <= availableEdge[159:128];//4
			6'h0F   : reg_data_out <= availableEdge[191:160];//5
			6'h10   : reg_data_out <= availableEdge[223:192];//6
			6'h11   : reg_data_out <= availableEdge[255:224];//7
			6'h12   : reg_data_out <= availableEdge[287:256];//8
			6'h13   : reg_data_out <= availableEdge[319:288];//9
			6'h14   : reg_data_out <= availableEdge[351:320];//10
			6'h15   : reg_data_out <= availableEdge[383:352];//11
			6'h16   : reg_data_out <= availableEdge[415:384];//12
			6'h17   : reg_data_out <= availableEdge[447:416];//13
			6'h18   : reg_data_out <= availableEdge[479:448];//14
			6'h19   : reg_data_out <= availableEdge[511:480];//15
			6'h1A   : reg_data_out <= 32'b0;
			6'h1B   : reg_data_out <= 32'b0;
			6'h1C   : reg_data_out <= 32'b0;
			6'h1D   : reg_data_out <= 32'b0;
			6'h1E   : reg_data_out <= 32'b0;
			6'h1F   : reg_data_out <= 32'b0;
			6'h20   : reg_data_out <= 32'b0;
			6'h21   : reg_data_out <= 32'b0;
			6'h22   : reg_data_out <= 32'b0;
			6'h23   : reg_data_out <= 32'b0;
			6'h24   : reg_data_out <= 32'b0;
			6'h25   : reg_data_out <= 32'b0;
			6'h26   : reg_data_out <= 32'b0;
			6'h27   : reg_data_out <= 32'b0;
			6'h28   : reg_data_out <= 32'b0;
			6'h29   : reg_data_out <= 32'b0;
			6'h2A   : reg_data_out <= 32'b0;
			6'h2B   : reg_data_out <= slv_reg43;
			6'h2C   : reg_data_out <= slv_reg44;
			6'h2D   : reg_data_out <= slv_reg45;
			6'h2E   : reg_data_out <= slv_reg46;
			6'h2F   : reg_data_out <= slv_reg47;
			6'h30   : reg_data_out <= slv_reg48;
			6'h31   : reg_data_out <= slv_reg49;
			default : reg_data_out <= 0;
		  endcase
	end

	// Output register or memory read data
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
		begin
		  axi_rdata  <= 0;
		end 
	  else
		begin    
		  // When there is a valid read address (S_AXI_ARVALID) with 
		  // acceptance of read address by the slave (axi_arready), 
		  // output the read dada 
		  if (slv_reg_rden)
			begin
			  axi_rdata <= reg_data_out;     // register read data
			end   
		end
	end    

	// Add user logic here


	// reg [3:0] inputX = 4'b0;
	// reg [4:0] inputY = 5'b0;
	// reg [4:0] inputZ = 5'b0;
    wire [13:0] inputIndex;
	wire [4095:0] outputMask_Wire;

	wire [4:0] edgeOutputSel;

	reg [4095:0] edgeResult;

	assign edgeOutputSel[4:0] = slv_reg2[4:0];

always @(*) begin
	case(edgeOutputSel)
	5'd0: availableEdge[511:0] <= edgeResult[511:0];
	5'd1: availableEdge[511:0] <= edgeResult[1023:512];
	5'd2: availableEdge[511:0] <= edgeResult[1535:1024];
	5'd3: availableEdge[511:0] <= edgeResult[2047:1536];
	5'd4: availableEdge[511:0] <= edgeResult[2559:2048];
	5'd5: availableEdge[511:0] <= edgeResult[3071:2560];
	5'd6: availableEdge[511:0] <= edgeResult[3583:3072];
	5'd7: availableEdge[511:0] <= edgeResult[4095:3584];
	default:availableEdge[511:0] <= 0;
	endcase
end

	always @ ( posedge S_AXI_ACLK ) begin

		if ( S_AXI_ARESETN == 1'b0 || slv_reg1[0] == 1'b1 ) begin
			edgeResult <= 4095'b0;
			// inputX <= 4'b0;
			// inputY <= 5'b0;
			// inputZ <= 5'b0;
		end // if ( S_AXI_ARESETN == 1'b0 )

		else begin
			edgeResult <= edgeResult | outputMask_Wire;

		end // else
	end // always @ ( posedge S_AXI_ACLK )


assign outputMask_Wire = {edge_mask_512p7,edge_mask_512p6,edge_mask_512p5,edge_mask_512p4,edge_mask_512p3,edge_mask_512p2,edge_mask_512p1,edge_mask_512p0};
assign {x,y,z} = inputIndex;


// prm_Logic_Ca_chk512p0 i_prm_LUT_chk_p0(
// 	.x(inputIndex[13:10]),
// 	.y(inputIndex[9:5]),
// 	.z(inputIndex[4:0]),
// 	.edge_mask_512p0(outputMask_Wire[511:0])
// );

// prm_Logic_Ca_chk512p1 i_prm_LUT_chk_p1(
// 	.x(inputIndex[13:10]),
// 	.y(inputIndex[9:5]),
// 	.z(inputIndex[4:0]),
// 	.edge_mask_512p1(outputMask_Wire[1023:512])
// );
// prm_Logic_Ca_chk512p2 i_prm_LUT_chk_p2(
// 	.x(inputIndex[13:10]),
// 	.y(inputIndex[9:5]),
// 	.z(inputIndex[4:0]),
// 	.edge_mask_512p2(outputMask_Wire[1535:1024])
// );
// prm_Logic_Ca_chk512p3 i_prm_LUT_chk_p3(
// 	.x(inputIndex[13:10]),
// 	.y(inputIndex[9:5]),
// 	.z(inputIndex[4:0]),
// 	.edge_mask_512p3(outputMask_Wire[2047:1536])
// );
// prm_Logic_Ca_chk512p4 i_prm_LUT_chk_p4(
// 	.x(inputIndex[13:10]),
// 	.y(inputIndex[9:5]),
// 	.z(inputIndex[4:0]),
// 	.edge_mask_512p4(outputMask_Wire[2559:2048])
// );
// prm_Logic_Ca_chk512p5 i_prm_LUT_chk_p5(
// 	.x(inputIndex[13:10]),
// 	.y(inputIndex[9:5]),
// 	.z(inputIndex[4:0]),
// 	.edge_mask_512p5(outputMask_Wire[3071:2560])
// );
// prm_Logic_Ca_chk512p6 i_prm_LUT_chk_p6(
// 	.x(inputIndex[13:10]),
// 	.y(inputIndex[9:5]),
// 	.z(inputIndex[4:0]),
// 	.edge_mask_512p6(outputMask_Wire[3583:3072])
// );
// prm_Logic_Ca_chk512p7 i_prm_LUT_chk_p7(
// 	.x(inputIndex[13:10]),
// 	.y(inputIndex[9:5]),
// 	.z(inputIndex[4:0]),
// 	.edge_mask_512p7(outputMask_Wire[4095:3584])
// );

// assign outputMask_Wire[4095:2048] = 2048'b0;
// assign outputMask_Wire[4095:1024] = 3072'b0;
// assign outputMask_Wire[4095:512] = 3584'b0;

genvar i;
generate 
for ( i = 0; i < 14;i=i+1 )  begin
BUFG BUFG_inst (
      .O(inputIndex[i]), // 1-bit output: Clock output
      .I(slv_reg0[i])  // 1-bit input: Clock input
   );
end
endgenerate

	// User logic ends

	endmodule
