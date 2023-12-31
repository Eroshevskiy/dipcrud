USE [master]
GO
/****** Object:  Database [dip]    Script Date: 14.11.2023 20:44:41 ******/
CREATE DATABASE [dip]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dip', FILENAME = N'D:\sql2\MSSQL15.SQLEXPRESS\MSSQL\DATA\dip.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dip_log', FILENAME = N'D:\sql2\MSSQL15.SQLEXPRESS\MSSQL\DATA\dip_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dip] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dip].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dip] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dip] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dip] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dip] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dip] SET ARITHABORT OFF 
GO
ALTER DATABASE [dip] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dip] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dip] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dip] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dip] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dip] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dip] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dip] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dip] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dip] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dip] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dip] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dip] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dip] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dip] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dip] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dip] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dip] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dip] SET  MULTI_USER 
GO
ALTER DATABASE [dip] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dip] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dip] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dip] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dip] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dip] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dip] SET QUERY_STORE = OFF
GO
USE [dip]
GO
/****** Object:  Table [dbo].[merch]    Script Date: 14.11.2023 20:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[photo] [nvarchar](50) NULL,
	[name] [nvarchar](50) NOT NULL,
	[descreption] [text] NOT NULL,
	[manufacturer] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[title] [text] NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_merch] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_users]    Script Date: 14.11.2023 20:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_users](
	[id] [int] NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_type_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 14.11.2023 20:44:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[id_type] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[merch] ON 

INSERT [dbo].[merch] ([id], [photo], [name], [descreption], [manufacturer], [price], [title], [discount]) VALUES (1, N'/photo/1.jpg', N'Подушка', N'Описание подушки', N'Текстиль Профи М', 2200, N'Подушка', 0)
INSERT [dbo].[merch] ([id], [photo], [name], [descreption], [manufacturer], [price], [title], [discount]) VALUES (2, N'/photo/2.jpg', N'Одеяло', N'Описание одеяла', N'Текстиль Профи М ', 3000, N'Одеяло', 0)
INSERT [dbo].[merch] ([id], [photo], [name], [descreption], [manufacturer], [price], [title], [discount]) VALUES (3, N'/photo/3.jpg', N'Наволочка', N'Описание Наволочки', N'Текстиль Профи М', 700, N'Наволочка', 200)
SET IDENTITY_INSERT [dbo].[merch] OFF
GO
INSERT [dbo].[type_users] ([id], [role]) VALUES (1, N'админ')
INSERT [dbo].[type_users] ([id], [role]) VALUES (2, N'менеджер')
INSERT [dbo].[type_users] ([id], [role]) VALUES (3, N'клиент')
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (1, N'root', N'12345', 1)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (2, N'manager', N'123456', 2)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (3, N'client', N'1234567', 3)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (4, N'123456', N'123456', 3)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (5, N'852456', N'852456', 3)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (6, N'45615', N'142561', 3)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_type_users] FOREIGN KEY([id_type])
REFERENCES [dbo].[type_users] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_type_users]
GO
USE [master]
GO
ALTER DATABASE [dip] SET  READ_WRITE 
GO
