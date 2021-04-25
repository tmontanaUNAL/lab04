`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:55:28 10/12/2019 
// Design Name: 	 ferney alberto beltran
// Module Name:    BancoRegistro 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module BancoRegistro #(      		 //   #( Parametros
         parameter BIT_ADDR = 3,  //   BIT_ADDR Número de bit para la dirección
         parameter BIT_DATO = 4  //  BIT_DATO  Número de bit para el dato
	)
	(
    input [BIT_ADDR-1:0] addrRa,
    input [BIT_ADDR-1:0] addrRb,
    
	 output [BIT_DATO-1:0] datOutRa,
    output [BIT_DATO-1:0] datOutRb,
    
	 input [BIT_ADDR-1:0] addrW,
    input [BIT_DATO-1:0] datW,
    
	 input RegWrite,
    input clk1,
    input rst1,
	 
	 output [6:0] SsegR,
	 output reg [3:0] anR
    );
	 
	

// La cantdiad de registros es igual a: 
localparam NREG = 2 ** BIT_ADDR;

wire [7:0] datOutR;

  
//configiración del banco de registro
reg [BIT_DATO-1: 0] breg [NREG-1:0];


assign  datOutRa = breg[addrRa];
assign  datOutRb = breg[addrRb];

assign  datOutR [3:0] =datOutRa[3:0];
assign  datOutR [7:4] =datOutRb[3:0];

initial
begin
$readmemh("Reg16.men",breg );
end

integer i;

always @(posedge clk1) begin
  if (RegWrite == 1)begin
     breg[addrW] = datW;
	  end
  
  if (rst1==0)begin
	  for(i=0;i<8 ; i=i+1)begin
	  breg[i]=i;
	  end
	 end
  end
  




// Implementacion display


display disR(.num(datOutR), .clk(clk1), .sseg(SsegR), .an(anR), .rst(rst1));

endmodule

