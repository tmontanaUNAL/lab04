# lab04

Laboratorio 4 - Digital I

Fabián Garzón García

Tizzian Santiago Montana Saavedra

A continuacion vemos la simualacion del modulo de banco de registros, alli se escriben todos los registros con un numero distinto, tambien se va cambiando que registro mostrar a la salida.
![image](https://user-images.githubusercontent.com/80001669/115980234-aa6a6c00-a550-11eb-8a62-94e71bf01d0c.png)

Como vemos el modulo funciona correctamente, el dato ingresado por datW (dato a escribir) se escribe en el registro dado por addrW (dirección de escritura), esto solo cuando RegWrite (modo de escritura) se hace 1 y luego 0. Tambien se tiene, que en dato en los registros escogidos en addrRa y addrRb (registros a mostrar) se muestra en las salidas datOutRa y datOutRb (datos de salida).

En el siguiente link se encuentra el video con la prueba de la pre carga del archivo Reg16.men en los registros
https://drive.google.com/file/d/1HlK3wNaCD_jS01hjOm2OdKlFvDStWsC0/view?usp=sharing

En este video se evidencia que se ha cargado  el registro por defecto a la tarjeta FPGA , se muestra que los 3 primeros suich son los encargados de  seleccionan la posición de  los datos de la salida A , y los 3 siguientes son los encargados de seleccionar  el registro la salida B, estas salidas están conectadas a los display  1,2 y 2,3 con el fin de que muestren los datos de salida de cada una de las terminales. En el video se muestra en su respectivo display  el dato que está en cada registro seleccionado  , esto con el fin de confirmar que el registro se ha cargado de manera adecuada.

En el siguiente link se encuentra el video con la prueba de la escritura en los registros, y la prueba del reset.
https://drive.google.com/drive/folders/1bhNQM7DrkF3MeATaPM1nfGes1v6T-PVD

En este video se muestra inicialmente que el dato cargado en el registro que está en la posición 0 en le banco de registros es 15 , puesto que es el valor que se carga por defecto . Los 3 primeros suiches son los encargados de escoger que registro se muestra en la salida A , los 3 siguientes son los encargados de seleccionar que registro se muestra en la salida B, y el suich 7 es el encargado de activar el modo de escritura.
