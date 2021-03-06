USE [master]
GO
/****** Object:  Database [dbventas]    Script Date: 2/15/2019 9:39:37 AM ******/
CREATE DATABASE [dbventas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbventas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbventas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbventas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dbventas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbventas] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbventas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbventas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbventas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbventas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbventas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbventas] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbventas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbventas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbventas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbventas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbventas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbventas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbventas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbventas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbventas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbventas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbventas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbventas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbventas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbventas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbventas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbventas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbventas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbventas] SET RECOVERY FULL 
GO
ALTER DATABASE [dbventas] SET  MULTI_USER 
GO
ALTER DATABASE [dbventas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbventas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbventas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbventas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbventas] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbventas', N'ON'
GO
ALTER DATABASE [dbventas] SET QUERY_STORE = OFF
GO
USE [dbventas]
GO
/****** Object:  Table [dbo].[articulo]    Script Date: 2/15/2019 9:39:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulo](
	[idArticulo] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](1024) NULL,
	[Imagen] [image] NULL,
	[fkCategoria] [int] NOT NULL,
	[fkPresentacion] [int] NOT NULL,
 CONSTRAINT [PK_articulo] PRIMARY KEY CLUSTERED 
(
	[idArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 2/15/2019 9:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](256) NULL,
 CONSTRAINT [PK_categoria] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 2/15/2019 9:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](40) NULL,
	[Sexo] [varchar](1) NULL,
	[Fecha_Nacimiento] [date] NULL,
	[Tipo_Documento] [varchar](20) NOT NULL,
	[Nm_Documento] [varchar](15) NOT NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_ingreso]    Script Date: 2/15/2019 9:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_ingreso](
	[idDetalle_Ingreso] [int] IDENTITY(1,1) NOT NULL,
	[fkIngreso] [int] NOT NULL,
	[fkArticulo] [int] NOT NULL,
	[Precio_Compra] [money] NOT NULL,
	[Precio_Venta] [money] NOT NULL,
	[Stock_Inicial] [int] NOT NULL,
	[Stock_Actual] [int] NOT NULL,
	[Fecha_Produccion] [date] NOT NULL,
	[Fecha_Venimiento] [date] NULL,
 CONSTRAINT [PK_detalle_ingreso] PRIMARY KEY CLUSTERED 
(
	[idDetalle_Ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[edetalle_venta]    Script Date: 2/15/2019 9:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[edetalle_venta](
	[idDetalle_Venta] [int] IDENTITY(1,1) NOT NULL,
	[fkVenta] [int] NOT NULL,
	[fkDetalle_Ingreso] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio_Venta] [money] NOT NULL,
	[Descuento] [money] NOT NULL,
 CONSTRAINT [PK_edetalle_venta] PRIMARY KEY CLUSTERED 
(
	[idDetalle_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ingreso]    Script Date: 2/15/2019 9:39:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ingreso](
	[idIngreso] [int] IDENTITY(1,1) NOT NULL,
	[fkTrabajador] [int] NOT NULL,
	[fkProveedor] [int] NOT NULL,
	[Fecha_Ingreso] [date] NOT NULL,
	[Tipo_Comprobante] [varchar](20) NOT NULL,
	[Serie] [varchar](4) NOT NULL,
	[Correlativo] [varchar](7) NOT NULL,
	[Igv] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_ingreso] PRIMARY KEY CLUSTERED 
(
	[idIngreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[presentacion]    Script Date: 2/15/2019 9:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[presentacion](
	[idPresentacion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](256) NULL,
 CONSTRAINT [PK_presentacion] PRIMARY KEY CLUSTERED 
(
	[idPresentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 2/15/2019 9:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[idProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Razon_Social] [varchar](150) NOT NULL,
	[Sector_Comercial] [varchar](50) NOT NULL,
	[Tipo_Documento] [varchar](20) NOT NULL,
	[Num_Documento] [varchar](11) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Telefono] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[Url] [varchar](100) NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trabajador]    Script Date: 2/15/2019 9:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trabajador](
	[idTrabajador] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
	[Apellidos] [varchar](40) NOT NULL,
	[Sexo] [varchar](1) NOT NULL,
	[Fecha_Nacimiento] [date] NOT NULL,
	[Numero_Documento] [varchar](15) NOT NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Acceso] [varchar](20) NOT NULL,
	[Usuario] [varchar](20) NULL,
	[Password] [varchar](20) NULL,
 CONSTRAINT [PK_Trabajador] PRIMARY KEY CLUSTERED 
(
	[idTrabajador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 2/15/2019 9:39:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[fkCliente] [int] NOT NULL,
	[fkTrabajador] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Tipo_Comprobante] [varchar](20) NOT NULL,
	[Serie_Comprobante] [varchar](4) NOT NULL,
	[Coorelativo] [varchar](7) NOT NULL,
	[Igv] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [dbventas] SET  READ_WRITE 
GO
