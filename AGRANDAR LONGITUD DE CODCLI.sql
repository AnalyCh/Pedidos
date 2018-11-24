use PedidosPruebas
go

--/////////////////////////////////////////////////////////////////////////////////////////////
------------ELIMINAR RESTRICCIONES DE LA TABLA DEL CLIENTE------------------------------------
alter table catalogo.cliente drop constraint debeTener
go
alter table catalogo.cliente drop constraint ubicado
go
alter table catalogo.cliente drop constraint codcli
go

--/////////////////////////////////////////////////////////////////////////////////////////////
-------------ELIMINAR RESTRICCIONES DE TABLAS DONDE ES FORANEA----------------------------------
alter table movimiento.cabecerap drop constraint solicita
go
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
drop trigger movimiento.afterInsertUpdateCabezera
go
update catalogo.cliente set codcli = 'C00001' where codCli='c01'
go
update catalogo.cliente set codcli = 'C00002' where codCli='c02'
go
update catalogo.cliente set codcli = 'C00003' where codCli='c03'
go
update catalogo.cliente set codcli = 'C00004' where codCli='c04'
go
update catalogo.cliente set codcli = 'C00005' where codCli='c05'
go
update catalogo.cliente set codcli = 'C00006' where codCli='c06'
go
update catalogo.cliente set codcli = 'C00007' where codCli='c07'
go

---------------GARANTE-------------------------------------------
update catalogo.cliente set garante = 'C00001' where garante='c01'
go
update catalogo.cliente set garante = 'C00002' where garante='c02'
go
update catalogo.cliente set garante = 'C00003' where garante='c03'
go
update catalogo.cliente set garante = 'C00004' where garante='c04'
go
update catalogo.cliente set garante = 'C00005' where garante='c05'
go
update catalogo.cliente set garante= 'C00006' where  garante='c06'
go
update catalogo.cliente set garante = 'C00007' where garante='c07'
go

----------------CODLI(TABLA:CABECERAP)----------------------------
update movimiento.cabecerap set codcli = 'C00001' where codcli='c01'
go
update movimiento.cabecerap set codcli = 'C00002' where codcli='c02'
go
update movimiento.cabecerap set codcli = 'C00003' where codcli='c03'
go
update movimiento.cabecerap set codcli = 'C00004' where codcli='c04'
go
update movimiento.cabecerap set codcli = 'C00005' where codcli='c05'
go
update movimiento.cabecerap set codcli = 'C00006' where codcli='c06'
go
update movimiento.cabecerap set codcli = 'C00007' where codcli='c07'
go
-----------------codcli(TABLA: CABECERADETALLEP)-------------------

update movimiento.CABECERADETALLEP set codcli = 'C00001' where codcli='c01'
go
update movimiento.CABECERADETALLEP set codcli = 'C00002' where codcli='c02'
go
update movimiento.CABECERADETALLEP set codcli = 'C00003' where codcli='c03'
go
update movimiento.CABECERADETALLEP set codcli = 'C00004' where codcli='c04'
go
update movimiento.CABECERADETALLEP set codcli = 'C00005' where codcli='c05'
go
update movimiento.CABECERADETALLEP set codcli = 'C00006' where codcli='c06'
go
update movimiento.CABECERADETALLEP set codcli = 'C00007' where codcli='c07'
go
--------------------PAGOS------------------------------------------------
sp_help 'movimiento.pagos'
update MOVIMIENTO.PAGOS set codcli = 'C00001' where codcli='c01'
go
update MOVIMIENTO.PAGOS set codcli = 'C00002' where codcli='c02'
go
update MOVIMIENTO.PAGOS set codcli = 'C00003' where codcli='c03'
go
update MOVIMIENTO.PAGOS set codcli = 'C00004' where codcli='c04'
go
update MOVIMIENTO.PAGOS set codcli = 'C00005' where codcli='c05'
go
update MOVIMIENTO.PAGOS set codcli = 'C00006' where codcli='c06'
go
update MOVIMIENTO.PAGOS set codcli = 'C00007' where codcli='c07'
go
-------------------DEUDOR-----------------------------------------------------

update catalogo.DEUDOR set codcli = 'C00001' where codcli='c01'
go
update catalogo.DEUDOR set codcli = 'C00002' where codcli='c02'
go
update catalogo.DEUDOR set codcli = 'C00003' where codcli='c03'
go
update catalogo.DEUDOR set codcli = 'C00004' where codcli='c04'
go
update catalogo.DEUDOR set codcli = 'C00005' where codcli='c05'
go
update catalogo.DEUDOR set codcli = 'C00006' where codcli='c06'
go
update catalogo.DEUDOR set codcli = 'C00007' where codcli='c07'
go


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





