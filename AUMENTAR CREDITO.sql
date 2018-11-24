use PedidosPruebas
go

--//////////////////////////////////////////////////////////////////////////////////////////
--AUMENTAR EL 10% AL CREDITO DEL CLIENTE---------------------------------------------------
select * from CATALOGO.CLIENTE
go
alter table CATALOGO.CLIENTE
drop constraint CK_Credito
GO

alter table CATALOGO.CLIENTE
add CONSTRAINT [CK_credito] CHECK (credito <= 2200 and credito >= 0)
go
update CATALOGO.CLIENTE set credito = credito*1.1;
go

