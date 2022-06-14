--reporte 1

CREATE DATABASE PRUEBASQL
use PRUEBASQL
CREATE TABLE CIUDAD
(
Id int not null ,
Nombre varchar (50) 
constraint PK_ID_CIUDAD  Primary key (Id)
)

use PRUEBASQL
CREATE TABLE CLIENTE

(
Id int not null ,
primer_nombre varchar (50),
primer_apellido varchar (50),
dias_mora int ,
id_ciudad int
constraint PK_ID_CLIENTE  Primary key (Id)
foreign key (ID_CIUDAD) references CIUDAD (Id)
)


///////////////////////////////////


select CLIENTE.Id as cedula, CLIENTE.primer_nombre + CLIENTE.primer_apellido  as nombre, CLIENTE.dias_mora as diasEnMora ,
case 
when dias_mora between 1 and 20 then 'Riesgo Bajo'
when dias_mora between 21 and 35 then 'Riesgo Medio'
when dias_mora > 35  then 'Riesgo Alto'
end as riesgo, CIUDAD.Nombre AS CIUDAD  from CLIENTE
inner join CIUDAD
on CLIENTE.id_ciudad = CIUDAD.Id
ORDER BY dias_mora ASC


////////////////////////////////


--reporte 2 

CREATE DATABASE Reporte_dos

use Reporte_dos

CREATE TABLE SUCURSAL
(
ID INT not null ,
NOMBRE VARCHAR (50) 
constraint PK_ID_SUCURSAL  Primary key (Id)
)

use Reporte_dos
CREATE TABLE COTIZACION

(
ID INT not null ,
VALOR_POLIZA_IVA_INCL INT,
VALOR_POLIZA INT,
VALOR_POLIZA_CUOTA INT,
ID_SUCURSAL INT
constraint PK_ID_COTIZACION  Primary key (Id)
foreign key (ID_SUCURSAL) references SUCURSAL (Id)
)
/////////////////////////////////////////////////////////////////
 
 SELECT SUCURSAL.NOMBRE AS SUCURSAL ,CONVERT (NUMERIC (10,0), COTIZACION.VALOR_POLIZA_IVA_INCL ) AS VALORTOTALPAGADO 
 FROM COTIZACION 
 inner join SUCURSAL 
 ON COTIZACION.ID_SUCURSAL = SUCURSAL.ID 
 ORDER BY VALOR_POLIZA_IVA_INCL DESC 
 

