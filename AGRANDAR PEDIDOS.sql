use PedidosPruebas
GO

--/////////////////////////////////////////////////////////////////////////////////////////////
------------ELIMINAR RESTRICCIONES DE LA TABLA DE LA CABECERAP------------------------------------

alter table movimiento.cabecerap drop constraint CHK_TipoPed
go
alter table movimiento.cabecerap drop constraint codPed
go
alter table movimiento.cabecerap drop constraint DF_TipoPed
go

--/////////////////////////////////////////////////////////////////////////////////////////////
-------------ELIMINAR RESTRICCIONES DE TABLAS DONDE ES FORANEA el CODPED----------------------------------

sp_help 'movimiento.detallep'
alter table movimiento.detallep drop constraint tieneDetalle
go
alter table movimiento.detallep drop constraint PK_DETALLEP
go
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------

--//////////////////////////////////////////////////////////////////////////////////////////////
-----------ELIMINAR LA CLAVE PRIMARIA DE LA TABLA CABECERAP---------------------------------------
------------------------------------------------------------------------------------------------
alter table movimiento.cabecerap drop constraint PK_CABECERAP
go


--*********AGRANDAR LA COLUMNA CODCLI EN TODAS LAS TABLAS INVOLUCRADAS*************************************************
--**********************************************************************************************
--**********************************************************************************************
sp_help 'movimiento.cabeceraP'

ALTER TABLE movimiento.cabecerap ALTER COLUMN codPed char(10)not null
go
sp_help 'movimiento.detallep'
ALTER TABLE movimiento.detallep ALTER COLUMN codPed char(10)not null
go

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--actualizar los datos segun la longitud de la socilitud de cambio
-----------CABECERAP----------------------------------------------
drop trigger movimiento.afterInsertUpdateCabezera
go

update movimiento.CABECERAP set codPed = 'PE00000001' where codPed='R01'
go
update movimiento.CABECERAP set codPed = 'PE00000002' where codPed='R02'
go
update movimiento.CABECERAP set codPed = 'PE00000003' where codPed='R03'
go
update movimiento.CABECERAP set codPed = 'PE00000004' where codPed='R04'
go
update movimiento.CABECERAP set codPed = 'PE00000005' where codPed='R05'
go
update movimiento.CABECERAP set codPed = 'PE00000006' where codPed='R06'
go
-----------detallep----------------------------------------------

update movimiento.detallep set codPed = 'PE00000001' where codPed='R01'
go
update movimiento.DETALLEP set codPed = 'PE00000002' where codPed= 'R02'
go

update movimiento.DETALLEP set codPed = 'PE00000003' where codPed= 'R03'
go

update movimiento.DETALLEP set codPed = 'PE00000004' where codPed= 'R04'
go

update movimiento.DETALLEP set codPed = 'PE00000005' where codPed= 'R05'
go

update movimiento.DETALLEP set codPed = 'PE00000006' where codPed= 'R05'
go

--///////////////////////////////////////////////////////////////////////////////////////////
----------------cabeceradetallep-------------------------------------------------------------
select * from movimiento.cabeceraDETALLEP
update movimiento.cabeceraDETALLEP set codPed = 'PE00000001' where codPed= 'R01'
go
update movimiento.cabeceraDETALLEP set codPed = 'PE00000002' where codPed= 'R02'
go
update movimiento.cabeceraDETALLEP set codPed = 'PE00000003' where codPed= 'R03'
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
