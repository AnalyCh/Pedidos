USE [PedidosPrueba]
GO
/****** Object:  Trigger [TR_Pagos]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP TRIGGER [movimiento].[TR_Pagos]
GO
/****** Object:  Trigger [actualizarMonto_update]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP TRIGGER [movimiento].[actualizarMonto_update]
GO
/****** Object:  Trigger [actualizarMonto]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP TRIGGER [movimiento].[actualizarMonto]
GO
/****** Object:  Trigger [TR_Deudores]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP TRIGGER [movimiento].[TR_Deudores]
GO
/****** Object:  Trigger [afterInsertUpdateCabezera]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP TRIGGER [movimiento].[afterInsertUpdateCabezera]
GO
ALTER TABLE [movimiento].[CABECERAP] DROP CONSTRAINT [CHK_TipoPed]
GO
ALTER TABLE [catalogo].[CLIENTE] DROP CONSTRAINT [CK_descuento]
GO
ALTER TABLE [catalogo].[CLIENTE] DROP CONSTRAINT [CK_credito]
GO
ALTER TABLE [movimiento].[DETALLEP] DROP CONSTRAINT [tieneDetalle]
GO
ALTER TABLE [movimiento].[DETALLEP] DROP CONSTRAINT [perteceProducto]
GO
ALTER TABLE [movimiento].[CABECERAP] DROP CONSTRAINT [solicita]
GO
ALTER TABLE [catalogo].[TelProv] DROP CONSTRAINT [disponeDe]
GO
ALTER TABLE [catalogo].[PROVEE] DROP CONSTRAINT [proveeProveedor]
GO
ALTER TABLE [catalogo].[PROVEE] DROP CONSTRAINT [proveeProducto]
GO
ALTER TABLE [catalogo].[CLIENTE] DROP CONSTRAINT [ubicado]
GO
ALTER TABLE [catalogo].[CLIENTE] DROP CONSTRAINT [debeTener]
GO
ALTER TABLE [movimiento].[CABECERAP] DROP CONSTRAINT [DF_TipoPed]
GO
/****** Object:  Index [PK_CABECERAP]    Script Date: 11/22/2018 2:51:50 PM ******/
ALTER TABLE [movimiento].[CABECERAP] DROP CONSTRAINT [PK_CABECERAP]
GO
/****** Object:  Index [PK_TelProv]    Script Date: 11/22/2018 2:51:50 PM ******/
ALTER TABLE [catalogo].[TelProv] DROP CONSTRAINT [PK_TelProv]
GO
/****** Object:  Index [PK_PROVEEDOR]    Script Date: 11/22/2018 2:51:50 PM ******/
ALTER TABLE [catalogo].[PROVEEDOR] DROP CONSTRAINT [PK_PROVEEDOR]
GO
/****** Object:  Index [PK_PRODUCTO]    Script Date: 11/22/2018 2:51:50 PM ******/
ALTER TABLE [catalogo].[PRODUCTO] DROP CONSTRAINT [PK_PRODUCTO]
GO
/****** Object:  Index [PK_CLIENTE]    Script Date: 11/22/2018 2:51:50 PM ******/
ALTER TABLE [catalogo].[CLIENTE] DROP CONSTRAINT [PK_CLIENTE]
GO
/****** Object:  Index [PK_CIUDAD]    Script Date: 11/22/2018 2:51:50 PM ******/
ALTER TABLE [catalogo].[CIUDAD] DROP CONSTRAINT [PK_CIUDAD]
GO
/****** Object:  Table [movimiento].[PAGOS]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP TABLE [movimiento].[PAGOS]
GO
/****** Object:  Table [movimiento].[DETALLEP]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP TABLE [movimiento].[DETALLEP]
GO
/****** Object:  Table [movimiento].[CABECERAP]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP TABLE [movimiento].[CABECERAP]
GO
/****** Object:  Table [movimiento].[CABECERADETALLEP]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP TABLE [movimiento].[CABECERADETALLEP]
GO
/****** Object:  Table [catalogo].[TelProv]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP TABLE [catalogo].[TelProv]
GO
/****** Object:  Table [catalogo].[PROVEEDOR]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP TABLE [catalogo].[PROVEEDOR]
GO
/****** Object:  Table [catalogo].[PROVEE]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP TABLE [catalogo].[PROVEE]
GO
/****** Object:  Table [catalogo].[PRODUCTO]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP TABLE [catalogo].[PRODUCTO]
GO
/****** Object:  Table [catalogo].[DEUDOR]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP TABLE [catalogo].[DEUDOR]
GO
/****** Object:  Table [catalogo].[CLIENTE]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP TABLE [catalogo].[CLIENTE]
GO
/****** Object:  Table [catalogo].[CIUDAD]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP TABLE [catalogo].[CIUDAD]
GO
/****** Object:  Schema [movimiento]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP SCHEMA [movimiento]
GO
/****** Object:  Schema [catalogo]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP SCHEMA [catalogo]
GO
USE [master]
GO
/****** Object:  Database [PedidosPrueba]    Script Date: 11/22/2018 2:51:50 PM ******/
DROP DATABASE [PedidosPrueba]
GO
/****** Object:  Database [PedidosPrueba]    Script Date: 11/22/2018 2:51:50 PM ******/
CREATE DATABASE [PedidosPrueba]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pedido1', FILENAME = N'E:\Prueba\Data\pedido1.mdf' , SIZE = 8192KB , MAXSIZE = 10240KB , FILEGROWTH = 10%), 
 FILEGROUP [Secundario] 
( NAME = N'pedido2', FILENAME = N'E:\Prueba\Data\pedido2.ndf' , SIZE = 5120KB , MAXSIZE = 10240KB , FILEGROWTH = 10%),
( NAME = N'pedido3', FILENAME = N'E:\Prueba\Data\pedido3.ndf' , SIZE = 5120KB , MAXSIZE = 10240KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'pedido1_log', FILENAME = N'E:\Prueba\Log\pedido1log.ldf' , SIZE = 2048KB , MAXSIZE = 8192KB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [PedidosPrueba] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PedidosPrueba].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PedidosPrueba] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PedidosPrueba] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PedidosPrueba] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PedidosPrueba] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PedidosPrueba] SET ARITHABORT OFF 
GO
ALTER DATABASE [PedidosPrueba] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PedidosPrueba] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PedidosPrueba] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PedidosPrueba] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PedidosPrueba] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PedidosPrueba] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PedidosPrueba] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PedidosPrueba] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PedidosPrueba] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PedidosPrueba] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PedidosPrueba] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PedidosPrueba] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PedidosPrueba] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PedidosPrueba] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PedidosPrueba] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PedidosPrueba] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PedidosPrueba] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PedidosPrueba] SET RECOVERY FULL 
GO
ALTER DATABASE [PedidosPrueba] SET  MULTI_USER 
GO
ALTER DATABASE [PedidosPrueba] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PedidosPrueba] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PedidosPrueba] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PedidosPrueba] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PedidosPrueba] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PedidosPrueba', N'ON'
GO
ALTER DATABASE [PedidosPrueba] SET QUERY_STORE = OFF
GO
USE [PedidosPrueba]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [PedidosPrueba]
GO
/****** Object:  Schema [catalogo]    Script Date: 11/22/2018 2:51:50 PM ******/
CREATE SCHEMA [catalogo]
GO
/****** Object:  Schema [movimiento]    Script Date: 11/22/2018 2:51:50 PM ******/
CREATE SCHEMA [movimiento]
GO
/****** Object:  Table [catalogo].[CIUDAD]    Script Date: 11/22/2018 2:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[CIUDAD](
	[codCiu] [char](3) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [codCiu] UNIQUE CLUSTERED 
(
	[codCiu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [catalogo].[CLIENTE]    Script Date: 11/22/2018 2:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[CLIENTE](
	[codCli] [char](3) NOT NULL,
	[credito] [numeric](7, 2) NULL,
	[direccion] [varchar](50) NULL,
	[descuento] [numeric](5, 2) NULL,
	[codCiu] [char](3) NULL,
	[garante] [char](3) NULL,
 CONSTRAINT [codCli] UNIQUE CLUSTERED 
(
	[codCli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [catalogo].[DEUDOR]    Script Date: 11/22/2018 2:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[DEUDOR](
	[codCli] [char](3) NULL,
	[codigoGarante] [char](3) NULL,
	[limiteCredito] [numeric](7, 2) NULL,
	[saldoDeudor] [numeric](7, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [catalogo].[PRODUCTO]    Script Date: 11/22/2018 2:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[PRODUCTO](
	[codPro] [char](3) NOT NULL,
	[nomProd] [varchar](100) NULL,
 CONSTRAINT [codPro] UNIQUE CLUSTERED 
(
	[codPro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [catalogo].[PROVEE]    Script Date: 11/22/2018 2:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[PROVEE](
	[stock] [int] NULL,
	[codProv] [char](3) NOT NULL,
	[codPro] [char](3) NOT NULL,
 CONSTRAINT [PK_PROVEE] PRIMARY KEY CLUSTERED 
(
	[codProv] ASC,
	[codPro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [catalogo].[PROVEEDOR]    Script Date: 11/22/2018 2:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[PROVEEDOR](
	[codProv] [char](3) NOT NULL,
	[nomProv] [varchar](50) NULL,
 CONSTRAINT [codProv] UNIQUE CLUSTERED 
(
	[codProv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [catalogo].[TelProv]    Script Date: 11/22/2018 2:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [catalogo].[TelProv](
	[numTelf] [varchar](15) NOT NULL,
	[codProv] [char](3) NULL,
 CONSTRAINT [numTelf] UNIQUE CLUSTERED 
(
	[numTelf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
) ON [Secundario]
GO
/****** Object:  Table [movimiento].[CABECERADETALLEP]    Script Date: 11/22/2018 2:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimiento].[CABECERADETALLEP](
	[codPed] [char](3) NOT NULL,
	[fecha] [date] NULL,
	[montoTotal] [money] NULL,
	[codCli] [char](3) NULL,
	[numLinea] [int] NOT NULL,
	[precioU] [money] NULL,
	[cantidad] [int] NULL,
	[codPro] [char](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [movimiento].[CABECERAP]    Script Date: 11/22/2018 2:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimiento].[CABECERAP](
	[codPed] [char](3) NOT NULL,
	[fecha] [date] NULL,
	[montoTotal] [money] NULL,
	[codCli] [char](3) NULL,
	[TipoPed] [char](7) NOT NULL,
 CONSTRAINT [codPed] UNIQUE CLUSTERED 
(
	[codPed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [movimiento].[DETALLEP]    Script Date: 11/22/2018 2:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimiento].[DETALLEP](
	[numLinea] [int] NOT NULL,
	[precioU] [money] NULL,
	[cantidad] [int] NULL,
	[codPed] [char](3) NOT NULL,
	[codPro] [char](3) NULL,
 CONSTRAINT [PK_DETALLEP] PRIMARY KEY CLUSTERED 
(
	[numLinea] ASC,
	[codPed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [movimiento].[PAGOS]    Script Date: 11/22/2018 2:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [movimiento].[PAGOS](
	[codCli] [char](3) NOT NULL,
	[fechaPago] [date] NULL,
	[valorPago] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
INSERT [catalogo].[CIUDAD] ([codCiu], [nombre]) VALUES (N'CI1', N'Quito')
INSERT [catalogo].[CIUDAD] ([codCiu], [nombre]) VALUES (N'CI2', N'Guayaquil')
INSERT [catalogo].[CIUDAD] ([codCiu], [nombre]) VALUES (N'CI3', N'Cuenca')
INSERT [catalogo].[CIUDAD] ([codCiu], [nombre]) VALUES (N'CI4', N'Loja')
INSERT [catalogo].[CLIENTE] ([codCli], [credito], [direccion], [descuento], [codCiu], [garante]) VALUES (N'C01', CAST(150.00 AS Numeric(7, 2)), N'NNUU y 10 de Agosto', CAST(10.00 AS Numeric(5, 2)), N'CI1', N'C01')
INSERT [catalogo].[CLIENTE] ([codCli], [credito], [direccion], [descuento], [codCiu], [garante]) VALUES (N'C02', CAST(120.00 AS Numeric(7, 2)), N'Riofrio y Bolivia', CAST(10.00 AS Numeric(5, 2)), N'CI1', N'C01')
INSERT [catalogo].[CLIENTE] ([codCli], [credito], [direccion], [descuento], [codCiu], [garante]) VALUES (N'C03', CAST(100.00 AS Numeric(7, 2)), N'Malecon 1050', CAST(5.00 AS Numeric(5, 2)), N'CI2', N'C02')
INSERT [catalogo].[CLIENTE] ([codCli], [credito], [direccion], [descuento], [codCiu], [garante]) VALUES (N'C04', CAST(500.00 AS Numeric(7, 2)), N'Libertadores y Ayacucho', CAST(3.00 AS Numeric(5, 2)), N'CI2', N'C02')
INSERT [catalogo].[CLIENTE] ([codCli], [credito], [direccion], [descuento], [codCiu], [garante]) VALUES (N'C05', CAST(900.00 AS Numeric(7, 2)), N'Julio Moreno 231', CAST(4.00 AS Numeric(5, 2)), N'CI3', N'C04')
INSERT [catalogo].[CLIENTE] ([codCli], [credito], [direccion], [descuento], [codCiu], [garante]) VALUES (N'C06', CAST(180.00 AS Numeric(7, 2)), N'La 15 y Marin', CAST(15.00 AS Numeric(5, 2)), N'CI3', N'C04')
INSERT [catalogo].[CLIENTE] ([codCli], [credito], [direccion], [descuento], [codCiu], [garante]) VALUES (N'C07', CAST(100.00 AS Numeric(7, 2)), N'Direnvio1 y Estadio', CAST(10.00 AS Numeric(5, 2)), N'CI4', N'C05')
INSERT [catalogo].[PRODUCTO] ([codPro], [nomProd]) VALUES (N'P01', N'Producto1')
INSERT [catalogo].[PRODUCTO] ([codPro], [nomProd]) VALUES (N'P02', N'Producto2')
INSERT [catalogo].[PRODUCTO] ([codPro], [nomProd]) VALUES (N'P03', N'Producto3')
INSERT [catalogo].[PRODUCTO] ([codPro], [nomProd]) VALUES (N'P04', N'Producto4')
INSERT [catalogo].[PRODUCTO] ([codPro], [nomProd]) VALUES (N'P05', N'Producto5')
INSERT [catalogo].[PRODUCTO] ([codPro], [nomProd]) VALUES (N'P06', N'Producto6')
INSERT [catalogo].[PROVEE] ([stock], [codProv], [codPro]) VALUES (1000, N'PR1', N'P01')
INSERT [catalogo].[PROVEE] ([stock], [codProv], [codPro]) VALUES (500, N'PR1', N'P02')
INSERT [catalogo].[PROVEE] ([stock], [codProv], [codPro]) VALUES (100, N'PR2', N'P02')
INSERT [catalogo].[PROVEE] ([stock], [codProv], [codPro]) VALUES (100, N'PR2', N'P03')
INSERT [catalogo].[PROVEE] ([stock], [codProv], [codPro]) VALUES (30, N'PR3', N'P02')
INSERT [catalogo].[PROVEE] ([stock], [codProv], [codPro]) VALUES (200, N'PR3', N'P04')
INSERT [catalogo].[PROVEE] ([stock], [codProv], [codPro]) VALUES (50, N'PR4', N'P03')
INSERT [catalogo].[PROVEE] ([stock], [codProv], [codPro]) VALUES (10, N'PR4', N'P04')
INSERT [catalogo].[PROVEEDOR] ([codProv], [nomProv]) VALUES (N'PR1', N'Proveedor1')
INSERT [catalogo].[PROVEEDOR] ([codProv], [nomProv]) VALUES (N'PR2', N'Proveedor2')
INSERT [catalogo].[PROVEEDOR] ([codProv], [nomProv]) VALUES (N'PR3', N'Proveedor3')
INSERT [catalogo].[PROVEEDOR] ([codProv], [nomProv]) VALUES (N'PR4', N'Proveedor4')
INSERT [catalogo].[TelProv] ([numTelf], [codProv]) VALUES (N'023245678', N'PR1')
INSERT [catalogo].[TelProv] ([numTelf], [codProv]) VALUES (N'043223455', N'PR4')
INSERT [catalogo].[TelProv] ([numTelf], [codProv]) VALUES (N'043456777', N'PR4')
INSERT [catalogo].[TelProv] ([numTelf], [codProv]) VALUES (N'069847636', N'PR3')
INSERT [catalogo].[TelProv] ([numTelf], [codProv]) VALUES (N'086584733', N'PR2')
INSERT [catalogo].[TelProv] ([numTelf], [codProv]) VALUES (N'098001001', N'PR2')
INSERT [catalogo].[TelProv] ([numTelf], [codProv]) VALUES (N'099321453', N'PR1')
INSERT [movimiento].[CABECERADETALLEP] ([codPed], [fecha], [montoTotal], [codCli], [numLinea], [precioU], [cantidad], [codPro]) VALUES (N'R04', CAST(N'2018-11-18' AS Date), 1.0000, N'C02', 5, 6.0000, 7, N'P02')
INSERT [movimiento].[CABECERADETALLEP] ([codPed], [fecha], [montoTotal], [codCli], [numLinea], [precioU], [cantidad], [codPro]) VALUES (N'R01', CAST(N'2018-08-12' AS Date), 10.0000, N'C01', 4, 3.0000, 11, N'P04')
INSERT [movimiento].[CABECERADETALLEP] ([codPed], [fecha], [montoTotal], [codCli], [numLinea], [precioU], [cantidad], [codPro]) VALUES (N'R03', CAST(N'2018-05-15' AS Date), 11.0000, N'C01', 1, NULL, NULL, NULL)
INSERT [movimiento].[CABECERADETALLEP] ([codPed], [fecha], [montoTotal], [codCli], [numLinea], [precioU], [cantidad], [codPro]) VALUES (N'R06', CAST(N'2018-11-14' AS Date), 200.0000, N'C02', 1, NULL, NULL, NULL)
INSERT [movimiento].[CABECERADETALLEP] ([codPed], [fecha], [montoTotal], [codCli], [numLinea], [precioU], [cantidad], [codPro]) VALUES (N'R06', CAST(N'2018-11-14' AS Date), 210.0000, N'C02', 1, NULL, NULL, NULL)
INSERT [movimiento].[CABECERADETALLEP] ([codPed], [fecha], [montoTotal], [codCli], [numLinea], [precioU], [cantidad], [codPro]) VALUES (N'R06', CAST(N'2018-11-14' AS Date), 230.0000, N'C02', 1, NULL, NULL, NULL)
INSERT [movimiento].[CABECERADETALLEP] ([codPed], [fecha], [montoTotal], [codCli], [numLinea], [precioU], [cantidad], [codPro]) VALUES (N'R06', CAST(N'2018-11-14' AS Date), 270.0000, N'C02', 1, NULL, NULL, NULL)
INSERT [movimiento].[CABECERAP] ([codPed], [fecha], [montoTotal], [codCli], [TipoPed]) VALUES (N'R01', CAST(N'2018-01-20' AS Date), 170.0000, N'C01', N'contado')
INSERT [movimiento].[CABECERAP] ([codPed], [fecha], [montoTotal], [codCli], [TipoPed]) VALUES (N'R02', CAST(N'2018-02-15' AS Date), 270.0000, N'C02', N'contado')
INSERT [movimiento].[CABECERAP] ([codPed], [fecha], [montoTotal], [codCli], [TipoPed]) VALUES (N'R03', CAST(N'2018-03-10' AS Date), 370.0000, N'C03', N'contado')
INSERT [movimiento].[CABECERAP] ([codPed], [fecha], [montoTotal], [codCli], [TipoPed]) VALUES (N'R04', CAST(N'2018-03-08' AS Date), 470.0000, N'C04', N'contado')
INSERT [movimiento].[CABECERAP] ([codPed], [fecha], [montoTotal], [codCli], [TipoPed]) VALUES (N'R05', CAST(N'2018-10-08' AS Date), 160.0000, N'C01', N'contado')
INSERT [movimiento].[CABECERAP] ([codPed], [fecha], [montoTotal], [codCli], [TipoPed]) VALUES (N'R06', CAST(N'2018-11-14' AS Date), 270.0000, N'C02', N'contado')
INSERT [movimiento].[DETALLEP] ([numLinea], [precioU], [cantidad], [codPed], [codPro]) VALUES (1, 2.0000, 2, N'R01', N'P01')
INSERT [movimiento].[DETALLEP] ([numLinea], [precioU], [cantidad], [codPed], [codPro]) VALUES (2, 5.5000, 10, N'R01', N'P02')
INSERT [movimiento].[DETALLEP] ([numLinea], [precioU], [cantidad], [codPed], [codPro]) VALUES (3, 1.0000, 10, N'R04', N'P01')
INSERT [movimiento].[DETALLEP] ([numLinea], [precioU], [cantidad], [codPed], [codPro]) VALUES (4, 3.0000, 11, N'R05', N'P04')
INSERT [movimiento].[DETALLEP] ([numLinea], [precioU], [cantidad], [codPed], [codPro]) VALUES (5, 6.0000, 7, N'R03', N'P02')
INSERT [movimiento].[DETALLEP] ([numLinea], [precioU], [cantidad], [codPed], [codPro]) VALUES (6, 20.0000, 2, N'R06', N'P04')
INSERT [movimiento].[PAGOS] ([codCli], [fechaPago], [valorPago]) VALUES (N'C01', CAST(N'2018-11-17' AS Date), CAST(100 AS Numeric(18, 0)))
INSERT [movimiento].[PAGOS] ([codCli], [fechaPago], [valorPago]) VALUES (N'C01', CAST(N'2018-11-18' AS Date), CAST(200 AS Numeric(18, 0)))
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_CIUDAD]    Script Date: 11/22/2018 2:51:51 PM ******/
ALTER TABLE [catalogo].[CIUDAD] ADD  CONSTRAINT [PK_CIUDAD] PRIMARY KEY NONCLUSTERED 
(
	[codCiu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_CLIENTE]    Script Date: 11/22/2018 2:51:51 PM ******/
ALTER TABLE [catalogo].[CLIENTE] ADD  CONSTRAINT [PK_CLIENTE] PRIMARY KEY NONCLUSTERED 
(
	[codCli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_PRODUCTO]    Script Date: 11/22/2018 2:51:51 PM ******/
ALTER TABLE [catalogo].[PRODUCTO] ADD  CONSTRAINT [PK_PRODUCTO] PRIMARY KEY NONCLUSTERED 
(
	[codPro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_PROVEEDOR]    Script Date: 11/22/2018 2:51:51 PM ******/
ALTER TABLE [catalogo].[PROVEEDOR] ADD  CONSTRAINT [PK_PROVEEDOR] PRIMARY KEY NONCLUSTERED 
(
	[codProv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_TelProv]    Script Date: 11/22/2018 2:51:51 PM ******/
ALTER TABLE [catalogo].[TelProv] ADD  CONSTRAINT [PK_TelProv] PRIMARY KEY NONCLUSTERED 
(
	[numTelf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Secundario]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_CABECERAP]    Script Date: 11/22/2018 2:51:51 PM ******/
ALTER TABLE [movimiento].[CABECERAP] ADD  CONSTRAINT [PK_CABECERAP] PRIMARY KEY NONCLUSTERED 
(
	[codPed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [movimiento].[CABECERAP] ADD  CONSTRAINT [DF_TipoPed]  DEFAULT ('contado') FOR [TipoPed]
GO
ALTER TABLE [catalogo].[CLIENTE]  WITH CHECK ADD  CONSTRAINT [debeTener] FOREIGN KEY([garante])
REFERENCES [catalogo].[CLIENTE] ([codCli])
GO
ALTER TABLE [catalogo].[CLIENTE] CHECK CONSTRAINT [debeTener]
GO
ALTER TABLE [catalogo].[CLIENTE]  WITH CHECK ADD  CONSTRAINT [ubicado] FOREIGN KEY([codCiu])
REFERENCES [catalogo].[CIUDAD] ([codCiu])
GO
ALTER TABLE [catalogo].[CLIENTE] CHECK CONSTRAINT [ubicado]
GO
ALTER TABLE [catalogo].[PROVEE]  WITH CHECK ADD  CONSTRAINT [proveeProducto] FOREIGN KEY([codPro])
REFERENCES [catalogo].[PRODUCTO] ([codPro])
GO
ALTER TABLE [catalogo].[PROVEE] CHECK CONSTRAINT [proveeProducto]
GO
ALTER TABLE [catalogo].[PROVEE]  WITH CHECK ADD  CONSTRAINT [proveeProveedor] FOREIGN KEY([codProv])
REFERENCES [catalogo].[PROVEEDOR] ([codProv])
GO
ALTER TABLE [catalogo].[PROVEE] CHECK CONSTRAINT [proveeProveedor]
GO
ALTER TABLE [catalogo].[TelProv]  WITH CHECK ADD  CONSTRAINT [disponeDe] FOREIGN KEY([codProv])
REFERENCES [catalogo].[PROVEEDOR] ([codProv])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [catalogo].[TelProv] CHECK CONSTRAINT [disponeDe]
GO
ALTER TABLE [movimiento].[CABECERAP]  WITH CHECK ADD  CONSTRAINT [solicita] FOREIGN KEY([codCli])
REFERENCES [catalogo].[CLIENTE] ([codCli])
GO
ALTER TABLE [movimiento].[CABECERAP] CHECK CONSTRAINT [solicita]
GO
ALTER TABLE [movimiento].[DETALLEP]  WITH CHECK ADD  CONSTRAINT [perteceProducto] FOREIGN KEY([codPro])
REFERENCES [catalogo].[PRODUCTO] ([codPro])
GO
ALTER TABLE [movimiento].[DETALLEP] CHECK CONSTRAINT [perteceProducto]
GO
ALTER TABLE [movimiento].[DETALLEP]  WITH CHECK ADD  CONSTRAINT [tieneDetalle] FOREIGN KEY([codPed])
REFERENCES [movimiento].[CABECERAP] ([codPed])
GO
ALTER TABLE [movimiento].[DETALLEP] CHECK CONSTRAINT [tieneDetalle]
GO
ALTER TABLE [catalogo].[CLIENTE]  WITH CHECK ADD  CONSTRAINT [CK_credito] CHECK  (([credito]<=(2000) AND [credito]>=(0)))
GO
ALTER TABLE [catalogo].[CLIENTE] CHECK CONSTRAINT [CK_credito]
GO
ALTER TABLE [catalogo].[CLIENTE]  WITH CHECK ADD  CONSTRAINT [CK_descuento] CHECK  (([descuento]>=(0) AND [descuento]<=(100)))
GO
ALTER TABLE [catalogo].[CLIENTE] CHECK CONSTRAINT [CK_descuento]
GO
ALTER TABLE [movimiento].[CABECERAP]  WITH CHECK ADD  CONSTRAINT [CHK_TipoPed] CHECK  (([TipoPed]='credito' OR [TipoPed]='contado'))
GO
ALTER TABLE [movimiento].[CABECERAP] CHECK CONSTRAINT [CHK_TipoPed]
GO
/****** Object:  Trigger [movimiento].[afterInsertUpdateCabezera]    Script Date: 11/22/2018 2:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [movimiento].[afterInsertUpdateCabezera]
on [movimiento].[CABECERAP]
AFTER INSERT,UPDATE
AS
insert into movimiento.CABECERADETALLEP 
values((select top 1 inserted.codPed from inserted),
(select top 1 inserted.fecha from inserted),
(select top 1 inserted.montoTotal from inserted),
(select top 1 inserted.codCli from inserted),
(1),
(null),
(null),
(null))

GO
ALTER TABLE [movimiento].[CABECERAP] ENABLE TRIGGER [afterInsertUpdateCabezera]
GO
/****** Object:  Trigger [movimiento].[TR_Deudores]    Script Date: 11/22/2018 2:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create trigger [movimiento].[TR_Deudores]
	on [movimiento].[CABECERAP]
	after insert
	as
	declare @deuda numeric(7,2)
	set @deuda= (select top 1 inserted.montoTotal from inserted)
	declare @totalDeuda numeric(7,2)
	set @totalDeuda = @deuda + (select saldoDeudor from [catalogo].[DEUDOR] where codCli = (select top 1 inserted.codCli from inserted))
	declare @limite numeric(7,2)
	set @limite= (select credito from [catalogo].[CLIENTE] where codCli = (select top 1 inserted.codCli from inserted))
	declare @garante char(3)
	set @garante = (select garante from [catalogo].[CLIENTE] where codCli = (select top 1 inserted.codCli from inserted)) 
	

	if (SELECT count(codCli) FROM [catalogo].[DEUDOR] where codCli = @garante) >0
	begin
		if @totalDeuda < @limite
		begin
			insert into [catalogo].[DEUDOR]
			values
			((select top 1 inserted.codCli from inserted),
			(select codCli from [catalogo].[CLIENTE] where(garante =(select top 1 inserted.codCli from inserted) )),
			(select credito from [catalogo].[CLIENTE] where codCli = (select top 1 inserted.codCli from inserted)),
			@totalDeuda	
			)
		end
	
		if @totalDeuda < @limite
		begin
			rollback
		end
	end

	if (SELECT count(codCli) FROM [catalogo].[DEUDOR] where codCli = @garante) =0
	begin
		rollback
	end
	
GO
ALTER TABLE [movimiento].[CABECERAP] ENABLE TRIGGER [TR_Deudores]
GO
/****** Object:  Trigger [movimiento].[actualizarMonto]    Script Date: 11/22/2018 2:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 create trigger [movimiento].[actualizarMonto]
 ON [movimiento].[DETALLEP]
 AFTER INSERT
 AS
 --UPDATE c set c.montoTotal= select inserted.cantidad*inserted.precioU+c.montoTotal from movimiento.cabecerap as c where inserted.codped = c.codped
UPDATE movimiento.cabecerap set movimiento.cabecerap.montoTotal=(select inserted.cantidad from inserted )* (select inserted.precioU from inserted)+movimiento.cabecerap.montoTotal
GO
ALTER TABLE [movimiento].[DETALLEP] ENABLE TRIGGER [actualizarMonto]
GO
/****** Object:  Trigger [movimiento].[actualizarMonto_update]    Script Date: 11/22/2018 2:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create trigger [movimiento].[actualizarMonto_update]
 ON [movimiento].[DETALLEP]
 AFTER UPDATE
 AS
 UPDATE movimiento.cabecerap 
 set 
 movimiento.cabecerap.montoTotal=(
 select inserted.cantidad from inserted )
 *(select inserted.precioU from inserted)
 +movimiento.cabecerap.montoTotal
GO
ALTER TABLE [movimiento].[DETALLEP] ENABLE TRIGGER [actualizarMonto_update]
GO
/****** Object:  Trigger [movimiento].[TR_Pagos]    Script Date: 11/22/2018 2:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [movimiento].[TR_Pagos]
	ON
	[movimiento].[PAGOS]
	after insert
	as
	declare @pago numeric(7,2)
		set @pago= (select inserted.valorPago from inserted)
		declare @saldo numeric(7,2)
		set @saldo = (select saldoDeudor from catalogo.Deudor where catalogo.DEUDOR.codCli=(select inserted.codCli from inserted))
		select * from catalogo.deudor
		if (@saldo-@pago)>0
		begin
		UPDATE catalogo.DEUDOR 
		set 
		saldoDeudor=(saldoDeudor-(select inserted.valorPago from inserted))
		end
		if(@saldo-@pago)<=0
			begin
			DELETE FROM catalogo.DEUDOR WHERE catalogo.DEUDOR.codCli=(select inserted.codCli from inserted) 
			end
	
GO
ALTER TABLE [movimiento].[PAGOS] ENABLE TRIGGER [TR_Pagos]
GO
USE [master]
GO
ALTER DATABASE [PedidosPrueba] SET  READ_WRITE 
GO
