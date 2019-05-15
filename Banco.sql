USE [master]
GO
/****** Object:  Database [HungryJoe]    Script Date: 5/14/2019 9:47:12 PM ******/
CREATE DATABASE [HungryJoe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HungryJoe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HungryJoe.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HungryJoe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HungryJoe_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HungryJoe] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HungryJoe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HungryJoe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HungryJoe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HungryJoe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HungryJoe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HungryJoe] SET ARITHABORT OFF 
GO
ALTER DATABASE [HungryJoe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HungryJoe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HungryJoe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HungryJoe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HungryJoe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HungryJoe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HungryJoe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HungryJoe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HungryJoe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HungryJoe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HungryJoe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HungryJoe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HungryJoe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HungryJoe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HungryJoe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HungryJoe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HungryJoe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HungryJoe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HungryJoe] SET  MULTI_USER 
GO
ALTER DATABASE [HungryJoe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HungryJoe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HungryJoe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HungryJoe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HungryJoe] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HungryJoe]
GO
/****** Object:  Table [dbo].[Cadastro]    Script Date: 5/14/2019 9:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cadastro](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CAD_NOME] [varchar](50) NULL,
	[CAD_ENDERECO] [varchar](80) NULL,
	[CAD_CIDADE] [varchar](50) NULL,
	[CAD_BAIRRO] [varchar](50) NULL,
	[CAD_CPF] [varchar](11) NULL,
	[CAD_TELEFONE] [varchar](14) NULL,
	[CAD_CELULAR] [varchar](14) NULL,
	[CAD_OBS] [varchar](max) NULL,
	[CAD_CLIENTE] [char](1) NULL,
	[CAD_ENTREGADOR] [char](1) NULL,
	[STATUS] [char](1) NULL,
	[DATA_INC] [datetime] NULL,
	[CAD_NUMERO] [varchar](5) NULL,
 CONSTRAINT [PK_Cadastro] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 5/14/2019 9:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Perfil](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[STATUS] [char](1) NULL,
	[PER_USUARIO] [char](1) NULL,
	[PER_VENDA] [char](1) NULL,
	[PER_PERFIL] [char](1) NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Produto]    Script Date: 5/14/2019 9:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Produto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[STATUS] [char](1) NULL,
	[PRO_ID_CATEGORIA] [int] NULL,
	[PRO_DESCRICAO] [varchar](50) NULL,
	[PRO_VALOR] [decimal](18, 2) NULL,
	[PRO_EST_MINIMO] [int] NULL,
	[PRO_ESTOQUE] [int] NULL,
	[DATA_INC] [datetime] NULL,
 CONSTRAINT [PK_Produto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Produto_Categoria]    Script Date: 5/14/2019 9:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Produto_Categoria](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PRO_CATEGORIA] [varchar](50) NULL,
 CONSTRAINT [PK_Produto_Categoria] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 5/14/2019 9:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USU_NOME] [varchar](50) NULL,
	[USU_SENHA] [varchar](50) NULL,
	[USU_LOGIN] [varchar](50) NULL,
	[USU_ID_PERFIL] [int] NULL,
	[STATUS] [char](1) NULL,
	[DATA_INC] [datetime] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venda]    Script Date: 5/14/2019 9:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Venda](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DATA_INC] [datetime] NULL,
	[STATUS] [varchar](20) NULL,
	[VEN_ID_CLIENTE] [int] NULL,
	[VEN_ID_VENDEDOR] [int] NULL,
	[VEN_VAL_PROD] [decimal](18, 2) NULL,
	[VEN_VAL_DESC] [decimal](18, 2) NULL,
	[VEN_VAL_TOTAL] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Venda] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venda_Itens]    Script Date: 5/14/2019 9:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venda_Itens](
	[VI_ID_VENDA] [int] NOT NULL,
	[VI_ID_PRODUTO] [int] NOT NULL,
	[VI_VALOR_UNT] [decimal](18, 2) NULL,
	[VI_QTDE] [int] NULL,
	[VI_VALOR_TOTAL] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Venda_Itens] PRIMARY KEY CLUSTERED 
(
	[VI_ID_VENDA] ASC,
	[VI_ID_PRODUTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 5/14/2019 9:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendedor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[STATUS] [char](1) NULL,
	[DATA_INC] [datetime] NULL,
	[DATA_ALT] [datetime] NULL,
	[VDR_NOME] [varchar](50) NULL,
	[VDR_CELULAR] [varchar](50) NULL,
	[VDR_EMAIL] [varchar](80) NULL,
 CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [HungryJoe] SET  READ_WRITE 
GO
