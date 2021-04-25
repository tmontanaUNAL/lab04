`timescale 1ns / 1ps
// este modulo es la caja negra que convierte el numero HEX de 4 digitos y lo muestra en 4 displays
// usando visualización dinámica.
module display(
    input [7:0] num, // numero a mostrar
    input clk, // reloj
    output [6:0] sseg, // salidas hacia los displays
    output reg [3:0] an, // indica que display esta encendido por medio de su anodo
	 input rst // si es 1 resetea el dispositivo
    );



reg [3:0]bcd=0; // registro que solo puede guardar un digito del numero de entrada
//wire [15:0] num=16'h4321;

BCDtoSSeg bcdtosseg(.BCD(bcd), .SSeg(sseg)); // instanciacion del conversor BCD se un digito

reg [26:0] cfreq=0; // aqui se guarda la frecuencia
wire enable; // activa la visualizacion dinamica cada vez que se hace 1

// Divisor de frecuecia

assign enable = cfreq[16]; // se selecciona la frecuencia deseada luego de dividirla
always @(posedge clk) begin // se activa cada vez que se ecuentre el flanco de subida del reloj
  if(rst==0) begin // reseteo si el reset esta en 1
		cfreq <= 0; // se resetea la frecuencia a 0
	end else begin
		cfreq <=cfreq+1; // le sumo 1 al registro de la frecuencia
	end
end

// Esta parte hace que el resultado se muestre en decimal

wire[3:0] dig_unia;
wire[3:0] dig_deca;
wire[3:0] dig_unib;
wire[3:0] dig_decb;

assign dig_unia=num[3:0] % 10;
assign dig_deca=(num[3:0]/10) % 10;
assign dig_unib=num[7:4] % 10;
assign dig_decb=(num[7:4]/10) % 10;



// Seleccion del anodo y del digito

reg [1:0]count=0; // contador que me indicara el display a activar

always @(posedge enable) begin // se activa cada vez que se ecuentre el flanco de subida del reloj
		if(rst==0) begin // reseteo si el reset esta en 1
			count<= 0; // se resetea el contador
			an<=3'b11; // se apagan todos los displays
		end else begin 
			count<= count+1; // se le suma 1 al contador
			case (count) // dependiendo del contador se activa un display distinto y muestra su
						// digito correspondiente
				2'h0: begin bcd <= dig_unia; an<=4'b1110; end
				2'h1: begin bcd <= dig_deca; an<=4'b1101; end	
				2'h2: begin bcd <= dig_unib; an<=4'b1011; end
				2'h3: begin bcd <= dig_decb; an<=4'b0111; end
			endcase
		end
end

endmodule
