use PedidosPruebas
go
sp_help 'catalogo.cliente'
go
--/////////////////////////////////////////////////////////////////////////////////////////////
------------ELIMINAR RESTRICCIONES DE LA TABLA DEL CLIENTE------------------------------------
alter table catalogo.cliente drop constraint debeTener
alter table catalogo.cliente drop constraint ubicado
alter table catalogo.cliente drop constraint codcli

--/////////////////////////////////////////////////////////////////////////////////////////////
-------------ELIMINAR RESTRICCIONES DE TABLAS DONDE ES FORANEA----------------------------------
alter table movimiento.cabecerap drop constraint solicita
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------

--//////////////////////////////////////////////////////////////////////////////////////////////
-----------ELIMINAR LA CLAVE PRIMARIA DE LA TABLA CLIENTE---------------------------------------
------------------------------------------------------------------------------------------------
alter table catalogo.cliente drop constraint PK_CLIENTE
go


--*********AGRANDAR LA COLUMNA CODCLI EN TODAS LAS TABLAS INVOLUCRADAS*************************************************
--**********************************************************************************************
--**********************************************************************************************


ALTER TABLE catalogo.cliente ALTER COLUMN codCli char(6) not null
go
ALTER TABLE catalogo.cliente ALTER COLUMN garante char(6) not null
go
alter table movimiento.cabecerap alter column codcli char(6) not null
go
alter table movimiento.cabeceradetallep alter column codcli char(6) not null
go
alter table movimiento.pagos alter column codcli char(6) not null
go
alter table catalogo.deudor alter column codcli char(6) not null
go
--/////////////////////////////////////////////////////////////////////////////////////////////////////
--actualizar los datos segun la longitud de la socilitud de cambio
-----------CODCLI----------------------------------------------
update catalogo.cliente set codcli = 'C00001' where codCli='c01'
update catalogo.cliente set codcli = 'C00002' where codCli='c02'
update catalogo.cliente set codcli = 'C00003' where codCli='c03'
update catalogo.cliente set codcli = 'C00004' where codCli='c04'
update catalogo.cliente set codcli = 'C00005' where codCli='c05'
update catalogo.cliente set codcli = 'C00006' where codCli='c06'
update catalogo.cliente set codcli = 'C00007' where codCli='c07'

---------------GARANTE-------------------------------------------
update catalogo.cliente set garante = 'C00001' where garante='c01'
update catalogo.cliente set garante = 'C00002' where garante='c02'
update catalogo.cliente set garante = 'C00003' where garante='c03'
update catalogo.cliente set garante = 'C00004' where garante='c04'
update catalogo.cliente set garante = 'C00005' where garante='c05'
update catalogo.cliente set garante= 'C00006' where  garante='c06'
update catalogo.cliente set garante = 'C00007' where garante='c07'

----------------CODLI(TABLA:CABECERAP)----------------------------
update movimiento.cabecerap set codcli = 'C00001' where codcli='c01'
update movimiento.cabecerap set codcli = 'C00002' where codcli='c02'
update movimiento.cabecerap set codcli = 'C00003' where codcli='c03'
update movimiento.cabecerap set codcli = 'C00004' where codcli='c04'
update movimiento.cabecerap set codcli = 'C00005' where codcli='c05'
update movimiento.cabecerap set codcli = 'C00006' where codcli='c06'
update movimiento.cabecerap set codcli = 'C00007' where codcli='c07'
-----------------codcli(TABLA: CABECERADETALLEP)-------------------
sp_help 'movimiento.CABECERADETALLEP'
update movimiento.CABECERADETALLEP set codcli = 'C00001' where codcli='c01'
update movimiento.CABECERADETALLEP set codcli = 'C00002' where codcli='c02'
update movimiento.CABECERADETALLEP set codcli = 'C00003' where codcli='c03'
update movimiento.CABECERADETALLEP set codcli = 'C00004' where codcli='c04'
update movimiento.CABECERADETALLEP set codcli = 'C00005' where codcli='c05'
update movimiento.CABECERADETALLEP set codcli = 'C00006' where codcli='c06'
update movimiento.CABECERADETALLEP set codcli = 'C00007' where codcli='c07'
--------------------PAGOS------------------------------------------------
sp_help 'movimiento.pagos'
update MOVIMIENTO.PAGOS set codcli = 'C00001' where codcli='c01'
update MOVIMIENTO.PAGOS set codcli = 'C00002' where codcli='c02'
update MOVIMIENTO.PAGOS set codcli = 'C00003' where codcli='c03'
update MOVIMIENTO.PAGOS set codcli = 'C00004' where codcli='c04'
update MOVIMIENTO.PAGOS set codcli = 'C00005' where codcli='c05'
update MOVIMIENTO.PAGOS set codcli = 'C00006' where codcli='c06'
update MOVIMIENTO.PAGOS set codcli = 'C00007' where codcli='c07'
-------------------DEUDOR-----------------------------------------------------
sp_help 'catalogo.deudor'
update catalogo.DEUDOR set codcli = 'C00001' where codcli='c01'
update catalogo.DEUDOR set codcli = 'C00002' where codcli='c02'
update catalogo.DEUDOR set codcli = 'C00003' where codcli='c03'
update catalogo.DEUDOR set codcli = 'C00004' where codcli='c04'
update catalogo.DEUDOR set codcli = 'C00005' where codcli='c05'
update catalogo.DEUDOR set codcli = 'C00006' where codcli='c06'
update catalogo.DEUDOR set codcli = 'C00007' where codcli='c07'


--//////////////////////////////////////////////////////////////////////////////////////////////////
-----RESTAURAR LOS CONSTRAINTS DE LA TABLA CLIENTES-------------------------------------------------
ALTER TABLE catalogo.CLIENTE ADD CONSTRAINT [PK_CLIENTE] PRIMARY KEY NONCLUSTERED ([codCli])
go
ALTER TABLE catalogo.CLIENTE ADD CONSTRAINT [codCli] UNIQUE CLUSTERED ([codCli])
go
ALTER TABLE catalogo.CLIENTE ADD CONSTRAINT [ubicado] FOREIGN KEY ([codCiu]) REFERENCES catalogo.CIUDAD ([codCiu]) ON UPDATE NO ACTION ON DELETE NO ACTION
go
ALTER TABLE catalogo.CLIENTE ADD CONSTRAINT [debeTener] FOREIGN KEY ([garante]) REFERENCES catalogo.CLIENTE ([codCli]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

--///////////////////////////////////////////////////////////////////////////////////////////////
-----------RESTAURAR TABLAS QUE TIENEN COMO CLAVE FORANEA AL CODIGO DE CLIENTE CLIENTE-----------

ALTER TABLE movimiento.CABECERAP ADD CONSTRAINT [solicita] FOREIGN KEY ([codCli]) REFERENCES catalogo.CLIENTE ([codCli]) ON UPDATE NO ACTION ON DELETE NO ACTION
go





