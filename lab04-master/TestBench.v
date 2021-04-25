`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:29:15 10/17/2019
// Design Name:   BancoRegistro
// Module Name:   C:/Users/UECCI/Documents/GitHub/SPARTAN6-ATMEGA-MAX5864/lab/lab07-BancosRgistro/bancoreg/src/TestBench.v
// Project Name:  lab07-BancosRgistro
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BancoRegistro
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestBench;

	// Inputs
	reg [2:0] addrRa;
	reg [2:0] addrRb;
	reg [2:0] addrW;
	reg [3:0] datW;
	reg RegWrite;
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] datOutRa;
	wire [3:0] datOutRb;
	//wire [6:0] SsegR;
	//wire [3:0] anR;

	// Instantiate the Unit Under Test (UUT)
	BancoRegistro uut (
		.addrRa(addrRa), 
		.addrRb(addrRb), 
		.datOutRa(datOutRa), 
		.datOutRb(datOutRb), 
		.addrW(addrW), 
		.datW(datW), 
		.RegWrite(RegWrite), 
		.clk1(clk), 
		.rst1(rst)
	//	.SsegR(SsegR),
		//.anR(anR)
	);

	initial begin
		// Initialize Inputs
		addrRa = 0;
		addrRb = 0;
		addrW = 0;
		datW = 0;
		RegWrite = 0;
		clk = 0;
		rst = 1;
		
		// Wait 100 ns for global reset to finish
		#10;
		
      for (addrW = 0; addrW < 8; addrW = addrW + 1) begin
			datW = addrW;
			#5 RegWrite = 1;
			#5 RegWrite = 0;
			addrRa=addrW;
			addrRb=addrW;
			#5;
    end
		
      for (addrRa = 0; addrRa < 8; addrRa = addrRa + 1) begin
			#5 addrRb=addrRa+8;
			 $display("el valor de registro %d =  %d y %d = %d", addrRa,datOutRa,addrRb,datOutRb) ;
    end
	 
		
		
	end
	
	always #1 clk = ~clk;
	
      initial begin: TEST_CASE
     $dumpfile("bancoregistro_TB.vcd");
     #(220) $finish;
		end
endmodule

