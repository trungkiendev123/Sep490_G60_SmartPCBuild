USE [master]
GO
/****** Object:  Database [SMARTPCDB]    Script Date: 6/20/2024 1:51:39 AM ******/
CREATE DATABASE [SMARTPCDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SMARTPCDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SMARTPCDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SMARTPCDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SMARTPCDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SMARTPCDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SMARTPCDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SMARTPCDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SMARTPCDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SMARTPCDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SMARTPCDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SMARTPCDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SMARTPCDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SMARTPCDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SMARTPCDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SMARTPCDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SMARTPCDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SMARTPCDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SMARTPCDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SMARTPCDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SMARTPCDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SMARTPCDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SMARTPCDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SMARTPCDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SMARTPCDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SMARTPCDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SMARTPCDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SMARTPCDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SMARTPCDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SMARTPCDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SMARTPCDB] SET  MULTI_USER 
GO
ALTER DATABASE [SMARTPCDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SMARTPCDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SMARTPCDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SMARTPCDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SMARTPCDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SMARTPCDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SMARTPCDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SMARTPCDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SMARTPCDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [uniqueidentifier] NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[AccountType] [varchar](255) NOT NULL,
	[status] [int] NULL,
	[RefreshToken] [text] NULL,
	[expired] [datetime] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[BillDate] [date] NULL,
	[TaxIN] [int] NULL,
	[Address] [nvarchar](255) NULL,
 CONSTRAINT [PK__Bill__11F2FC4A4318CF46] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CustomerID] [uniqueidentifier] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Category__19093A2BD677D987] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [uniqueidentifier] NOT NULL,
	[ProductID] [int] NOT NULL,
	[CommentText] [nvarchar](max) NOT NULL,
	[CommentDate] [date] NOT NULL,
	[ReplyText] [nvarchar](max) NULL,
	[ReplyStaffID] [uniqueidentifier] NULL,
 CONSTRAINT [PK__Comment__C3B4DFAAC51E26D2] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [uniqueidentifier] NOT NULL,
	[AccountID] [uniqueidentifier] NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Customer__A4AE64B8EB495964] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilterString]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilterString](
	[FilterStringID] [int] IDENTITY(1,1) NOT NULL,
	[FilterTypeCategoryID] [int] NULL,
	[FilterString] [text] NULL,
 CONSTRAINT [PK_FilterString] PRIMARY KEY CLUSTERED 
(
	[FilterStringID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilterType]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilterType](
	[FilterTypeID] [int] IDENTITY(1,1) NOT NULL,
	[FilterType] [varchar](50) NULL,
 CONSTRAINT [PK_FilterType] PRIMARY KEY CLUSTERED 
(
	[FilterTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilterTypeCategory]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilterTypeCategory](
	[FilterTypeCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[FilterTypeID] [int] NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_FilterTypeCategory] PRIMARY KEY CLUSTERED 
(
	[FilterTypeCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[PCBuildID] [int] NOT NULL,
	[PCType] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [uniqueidentifier] NULL,
	[OrderDate] [date] NOT NULL,
	[OrderStatus] [varchar](20) NOT NULL,
	[OrderAddress] [nvarchar](255) NULL,
	[ReceiveDate] [date] NULL,
	[TotalAmount] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK__Order__C3905BAFBBB7EE4A] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[OrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[WarrantyID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PricePerItem] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK__OrderIte__57ED06A15BD17752] PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCBuild]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCBuild](
	[PCBuildID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [uniqueidentifier] NULL,
	[BuildDate] [date] NOT NULL,
 CONSTRAINT [PK__PCBuild__FB9BAC5128C69B39] PRIMARY KEY CLUSTERED 
(
	[PCBuildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCBuildParts]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCBuildParts](
	[PCBuildID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[ProductName] [varchar](255) NOT NULL,
	[Description] [text] NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Warranty] [varchar](50) NULL,
	[Brand] [varchar](50) NULL,
	[Tag] [text] NULL,
	[TDP] [int] NULL,
	[ImageLink] [text] NULL,
 CONSTRAINT [PK__Product__B40CC6EDD02E4839] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStore]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStore](
	[ProductStoreID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[StockQuantity] [int] NOT NULL,
 CONSTRAINT [PK__ProductS__B9ACEA7D5DFE9994] PRIMARY KEY CLUSTERED 
(
	[ProductStoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductWarranty]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductWarranty](
	[WarrantyID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[WarrantySentDate] [date] NULL,
	[WarrantyReceive] [date] NULL,
 CONSTRAINT [PK__ProductW__2ED318F3315F1B7E] PRIMARY KEY CLUSTERED 
(
	[WarrantyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [uniqueidentifier] NOT NULL,
	[AccountID] [uniqueidentifier] NULL,
	[StoreID] [int] NULL,
	[FullName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Staff__96D4AAF7A071A3AE] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 6/20/2024 1:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[StoreID] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Store__3B82F0E14FF980B8] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Email], [Password], [AccountType], [status], [RefreshToken], [expired]) VALUES (N'49ca5a4a-5437-4dfa-9ea6-088489531291', N'thanhca001', N'kienlthe140057@fpt.edu.vn', N'0CEF1FB10F60529028A71F58E54ED07B', N'CUSTOMER', 1, NULL, CAST(N'2024-06-23T21:49:15.037' AS DateTime))
INSERT [dbo].[Account] ([AccountID], [Username], [Email], [Password], [AccountType], [status], [RefreshToken], [expired]) VALUES (N'34ba998a-a6b0-4374-8549-47ed5fdd70ac', N'tandz2001', N'hothithaonguyen832002@gmail.com', N'0CEF1FB10F60529028A71F58E54ED07B', N'STAFF', 1, NULL, NULL)
INSERT [dbo].[Account] ([AccountID], [Username], [Email], [Password], [AccountType], [status], [RefreshToken], [expired]) VALUES (N'bc81979e-170c-4434-adca-bb071b1262bd', N'trunghoan', N'trunghoan@gmail.com', N'0CEF1FB10F60529028A71F58E54ED07B', N'STAFF', 1, NULL, NULL)
INSERT [dbo].[Account] ([AccountID], [Username], [Email], [Password], [AccountType], [status], [RefreshToken], [expired]) VALUES (N'570be968-a574-4ba6-87a0-e69ac3e91c56', N'aladin00', N'aladin00@gmail.com', N'0CEF1FB10F60529028A71F58E54ED07B', N'STAFF', 1, NULL, NULL)
INSERT [dbo].[Account] ([AccountID], [Username], [Email], [Password], [AccountType], [status], [RefreshToken], [expired]) VALUES (N'8b14a7bd-8854-4f8c-b0d9-e83ba4a5d987', N'kientrunghn2000', N'kientrunghn2000@gmail.com', N'0CEF1FB10F60529028A71F58E54ED07B', N'ADMIN', 1, N'NIpB2f6WSw4o89DJSav/5HeRcMmebJ06GsQ/1n/Ec2o=', CAST(N'2024-06-24T13:47:50.780' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (8, N'Case')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (9, N'Cooling System')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'CPU')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'HDD')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (10, N'Keyboard')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Mainboard')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (12, N'Monitor')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (11, N'Mouse')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (7, N'PSU')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'RAM')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'SSD')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'VGA')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (N'aa8c0cae-d83e-47db-af8d-03d9861880a2', N'49ca5a4a-5437-4dfa-9ea6-088489531291', N'0945632245', N'Lê Trung Thành', N'Hà Đông,Hà Nội')
GO
SET IDENTITY_INSERT [dbo].[FilterString] ON 

INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (3, 2, N'Under 2 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (4, 2, N'2 - 4 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (5, 2, N'4 - 8 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (6, 2, N'Over 8 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (7, 3, N'CORE I3')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (8, 3, N'CORE I5')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (9, 3, N'CORE I7')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (10, 3, N'CORE I9')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (11, 3, N'Ryzen 3')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (12, 3, N'Ryzen 5')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (13, 3, N'Ryzen 7')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (14, 3, N'Others')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (15, 5, N'LGA 1200')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (16, 5, N'LGA 1700')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (17, 5, N'AM4')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (18, 5, N'AM5')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (19, 7, N'Under 2 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (20, 7, N'2 - 4 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (21, 7, N'4 - 8 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (22, 7, N'Over 8 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (23, 8, N'LGA 1200')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (24, 8, N'LGA 1700')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (25, 8, N'AM4')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (26, 8, N'AM5')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (27, 9, N'mATX')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (28, 9, N'ATX')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (29, 11, N'Under 2 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (30, 11, N'2 - 4 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (31, 11, N'4 - 8 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (32, 11, N'Over 8 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (33, 12, N'DDR4')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (34, 12, N'DDR5')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (35, 13, N'8GB')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (36, 13, N'16GB')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (37, 13, N'32GB')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (38, 13, N'64GB')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (39, 14, N'2666MHz')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (40, 14, N'3200MHz')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (41, 14, N'3600MHz')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (42, 14, N'5200MHz')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (43, 14, N'5600MHz')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (44, 14, N'6000MHz')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (45, 14, N'6200MHz')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (46, 14, N'6400MHz')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (47, 16, N'Under 2 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (48, 16, N'2 - 4 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (49, 16, N'4 - 8 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (50, 16, N'Over 8 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (51, 17, N'120GB')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (52, 17, N'240GB')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (53, 17, N'256GB')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (54, 17, N'480GB')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (55, 17, N'500GB')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (56, 17, N'1TB')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (57, 17, N'2TB')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (58, 18, N'M.2 NVMe')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (59, 18, N'SATA')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (60, 20, N'Under 2 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (61, 20, N'2 - 4 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (62, 20, N'4 - 8 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (63, 20, N'Over 8 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (64, 21, N'1TB')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (65, 21, N'2TB')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (66, 21, N'4TB')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (67, 21, N'10TB')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (68, 21, N'14TB')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (69, 21, N'16TB')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (70, 21, N'20TB')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (71, 23, N'2 - 4 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (72, 23, N'4 - 8 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (73, 23, N'8 - 12 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (74, 23, N'12 - 20 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (75, 23, N'Over 20 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (76, 24, N'Low-end')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (77, 24, N'Mid-end')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (78, 24, N'High-end')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (79, 26, N'Under 2 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (80, 26, N'2 - 4 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (81, 26, N'4 - 8 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (82, 26, N'Over 8 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (83, 27, N'Under 500W')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (84, 27, N'500 - 650W')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (85, 27, N'650 - 800W')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (86, 27, N'800 - 1000W')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (87, 27, N'Over 1000W')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (88, 29, N'Under 1 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (89, 29, N'1 - 2 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (90, 29, N'Over 2 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (91, 30, N'Mid Tower ')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (92, 30, N'Full Tower')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (93, 32, N'Under 2 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (94, 32, N'2 - 4 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (95, 32, N'4 - 8 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (96, 32, N'Over 8 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (97, 34, N'14 inch')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (98, 34, N'15.6 inch')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (99, 34, N'23.8 inch')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (100, 34, N'24 inch')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (101, 34, N'27 inch')
GO
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (102, 34, N'28 inch')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (103, 34, N'32 inch')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (104, 34, N'34 inch')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (105, 35, N'FHD')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (106, 35, N'QHD')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (107, 35, N'UHD')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (108, 36, N'60Hz')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (109, 36, N'75Hz')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (110, 36, N'120Hz')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (111, 36, N'144Hz')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (112, 36, N'165Hz')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (113, 38, N'Under 500K')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (114, 38, N'500K - 1 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (115, 38, N'Over 1 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (116, 39, N'LGA 1200')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (117, 39, N'LGA 1700')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (118, 39, N'AM4')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (119, 39, N'AM5')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (120, 41, N'Under 500K')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (121, 41, N'500K - 1 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (122, 41, N'Over 1 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (123, 42, N'Mechanical Keyboard')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (124, 42, N'Wired')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (125, 42, N'Wireless')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (126, 44, N'Under 500K')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (127, 44, N'500K - 1 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (128, 44, N'Over 1 Millions')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (129, 45, N'Wired')
INSERT [dbo].[FilterString] ([FilterStringID], [FilterTypeCategoryID], [FilterString]) VALUES (130, 45, N'Wireless')
SET IDENTITY_INSERT [dbo].[FilterString] OFF
GO
SET IDENTITY_INSERT [dbo].[FilterType] ON 

INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (1, N'CPU Brand')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (2, N'CPU Price')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (3, N'CPU Type')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (5, N'CPU Socket')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (6, N'Mainboard Brand')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (7, N'Mainboard Price')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (8, N'Mainboard Socket')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (9, N'Mainboard Size')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (10, N'RAM Brand')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (11, N'RAM Price')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (12, N'RAM Type')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (13, N'RAM Memory')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (14, N'RAM Bus')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (15, N'SSD Brand')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (16, N'SSD Price')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (17, N'SSD Storage')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (18, N'SSD Type')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (19, N'HDD Brand')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (20, N'HDD Price')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (21, N'HDD Storage')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (22, N'VGA Brand')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (23, N'VGA Price')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (24, N'VGA Type')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (25, N'PSU Brand')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (26, N'PSU Price')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (27, N'PSU Power')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (28, N'Case Brand')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (29, N'Case Price')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (30, N'Case Type')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (31, N'Monitor Brand')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (32, N'Monitor Price')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (33, N'Monitor Size')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (34, N'Monitor Resolution')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (35, N'Monitor Refresh Rate')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (36, N'Cooling Brand')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (37, N'Cooling Price')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (38, N'Cooling Socket')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (39, N'Keyboard Brand')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (40, N'Keyboard Price')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (41, N'Keyboard Type')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (42, N'Mouse Brand')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (43, N'Mouse Price')
INSERT [dbo].[FilterType] ([FilterTypeID], [FilterType]) VALUES (44, N'Mouse Type')
SET IDENTITY_INSERT [dbo].[FilterType] OFF
GO
SET IDENTITY_INSERT [dbo].[FilterTypeCategory] ON 

INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (1, 1, 1)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (2, 2, 1)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (3, 3, 1)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (5, 5, 1)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (6, 6, 2)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (7, 7, 2)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (8, 8, 2)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (9, 9, 2)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (10, 10, 3)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (11, 11, 3)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (12, 12, 3)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (13, 13, 3)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (14, 14, 3)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (15, 15, 4)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (16, 16, 4)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (17, 17, 4)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (18, 18, 4)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (19, 19, 5)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (20, 20, 5)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (21, 21, 5)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (22, 22, 6)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (23, 23, 6)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (24, 24, 6)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (25, 25, 7)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (26, 26, 7)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (27, 27, 7)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (28, 28, 8)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (29, 29, 8)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (30, 30, 8)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (31, 31, 12)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (32, 32, 12)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (34, 33, 12)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (35, 34, 12)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (36, 35, 12)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (37, 36, 9)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (38, 37, 9)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (39, 38, 9)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (40, 39, 10)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (41, 40, 10)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (42, 41, 10)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (43, 42, 11)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (44, 43, 11)
INSERT [dbo].[FilterTypeCategory] ([FilterTypeCategoryID], [FilterTypeID], [CategoryID]) VALUES (45, 44, 11)
SET IDENTITY_INSERT [dbo].[FilterTypeCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (1, 1, N'CPU INTEL CORE I5-12400F', N'6 cores 12 threads, Up to 4.4GHz', CAST(2999000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/1ieHm5StVSB_mciaAk80jIYjQCdFBL8Ji/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (3, 1, N'CPU INTEL CORE I5-12400', N'6 cores 12 threads, Up to 4.4GHz', CAST(3799000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/1s1G_iTLf5YcwD2qhDCBaGTSykgLaC0pw/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (4, 1, N'CPU INTEL CORE I5-13400', N'10 cores 16 threads, Up to 4.6GHz', CAST(5859000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/1CQ3ApvA1n9tBpsVeRay-7FobhZNGno93/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (5, 1, N'CPU INTEL CORE I3-12100', N'4 cores 8 threads, 3.3GHz turbo up to 4.3GHz', CAST(2939000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 58, N'https://drive.google.com/file/d/14QTNEAfEVLkYDoQCzoQKdu4iiYzl0XDB/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (6, 1, N'CPU INTEL CORE I7-13700', N'16 cores 24 threads, Up to 5.2GHz', CAST(10499000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/1y8HAd4iN-5kWZ0fhr-rXDxoSFFseXv-B/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (7, 1, N'CPU INTEL CORE I5-13500', N'14 cores 20 threads, Up to 4.8GHz', CAST(6499000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/1mUNxs2gLyBQCFBW2mQQz9XXyjK4rXN8D/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (8, 1, N'CPU INTEL CORE I5-14600K', N'14 cores 20 threads, Up to 5.3GHz', CAST(8499000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125, N'https://drive.google.com/file/d/1BnWkz-Z5-BeByXqYU9fB4hAK0UXVlkF3/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (9, 1, N'CPU INTEL CORE I7-14700K', N'20 cores 28 threads, Up to 5.6GHz', CAST(11399000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125, N'https://drive.google.com/file/d/1u-hhRBLBzvay7T9Q7S5Q0H5ZjLRA038j/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (10, 1, N'CPU INTEL CORE I9-14900K', N'24 cores 32 threads, Up to 5.8GHz', CAST(15899000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125, N'https://drive.google.com/file/d/1tEywsFV6FoB7ks0m6HY0YOmvcqWuQgmn/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (11, 1, N'CPU INTEL CORE I7-14700KF', N'20 cores 28 threads, Up to 5.6GHz', CAST(10799000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125, N'https://drive.google.com/file/d/1FtYvk0z_Et9U_1VVL-AttmlkAfXrUYh_/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (12, 1, N'CPU INTEL CORE I7-13700K', N'16 cores 24 threads, Up to 5.4GHz', CAST(11199000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125, N'https://drive.google.com/file/d/1p01frdUJG7m0_UPJPh_Ovx2GEKdz30_v/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (13, 1, N'CPU INTEL CORE I3-10105', N'4 cores 8 threads, 3.7GHz turbo up to 4.4GHz', CAST(2699000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1200', 65, N'https://drive.google.com/file/d/1Hm-BKiZvQvWmeyC5rcwfvh34FOPMnhw1/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (14, 1, N'CPU INTEL CORE I9-12900K', N'16 cores 24 threads, 3.2GHz turbo up to 5.2GHz', CAST(10599000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125, N'https://drive.google.com/file/d/1TzkqBu413h4GYTwnH_7gFzne4GAar04b/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (15, 1, N'CPU INTEL CORE I5-12600K', N'10 cores 16 threads, 3.7GHz turbo up to 4.9GHz', CAST(5149000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125, N'https://drive.google.com/file/d/1Jnm9hdkOcfLKOn6ttRGQTbXUV7k8-PLn/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (16, 1, N'CPU INTEL CORE I5-12600KF', N'10 cores 16 threads, 3.7GHz turbo up to 4.9GHz', CAST(4499000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125, N'https://drive.google.com/file/d/1ciQriUzIt7AkEWEup5T2Ko8Ja6BMY7A5/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (18, 1, N'CPU INTEL CORE I9-14900', N'24 cores 32 threads, Up to 5.8GHz', CAST(15999000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/14f0zvcBgr9oz6u4R-VlybBIsT1vX8yx4/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (19, 1, N'CPU INTEL CORE I3-13100F', N'4 cores 8 threads, Up to 4.5GHz', CAST(3099000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/14f0zvcBgr9oz6u4R-VlybBIsT1vX8yx4/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (20, 1, N'CPU INTEL CORE I7-12700F', N'12 cores 20 threads, Up to 4.8GHz', CAST(7099000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125, N'https://drive.google.com/file/d/1Iq5oklGPbkYQpL6se85rz7gF0TRVIVBE/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (21, 1, N'CPU INTEL CORE I7-12700', N'12 cores 20 threads, 3.6GHz turbo up to 4.9GHz', CAST(7799000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/1Q7v4vqIYajVb2FcxncVjX_REIk9BOxk7/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (22, 1, N'CPU INTEL CORE I9-13900', N'24 cores 32 threads, Up to 5.6GHz', CAST(15599000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/1BIuy8Z9nylbf2Muk02fjaskMRma3hg43/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (23, 1, N'CPU INTEL PENTIUM GOLD G7400', N'2 cores 4 threads, 3.7GHz', CAST(2359000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 46, N'https://drive.google.com/file/d/16Z0dxXSFQX0BU48Zi5mk-xyY3SLvYZqj/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (24, 1, N'CPU INTEL CORE I7-12700K', N'12 cores 20 threads, 3.8GHz turbo up to 5.0GHz', CAST(7799000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125, N'https://drive.google.com/file/d/1AphvuGcRt-vkmJU0mEGNeK4cuCAVsx0N/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (25, 1, N'CPU INTEL CORE I3-13100', N'4 cores 8 threads, Up to 4.5GHz', CAST(3899000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/1H2YS4smYF947iKxTLL2S2PTUTWOe-nJx/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (26, 1, N'CPU INTEL CORE I5-13400F', N'10 cores 16 threads, Up to 4.6GHz', CAST(4899000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/1IqPlVsPwmiEecdS-QZ0MntOWaguU6G1t/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (27, 1, N'CPU INTEL CORE I3-14100', N'4 cores 8 threads, Up to 4.7GHz', CAST(3899000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 60, N'https://drive.google.com/file/d/1BathxJliSvZTq_-xeuvge9UxL6qIXHpR/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (28, 1, N'CPU INTEL CORE I3-14100F', N'4 cores 8 threads, Up to 4.7GHz', CAST(3699000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 60, N'https://drive.google.com/file/d/1WsfQdAhwkeufC67SH78N4Ms18W41NIPN/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (29, 1, N'CPU INTEL CORE I7-14700F', N'20 cores 28 threads, Up to 5.4GHz', CAST(10399000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/1U6zePLomYTjYKVOld_7Lm7kwIXIPKAVN/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (30, 1, N'CPU INTEL CORE I7-14700', N'20 cores 28 threads, Up to 5.4GHz', CAST(11499000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/1fA7Rjsf-aoFNtys4Z8tWEjPzUWu2qbDP/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (31, 1, N'CPU INTEL CORE I5-14500', N'14 cores 20 threads, Up to 5.0GHz', CAST(6599000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/1ksd3wq3ddv4yS2NxO1K8qkhtf_q8Veqz/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (32, 1, N'CPU INTEL CORE I5-14400', N'10 cores 16 threads, Up to 4.7GHz', CAST(6299000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/1GBVFba7hUWx2wsFJ4aof0FI76rQ56Zje/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (33, 1, N'CPU INTEL CORE I7-13700K', N'16 cores 24 threads, Up to 5.4GHz', CAST(11199000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125, N'https://drive.google.com/file/d/1FtYvk0z_Et9U_1VVL-AttmlkAfXrUYh_/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (34, 1, N'CPU INTEL CORE I5-13600K', N'14 cores 20 threads, Up to 5.1GHz', CAST(7699000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125, N'https://drive.google.com/file/d/1RM1DN0qMzBKlSsNE2T007-hVWeQIKhDN/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (35, 1, N'CPU INTEL CORE I5-13400F', N'10 cores 16 threads, Up to 4.6GHz', CAST(5199000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/1IqPlVsPwmiEecdS-QZ0MntOWaguU6G1t/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (36, 1, N'CPU INTEL CORE I3-10105F', N'4 cores 8 threads, Up to 4.4GHz', CAST(1699000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1200', 65, N'https://drive.google.com/file/d/1QEdhMwA2lbUXFT9kkmbgSfYxi3N33-PD/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (37, 1, N'CPU INTEL CORE I7-12700K', N'12 cores 20 threads, Up to 5.0GHz', CAST(7799000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125, N'https://drive.google.com/file/d/1AphvuGcRt-vkmJU0mEGNeK4cuCAVsx0N/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (38, 1, N'CPU INTEL CORE I5-10400', N'6 cores 12 threads, Up to 4.3GHz', CAST(3449000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1200', 65, N'https://drive.google.com/file/d/1XKL8JB_1Zf3iiZYrhKKtI4cUKv9kwF1I/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (39, 1, N'CPU INTEL CORE I5-10400F', N'6 cores 12 threads, Up to 4.3GHz', CAST(2699000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1200', 65, N'https://drive.google.com/file/d/1ieYD-iRtAEkOLkg85RZ1yKjtFPtMhFln/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (40, 1, N'CPU INTEL CORE I9-12900KS', N'16 cores 24 threads, Up to 5.5GHz', CAST(12599000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 150, N'https://drive.google.com/file/d/1Hm-BKiZvQvWmeyC5rcwfvh34FOPMnhw1/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (41, 1, N'CPU INTEL CORE I9-13900K', N'24 cores 32 threads, Up to 5.8GHz', CAST(15599000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125, N'https://drive.google.com/file/d/1x5z-tx4TH-zQULrm6zFTOtvWki1ykcv5/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (42, 1, N'CPU INTEL CORE I9-13900KF', N'24 cores 32 threads, Up to 5.8GHz', CAST(14999000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125, N'https://drive.google.com/file/d/1VkCYwmdJa2RN4PQUUP0GTnbRzvlFpeX2/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (43, 1, N'CPU INTEL CORE I7-13700KF', N'16 cores 24 threads, Up to 5.4GHz', CAST(10499000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125, N'https://drive.google.com/file/d/17-iUD8g396Eky71FkXAxRd2rfyv-AYti/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (44, 1, N'CPU INTEL CORE I5-13600KF', N'14 cores 20 threads, Up to 5.1GHz', CAST(7799000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125, N'https://drive.google.com/file/d/1BLxq4V81sstORkDEQay3tFFY0HZo-Grd/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (45, 1, N'CPU INTEL CORE I3-10105F', N'4 cores 8 threads, Up to 4.4GHz', CAST(1699000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/1QEdhMwA2lbUXFT9kkmbgSfYxi3N33-PD/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (46, 1, N'CPU INTEL CORE I7-12700', N'12 cores 20 threads, Up to 4.9GHz', CAST(7799000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/1Q7v4vqIYajVb2FcxncVjX_REIk9BOxk7/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (50, 1, N'CPU AMD Ryzen 7 7800X3D', N'8 cores, 16 threads, 4.2GHz up to 5.0GHz', CAST(10699000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM5', 120, N'https://drive.google.com/file/d/1TeYTIzyEla5d0quKN4O4a9cz_fdRipnl/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (51, 1, N'CPU AMD Ryzen 9 7900X3D', N'12 cores, 24 threads, 4.4Ghz up to 5.6Ghz', CAST(14299900 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM5', 120, N'https://drive.google.com/file/d/18DCh5aenwk_68ilzPprK1I6LAM1fDP13/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (52, 1, N'CPU AMD Ryzen 9 7950X3D', N'16 cores, 32 threads, 4.2Ghz up to 5.7Ghz', CAST(18699000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM5', 120, N'https://drive.google.com/file/d/1ESOj7fV-o2k-F8qTNwUHvoEQ9Wx8Ym9E/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (53, 1, N'CPU AMD Ryzen 7 7700X', N'8 cores, 16 threads, 4.5 GHz Upto 5.4GHz', CAST(9299000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM5', 105, N'https://drive.google.com/file/d/1STxeOfC1kXI1A7WL_pcfFr0HRsAR_poz/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (54, 1, N'CPU AMD Ryzen 9 7900X', N'12 cores, 24 threads, 4.7 GHz Upto 5.6GHz', CAST(12099000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM5', 170, N'https://drive.google.com/file/d/1byTsb5-n7quS_WqMgrNSik4TIq7yJenI/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (55, 1, N'CPU AMD Ryzen 5 5600GT', N'6 cores, 12 threads, 3.6GHz Upto 4.6GHz', CAST(3799000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65, N'https://drive.google.com/file/d/17WF3yw8ku4lIrV2DXDzfdrJXh5z0beeT/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (56, 1, N'CPU AMD Ryzen 7 5700X3D', N'8 cores, 16 threads, 3.0GHz Upto 4.1GHz', CAST(6699000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 105, N'https://drive.google.com/file/d/1u76fa0FgxGg5UERdrHZNzoNdPFN5tvGG/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (57, 1, N'CPU AMD Ryzen 7 8700G', N'8 cores, 16 threads, 4.2GHz Upto 5.1GHz', CAST(9499000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM5', 65, N'https://drive.google.com/file/d/1y9Col-VfbE9-9sYBB_qPp1S_ckAK3Fyd/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (58, 1, N'CPU AMD Ryzen 5 8600G', N'6 cores, 12 threads, 4.3GHz Upto 5.0GHz', CAST(6599000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM5', 65, N'https://drive.google.com/file/d/1RhuV7rsRwPFM9__fwtoaZxeitdCm0GCi/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (59, 1, N'CPU AMD Ryzen 5 8500G', N'6 cores, 12 threads, 3.5GHz Upto 5.0GHz', CAST(5199000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM5', 65, N'https://drive.google.com/file/d/1P36cMohBoXu6-xRNAmybAMLvzhglRQJ_/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (60, 1, N'CPU AMD Ryzen 5 5600G', N'6 cores, 12 threads, 3.9GHz Upto 4.4GHz', CAST(3599000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65, N'https://drive.google.com/file/d/154hXkfhKGGoOjtB7MYxfk2qiN6Rq0Ms7/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (61, 1, N'CPU AMD Ryzen 9 7950X', N'16 cores, 32 threads, 4.5 GHz Upto 5.7GHz', CAST(17199000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM5', 170, N'https://drive.google.com/file/d/1L5ZdSnk0IwAKhJeECp7rZqfc200sMKhs/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (62, 1, N'CPU AMD Ryzen 5 4600G', N'6 cores, 12 threads, 3.7 GHz turbo upto 4.2GHz', CAST(2659000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65, N'https://drive.google.com/file/d/1tl-wTgPCeb8bGd5gWyViQ5RmZv0y3a1d/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (63, 1, N'CPU AMD Ryzen 5 5500', N'6 cores, 12 threads, 3.6 GHz Upto 4.2GHz', CAST(2449000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65, N'https://drive.google.com/file/d/1x6HBkBBEFaQlmv24e0RF09YSNcwfCdVJ/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (64, 1, N'CPU AMD Ryzen 5 5600', N'6 cores, 12 threads, 3.5 GHz Upto 4.4GHz', CAST(3399000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65, N'https://drive.google.com/file/d/1ph37OUfKcLyFV7J2yLvDEIKKSuZzi-GZ/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (65, 1, N'CPU AMD Ryzen 7 5800X3D', N'8 cores, 16 threads, 3.4 GHz Upto 4.5GHz', CAST(8899000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 105, N'https://drive.google.com/file/d/1uR2B43AIeKrJBSa6nF8sRfX3UErJOTa9/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (66, 1, N'CPU AMD Ryzen 9 5900X', N'12 cores, 24 threads, 3.7 GHz Upto 4.8GHz', CAST(8399000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 105, N'https://drive.google.com/file/d/1Wpd3hjqlOWbOeESwO20sZeUAn5r36zO_/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (67, 1, N'CPU AMD Ryzen 5 5600X', N'6 cores, 12 threads, 3.7 GHz Upto 4.6GHz', CAST(3999000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65, N'https://drive.google.com/file/d/1qC8M5ad37_Vdn2yLeIlRdxr6HccvSwDp/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (68, 1, N'CPU AMD Athlon 3000G', N'2 cores, 4 threads, 3.5GHz', CAST(1289000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 35, N'https://drive.google.com/file/d/17m40tdJAlARYuWszrEb6VOeZc_XjZy7a/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (69, 1, N'CPU AMD Ryzen 3 3200G', N'4 cores, 4 threads, 3.6GHz turbo up to 4.0GHz', CAST(1999000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65, N'https://drive.google.com/file/d/18nNpUmEiWoU1vW4ldp9V_oGbFHyoI9as/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (70, 1, N'CPU AMD Ryzen 7 5700G', N'8 cores, 16 threads, 3.8GHz Upto 4.6GHz', CAST(5199000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65, N'https://drive.google.com/file/d/1UZ6hArUSa82iVGBFxA0UuEnq4UIGFHZQ/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (71, 1, N'CPU AMD Ryzen 5 7600X', N'6 cores, 12 threads, 4.7 GHz Upto 5.3GHz', CAST(6599000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM5', 105, N'https://drive.google.com/file/d/1lO8Yz7DhI-CXJEL8Mw4bkb-pCItgzzmi/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (72, 1, N'CPU AMD Ryzen 3 4300G', N'4 cores, 8 threads, 3.8 GHz turbo upto 4.0GHz', CAST(2499000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65, N'https://drive.google.com/file/d/1my-fATSbRIkD2N9nDvAm0CRX5OnxYrcz/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (73, 1, N'CPU AMD Ryzen 7 5700X', N'8 cores, 16 threads, 3.4 GHz Upto 4.6GHz', CAST(5099000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65, N'https://drive.google.com/file/d/18DAwAs6RiOjdup-BiObcRedBtIcol7Hr/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (74, 1, N'CPU AMD Ryzen 5 7600', N'6 cores, 12 threads, 3.8 GHz Upto 5.1GHz', CAST(5599000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM5', 65, N'https://drive.google.com/file/d/1KMkZNkUGFS-YI3_5NsVFyaVjKbc3067J/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (75, 1, N'CPU AMD Ryzen 5 3600', N'6 cores, 12 threads, 3.6GHz turbo up to 4.2GHz', CAST(2199000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65, N'https://drive.google.com/file/d/1bKkLnBnx8qsEZoivkraKzVywU6683BTW/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (76, 1, N'CPU AMD Ryzen 5 3500', N'6 cores, 6 threads, 3.6GHz turbo up to 4.1GHz', CAST(3299000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65, N'https://drive.google.com/file/d/1Ue1m_gtIQO9ugUwFGc2yiIBxflequ_Fw/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (77, 1, N'CPU AMD Ryzen Threadripper Pro 7985WX', N'64 cores, 128 threads, 3.2Ghz up to 5.1Ghz', CAST(214999000 AS Decimal(18, 0)), N'36 months', N'AMD', N'sTR5', 350, N'https://drive.google.com/file/d/14iSRNqqZUuBjO93JLHV0JoIWcYoW4bZQ/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (78, 1, N'CPU AMD Ryzen 7 7700', N'8 cores, 16 threads, 3.8 GHz Upto 5.3GHz', CAST(8999000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM5', 65, N'https://drive.google.com/file/d/1lTDWsFmvJvy3oY_Jtdyr9hFLfY0-zjce/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (79, 1, N'CPU AMD Ryzen 9 7900', N'12 cores, 24 threads, 3.7 GHz Upto 5.4GHz', CAST(11699000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM5', 65, N'https://drive.google.com/file/d/1StdwexhzCEyUGu5g23cHPBBEAm93xAex/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (80, 1, N'CPU AMD Ryzen Threadripper Pro 7975WX', N'32 cores, 64 threads, 4.0Ghz up to 5.3Ghz', CAST(111199000 AS Decimal(18, 0)), N'36 months', N'AMD', N'sTR5', 350, N'https://drive.google.com/file/d/17JS0uCIw6Ewj10s2j5kibCRweE-CxqmM/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (81, 1, N'CPU AMD Ryzen Threadripper Pro 7965WX', N'24 cores, 48 threads, 4.2Ghz up to 5.3Ghz', CAST(76599000 AS Decimal(18, 0)), N'36 months', N'AMD', N'sTR5', 350, N'https://drive.google.com/file/d/1RVoC7puX5958OdesqUcP3hNk4cqf20cW/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (82, 1, N'CPU AMD Ryzen 5 5500GT', N'6 cores, 12 threads, 4.4 GHz Upto 3.6 GHz', CAST(3499000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM5', 65, N'https://drive.google.com/file/d/17V9TshXjt1-zCofBwUML-cz6MiSrKvPV/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (83, 1, N'CPU AMD Ryzen Threadripper 7980X', N'64 cores, 128 threads, 3.2Ghz up to 5.1Ghz', CAST(143999000 AS Decimal(18, 0)), N'36 months', N'AMD', N'sTR5', 350, N'https://drive.google.com/file/d/1EadPeBnFBs1g0fPdaV8dyysIWIs-pAKf/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (84, 1, N'CPU AMD Ryzen Threadripper Pro 5965WX', N'24 cores, 48 threads, 3.8 GHz Upto 4.5GHz', CAST(64999000 AS Decimal(18, 0)), N'36 months', N'AMD', N'sWRX8', 280, N'https://drive.google.com/file/d/1284ozi12rf5Bt-z8LB19Wdt7qCfn1uZW/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (85, 1, N'CPU AMD Ryzen Threadripper Pro 5995WX', N'64 cores, 128 threads, 2.7 GHz Upto 4.5GHz', CAST(180999000 AS Decimal(18, 0)), N'36 months', N'AMD', N'sWRX8', 280, N'https://drive.google.com/file/d/1Py8hJb-5EGJNd93Y7AHABCKwb36gXLfm/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (86, 1, N'CPU AMD Ryzen 3 4100', N'4 cores, 8 threads, 3.8 GHz turbo upto 4.0GHz', CAST(1699000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM4', 65, N'https://drive.google.com/file/d/1lWgkgOToOehyMZOR3CJDDJFyJq9zvbZM/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (87, 1, N'CPU AMD Ryzen 5 4500', N'6 cores, 12 threads, 3.6 GHz turbo upto 4.1GHz', CAST(1949000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM4', 65, N'https://drive.google.com/file/d/18Ur63XNLYznY0KK1RhqDQt8jhGEqWoJk/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (88, 1, N'CPU AMD Ryzen 7 5800X', N'8 cores, 16 threads, 3.8 GHz Upto 4.7GHz', CAST(6599000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM4', 105, N'https://drive.google.com/file/d/1jzS0IUKLv7YzkD1XKFhQldJKKz_FXOIZ/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (89, 1, N'CPU AMD Ryzen 9 5950X', N'16 cores, 32 threads, 3.4 GHz Upto 4.9GHz', CAST(10599000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM4', 105, N'https://drive.google.com/file/d/1rujxt4viaiqHveuExqMX3wcv5_mes1iB/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (90, 2, N'Mainboard ASUS ROG MAXIMUS Z790 HERO', N'High-end gaming motherboard with extensive features.', CAST(16499000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 60, N'https://drive.google.com/file/d/1d_a3JMM643w2DZJ9nkr3nAYt4QcuV1xY/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (91, 2, N'Mainboard MSI MEG Z790 ACE DDR5', N'Premium motherboard with top-tier features for gamers and enthusiasts.', CAST(17599000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'E-ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 60, N'https://drive.google.com/file/d/18K6LKCZtYXM48wuDtukXy05v5LWw_GzN/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (92, 2, N'Mainboard ASUS ROG STRIX Z790-A GAMING WIFI DDR5', N'Gaming-focused motherboard with advanced features.', CAST(13699000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 60, N'https://drive.google.com/file/d/1FjyEu3rhsG9kJmuGcMFT21iZb_8Lf_7A/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (93, 2, N'Mainboard ASUS PROART Z790-CREATOR WIFI DDR5', N'Motherboard designed for creators with enhanced connectivity.', CAST(12299000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 60, N'https://drive.google.com/file/d/1LapRLZY6DTgSvVbqN6VRMR9E3vzOnK3O/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (94, 2, N'Mainboard GIGABYTE Z790 AORUS MASTER', N'High-end motherboard with robust performance and connectivity.', CAST(15499000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'E-ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 70, N'https://drive.google.com/file/d/1BfFTyn62nhijEghpo1s6E9gekhpC_QIY/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (95, 2, N'Mainboard ASUS ROG STRIX Z790-E GAMING WIFI', N'Feature-rich motherboard with WiFi and gaming optimizations.', CAST(12999000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55, N'https://drive.google.com/file/d/15qIlCeXnYE5u38J9kQLe09aUr5RhGrzH/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (96, 2, N'Mainboard GIGABYTE Z790 AERO G', N'Content creation motherboard with DDR5 support.', CAST(8459000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55, N'https://drive.google.com/file/d/188C9SYCICz7cpm7I-QbtSZrBtZytSue4/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (98, 2, N'Mainboard ASUS ROG STRIX Z790-H GAMING WIFI DDR4', N'High-performance gaming motherboard with WiFi support.', CAST(6499000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1700, DDR4, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55, N'https://drive.google.com/file/d/1IRU_WZfEW3Xg_DCxfGWKLhvMbV3tfVsU/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (99, 2, N'Mainboard GIGABYTE Z790 UD AX DDR5', N'Reliable motherboard with DDR5 support.', CAST(6299000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55, N'https://drive.google.com/file/d/1IRU_WZfEW3Xg_DCxfGWKLhvMbV3tfVsU/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (100, 2, N'Mainboard MSI MAG Z790 TOMAHAWK WIFI', N'Durable motherboard with extensive connectivity.', CAST(5999000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 60, N'https://drive.google.com/file/d/11bR4jtyx8QNacJEpBBOgJYX_YoGebYgT/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (101, 2, N'Mainboard MSI Z790-A PRO DDR5', N'Affordable motherboard with DDR5 support.', CAST(5799000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55, N'https://drive.google.com/file/d/1NoHw_w7xeHSjAHNTLPwsUpphjCSULo1p/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (102, 2, N'Mainboard GIGABYTE Z790 UD AX', N'Reliable motherboard with WiFi support.', CAST(5799000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55, N'https://drive.google.com/file/d/1DPJALXypEqQ5nlL8jQZOeYPbOzLBmWfR/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (103, 2, N'Mainboard GIGABYTE Z790 GAMING X AX DDR5', N'Affordable gaming motherboard with DDR5 support.', CAST(5799000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55, N'https://drive.google.com/file/d/1-T73Vx3_5prWeWg3CK9voyBV1IxnaLcg/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (104, 2, N'Mainboard ASUS TUF GAMING Z790-PLUS D4', N'Gaming motherboard with DDR4 memory support.', CAST(5499000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1700, DDR4, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55, N'https://drive.google.com/file/d/1IhDTXnCHN-j0lz2g7aMvJbMX2fV7Vv5r/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (105, 2, N'Mainboard GIGABYTE Z790 UD', N'Affordable motherboard with reliable performance.', CAST(4899000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, LGA 1700, DDR4, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55, N'https://drive.google.com/file/d/1DPJALXypEqQ5nlL8jQZOeYPbOzLBmWfR/view?usp=drive_link')
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (106, 2, N'Mainboard MSI PRO Z790-A WIFI DDR4', N'Affordable motherboard with DDR4 support.', CAST(4899000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'ATX, LGA 1700, DDR4, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55, N'https://drive.google.com/file/d/1Dz-PAT6ol5B_DLGCdBFyIzT8Kdbcb_S0/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (107, 2, N'Mainboard ASUS TUF GAMING Z790-PLUS', N'Gaming motherboard with robust build quality.', CAST(5499000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1700, DDR4, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55, N'https://drive.google.com/file/d/16fTsLM5GvLEcbQVPXX42MrmpRkhIxV6s/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (108, 2, N'Mainboard GIGABYTE Z790 UD DDR4', N'Budget-friendly motherboard with essential features.', CAST(4999000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, LGA 1700, DDR4, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55, N'https://drive.google.com/file/d/1zkUvsOwiVIHqmyl0xDX20mIM3QZcMN7I/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (109, 2, N'Mainboard GIGABYTE Z790 GAMING X AX', N'Budget-friendly motherboard with WiFi support.', CAST(4899000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55, N'https://drive.google.com/file/d/1-T73Vx3_5prWeWg3CK9voyBV1IxnaLcg/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (110, 2, N'Mainboard GIGABYTE Z790 UD AX DDR5', N'Reliable motherboard with DDR5 support.', CAST(5299000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55, N'https://drive.google.com/file/d/1DPJALXypEqQ5nlL8jQZOeYPbOzLBmWfR/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (111, 2, N'Mainboard ASUS ROG MAXIMUS XII APEX', N'High-end motherboard with overclocking capabilities.', CAST(11009000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55, N'https://drive.google.com/file/d/1h5i6XSX8_E0XbQjoHkZz9So_pKHY69G8/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (112, 2, N'Mainboard ASUS PROART Z490-CREATOR 10G', N'Motherboard designed for content creators with enhanced connectivity.', CAST(8989000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55, N'https://drive.google.com/file/d/1as8Yhn5aaRxjjKURNlBUI6oihX2wTOZx/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (113, 2, N'Mainboard MSI MEG Z490 UNIFY', N'Premium motherboard with unified aesthetics and performance.', CAST(8889000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'ATX, LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55, N'https://drive.google.com/file/d/1D-zGvx68KQroqlGGfLaAgH9qwMJztCer/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (114, 2, N'Mainboard MSI MEG Z490i UNIFY', N'Compact motherboard with powerful performance.', CAST(7679000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'Mini ITX, LGA 1200, DDR4, 64GB, SATA, M.2 NVMe, PCIe 3.0', 55, N'https://drive.google.com/file/d/16ItsMcStHRGV2j-JmLDDwHvapWAmenI0/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (115, 2, N'Mainboard ASUS ROG STRIX Z490-G GAMING', N'Gaming motherboard with compact form factor.', CAST(7149000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'mATX,  LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55, N'https://drive.google.com/file/d/1TTEJDZCWoZpmYbvAwEvFGrahNLLN-N4B/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (116, 2, N'Mainboard ASUS PRIME Z490-A', N'Versatile motherboard with robust features.', CAST(6799000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55, N'https://drive.google.com/file/d/1bIJ80Q_RfE0TWdpUv6gpecTs_G7w1z-G/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (117, 2, N'Mainboard ASUS PRIME Z490M-PLUS', N'Micro ATX motherboard with reliable performance.', CAST(4229000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'mATX, LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55, N'https://drive.google.com/file/d/1k-F2j4A3mxfdqCqPxCx6F4KKCoW6qHFN/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (118, 2, N'Mainboard ASUS ROG STRIX B460-H GAMING', N'Gaming motherboard with budget-friendly price.', CAST(3499000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55, N'https://drive.google.com/file/d/1_BYXDsZhFtxYOyq0NoUSbqE_dSnIIOv8/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (119, 2, N'Mainboard ASUS PRIME B460-PLUS', N'Entry-level motherboard with essential features.', CAST(2929000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55, N'https://drive.google.com/file/d/14I8gJaHPWf1FinjIXwTLXOcH2vOY_XOK/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (120, 2, N'Mainboard ASROCK B460 PRO4', N'Reliable motherboard with sturdy build quality.', CAST(2829000 AS Decimal(18, 0)), N'36 Months', N'ASROCK', N'ATX, LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55, N'https://drive.google.com/file/d/1pIxgbySWee4HrtlFIDJ-JI5wckfW0RmL/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (121, 2, N'Mainboard Gigabyte B460M D3H', N'Micro ATX motherboard with DDR4 support.', CAST(2629000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'mATX, LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55, N'https://drive.google.com/file/d/1Fbf0UNDeDstVq1WFRLCxwxNApPlCRrrB/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (122, 2, N'Mainboard Gigabyte B560M DS3H V3', N'Budget-friendly motherboard with modern features.', CAST(2299000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'mATX,  LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 4.0', 55, N'https://drive.google.com/file/d/1OCW1EHaiP191ayrbo1w-6P15MFBO__rT/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (123, 2, N'Mainboard MSI B560M PRO-E', N'Affordable motherboard with PCIe 4.0 support.', CAST(1999000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'mATX,  LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 4.0', 55, N'https://drive.google.com/file/d/1zSfZvO2wVDDI_9Cn_3qwQwizZ1wwgvcb/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (124, 2, N'Mainboard ASROCK H410M-HDV/M.2', N'Micro ATX motherboard with M.2 support.', CAST(1819000 AS Decimal(18, 0)), N'36 Months', N'ASROCK', N'mATX,  LGA 1200, DDR4, 64GB, SATA, M.2 NVMe, PCIe 3.0', 55, N'https://drive.google.com/file/d/1KB7HZlbTM6FvqK2IELNvrd7xHdbHw1SK/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (125, 2, N'Mainboard Gigabyte H510M-H V2', N'Entry-level motherboard with DDR4 support.', CAST(1709000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'mATX,  LGA 1200, DDR4, 64GB, SATA, M.2 NVMe, PCIe 3.0', 55, N'https://drive.google.com/file/d/14Ag51fiYZRZxCp3ZcYb6zAecsaNqFWbK/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (126, 2, N'Mainboard MSI PRO H510M-B', N'Budget-friendly motherboard with reliable performance.', CAST(1689000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'mATX, LGA 1200, DDR4, 64GB, SATA, M.2 NVMe, PCIe 3.0', 55, N'https://drive.google.com/file/d/1B0WhaHVwFjw-fqmXRvkWUx7PW_l-lJte/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (127, 2, N'Mainboard ASROCK H510M-H/M.2 SE', N'Micro ATX motherboard with M.2 support.', CAST(1599000 AS Decimal(18, 0)), N'36 Months', N'ASROCK', N'mATX,  LGA 1200, DDR4, 64GB, SATA, M.2 NVMe, PCIe 3.0', 55, N'https://drive.google.com/file/d/1Lptm-gU2Pm6-y9X7jm9Zik0QoYp_ANrR/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (128, 2, N'Mainboard ASROCK H510M-HDV/M.2 SE', N'Micro ATX motherboard with M.2 support.', CAST(1599000 AS Decimal(18, 0)), N'36 Months', N'ASROCK', N'mATX, LGA 1200, DDR4, 64GB, SATA, M.2 NVMe, PCIe 3.0', 55, N'https://drive.google.com/file/d/1rxaPvoOaTlKZYQdS7aQPsHXJu0SBQLFm/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (129, 3, N'GSKILL TRIDENT Z NEO RGB (F4-3600C18D-64GTZN)', N'64GB (2x32GB) DDR4 3600MHz', CAST(4599000 AS Decimal(18, 0)), N'24 Months', N'GSKILL', N'DDR4', 5, N'https://drive.google.com/file/d/1UP2XqpjY_bEy2hl3wsW_3xSCTA9GN3b-/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (130, 3, N'Corsair Vengeance RGB RS (CMG64GX4M2D3600C18)', N'64GB (2x32GB) DDR4 3600MHz', CAST(4499000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5, N'https://drive.google.com/file/d/1r6Drkhs-ScL4U3FQSlLo_DcN0s3ZXCDh/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (131, 3, N'Klevv CRAS X RGB (KD4AGU880-36A180Z)', N'32GB (2x16GB) DDR4 3600MHz', CAST(4449000 AS Decimal(18, 0)), N'24 Months', N'Klevv', N'DDR4', 5, N'https://drive.google.com/file/d/1_c4-s9oYrJhCBE_a2KUj1ZCXH4wG_2H5/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (132, 3, N'Corsair Vengeance RGB RS (CMG64GX4M2E3200C16)', N'64GB (2x32GB) DDR4 3200MHz', CAST(4399000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5, N'https://drive.google.com/file/d/11TdtwLdZbDFZNAkRe0HMiYnKsGM2jwit/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (133, 3, N'Klevv CRAS X RGB (KD4AGU880-32A160X)', N'32GB (2x16GB) DDR4 3200MHz', CAST(3939000 AS Decimal(18, 0)), N'24 Months', N'Klevv', N'DDR4', 5, N'https://drive.google.com/file/d/1EknKzmD_cj2J01UbbI68h85J5G7LCu8z/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (135, 3, N'Corsair Dominator Platinum Black RGB (CMT32GX4M2E3200C16)', N'32GB (2x16G) DDR4 3200MHz', CAST(3699000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5, N'https://drive.google.com/file/d/1kvF-QIeogRQ8BwMl_ASBibNUijOdr6VR/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (136, 3, N'Corsair Dominator Platinum White RGB (CMT32GX4M2E3200C16W)', N'32GB (2x16G) DDR4 3200MHz', CAST(3699000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5, N'https://drive.google.com/file/d/1Vp6jfgb0wm49Rh9Kd4Pu-OABrg9nEfcr/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (137, 3, N'Gskill Trident Z Neo RGB (F4-3600C18D-32GTZN)', N'32GB (2x16GB) DDR4 3600MHz', CAST(2699000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR4', 5, N'https://drive.google.com/file/d/1l8gYWWFHvo192XmWcPFglzJGyrBbQ55j/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (138, 3, N'Kingston Fury Beast RGB (KF432C16BB12AK2/32)', N'32GB (2x16GB) DDR4 3200MHz', CAST(2699000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5, N'https://drive.google.com/file/d/1jmcfQvKqZ1L82FuBnhZBP6MqYig93Aqk/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (139, 3, N'ADATA Spectrix D80 8GB/3200 (1x8GB) -Black', N'8GB (1x8GB) DDR4 3200MHz', CAST(2690000 AS Decimal(18, 0)), N'24 Months', N'ADATA', N'DDR4', 5, N'https://drive.google.com/file/d/1EMk56GYRzLoU41_geXY6ayhvmZdDJP75/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (140, 3, N'Corsair Vengeance RGB RS (CMG32GX4M2D3600C18)', N'32GB (2x16GB) DDR4 3600MHz', CAST(2649000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5, N'https://drive.google.com/file/d/1gyVZzuxrYmU3ChrP74ex9MhpITXWEniu/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (141, 3, N'Gskill Trident Z RGB (F4-3200C16D-32GTZR)', N'32GB (2x16GB) DDR4 3200MHz', CAST(2599000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR4', 5, N'https://drive.google.com/file/d/1YWxeBaadqv_mZwrwTpyIFY8G0U3GbqFi/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (142, 3, N'Kingston Fury Beast (KF436C18BBK2/32)', N'32GB (2x16GB) DDR4 3600MHz', CAST(2599000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5, N'https://drive.google.com/file/d/1GLYRT93Ca0sTUc2J8pRmlWTHDsbmNENs/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (143, 3, N'Corsair Vengeance RS RGB (CMG32GX4M2E3200C16)', N'32GB (2x16GB) DDR4 3200MHz', CAST(2599000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5, N'https://drive.google.com/file/d/1eu4f8GpfFmDJzJATPGaqfROP3hoi_pBS/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (144, 3, N'Klevv CRAS X RGB (KD48GU880-36A180Z)', N'16GB (2x8GB) DDR4 3600MHz', CAST(2529000 AS Decimal(18, 0)), N'24 Months', N'Klevv', N'DDR4', 5, N'https://drive.google.com/file/d/18hguIVvaD_9xcXMC7CqDMUQDjTkXBjZF/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (145, 3, N'TEAMGROUP DELTA RGB WHITE (TF4D432G3200HC16F01)', N'32GB (1x32GB) DDR4 3200MHz', CAST(2299000 AS Decimal(18, 0)), N'24 Months', N'TEAMGROUP', N'DDR4', 5, N'https://drive.google.com/file/d/1iUmmm3IPOnZmsRvM6aaTYS-RJQs7RQQ2/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (146, 3, N'TEAMGROUP DELTA RGB (TF3D432G3200HC16F01)', N'32GB (1x16GB) DDR4 3200MHz', CAST(2299000 AS Decimal(18, 0)), N'24 Months', N'TEAMGROUP', N'DDR4', 5, N'https://drive.google.com/file/d/1BGavP8f8PkImDDWZ84X92I0gGfRowwXO/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (147, 3, N'Klevv CRAS X RGB (KD48GU880-32A160X)', N'16GB (2x8GB) DDR4 3200MHz', CAST(2229000 AS Decimal(18, 0)), N'24 Months', N'Klevv', N'DDR4', 5, N'https://drive.google.com/file/d/1yfed0-EAnR0GzU2F5Ok_s-MG9reuqBG5/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (148, 3, N'ADATA XPG Spectrix D41 RGB Grey (AX4U30008G16A-DT41)', N'16GB (2x8GB) DDR4 3000MHz', CAST(2199000 AS Decimal(18, 0)), N'24 Months', N'ADATA', N'DDR4', 5, N'https://drive.google.com/file/d/1aJU09AbnoL7JBkuwbW4yNqaPti_VojHK/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (149, 3, N'Lexar Thor (LD4BU016G-R3200GDXG)', N'32GB (2x16GB) DDR4 3200MHz', CAST(1999000 AS Decimal(18, 0)), N'24 Months', N'Lexar', N'DDR4', 5, N'https://drive.google.com/file/d/1J-6ixVbSqe6TG9bKpxTcnnLQ7BOUiO6W/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (150, 3, N'Kingston Fury Beast RGB (KF436C17BB2AK2/16)', N'16GB (2x8GB) DDR4 3600MHz', CAST(1799000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5, N'https://drive.google.com/file/d/1mIb4bbjq21Wd9xrXxWE-JSI9rIcRM0lN/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (151, 3, N'Kingston Fury Beast White RGB (KF432C16BWAK2/16)', N'16GB (2x8GB) DDR4 3200MHz', CAST(1799000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5, N'https://drive.google.com/file/d/1jTWk5F-DRBiHW4z7jFXUkI9HTqtyv69f/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (152, 3, N'Klevv BOLT X (KD4AGU880-32A160T)', N'16GB (1x16GB) DDR4 3200MHz', CAST(1719000 AS Decimal(18, 0)), N'24 Months', N'Klevv', N'DDR4', 5, N'https://drive.google.com/file/d/18HVL1M0oR4P-ntgHDShWZzucx-gg5jkg/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (153, 3, N'Corsair Vengeance RS RGB (CMG16GX4M2D3600C18)', N'16GB (2x8GB) DDR4 3600MHz', CAST(1699000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5, N'https://drive.google.com/file/d/1yejzORkL0jtM8ygq0KX1GJNjUopCBs6u/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (154, 3, N'Corsair Vengeance RGB RS (CMG16GX4M2E3200C16)', N'16GB (2x8GB) DDR4 3200MHz', CAST(1699000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5, N'https://drive.google.com/file/d/1ZTYkZMPSGxZIn3SH3ld0t_Dk0AI5AkP7/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (155, 3, N'Gskill Trident Z Neo RGB (F4-3600C18D-16GTZN)', N'16GB (2x8GB) DDR4 3600MHz', CAST(1699000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR4', 5, N'https://drive.google.com/file/d/1AYPj3X_zdAQnf86P_UkXzIoMScpMTcs9/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (156, 3, N'Corsair Vengeance RS RGB (CMG16GX4M2E3200C16)', N'16GB (2x8GB) DDR4 3200MHz', CAST(1599000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5, N'https://drive.google.com/file/d/1kgeaWzgBnu0c5h-GFXnamjVsGtKtB0NB/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (157, 3, N'Gskill Trident Z RGB (F4-3200C16D-16GTZR)', N'16GB (2x8GB) DDR4 3200MHz', CAST(1599000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR4', 5, N'https://drive.google.com/file/d/19cickZghSaKYJ7JY1nMfXLHiUhc4_X6Q/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (158, 3, N'Kingston Fury Beast (KF426C16BBK2/16)', N'16GB (2x8GB) DDR4 2666MHz', CAST(1549000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5, N'https://drive.google.com/file/d/11NScLLzjGDWS2efCElFT1edAEDMOVYLl/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (159, 3, N'Klevv (KD4AGUA8M-26N190A)', N'16GB (1x16GB) DDR4 2666MHz', CAST(1519000 AS Decimal(18, 0)), N'24 Months', N'Klevv', N'DDR4', 5, N'https://drive.google.com/file/d/1hGsc1X0sDuxzI4_szTpopwj8O21vzIRt/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (160, 3, N'Kingston Fury Beast RGB (KF436C18BB2A/16)', N'16GB (1x16GB) DDR4 3600MHz', CAST(1499000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5, N'https://drive.google.com/file/d/1vbq-hCuwO4fDis3iobO5UtTsZvWjqBPZ/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (161, 3, N'Kingston Fury Beast RGB (KF432C16BBAK2/16)', N'16GB (2x8GB) DDR4 3200MHz', CAST(1499000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5, N'https://drive.google.com/file/d/1jTWk5F-DRBiHW4z7jFXUkI9HTqtyv69f/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (162, 3, N'Kingston Fury Beast (KF436C17BBK2/16)', N'16GB (2x8GB) DDR4 3600MHz', CAST(1499000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5, N'https://drive.google.com/file/d/1lA43JpZszT8LXPXTqPPAIhh8rY9uwOCc/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (163, 3, N'Kingston Fury Beast RGB (KF432C16BB2A/16)', N'16GB (1x16GB) DDR4 3200MHz', CAST(1439000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5, N'https://drive.google.com/file/d/1fNSenzV8Ws7CBB5l_-viOAx7ZfbWDRHO/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (164, 3, N'Corsair Vengeance RS RGB (CMG16GX4M1E3200C16)', N'16GB (1x16GB) DDR4 3200MHz', CAST(1399000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5, N'https://drive.google.com/file/d/17yfNTDkvpIeT92-SJ2vmqmQNqN7YlioH/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (165, 3, N'ADATA XPG Spectrix D60G RGB (AX4U36008G18I-DT60)', N'16GB (2x8GB) DDR4 3600MHz', CAST(1399000 AS Decimal(18, 0)), N'24 Months', N'ADATA', N'DDR4', 5, N'https://drive.google.com/file/d/1LgTbN_RffhM6hqAxgVBbner2jOqteN5Y/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (166, 3, N'Corsair Vengeance LPX (CMK16GX4M2E3200C16)', N'16GB (2x8GB) DDR4 3200MHz', CAST(1399000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5, N'https://drive.google.com/file/d/1I3115mJpqWIZVQrRIWAt7T3TNK085oj1/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (167, 3, N'Kingston (KSM26ED8/16HD)', N'16GB DDR4 2666MHz ECC', CAST(1299000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5, N'https://drive.google.com/file/d/1QC1kIu29aopaBh3ShzHLQMYVCyU-2JUo/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (168, 3, N'Corsair Vengeance LPX (CMK16GX4M1D3600C18)', N'16GB (1x16GB) DDR4 3600MHz', CAST(1299000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5, N'https://drive.google.com/file/d/11dFA_6HzFN4f_UTFUtqDvFLNU2PeUK4G/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (169, 3, N'Kingston Fury Beast (KF426C16BB1/16)', N'16GB (1x16GB) DDR4 2666MHz', CAST(1269000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5, N'https://drive.google.com/file/d/1gacd9AgfwOrKeZcsp-J7MVLd1JEcvKW_/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (170, 3, N'TEAMGROUP DELTA RGB (TF3D416G3200HC16F01)', N'16GB (1x16GB) DDR4 3200MHz', CAST(1199000 AS Decimal(18, 0)), N'24 Months', N'TEAMGROUP', N'DDR4', 5, N'https://drive.google.com/file/d/1sIgPV03mYapOByB54p2RDIPPEwylxyh_/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (212, 3, N'Gskill Trident Z Royal RGB (F5-6400J3239G32GX2-TR5S)', N'64GB (2x32GB) DDR5 6400MHz', CAST(9100000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR5', 7, N'https://drive.google.com/file/d/1f4Rb_Mo2RtERH6rR6TWex8s3CN8eDOIP/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (213, 3, N'Corsair Dominator Titanium RGB Black (CCMP64GX5M2B6000C30)', N'64GB (2x32GB) DDR5 6000MHz', CAST(8499000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR5', 7, N'https://drive.google.com/file/d/1DZsoWK63hITRlv6RUUd0GI7_8Jcu2Xp3/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (214, 3, N'Teamgroup Delta RGB (FF4D532G6200HC38ADC01)', N'32GB (2x16GB) DDR5 6200MHz', CAST(7699000 AS Decimal(18, 0)), N'24 Months', N'Teamgroup', N'DDR5', 7, N'https://drive.google.com/file/d/1lynLw1-IQL22DndOLAzT7X4qjTCtIXq1/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (215, 3, N'Teamgroup Delta RGB (FF3D532G6200HC38ADC01)', N'32GB (2x16GB) DDR5 6200MHz', CAST(7699000 AS Decimal(18, 0)), N'24 Months', N'Teamgroup', N'DDR5', 7, N'https://drive.google.com/file/d/1qj1OTKsd5D7mYAN16s_rTMGPhXmgmhun/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (216, 3, N'Teamgroup Delta RGB (FF4D532G6000HC38ADC01)', N'32GB (2x16GB) DDR5 6000MHz', CAST(7499000 AS Decimal(18, 0)), N'24 Months', N'Teamgroup', N'DDR5', 7, N'https://drive.google.com/file/d/1Ag_TKntFf6kM9kkHsl7vDar3-mUAQ-6L/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (217, 3, N'Teamgroup Delta RGB (FF3D532G6000HC38ADC01)', N'32GB (2x16GB) DDR5 6000MHz', CAST(7499000 AS Decimal(18, 0)), N'24 Months', N'Teamgroup', N'DDR5', 7, N'https://drive.google.com/file/d/1A2adDFXA-RHFxUDbcOIJt3JAt3qYAMAr/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (218, 3, N'Dominator Platinum RGB White (CMT64GX5M2B5600C40W)', N'64GB (2x32GB) DDR5 5600MHz', CAST(6999000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR5', 7, N'https://drive.google.com/file/d/12hY_CXBVpBxRK7UcciiFxZ6fZ9BjZyD6/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (219, 3, N'Kingston Fury Beast Black RGB XMP (KF560C40BBAK2-64)', N'64GB (2x32GB) DDR5 6000MHz', CAST(6999000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR5', 7, N'https://drive.google.com/file/d/16ZMjNOFJBfGoZ5HzP0DBh9XAL7r6gRLk/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (220, 3, N'Corsair Dominator Platinum RGB Black (CMT64GX5M2B5600C40)', N'64GB (2x32GB) DDR5 5600MHz', CAST(6999000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR5', 7, N'https://drive.google.com/file/d/1CqSOeN7fqng3gYkM52k6Hcj3fEOcYCL9/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (221, 3, N'Corsair Dominator Platinum RGB Black (CMT64GX5M2B5200C40)', N'64GB (2x32GB) DDR5 5200MHz', CAST(6799000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR5', 7, N'https://drive.google.com/file/d/15CqhCNlqLhuPzxMbG4ZNaGHicPsD61ZA/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (222, 3, N'Corsair Dominator Platinum RGB White (CMT64GX5M2B5200C40W)', N'64GB (2x32GB) DDR5 5200MHz', CAST(6799000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR5', 7, N'https://drive.google.com/file/d/15tfpgzn5pPjKJfsqQFe9yYv-33oTTRO7/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (223, 3, N'Gskill Trident Z5 RGB (F5-6000J3636F32GX2-TZ5RK)', N'64GB (2x32GB) DDR5 6000MHz', CAST(6499000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR5', 7, N'https://drive.google.com/file/d/1a5h7baF_aauPU7Mu9xu6kl0KlE-siik7/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (224, 3, N'Gskill Trident Z5 RGB Siliver (F5-6000J3238G32GX2-TZ5RS)', N'64GB (2x32GB) DDR5 6000MHz', CAST(6499000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR5', 7, N'https://drive.google.com/file/d/1ERpyjxMiOzIvTvcwsHJlcsnqaZ8DuRDg/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (225, 3, N'Kingston Fury Beast RGB (KF556C40BBAK2-64)', N'64GB (2x32GB) DDR5 5600MHz', CAST(6299000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR5', 7, N'https://drive.google.com/file/d/1LkZn18FdUIZtnedw0_gJgxNZcQK7OKW9/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (226, 3, N'Kingston Fury Beast RGB (KF552C40BBAK2-64)', N'64GB (2x32GB) DDR5 5200MHz', CAST(5999000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR5', 7, N'https://drive.google.com/file/d/1gj5hhEdNcoDXlvTJBkSFLPOok4Yx8ywd/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (227, 3, N'Corsair Dominator Titanium RGB White (CMP32GX5M2B6000C30W)', N'32GB (2x16GB) DDR5 6000MHz', CAST(5399000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR5', 7, N'https://drive.google.com/file/d/1RrpUZlELKDOdJkrLbPTpeZ-equ8mcnT9/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (228, 3, N'Gskill Trident Z Royal RGB (F5-6400J3239G16GX2-TR5S)', N'32GB (2x16GB) DDR5 6400MHz', CAST(5200000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR5', 7, N'https://drive.google.com/file/d/1J420UCziNQK83bhBaJUf6gvpZ7YdSv3U/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (229, 3, N'Gskill Ripjaws M5 RGB (F5-5200J4040A32GX2-RM5RW)', N'64GB (2x32GB) DDR5 5200MHz', CAST(4990000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR5', 7, N'https://drive.google.com/file/d/1W-wDcLk3jGsn-f2cxTCjpZdoqvIteXsm/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (230, 3, N'Gskill Ripjaws M5 RGB (F5-5200J4040A16GX2-RM5RK)', N'64GB (2x32GB) DDR5 5200MHz', CAST(4990000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR5', 7, N'https://drive.google.com/file/d/1Kj3PReBD9kQxxg73RasXVMJ8HLm8W948/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (231, 3, N'Corsair Dominator Platinum RGB Black Heatspreader (CMT32GX5M2B5600C36)', N'32GB (2x16GB) DDR5 5600MHz', CAST(4599000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR5', 7, N'https://drive.google.com/file/d/19Ks4Q9h6KAEglQLyboV5q0zz95Fcqi7I/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (232, 3, N'Corsair Dominator Platinum RGB Black (CMT32GX5M2B5200C40)', N'32GB (2x16GB) DDR5 5200MHz', CAST(4199000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR5', 7, N'https://drive.google.com/file/d/1UWq6T_UxPBXnMyajC2VGBym9W5c5mJAo/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (233, 3, N'Kingston Fury Beast (KF560C40BBK2-32)', N'32GB (2x16GB) DDR5 6000MHz', CAST(3699000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR5', 7, N'https://drive.google.com/file/d/10GsPYZhjizFZfJT0u_Jxak8NbFXnn-Ug/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (234, 3, N'Kingston Fury Beast RGB (KF556C40BBAK2-32)', N'32GB (2x16GB) DDR5 5600MHz', CAST(3599000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR5', 7, N'https://drive.google.com/file/d/1EQuatxZ0VHFaYHPOdRuHzxmNI_jq3tKh/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (235, 3, N'Teamgroup Vulcan (FLBD532G5200HC40CDC01)', N'32GB (2x16GB) DDR5 5200MHz', CAST(3299000 AS Decimal(18, 0)), N'24 Months', N'Teamgroup', N'DDR5', 7, N'https://drive.google.com/file/d/1TUpDy5O7x4EmAS9Ac9kY8o95MySRG28p/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (236, 3, N'Teamgroup Vulcan (FLRD532G5200HC40CDC01)', N'32GB (2x16GB) DDR5 5200MHz', CAST(3299000 AS Decimal(18, 0)), N'24 Months', N'Teamgroup', N'DDR5', 7, N'https://drive.google.com/file/d/1fLWynAzKB_CsIfMoZ8miiimdOaXHW1Hx/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (237, 3, N'Kingston Fury Beast (KF552C40BBK2-32)', N'32GB (2x16GB) DDR5 5200MHz', CAST(3199000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR5', 7, N'https://drive.google.com/file/d/1F8XwzSpPqbD0idei4c3cwNxM6U1xbhHP/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (238, 3, N'Corsair Vengeance RGB Heatspreader (CMH32GX5M2B5200C40)', N'32GB (2x16GB) DDR5 5200MHz', CAST(3199000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR5', 7, N'https://drive.google.com/file/d/1O0mQtKAOgh5ktO_ZVD-wWMjAaX1hcl7h/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (239, 3, N'Kingston Fury Beast (KF548C38BBK2-32)', N'32GB (2x16GB) DDR5 4800MHz', CAST(3199000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR5', 7, N'https://drive.google.com/file/d/1fiS_aw8XdZBVFreohy74SjcZFO9v1LqS/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (240, 3, N'Gskill Ripjaws S5 (F5-5600J4040C16GX2-RS5K)', N'32GB (2x16GB) DDR5 5600MHz', CAST(3099000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR5', 7, N'https://drive.google.com/file/d/1G_eYyI0Q7wOmvLJvm8YZ9NzxijA6IE0e/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (241, 5, N'Seagate Exos 24TB', N'3.5 inch HDD, SATA, 24TB storage capacity', CAST(20599000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30, N'https://drive.google.com/file/d/12BgWVHMOZMe1pq-HsrsZStl5zIjfCGo8/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (242, 5, N'Seagate Ironwolf Pro 20TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(19899000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30, N'https://drive.google.com/file/d/1yjRgPWN3At9_JyP6XKBVy5IGHtWUfaqx/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (244, 5, N'Seagate SkyHawk AI 20TB', N'3.5 inch HDD', CAST(19599000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30, N'https://drive.google.com/file/d/1ZWxtYr_ufEiirbf-zQK3PKNw8KKTc04g/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (245, 5, N'WD Purple Pro 22TB', N'3.5 inch HDD, 7200RPM, SATA, 512MB Cache', CAST(19399000 AS Decimal(18, 0)), N'60 Months', N'WD', N'SATA', 30, N'https://drive.google.com/file/d/1bNGzhaLsk8RTBXHVJKssnTswYVo2Sy9q/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (247, 5, N'Seagate Ironwolf Pro 20TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(19899000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30, N'https://drive.google.com/file/d/1yjRgPWN3At9_JyP6XKBVy5IGHtWUfaqx/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (249, 5, N'Seagate SkyHawk AI 20TB', N'3.5 inch HDD', CAST(19599000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30, N'https://drive.google.com/file/d/1ZWxtYr_ufEiirbf-zQK3PKNw8KKTc04g/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (252, 5, N'Seagate Ironwolf Pro 14TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(16899000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30, N'https://drive.google.com/file/d/1JxWIYUmhgvhnHaXTRyMQvpmDQnjIl4F8/view?usp=drive_link')
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (253, 5, N'Seagate Ironwolf Pro 18TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(16299000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30, N'https://drive.google.com/file/d/1yoA684LAtiLIKbBiitcu6sIKzVzep5KJ/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (254, 5, N'Seagate SkyHawk AI 18TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(15999000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30, N'https://drive.google.com/file/d/1G3ZmStXxYIHoa_zZkzbGK746V-rHbb5t/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (255, 5, N'WD Purple Pro 18TB', N'3.5 inch HDD, 7200RPM, SATA, 512MB Cache', CAST(15699000 AS Decimal(18, 0)), N'60 Months', N'WD', N'SATA', 30, N'https://drive.google.com/file/d/1j5whQu0c4F8EmWe2_lfs2kzUFYIkW6sR/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (256, 5, N'Seagate Ironwolf Pro 16TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(13299000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30, N'https://drive.google.com/file/d/11JMFwNkG2J3YCeTh0ySkgVlyvg7VuLHZ/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (257, 5, N'Seagate SkyHawk AI 16TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(12599000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30, N'https://drive.google.com/file/d/1E-_AFMB9gQy11DKJ8OEFrbLGJ-LQivYa/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (258, 5, N'WD Purple Pro 14TB', N'3.5 inch HDD, 7200RPM, SATA, 512MB Cache', CAST(12399000 AS Decimal(18, 0)), N'60 Months', N'WD', N'SATA', 30, N'https://drive.google.com/file/d/1BSww-7Ar5LVlWw8Rwgrd4D4WyYUdZCts/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (259, 5, N'WD Enterprise Ultrastar DC HC550 16TB', N'3.5 inch HDD, 7200RPM, SATA, 512MB Cache', CAST(11499000 AS Decimal(18, 0)), N'60 Months', N'WD', N'SATA', 30, N'https://drive.google.com/file/d/1PsHaqKWMNBCE1fRNB3EkqxXG9Rb3SKS-/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (260, 5, N'WD Gold 14TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(14999000 AS Decimal(18, 0)), N'60 Months', N'WD', N'SATA', 30, N'https://drive.google.com/file/d/1vGyF1gOz3hR4KrPKfz6GkfFpx8VTt4r8/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (261, 4, N'Kingston A400 240GB SATA III 2.5 inch', N'240GB SATA III 2.5 inch SSD', CAST(790000 AS Decimal(18, 0)), N'60 Months', N'Kingston', N'SATA', 9, N'https://drive.google.com/file/d/1JdfPnSzQwN7FSeEOXGezuOKfiQxAAGmj/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (262, 4, N'Samsung 860 EVO 500GB SATA III 2.5 inch', N'500GB SATA III 2.5 inch SSD', CAST(2699000 AS Decimal(18, 0)), N'60 Months', N'Samsung', N'SATA', 9, N'https://drive.google.com/file/d/1rI4w7Of-d5j7ZqUu1d15AK8tzYfP16lK/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (263, 4, N'Samsung 970 EVO 500GB M.2 NVMe PCIe Gen 3', N'500GB M.2 NVMe PCIe Gen 3 SSD', CAST(2899000 AS Decimal(18, 0)), N'60 Months', N'Samsung', N'M.2 NVMe', 9, N'https://drive.google.com/file/d/14SZMH4sl1TZxs1cbTvc7D3MGSlBsipvf/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (264, 4, N'Samsung 970 EVO Plus 1TB M.2 NVMe PCIe Gen 3', N'1TB M.2 NVMe PCIe Gen 3 SSD', CAST(4799000 AS Decimal(18, 0)), N'60 Months', N'Samsung', N'M.2 NVMe', 7, N'https://drive.google.com/file/d/1Cklrffx08Br8HB5Rq5-Ds8FI-Xhn9E1p/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (265, 4, N'Samsung 970 EVO Plus 500GB M.2 NVMe PCIe Gen 3', N'500GB M.2 NVMe PCIe Gen 3 SSD', CAST(3399000 AS Decimal(18, 0)), N'60 Months', N'Samsung', N'M.2 NVMe', 7, N'https://drive.google.com/file/d/1LipFpg_mXboVpcVVW4CE4MvYUTXqdzUV/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (266, 4, N'Crucial BX500 120GB SATA III 2.5 inch', N'120GB SATA III 2.5 inch SSD', CAST(550000 AS Decimal(18, 0)), N'60 Months', N'Crucial', N'SATA', 9, N'https://drive.google.com/file/d/1Dnk00b-1S2E9YEIQpOKaCBAkW3MAz7Ok/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (267, 4, N'ADATA XPG SX8200 Pro 512GB NVMe PCIe Gen 3', N'512GB NVMe PCIe Gen 3 SSD', CAST(2499000 AS Decimal(18, 0)), N'60 Months', N'ADATA', N'M.2 NVMe', 7, N'https://drive.google.com/file/d/1YGWYqD3C_bEaX-ZGf754Pj8VBDq-F2d7/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (268, 4, N'Crucial BX500 240GB SATA III 2.5 inch', N'240GB SATA III 2.5 inch SSD', CAST(750000 AS Decimal(18, 0)), N'60 Months', N'Crucial', N'SATA', 9, N'https://drive.google.com/file/d/1r_Eh55vRoPDcYCadayhr0aNfHgOvLx2J/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (269, 4, N'Kingston KC600 1TB SATA III 2.5 inch', N'1TB SATA III 2.5 inch SSD', CAST(3099000 AS Decimal(18, 0)), N'60 Months', N'Kingston', N'SATA', 7, N'https://drive.google.com/file/d/1xjv59uFIX3HtiOACaojdsuCpNv9w_TMw/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (270, 4, N'Kingston KC600 256GB SATA III 2.5 inch', N'256GB SATA III 2.5 inch SSD', CAST(1049000 AS Decimal(18, 0)), N'60 Months', N'Kingston', N'SATA', 9, N'https://drive.google.com/file/d/1xjv59uFIX3HtiOACaojdsuCpNv9w_TMw/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (271, 4, N'ADATA XPG SX6000 Lite 256GB M.2 NVMe PCIe Gen 3', N'256GB M.2 NVMe PCIe Gen 3 SSD', CAST(1299000 AS Decimal(18, 0)), N'60 Months', N'ADATA', N'M.2 NVMe', 9, N'https://drive.google.com/file/d/1Ifd1TVkxUjsXx9j8JIQC_3Mv7eAD9QPk/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (272, 4, N'ADATA SU650 240GB SATA III 2.5 inch', N'240GB SATA III 2.5 inch SSD', CAST(690000 AS Decimal(18, 0)), N'60 Months', N'ADATA', N'SATA', 9, N'https://drive.google.com/file/d/1JxoLWyJqlmfh5w4N_sThHdVIx2uo5yWw/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (273, 4, N'Crucial MX500 500GB SATA III 2.5 inch', N'500GB SATA III 2.5 inch SSD', CAST(1599000 AS Decimal(18, 0)), N'60 Months', N'Crucial', N'SATA', 9, N'https://drive.google.com/file/d/1Yys_mg6FPNi70328nXPZ7Bd-6aBGZ2-L/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (274, 4, N'Crucial MX500 1TB SATA III 2.5 inch', N'1TB SATA III 2.5 inch SSD', CAST(3399000 AS Decimal(18, 0)), N'60 Months', N'Crucial', N'SATA', 9, N'https://drive.google.com/file/d/1XidI0ELXD1MP_zZf8J27LGg9Q0AVm_Bw/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (275, 4, N'WD Blue SN550 500GB M.2 NVMe PCIe Gen 3', N'500GB M.2 NVMe PCIe Gen 3 SSD', CAST(1799000 AS Decimal(18, 0)), N'60 Months', N'WD', N'M.2 NVMe', 9, N'https://drive.google.com/file/d/1UOat7tlCPIH_D9zS9qYEB7FTzxWJKBiu/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (276, 4, N'WD Blue SN550 1TB M.2 NVMe PCIe Gen 3', N'1TB M.2 NVMe PCIe Gen 3 SSD', CAST(3199000 AS Decimal(18, 0)), N'60 Months', N'WD', N'M.2 NVMe', 9, N'https://drive.google.com/file/d/1X-wN1qOabm6F6YXMUwFjcDNUgBLC7oaG/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (277, 4, N'Samsung 870 QVO 1TB SATA III 2.5 inch', N'1TB SATA III 2.5 inch SSD', CAST(2999000 AS Decimal(18, 0)), N'60 Months', N'Samsung', N'SATA', 9, N'https://drive.google.com/file/d/1F-yTI0X5IZNMisEbxDFIMjDCVm6X2EBd/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (278, 4, N'Kingston UV500 480GB SATA III 2.5 inch', N'480GB SATA III 2.5 inch SSD', CAST(1399000 AS Decimal(18, 0)), N'60 Months', N'Kingston', N'SATA', 9, N'https://drive.google.com/file/d/1b8heiQf8kBqBevecOyn-JQK0zVBH1ECA/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (279, 4, N'Crucial MX500 250GB SATA III 2.5 inch', N'250GB SATA III 2.5 inch SSD', CAST(1099000 AS Decimal(18, 0)), N'60 Months', N'Crucial', N'SATA', 9, N'https://drive.google.com/file/d/1zq1UdyvPHWbuV5VV69sT52yHfRBY1ccl/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (280, 4, N'Samsung 870 EVO 500GB SATA III 2.5 inch', N'500GB SATA III 2.5 inch SSD', CAST(2199000 AS Decimal(18, 0)), N'60 Months', N'Samsung', N'SATA', 9, N'https://drive.google.com/file/d/1_kHLd6Belsc9ytcqZBCQvtu6ANtmrCnn/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (281, 4, N'ADATA SU800 1TB SATA III 2.5 inch', N'1TB SATA III 2.5 inch SSD', CAST(3199000 AS Decimal(18, 0)), N'60 Months', N'ADATA', N'SATA', 9, N'https://drive.google.com/file/d/12E6ZIR5etjKTumOCNn5K6ZBUOe62umK5/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (282, 4, N'Crucial BX500 480GB SATA III 2.5 inch', N'480GB SATA III 2.5 inch SSD', CAST(1399000 AS Decimal(18, 0)), N'60 Months', N'Crucial', N'SATA', 9, N'https://drive.google.com/file/d/1DDtyykiPfnNQhQk2zDHA_kAQJLWek0Bl/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (283, 4, N'Kingston A400 480GB SATA III 2.5 inch', N'480GB SATA III 2.5 inch SSD', CAST(1399000 AS Decimal(18, 0)), N'60 Months', N'Kingston', N'SATA', 9, N'https://drive.google.com/file/d/1PmRFSYOpiR6raJ3yEDsnvB-32HTwQqE8/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (284, 4, N'WD Blue SN550 250GB M.2 NVMe PCIe Gen 3', N'250GB M.2 NVMe PCIe Gen 3 SSD', CAST(1099000 AS Decimal(18, 0)), N'60 Months', N'WD', N'M.2 NVMe', 9, N'https://drive.google.com/file/d/1vk9H_BWNnkWXqjrAUk_7t-wd-Kh5wVEU/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (285, 4, N'Kingston UV500 240GB SATA III 2.5 inch', N'240GB SATA III 2.5 inch SSD', CAST(990000 AS Decimal(18, 0)), N'60 Months', N'Kingston', N'SATA', 9, N'https://drive.google.com/file/d/16hky2uL8tiDZMtpep17lPvjktpe4E9lT/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (286, 4, N'Samsung 870 EVO 1TB SATA III 2.5 inch', N'1TB SATA III 2.5 inch SSD', CAST(3999000 AS Decimal(18, 0)), N'60 Months', N'Samsung', N'SATA', 9, N'https://drive.google.com/file/d/1qT4QPJo4D-j-K-kziCqk3E7TD9-0BVwl/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (287, 4, N'WD Blue SN550 2TB M.2 NVMe PCIe Gen 3', N'2TB M.2 NVMe PCIe Gen 3 SSD', CAST(5999000 AS Decimal(18, 0)), N'60 Months', N'WD', N'M.2 NVMe', 7, N'https://drive.google.com/file/d/169oto1x9HPC4uNMoW2dycnmC8fEjonz3/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (288, 4, N'ADATA SU800 2TB SATA III 2.5 inch', N'2TB SATA III 2.5 inch SSD', CAST(6499000 AS Decimal(18, 0)), N'60 Months', N'ADATA', N'SATA', 9, N'NULLhttps://drive.google.com/file/d/1ebesYSXNH0w9J6dC4CTx0GO8s60uN4TN/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (289, 4, N'Crucial MX500 2TB SATA III 2.5 inch', N'2TB SATA III 2.5 inch SSD', CAST(6799000 AS Decimal(18, 0)), N'60 Months', N'Crucial', N'SATA', 9, N'https://drive.google.com/file/d/1QIsM3PQGz797gCO35B9I97R7uYKB0Fl1/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (290, 4, N'Kingston A400 120GB SATA III 2.5 inch', N'120GB SATA III 2.5 inch SSD', CAST(490000 AS Decimal(18, 0)), N'60 Months', N'Kingston', N'SATA', 7, N'https://drive.google.com/file/d/1ibjTe8qVn9BTb-CEP5rPE3NZTfxJ4VC2/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (291, 4, N'Samsung 860 EVO 250GB SATA III 2.5 inch', N'250GB SATA III 2.5 inch SSD', CAST(1299000 AS Decimal(18, 0)), N'60 Months', N'Samsung', N'SATA', 7, N'https://drive.google.com/file/d/1NROiA4yB_BPrnHYnzt0f8mPCN8ZtdRZy/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (292, 2, N'ASROCK B450M-HDV R4.0', N'Mainboard ASROCK B450M-HDV R4.0', CAST(1699000 AS Decimal(18, 0)), N'36 Months', N'ASROCK', N'mATX, AM4, DDR4, 64GB, SATA, M.2 NVMe, PCIe 4.0', 55, N'https://drive.google.com/file/d/1GHtvhGvdNR2p9zZIxVlag1_8YKwRfA01/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (293, 2, N'ASUS TUF GAMING B550M-PLUS', N'Mainboard ASUS TUF GAMING B550M-PLUS', CAST(3799000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'mATX, AM4, DDR4, 128GB, SATA, M.2 NVMe, PCIe 4.0', 55, N'https://drive.google.com/file/d/1eA5vwkJapfjQ-wGvvCaZ_ZzUqUQVT6y6/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (294, 2, N'MSI B450M PRO-VDH MAX', N'Mainboard MSI B450M PRO-VDH MAX', CAST(1849000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'mATX, AM4, DDR4, 64GB, SATA, M.2 NVMe, PCIe 4.0', 55, N'NULLhttps://drive.google.com/file/d/1cMqwRCPmRP2J0yW8FQh7zZC12EWx9A-Q/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (295, 2, N'ASUS TUF GAMING B550M-PLUS (WI-FI)', N'Mainboard ASUS TUF GAMING B550M-PLUS', CAST(3999000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'mATX, AM4, DDR4, 128GB, SATA, M.2 NVMe, PCIe 4.0', 55, N'https://drive.google.com/file/d/1eA5vwkJapfjQ-wGvvCaZ_ZzUqUQVT6y6/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (296, 2, N'Gigabyte B550M AORUS ELITE AX', N'Mainboard Gigabyte B550M AORUS ELITE AX', CAST(3499000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'mATX, AM4, DDR4, 128GB, SATA, M.2 NVMe, PCIe 4.0', 55, N'https://drive.google.com/file/d/1knIJO2ZbrifZSqSWSBXFl9QzWcPjZWIX/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (297, 2, N'Gigabyte X570S UD', N'Mainboard Gigabyte X570S UD', CAST(4699000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, AM4, DDR4, 128GB, SATA, M.2 NVMe, PCIe 4.0', 55, N'https://drive.google.com/file/d/1ywF1g15ipw06_BeSagXVaCq9hhhnP3sp/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (298, 2, N'Gigabyte B550M AORUS ELITE', N'Mainboard Gigabyte B550M AORUS ELITE (AMD B550, Socket AM4, m-ATX, 4 khe RAM DDR4)', CAST(2599000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'mATX, AM4, DDR4, 128GB, SATA, M.2 NVMe, PCIe 4.0', 55, N'https://drive.google.com/file/d/1knIJO2ZbrifZSqSWSBXFl9QzWcPjZWIX/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (299, 2, N'ASUS PRIME B450M-A II', N'Mainboard ASUS PRIME B450M-A II', CAST(1899000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'mATX, AM4, DDR4, 64GB, SATA, M.2 NVMe, PCIe 4.0', 55, N'https://drive.google.com/file/d/1zc4KJBkyXEmdACUf03VDMIxahe9hVb2_/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (300, 2, N'ASUS PRIME A320M-K', N'Mainboard ASUS PRIME A320M-K (AMD A320, Socket AM4, ATX, 2 khe RAM DDR4)', CAST(1399000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, AM4, DDR4, 64GB, SATA, M.2 NVMe, PCIe 4.0', 55, N'https://drive.google.com/file/d/1_E1hPtWPUexPZ-YzpjVK83LH7OR60Rzi/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (301, 2, N'Gigabyte X670 AORUS ELITE AX', N'Supports AMD Ryzen™ 7000 and 8000 Series Processors. Twin 16+2+2 Digital VRM Design, Dual Channel DDR5, PCIe 5.0 Ready, Wi-Fi 6E, and more.', CAST(8699000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, AM5, DDR5, 128GB, SATA, M.2 NVMe, PCIe 4.0', 75, N'https://drive.google.com/file/d/1_E1hPtWPUexPZ-YzpjVK83LH7OR60Rzi/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (302, 2, N'Gigabyte B650 AORUS PRO AX DDR5', N'Supports AMD Ryzen™ 7000 Series Processors. Direct 8+2+2 Digital VRM Solution, Dual Channel DDR5, PCIe 4.0 slots, and more.', CAST(7999000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, AM5, DDR5, 128GB, SATA, M.2 NVMe, PCIe 4.0', 60, N'https://drive.google.com/file/d/1F9GTrtiJ4SykLGccFraKoAxb0xU7jtCi/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (303, 2, N'Gigabyte B650 GAMING X AX DDR5', N'Supports AMD Ryzen™ 8000/7000 Series Processors. Enhanced Power Design, Dual Channel DDR5, PCIe 4.0 slot, Lightning Gen4 M.2, and more.', CAST(5599000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, AM5, DDR5, 128GB, SATA, M.2 NVMe, PCIe 4.0', 60, N'https://drive.google.com/file/d/1KW3bgenvLB6dIhQNrUj-VfUs1yQhUywU/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (304, 2, N'Gigabyte B650M GAMING X AX DDR5', N'Supports AMD Ryzen™ 8000/7000 Series Processors. Enhanced Power Design, Dual Channel DDR5, PCIe 4.0 slot, Lightning Gen4 M.2, and more.', CAST(5099000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'mATX, AM5, DDR5, 128GB, SATA, M.2 NVMe, PCIe 4.0', 50, N'https://drive.google.com/file/d/17grtCH_D2Xx4Bp-LKV6BIz10K99DmqyQ/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (305, 2, N'MSI B650M GAMING PLUS WIFI', N'Supports AMD Ryzen™ 7000/8000 Series Processors. Direct 6+2+1 Digital VRM Solution, Dual Channel DDR5, PCIe 4.0 x4 M.2 connectors, and more.', CAST(4699000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'mATX, AM5, DDR5, 128GB, SATA, M.2 NVMe, PCIe 4.0', 50, N'https://drive.google.com/file/d/1G_fsVjSAC6JrqelUSO4353XtIPZv_vkd/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (306, 6, N'ASUS ROG STRIX RTX 4080 SUPER-O16G-GAMING', N'High-end', CAST(37999000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 320, N'https://drive.google.com/file/d/1KTKsC7KQbQGfKh6jlL2vqIy4uUu3tM4u/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (307, 6, N'ASUS ROG STRIX RTX 4060-O8G-V2-GAMING', N'Mid-end', CAST(9399000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 115, N'https://drive.google.com/file/d/1WaxpiwoaW-DEjytP_bppNZzfQtSwLYQA/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (308, 6, N'ASUS TUF-RTX 3060-12G-V2-GAMING', N'Mid-end', CAST(8899000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 130, N'https://drive.google.com/file/d/1baGZUKau1B_UOGi2VxKfOqXoRw_ehOJ_/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (309, 6, N'ASUS ROG STRIX RTX 4090-O24G-GAMING', N'High-end', CAST(62999000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 450, N'https://drive.google.com/file/d/1d0i_mkwZoQuAO_H4zYF29SPzwL01OCj7/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (310, 6, N'ASUS DUAL RTX 3050-O8G-V2', N'Low-end', CAST(5899000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 130, N'https://drive.google.com/file/d/1SP30cj2ojjNEjiyjDmkg_sPHjiXMi-CP/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (311, 6, N'MSI RTX 3060 VENTUS 2X OC 12 GB', N'Mid-end', CAST(7999000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'PCIe 4.0', 170, N'https://drive.google.com/file/d/1QDD4U9K5Tkop9J4CNGZJIFd9_gJP2Rr_/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (312, 6, N'ASUS ROG STRIX-RTX 3060-O12G-V2-GAMING', N'Mid-end', CAST(9399000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 130, N'https://drive.google.com/file/d/10zALwDG65-IqnSXbg2HAWfzP79PIFDeI/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (313, 6, N'ASUS ROG STRIX-RTX 3060-12G-V2-GAMING', N'Mid-end', CAST(9399000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 130, N'https://drive.google.com/file/d/1WsM22LCTKsqIconH04QL_6FTeyw4L8XT/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (314, 6, N'ASUS TUF-RTX 3060-O12G-V2-GAMING', N'Mid-end', CAST(8999000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 130, N'https://drive.google.com/file/d/1-s8vOSZ60koKVBURRmUQJ6eJTtW8WNsy/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (316, 6, N'INNO3D RTX 4070 Ti SUPER X3 OC 16GB', N'High-end', CAST(23999000 AS Decimal(18, 0)), N'36 Months', N'INNO3D', N'PCIe 4.0', 300, N'https://drive.google.com/file/d/1MJ5lqglBrEteOlxY1_v97ThMqd1Otw99/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (317, 6, N'INNO3D RTX 4060 Ti Twin X2 16GB', N'Mid-end', CAST(12999000 AS Decimal(18, 0)), N'36 Months', N'INNO3D', N'PCIe 4.0', 185, N'https://drive.google.com/file/d/1t9npsrXjd_tktk9euKnLK-ZHXZgAKWSk/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (318, 6, N'ASUS DUAL RX 6600 8GB-V3', N'Mid-end', CAST(5499000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 150, N'https://drive.google.com/file/d/1K9zbno_ljWskSdRi7h78HqCD88DzsqUC/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (319, 6, N'ASUS DUAL RX 6600 8GB-V2', N'Mid-end', CAST(5499000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 165, N'https://drive.google.com/file/d/18tSrEzzNBTzpBjXdBbVA2PTLXft6yOlp/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (320, 6, N'ASUS DUAL GTX 1650-4GD6-P-EVO', N'Low-end', CAST(3749000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 3.0', 70, N'https://drive.google.com/file/d/1kR3zE6weCZrvnB0JsXrNW2AqypFEp4-D/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (321, 6, N'PNY RTX 4060 8GB XLR8 GAMING VERTO Overclocked Dual Fan', N'Mid-end', CAST(8099000 AS Decimal(18, 0)), N'36 Months', N'PNY', N'PCIe 4.0', 150, N'https://drive.google.com/file/d/10VwIASustpJIpJTNUy5mfIb3nwd-KTw4/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (322, 6, N'ASUS RTX 4080 SUPER-O16G-NOCTUA', N'High-end', CAST(37999000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 400, N'https://drive.google.com/file/d/1H2CpbLSgamZYw0QcqA8Mfvtb9HE5a6ja/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (323, 6, N'ASUS ROG STRIX RTX 4080 SUPER-16G-GAMING', N'High-end', CAST(37799000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 350, N'https://drive.google.com/file/d/1ZdcSPSi6hXXY4618P9-6eRPcfPv999Gc/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (324, 6, N'MSI RTX 4070 Ti SUPER 16G VENTUS 3X OC', N'High-end', CAST(25999000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'PCIe 4.0', 300, N'https://drive.google.com/file/d/1mLFqVUUVrq4RzLU5ky2QGPrRj4bBpqgs/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (325, 6, N'GIGABYTE RTX 4080 SUPER WINDFORCE V2-16G', N'High-end', CAST(33499000 AS Decimal(18, 0)), N'36 Months', N'GIGABYTE', N'PCIe 4.0', 320, N'https://drive.google.com/file/d/1I3zfe_4F3FOwcbaTMb4-CiliDRhkM9_f/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (326, 6, N'GIGABYTE RTX 4080 SUPER GAMING OC-16G', N'High-end', CAST(35499000 AS Decimal(18, 0)), N'36 Months', N'GIGABYTE', N'PCIe 4.0', 340, N'https://drive.google.com/file/d/1eeY6UCfIU1145zfqzY-4PkKHrTOcqfD5/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (327, 6, N'GIGABYTE RTX 4080 SUPER AERO OC-16G', N'High-end', CAST(36999000 AS Decimal(18, 0)), N'36 Months', N'GIGABYTE', N'PCIe 4.0', 340, N'https://drive.google.com/file/d/1-CeMi81c4frCHJ9T0-J7qitU0iykIcgf/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (328, 6, N'MSI RTX 4080 SUPER 16G SUPRIM X', N'High-end', CAST(38499000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'PCIe 4.0', 340, N'https://drive.google.com/file/d/1hyp9EMjCxOaWTGcxidblFEvPNhOuo_f1/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (329, 6, N'ASUS DUAL-RTX 4060 TI-O8G-EVO', N'Mid-end', CAST(11599000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 220, N'https://drive.google.com/file/d/16pkXZqIXQQ-10nNLAcGj9ItwGoSAB-zQ/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (330, 6, N'ASUS DUAL GTX 1650-O4GD6-P-EVO', N'Low-end', CAST(3799000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 3.0', 75, N'https://drive.google.com/file/d/1fcKWaFc0tHaXPI2vZ1F0Mz0rN2yY2R0M/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (331, 6, N'MSI RTX 4070 VENTUS 3X E 12G OC', N'Mid-end', CAST(17499000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'PCIe 4.0', 175, N'https://drive.google.com/file/d/1XgxzL8_PylUdKExVg9v8GLIOCD6vOOZm/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (333, 6, N'INNO3D GTX 1650 TWIN X2 OC 4GB GDDR6 / V3 (N16502-04D6X-171330N)', N'Low-end', CAST(3699000 AS Decimal(18, 0)), N'36 Months', N'INNO3D', N'PCIe 3.0', 70, N'https://drive.google.com/file/d/10MWbwcgiAoyRBwnNChfh3QzeiOBui6ih/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (336, 7, N'ASUS TUF Gaming 650W Bronze', N'80 Plus Bronze certification, black color', CAST(1459000 AS Decimal(18, 0)), N'60 Months', N'ASUS', N'Mid Tower, Full Tower', 650, N'https://drive.google.com/file/d/17MTBRZth0Sv2xq-DGq3kXeSJCKw4d57Y/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (337, 7, N'Jetek SWAT 650 650W', N'80 Plus Bronze certification, black color', CAST(1349000 AS Decimal(18, 0)), N'60 Months', N'Jetek', N'Mid Tower, Full Tower', 650, N'https://drive.google.com/file/d/1Gzd4TLXl2U5CTTrUxE6NCzIlcnDrBQ_M/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (338, 7, N'FSP Power Supply HYN Series HYN550ATX', N'Active PFC, black color', CAST(659000 AS Decimal(18, 0)), N'60 Months', N'FSP', N'Mid Tower, Full Tower', 550, N'https://drive.google.com/file/d/1xn3xBakVqmhBy1eE7LMyZHbwhbMArI-Z/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (339, 7, N'Antec Atom V650 EC - 650W', N'650W power supply, black color', CAST(939000 AS Decimal(18, 0)), N'60 Months', N'Antec', N'Mid Tower, Full Tower', 650, N'https://drive.google.com/file/d/16RjxfqlMLQOis_c9GxvOQC_twiZbS05M/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (340, 7, N'Gigabyte P650G 650W', N'80 Plus Gold certification, black color', CAST(1519000 AS Decimal(18, 0)), N'60 Months', N'Gigabyte', N'Mid Tower, Full Tower', 650, N'https://drive.google.com/file/d/1svgDjo1n2N6Br1vO1AgCQ2q2f3J_Aiye/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (341, 7, N'Cooler Master Elite V3 230V PC600 600W', N'600W power supply, black color', CAST(939000 AS Decimal(18, 0)), N'60 Months', N'Cooler Master', N'Mid Tower, Full Tower', 600, N'https://drive.google.com/file/d/1JjWKsCuJ0q78ngp_nOLHbk8j02oSiumk/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (342, 7, N'Gigabyte GP-P550B 550W', N'80 Plus Bronze certification, black color', CAST(999000 AS Decimal(18, 0)), N'60 Months', N'Gigabyte', N'Mid Tower, Full Tower', 550, N'https://drive.google.com/file/d/1HJ5y_eIlkiONYpxuksW8ifKxzSGd_FJ2/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (343, 7, N'MSI MAG A550BN 550W', N'80 Plus Bronze certification, black color', CAST(1199000 AS Decimal(18, 0)), N'60 Months', N'MSI', N'Mid Tower, Full Tower', 550, N'https://drive.google.com/file/d/1dyfshAoFDCxbtrZOEA4yzWLOe6ZtVcpL/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (344, 7, N'Xigmatek X-POWER III 650 - 600W', N'600W power supply, black color', CAST(899000 AS Decimal(18, 0)), N'60 Months', N'Xigmatek', N'Mid Tower, Full Tower', 600, N'https://drive.google.com/file/d/1drl3BC224c8Ssl4BmakMdA3qlfwN20ez/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (345, 7, N'MSI MAG A650BN 650W', N'80 Plus Bronze certification, black color', CAST(1289000 AS Decimal(18, 0)), N'60 Months', N'MSI', N'Mid Tower, Full Tower', 650, N'https://drive.google.com/file/d/1A8e5yNB3eaO8kvdrAb964VQ5N1NhhcGC/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (346, 7, N'Antec Cuprum Strike CSK650 - 650W', N'80 Plus Bronze certification, black color', CAST(1339000 AS Decimal(18, 0)), N'60 Months', N'Antec', N'Mid Tower, Full Tower', 650, N'https://drive.google.com/file/d/1hBTPDtddALdqebQjrDxf_y1qHqqEmC4a/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (347, 7, N'CORSAIR RM750E ATX 3.0', N'80 Plus Gold certification, black color, full modular', CAST(2999000 AS Decimal(18, 0)), N'60 Months', N'Corsair', N'Mid Tower, Full Tower', 750, N'https://drive.google.com/file/d/1zHLKpMuM01ag5je3mLJgqHXyQg8fCJRd/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (348, 7, N'SEGOTEP KL-M750G SFX', N'80 Plus Gold certification, black color, ATX 3.0 + PCIe 5.0', CAST(2849000 AS Decimal(18, 0)), N'60 Months', N'Segotep', N'SFX Case', 750, N'https://drive.google.com/file/d/18ra21z79yfGO6DdDrDNsUFnj4pv_i7Jk/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (349, 7, N'Cooler Master MWE GOLD 750 - V2', N'80 Plus Gold certification, black color, full modular', CAST(2799000 AS Decimal(18, 0)), N'60 Months', N'Cooler Master', N'Mid Tower, Full Tower', 750, N'https://drive.google.com/file/d/1su4bOG1ana7vRrUz_v0SZW180jaJB7Kv/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (350, 7, N'FSP HPT2-750M PPA7505701', N'80 Plus Platinum certification, black color', CAST(2459000 AS Decimal(18, 0)), N'60 Months', N'FSP', N'Mid Tower, Full Tower', 750, N'https://drive.google.com/file/d/1WCMCLAJyIvBZc-pM9z3xEtZjn2tZ5YJR/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (351, 7, N'Cooler Master MWE GOLD 750-V2', N'80 Plus Gold certification, black color', CAST(2399000 AS Decimal(18, 0)), N'60 Months', N'Cooler Master', N'Mid Tower, Full Tower', 750, N'https://drive.google.com/file/d/1XfGMTlEsvdt7F1vOCsnAP2ZsadQZZO0L/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (352, 7, N'Gigabyte GP-P750GM', N'80 Plus Gold certification, black color, full modular', CAST(2199000 AS Decimal(18, 0)), N'60 Months', N'Gigabyte', N'Mid Tower, Full Tower', 750, N'https://drive.google.com/file/d/1QUWfJE54SSPfVl_2LZ3NQ8HsA4jupvkA/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (353, 7, N'Jetek SWAT750 EV1', N'PCIe 5.0, black color', CAST(1799000 AS Decimal(18, 0)), N'60 Months', N'Jetek', N'Mid Tower, Full Tower', 750, N'https://drive.google.com/file/d/1mAp1jRFMu_MJj7gz3A_4AXuUJLzfYrke/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (354, 7, N'ASUS TUF GAMING 750W Bronze', N'80 Plus Bronze certification, black color', CAST(1759000 AS Decimal(18, 0)), N'60 Months', N'ASUS', N'Mid Tower, Full Tower', 750, N'https://drive.google.com/file/d/1dm-tz0NGMHZxewYNvPpnTBNUdT4F4E7O/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (355, 7, N'MSI MAG A750BN PCIE5', N'80 Plus Bronze certification, black color', CAST(1599000 AS Decimal(18, 0)), N'60 Months', N'MSI', N'Mid Tower, Full Tower', 750, N'https://drive.google.com/file/d/1u0dbyn6NwJv-RlwFxTc3frejvLgVQHpD/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (356, 7, N'Cooler Master MWE V2 230V 750', N'80 Plus Bronze certification, black color', CAST(1599000 AS Decimal(18, 0)), N'60 Months', N'Cooler Master', N'Mid Tower, Full Tower', 750, N'https://drive.google.com/file/d/1GSYzLyM48hN4kBc_vnj18ZILoWjU2-Tg/view?usp=drive_link')
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (357, 7, N'Antec Cuprum Strike CSK750', N'80 Plus Bronze certification, black color', CAST(1549000 AS Decimal(18, 0)), N'60 Months', N'Antec', N'Mid Tower, Full Tower', 750, N'https://drive.google.com/file/d/19UcMrj8sFUMJq8302pszHjZcaiSm-n-q/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (359, 7, N'Cooler Master MWE V2 230V 650 650W', N'80 Plus Bronze certification, black color', CAST(1439000 AS Decimal(18, 0)), N'60 Months', N'Cooler Master', N'Mid Tower, Full Tower', 650, N'https://drive.google.com/file/d/1HXjLAIYSBpL-P1umqdxY2T9X0zs6y8gu/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (360, 7, N'DeepCool PK750D', N'80 Plus Bronze certification, black color', CAST(1399000 AS Decimal(18, 0)), N'60 Months', N'DeepCool', N'Mid Tower, Full Tower', 750, N'https://drive.google.com/file/d/1KTAMODdfJBuBm5l5zY-a4cjnNFwMrVPB/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (361, 7, N'AIGO GB750 750W', N'80 Plus Bronze certification, black color', CAST(1359000 AS Decimal(18, 0)), N'60 Months', N'AIGO', N'Mid Tower, Full Tower', 750, N'https://drive.google.com/file/d/1cy-TT7AguXBr7jvQyUSuLnaDtx7U4R4b/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (362, 7, N'Jetek SWAT 650 650W', N'80 Plus Bronze certification, black color', CAST(1349000 AS Decimal(18, 0)), N'60 Months', N'Jetek', N'Mid Tower, Full Tower', 650, N'https://drive.google.com/file/d/1Gzd4TLXl2U5CTTrUxE6NCzIlcnDrBQ_M/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (363, 7, N'CORSAIR RM1000E ATX 3.0', N'80 Plus Gold certification, black color, full modular', CAST(4779000 AS Decimal(18, 0)), N'60 Months', N'Corsair', N'Mid Tower, Full Tower', 1000, N'https://drive.google.com/file/d/1Si_yfRpeRsFkTVpfMV0Uqo95bIGeR_M_/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (364, 7, N'ASUS TUF Gaming 1000W Gold ATX3.0', N'PCIe Gen 5.0, 80 Plus Gold certification, black color, full modular', CAST(4449000 AS Decimal(18, 0)), N'60 Months', N'ASUS', N'Mid Tower, Full Tower', 1000, N'https://drive.google.com/file/d/1UHGro1WYz7F5k-b1fz0p0azUKH-kf2oh/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (365, 7, N'MSI A1000G 1000W', N'80 Plus Gold certification, black color, full modular', CAST(4299000 AS Decimal(18, 0)), N'60 Months', N'MSI', N'Mid Tower, Full Tower', 1000, N'https://drive.google.com/file/d/1jzcQDM1Q5aqMLYQzM5ljEwFculnO6IBT/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (366, 7, N'NZXT C1000 - 1000W Gold', N'80 Plus Gold certification, black color, full modular', CAST(3999000 AS Decimal(18, 0)), N'60 Months', N'NZXT', N'Mid Tower, Full Tower', 1000, N'https://drive.google.com/file/d/1tQLcxrOpSeuBFlmiDHyR7hbsLILXx8RK/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (367, 7, N'Corsair RM850e ATX 3.0', N'80 Plus Gold certification, black color, full modular', CAST(3269000 AS Decimal(18, 0)), N'60 Months', N'Corsair', N'Mid Tower, Full Tower', 850, N'https://drive.google.com/file/d/1SWC5QvthgLvfyNZaNgUc7Lqvnyfi2Ox3/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (368, 7, N'MSI MAG A850GL PCIE 5.0', N'80 Plus Gold certification, black color, ATX 3.0', CAST(2899000 AS Decimal(18, 0)), N'60 Months', N'MSI', N'Mid Tower, Full Tower', 850, N'https://drive.google.com/file/d/1nlgdOiCs9-b5uQYA1PUcsWPOWNSYcNBn/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (369, 7, N'FSP DAGGER PRO SDA2-850 Gen 5', N'80 Plus Gold certification, black color, PCIe 5.0, full modular', CAST(2799000 AS Decimal(18, 0)), N'60 Months', N'FSP', N'Mid Tower, Full Tower', 850, N'https://drive.google.com/file/d/1B1PFzSP8vIVC7drqSwFRPZTykwEBrj6w/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (370, 7, N'Gigabyte GP-P850GM 850W', N'80 Plus Gold certification, black color, full modular', CAST(2699000 AS Decimal(18, 0)), N'60 Months', N'Gigabyte', N'Mid Tower, Full Tower', 850, N'https://drive.google.com/file/d/1bA7woNOeCCByDBF-PbUsVWRNDb4oDrnU/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (371, 7, N'Super Flower Leadex Platinum 2000W SF-2000F14HP', N'80 Plus Platinum certification, black color, high wattage, full modular', CAST(11499000 AS Decimal(18, 0)), N'60 Months', N'Super Flower', N'Mid Tower, Full Tower', 2000, N'https://drive.google.com/file/d/1PNfNRtjuPRxmSmLZwZrytD_-r1cYYXh6/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (372, 7, N'CORSAIR HX1200I 2023', N'80 Plus Platinum certification, black color, full modular', CAST(6719000 AS Decimal(18, 0)), N'60 Months', N'CORSAIR', N'Mid Tower, Full Tower', 1200, N'https://drive.google.com/file/d/1JHxNcTSCJTOFMmKrHuXzFcXUvry406HZ/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (373, 7, N'Cooler Master MWE GOLD 1250 - V2 1250W ATX3.0', N'PCIe 5.0, 80 Plus Gold certification, black color, full modular', CAST(5289000 AS Decimal(18, 0)), N'60 Months', N'Cooler Master', N'Mid Tower, Full Tower', 1250, N'https://drive.google.com/file/d/1Lzq4H8JfJyEa5pSyuDzvYaALSjAB4Vvp/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (374, 8, N'Case AZZA CUBE 802F', N'Mid tower, black', CAST(6799000 AS Decimal(18, 0)), N'36 Months', N'AZZA', N'Mid Tower', 0, N'https://drive.google.com/file/d/1voVzdukT00xA9xGwHE5cbXNsl9o_AdKO/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (375, 8, N'Case In-Win 805 Infinity RGB Led- Aluminium & Tempered Glass Mid-Tower Ðen', N'Aluminium & tempered glass, mid tower, black', CAST(6499000 AS Decimal(18, 0)), N'36 Months', N'In-Win', N'Mid Tower', 0, N'https://drive.google.com/file/d/1-pGffs3ps3m4HFHdWzxzopuWdzJMrIDp/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (376, 8, N'CASE ASUS ROG STRIX HELIOS GX601', N'Tempered glass, gaming, mid tower, black, led RGB', CAST(6499000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'Mid Tower', 0, N'https://drive.google.com/file/d/1z1rUvE1j7a-Me0JpQbkWXUJ0WiaYioB7/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (377, 8, N'Case Asus GX601 ROG STRIX HELIOS EVA EDITION', N'Mid tower, black, gaming', CAST(5999000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'Mid Tower', 0, N'https://drive.google.com/file/d/1nrJThIa5SBJ3eh-uxNaymUkOripxH9Kh/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (378, 8, N'Case Cougar BLAZER', N'Mid tower, black', CAST(5989000 AS Decimal(18, 0)), N'36 Months', N'Cougar', N'Mid Tower', 0, N'https://drive.google.com/file/d/1TsXTKJs8g2xkFxC0RIwLWJu3mcKI5gxP/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (379, 8, N'case HYTE Y60 Black', N'EATX, mid tower, black', CAST(5499000 AS Decimal(18, 0)), N'36 Months', N'HYTE', N'Mid Tower', 0, N'https://drive.google.com/file/d/1nicOv7gHiRiLQ6KGNju-HY5i8wrFZzuP/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (380, 8, N'case HYTE Y60 White-White', N'EATX, mid tower, white', CAST(5499000 AS Decimal(18, 0)), N'36 Months', N'HYTE', N'Mid Tower', 0, N'https://drive.google.com/file/d/1KamVZKeLbvofiw_9Ait3c6pINsLtrGeg/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (381, 8, N'Case Phanteks Enthoo Evolv X ATX Case, Tempered Glass Window - Black', N'ATX, mid tower, tempered glass, black', CAST(5419000 AS Decimal(18, 0)), N'36 Months', N'Phanteks', N'Mid Tower', 0, N'https://drive.google.com/file/d/1OvQNcGIJaRpon1gB-LShYb5blc4pYLxR/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (382, 8, N'Case Phanteks Enthoo Evolv X ATX Case, Tempered Glass Window - Anthracite Grey', N'ATX, mid tower, tempered glass, grey', CAST(5419000 AS Decimal(18, 0)), N'36 Months', N'Phanteks', N'Mid Tower', 0, N'https://drive.google.com/file/d/1aVauLCHHWrmYvm2nmVQz6CRXYVQRhZU1/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (383, 8, N'Case Phanteks Enthoo Evolv X ATX Case, Tempered Glass Window - Galaxy Silver', N'ATX, mid tower, tempered glass, silver', CAST(5419000 AS Decimal(18, 0)), N'36 Months', N'Phanteks', N'Mid Tower', 0, N'https://drive.google.com/file/d/1yDO2BFuiBnbMCm9j3wFm8yCzXkwHL83S/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (384, 8, N'Case Cougar CONQUER', N'Mid tower, black', CAST(5409000 AS Decimal(18, 0)), N'36 Months', N'Cougar', N'Mid Tower', 0, N'https://drive.google.com/file/d/1lXh-CWmaE-hd51gbQFuSmdDnksDTJwTS/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (385, 8, N'case Jonsbo MOD3 Black', N'Mid tower, black', CAST(5399000 AS Decimal(18, 0)), N'36 Months', N'Jonsbo', N'Mid Tower', 0, N'https://drive.google.com/file/d/1IASmTTPV9IcVXNBakX8RjD7bCV_fBq0f/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (386, 8, N'case Jonsbo MOD3 Grey', N'Mid tower, grey', CAST(5399000 AS Decimal(18, 0)), N'36 Months', N'Jonsbo', N'Mid Tower', 0, N'https://drive.google.com/file/d/1NdDuTvyOejTRe3GEbCggHKOZusL5TaOa/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (387, 8, N'case Jonsbo MOD3 Pink', N'Mid tower, pink', CAST(5119000 AS Decimal(18, 0)), N'36 Months', N'Jonsbo', N'Mid Tower', 0, N'https://drive.google.com/file/d/1HBluDM1fNCQV9edqNvzBwAFdDMdNWGRx/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (388, 8, N'Case NZXT H9 Elite Black', N'Mid tower, black', CAST(4999000 AS Decimal(18, 0)), N'36 Months', N'NZXT', N'Mid Tower', 0, N'https://drive.google.com/file/d/162CW6cOW3YzUFzRPGdsxnoEfyFkC-4yN/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (389, 8, N'Case NZXT H9 Elite White', N'Mid tower, white', CAST(4999000 AS Decimal(18, 0)), N'36 Months', N'NZXT', N'Mid Tower', 0, N'https://drive.google.com/file/d/1Xr7sVtuHUFBQmXuOFY_h8-d3EYWAjSSU/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (390, 8, N'Case Jonsbo MOD-3 Mini Grey', N'Mid tower, grey', CAST(4499000 AS Decimal(18, 0)), N'36 Months', N'Jonsbo', N'Mid Tower', 0, N'https://drive.google.com/file/d/1tijqVJDGx5Fq6jjLzEDHqfuSGk6E1nI9/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (391, 8, N'Case Jonsbo MOD-3 Mini White', N'Mid tower, white', CAST(4499000 AS Decimal(18, 0)), N'36 Months', N'Jonsbo', N'Mid Tower', 0, N'https://drive.google.com/file/d/1DAvgsoH4gjw5COcfBzrrPSDBo3qUPM-9/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (392, 8, N'Case NZXT H7 Elite White', N'Mid tower, white', CAST(4399000 AS Decimal(18, 0)), N'36 Months', N'NZXT', N'Mid Tower', 0, N'https://drive.google.com/file/d/1ThuHkG7ikZgMPmk-_rL7WRunFxijnG-v/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (393, 8, N'Case Jonsbo TR03-G Black', N'Mid tower, black', CAST(4299000 AS Decimal(18, 0)), N'36 Months', N'Jonsbo', N'Mid Tower', 0, N'https://drive.google.com/file/d/1D2REhCERZI1fK6xKd-rsNv8n420baPnG/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (394, 8, N'Case Jonsbo TR03-G Silver', N'Mid tower, silver', CAST(4299000 AS Decimal(18, 0)), N'36 Months', N'Jonsbo', N'Mid Tower', 0, N'https://drive.google.com/file/d/1ufybVd-LKdx-_C219ALVfFsB8x9WJN5N/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (395, 8, N'Case Jonsbo TR03-A Black', N'Mid tower, black', CAST(4299000 AS Decimal(18, 0)), N'36 Months', N'Jonsbo', N'Mid Tower', 0, N'https://drive.google.com/file/d/1SjKsCC4NXWleQzDX_9J1-hTd3lpLP7po/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (396, 8, N'Case Jonsbo TR03-A Silver', N'Mid tower, silver', CAST(4299000 AS Decimal(18, 0)), N'36 Months', N'Jonsbo', N'Mid Tower', 0, N'https://drive.google.com/file/d/1zTlyphZpZ7dbQMK82DdL_8ifgJuJmZpa/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (397, 8, N'Case NZXT H7 (2023) Elite Black', N'Mid tower,black', CAST(4199000 AS Decimal(18, 0)), N'36 Months', N'NZXT', N'Mid Tower', 0, N'https://drive.google.com/file/d/134HR2WZFHIt7WKExyW456w8SBchWkooi/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (398, 8, N'Case Corsair 6500X Airflow Tempered Glass White', N'mATX, mid tower, white', CAST(4189000 AS Decimal(18, 0)), N'36 Months', N'Corsair', N'Mid Tower', 0, N'https://drive.google.com/file/d/1qan1ZzzvLGb-2AL88BYVoxOAJ0q643om/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (399, 8, N'Case Thermaltake Core P5 TG V2 Black Edition', N'Open frame, mid tower, black', CAST(4039000 AS Decimal(18, 0)), N'36 Months', N'Thermaltake', N'Mid Tower', 0, N'https://drive.google.com/file/d/1z4dehIwJc_RWA8BgN4CU8EzcVwh5VNPQ/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (400, 8, N'Case Corsair iCUE 5000X RGB TG Black', N'Mid tower, black', CAST(3999000 AS Decimal(18, 0)), N'36 Months', N'Corsair', N'Mid Tower', 0, N'https://drive.google.com/file/d/1zAObdY0ZMES7dl-DaV-ik-lAeGRJr6oV/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (401, 8, N'Case Corsair iCUE 5000X RGB TG White', N'Mid tower, white', CAST(3999000 AS Decimal(18, 0)), N'36 Months', N'Corsair', N'Mid Tower', 0, N'https://drive.google.com/file/d/1KFPgm7DYCECsQUFXXL08zbHL6rn_HCY0/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (402, 8, N'Case Fractal Design North Chalk White', N'ATX, mid tower, pink', CAST(3799000 AS Decimal(18, 0)), N'36 Months', N'Fractal Design', N'Mid Tower', 0, N'https://drive.google.com/file/d/1LlWacTooCVBNNXoqQ0YZGUCw3EbtMOOk/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (403, 8, N'Case Fractal Design North Chalk White TG Clear Tint', N'ATX, mid tower, white', CAST(3799000 AS Decimal(18, 0)), N'36 Months', N'Fractal Design', N'Mid Tower', 0, N'https://drive.google.com/file/d/1LlWacTooCVBNNXoqQ0YZGUCw3EbtMOOk/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (404, 8, N'Case Fractal Design North Charcoal Black TG Dark', N'ATX, mid tower, black', CAST(3799000 AS Decimal(18, 0)), N'36 Months', N'Fractal Design', N'Mid Tower', 0, N'https://drive.google.com/file/d/1iduI9bqVZ1aFTr8GOCLI0yuT5FHvk4z8/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (405, 8, N'Case Fractal Design North Charcoal Black', N'ATX, mid tower, black', CAST(3799000 AS Decimal(18, 0)), N'36 Months', N'Fractal Design', N'Mid Tower', 0, N'https://drive.google.com/file/d/15JORJn7AeyI_nO3pNNQUrWF8JJIDxnEi/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (406, 8, N'Case HYTE Y40 Black-White', N'ATX, mid tower, black-white', CAST(3799000 AS Decimal(18, 0)), N'36 Months', N'HYTE', N'Mid Tower', 0, N'https://drive.google.com/file/d/1re9PGPmTeiReTlMdcu67T-9UPsIJOV7B/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (407, 8, N'Case HYTE Y40 White', N'ATX, mid tower, white', CAST(3799000 AS Decimal(18, 0)), N'36 Months', N'HYTE', N'Mid Tower', 0, N'https://drive.google.com/file/d/1-r_FpnTdRSq9o72ztYbSHaPbfYUI_FNt/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (408, 8, N'Case HYTE Y40 Black-Red', N'ATX, mid tower, black-red', CAST(3799000 AS Decimal(18, 0)), N'36 Months', N'HYTE', N'Mid Tower', 0, N'https://drive.google.com/file/d/1LqdrfFTTPssAqYkdLCsvb6g2nLJFjPH0/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (409, 8, N'Case MSI MPG GUNGNIR 110R', N'Mid tower, black', CAST(3799000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'Mid Tower', 0, N'https://drive.google.com/file/d/1R6pIDUT7xPi_d0yz5vZbQ08Xg0I_6Dbs/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (410, 8, N'Case Fractal Design Define 7 Tempered Glass Clear Tint Black', N'ATX, mid tower, black', CAST(3699000 AS Decimal(18, 0)), N'36 Months', N'Fractal Design', N'Mid Tower', 0, N'https://drive.google.com/file/d/1TzxZtrOAPC8Xh4oytS28TCWTHItFmUfp/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (411, 8, N'Case Phanteks Eclipse P500A D-RGB - Black', N'ATX, mid tower, black', CAST(3699000 AS Decimal(18, 0)), N'36 Months', N'Phanteks', N'Mid Tower', 0, N'https://drive.google.com/file/d/1TjOTM8J5SFfDiGVEguS6J5PHVLGYXkho/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (412, 8, N'Case Fractal Design Define 7 Compact - Tempered Glass Light Tint Black', N'ATX, mid tower, black', CAST(3699000 AS Decimal(18, 0)), N'36 Months', N'Fractal Design', N'Mid Tower', 0, N'https://drive.google.com/file/d/1KaRJ9QWI4ga073uc-u3vL9KjWHx0-kng/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (413, 8, N'Case Corsair 4000D Airflow Tempered Glass Black', N'Mid tower, black', CAST(3599000 AS Decimal(18, 0)), N'36 Months', N'Corsair', N'Mid Tower', 0, N'https://drive.google.com/file/d/1bL8FlwnXt3MKjVuF8IpvUsNKdDfX9MYC/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (414, 8, N'CASE THERMALTAKE CORE P8 TEMPERED GLASS FULL TOWER CHASSIS', N'Full Tower, black', CAST(4939000 AS Decimal(18, 0)), N'36 Months', N'Thermaltake', N'Full Tower', 0, N'https://drive.google.com/file/d/1t_pDl2ZyDUKeQ16fQwNnbcVbwGCkMkne/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (415, 8, N'Case Phanteks Enthoo 719 (Luxe II), Tempered Glass, DRGB Ligting, Satin', N'Full Tower, black', CAST(4949000 AS Decimal(18, 0)), N'36 Months', N'Phanteks', N'Full Tower', 0, N'https://drive.google.com/file/d/1az6o-c0pY9zv6aqYrTMUuQ1zqqUzhZHE/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (416, 8, N'Case Phanteks Enthoo 719 (Luxe II), Tempered Glass, DRGB Ligting, Anthracite', N'Full Tower, grey', CAST(4949000 AS Decimal(18, 0)), N'36 Months', N'Phanteks', N'Full Tower', 0, N'https://drive.google.com/file/d/1LzLfkcKx8lzFaODUV7yQt_VLQ5vXcVz-/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (417, 8, N'Case Corsair 7000D Airflow TG Black', N'Full Tower, black', CAST(5689000 AS Decimal(18, 0)), N'36 Months', N'Corsair', N'Full Tower', 0, N'https://drive.google.com/file/d/1i7YydnmPQ2ZlpzoPuaziFefNBPJqCaJr/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (418, 8, N'Case Corsair iCUE 7000X RGB TG Black', N'Full Tower, black, RGB', CAST(6899000 AS Decimal(18, 0)), N'36 Months', N'Corsair', N'Full Tower', 0, N'https://drive.google.com/file/d/1fStew8umi8rs9i-5Qh58Au6LAFxvA666/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (419, 8, N'Case Corsair 7000D Airflow TG White', N'Full Tower, white', CAST(4999000 AS Decimal(18, 0)), N'36 Months', N'Corsair', N'Full Tower', 0, N'https://drive.google.com/file/d/1cRn4VM-VVPJ22rZbB1pa8wzKIv7mQxo2/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (420, 8, N'Case Corsair iCUE 7000X RGB TG White', N'Full Tower, white, RGB', CAST(6899000 AS Decimal(18, 0)), N'36 Months', N'Corsair', N'Full Tower', 0, N'https://drive.google.com/file/d/16aXXbS9ilMozyJNAfy0TnAyFu6Norbsx/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (421, 8, N'Case Jonsbo D500 Black', N'Full Tower, black', CAST(5799000 AS Decimal(18, 0)), N'36 Months', N'Jonsbo', N'Full Tower', 0, N'https://drive.google.com/file/d/1nE6zpE2o8vtBCvEeLjVlJ1Y7YNC36THl/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (422, 8, N'Case Jonsbo D500 Silver', N'Full Tower, silver', CAST(5799000 AS Decimal(18, 0)), N'36 Months', N'Jonsbo', N'Full Tower', 0, N'https://drive.google.com/file/d/1S1Dbu1XIPsuDAqrh2WgND7oKUPDPPkGc/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (423, 8, N'Case XIGMATEK AQUA ULTRA', N'Full Tower, black', CAST(1999000 AS Decimal(18, 0)), N'36 Months', N'Xigmatek', N'Full Tower', 0, N'https://drive.google.com/file/d/1Q-xE4QBUX3MslHaBT5v8p91OxMEQBEyz/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (424, 8, N'Case DeepCool QUADSTELLAR INFINITY', N'Full Tower, black', CAST(6599000 AS Decimal(18, 0)), N'36 Months', N'DeepCool', N'Full Tower', 0, N'https://drive.google.com/file/d/1skwojEZ8X-KzFszXf6Yfhr126kcA-5Z9/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (425, 8, N'Case XIGMATEK AQUA ULTRA ARCTIC', N'Full Tower, white', CAST(1999000 AS Decimal(18, 0)), N'36 Months', N'Xigmatek', N'Full Tower', 0, N'https://drive.google.com/file/d/1Q-xE4QBUX3MslHaBT5v8p91OxMEQBEyz/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (426, 8, N'Case LIAN-LI O11D EVO XL BLACK', N'Full Tower, black', CAST(5599000 AS Decimal(18, 0)), N'36 Months', N'Lian-Li', N'Full Tower', 0, N'https://drive.google.com/file/d/1YUxv35HCi8BWUxdXPfN-c51X4n4CrT8w/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (427, 8, N'Case Lian Li O11D VISION Chrome', N'Full Tower, chrome', CAST(3689000 AS Decimal(18, 0)), N'36 Months', N'Lian-Li', N'Full Tower', 0, N'https://drive.google.com/file/d/1VMKhbpCVRtsAlkzKKNtmf95GMadsUfKr/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (428, 8, N'Case Thermaltake Core P6 TG Black', N'Full Tower, black', CAST(3799000 AS Decimal(18, 0)), N'36 Months', N'Thermaltake', N'Full Tower', 0, N'https://drive.google.com/file/d/1QJYBDsCXjtbIN3dVEC3tTV1C2tCV8REn/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (429, 8, N'Case LIAN-LI O11D EVO XL WHITE', N'Full Tower, white', CAST(5599000 AS Decimal(18, 0)), N'36 Months', N'Lian-Li', N'Full Tower', 0, N'https://drive.google.com/file/d/1bMYp3f_my9yG041E-uAyogx2vRaTCTk8/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (430, 8, N'Case Lian Li O11D VISION White', N'Full Tower, white', CAST(3689000 AS Decimal(18, 0)), N'36 Months', N'Lian-Li', N'Full Tower', 0, N'https://drive.google.com/file/d/1ZbJjFzsVhnu35yN8DF2kt78BR0WZLVUE/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (431, 8, N'Case Asus TUF Gaming GT302 ARGB Black', N'Full Tower, black', CAST(3199000 AS Decimal(18, 0)), N'36 Months', N'Asus', N'Full Tower', 0, N'https://drive.google.com/file/d/12-vdJEgSqLANZnm3O7R3bXGpuX5AhXCT/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (432, 8, N'Case Lian Li Lancool 3-X Black', N'Full Tower, black', CAST(2999000 AS Decimal(18, 0)), N'36 Months', N'Lian-Li', N'Full Tower', 0, N'https://drive.google.com/file/d/1ARntEN-1A8qk27YujvLFGkQtNpPbvHZ7/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (433, 8, N'Case Thermaltake H570 TG ARGB Black', N'Full Tower, black', CAST(1889000 AS Decimal(18, 0)), N'36 Months', N'Thermaltake', N'Full Tower', 0, N'https://drive.google.com/file/d/158ksRWjCp_DsXXFyJwKpRHQUdZnvAkh3/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (434, 8, N'Case Thermaltake Core P6 TG Snow', N'Full Tower, white', CAST(3999000 AS Decimal(18, 0)), N'36 Months', N'Thermaltake', N'Full Tower', 0, N'https://drive.google.com/file/d/1syU-uGt8joWdSXtEO02E8a-G9rZ3QyUD/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (435, 8, N'Case Lian Li Lancool 3R-X Black', N'Full Tower, black, RGB', CAST(3249000 AS Decimal(18, 0)), N'36 Months', N'Lian-Li', N'Full Tower', 0, N'https://drive.google.com/file/d/1C8HF9-Wt5XCQbFoy710wyyRKplGJrHBa/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (436, 8, N'Case Thermaltake H570 TG ARGB Snow', N'Full Tower, white', CAST(2049000 AS Decimal(18, 0)), N'36 Months', N'Thermaltake', N'Full Tower', 0, N'https://drive.google.com/file/d/1gJVEskzMHnUIIy2Q45N2pkqLIrNDMMk1/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (437, 8, N'Case LIAN-LI LANCOOL III MESH WHITE', N'Full Tower, white', CAST(3099000 AS Decimal(18, 0)), N'36 Months', N'Lian-Li', N'Full Tower', 0, N'https://drive.google.com/file/d/1O3sbhQwajeSACYtZ379rdsyokZRLzw95/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (438, 8, N'Case LIAN-LI LANCOOL III RGB MESH WHITE', N'Full Tower, white, RGB', CAST(3499000 AS Decimal(18, 0)), N'36 Months', N'Lian-Li', N'Full Tower', 0, N'https://drive.google.com/file/d/1SlpvDpSM-vL1pz8i8XfmdOG8L4AUVNR5/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (439, 8, N'Case XIGMATEK ALPHARD 3GF', N'EATX, Full Tower, black, 3 fans', CAST(999000 AS Decimal(18, 0)), N'36 Months', N'Xigmatek', N'Full Tower', 0, N'https://drive.google.com/file/d/1wIkb5S28-b6pwsEinnhNSjWKBGPsyk4J/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (440, 8, N'Case XIGMATEK ALPHARD ARTIC 3GF', N'EATX, Full Tower, white, 3 fans', CAST(1099000 AS Decimal(18, 0)), N'36 Months', N'Xigmatek', N'Full Tower', 0, N'https://drive.google.com/file/d/17fHHfxeWjwSGq7_2iwpxJgxdPw79-YY6/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (441, 8, N'Case ADATA XPG DEFENDER PRO WHITE', N'Full Tower, white', CAST(999000 AS Decimal(18, 0)), N'36 Months', N'ADATA', N'Full Tower', 0, N'https://drive.google.com/file/d/1xjJjjTqEtnCEQhLAwIbp2ARxBffBdli9/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (442, 8, N'Case VITRA TITAN R220 AIR Black', N'EATX, black, 3 fans', CAST(1199000 AS Decimal(18, 0)), N'36 Months', N'VITRA', N'EATX', 0, N'https://drive.google.com/file/d/1aDjCX_NH1x5kPgF-BFGVlVBmlxaDAeSl/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (443, 8, N'Case Lian Li O11 VISION Compact - Black', N'ATX, Full Tower, black', CAST(3299000 AS Decimal(18, 0)), N'36 Months', N'Lian-Li', N'Full Tower', 0, N'https://drive.google.com/file/d/16XVnYCGRtw1OZjmcmxsUCBV_Dozk5MTk/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (444, 8, N'Case Lian Li O11 VISION Compact - White', N'ATX, Full Tower, white', CAST(3299000 AS Decimal(18, 0)), N'36 Months', N'Lian-Li', N'Full Tower', 0, N'https://drive.google.com/file/d/1IFJyIspvEKGK-2vXMH0xU6U1q3rPFU7i/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (445, 9, N'FAN CPU NOCTUA NH-D15', N'High-performance dual-tower CPU cooler', CAST(3059000 AS Decimal(18, 0)), N'24 Months', N'Noctua', N'LGA 1700, AM5', 8, N'https://drive.google.com/file/d/1y8Ncueof4J06_sti-SJ6qqvJ0QRo5dwR/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (446, 9, N'FAN CPU DEEPCOOL AK620 WH', N'Premium dual-tower air cooler, white edition', CAST(1529000 AS Decimal(18, 0)), N'24 Months', N'Deepcool', N'LGA 1700, AM5', 8, N'https://drive.google.com/file/d/1tkt-DciVbOzZRrDl36cui14IuZ29haNt/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (447, 9, N'Fan CPU Noctua NH-D15S', N'Asymmetrical high-performance CPU cooler', CAST(2359000 AS Decimal(18, 0)), N'24 Months', N'Noctua', N'LGA 1700, AM5', 8, N'https://drive.google.com/file/d/1vUJZu6TQXY0thJhEyBpIr-j5RMKykfGT/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (448, 9, N'FAN CPU Jonsbo HX6240 White', N'Compact white CPU cooler', CAST(889000 AS Decimal(18, 0)), N'24 Months', N'Jonsbo', N'LGA 1700, AM5', 8, N'https://drive.google.com/file/d/17j7J7mLnCYhLlaUNTuWQW_L8IqtmfClU/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (449, 9, N'FAN CPU ID-Cooling SE-207-XT ADVANCED', N'Advanced dual-tower air cooler', CAST(999000 AS Decimal(18, 0)), N'24 Months', N'ID-Cooling', N'LGA 1700, AM5', 8, N'https://drive.google.com/file/d/1YlD2Ax2h8SH3W1xbQ__thvx7OElF3wMp/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (450, 9, N'FAN CPU CENTAUR CT-AIR01 WHITE', N'Budget-friendly white air cooler', CAST(319000 AS Decimal(18, 0)), N'24 Months', N'Centaur', N'LGA 1700, AM5', 8, N'https://drive.google.com/file/d/1yhgA10OwVwA0yFsFVeikPwrxs5JRJCb_/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (451, 9, N'FAN CPU JONSBO HX6200D BLACK', N'Low-profile black air cooler', CAST(819000 AS Decimal(18, 0)), N'24 Months', N'Jonsbo', N'LGA 1700, AM5', 8, N'https://drive.google.com/file/d/16aTkpTepUFh0KQZvAtHvi5SAXW_GZFZZ/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (452, 9, N'FAN CPU Jonsbo HX4170D Black', N'High-performance black CPU cooler', CAST(649000 AS Decimal(18, 0)), N'24 Months', N'Jonsbo', N'LGA 1700, AM5', 5, N'https://drive.google.com/file/d/1BlEUbzjYLpmZNM-X73G_OoIf52f8ZTVo/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (453, 9, N'FAN CPU Jonsbo HX4170D White', N'High-performance white CPU cooler', CAST(699000 AS Decimal(18, 0)), N'24 Months', N'Jonsbo', N'LGA 1700, AM5', 5, N'https://drive.google.com/file/d/1jBMp5SbVw-zt6wkTjqcuIdFqRq97CjLh/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (454, 9, N'FAN CPU Jonsbo CR-1000 EVO ARGB Black', N'ARGB black air cooler', CAST(399000 AS Decimal(18, 0)), N'24 Months', N'Jonsbo', N'LGA 1700, AM5', 5, N'https://drive.google.com/file/d/1JEAE1GxoGhRwhed4XnCIauLVqNHbt3dk/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (455, 9, N'FAN CPU Jonsbo CR-1000 EVO ARGB White', N'ARGB white air cooler', CAST(399000 AS Decimal(18, 0)), N'24 Months', N'Jonsbo', N'LGA 1700, AM5', 5, N'https://drive.google.com/file/d/1iZKPR4k3Ydmw3cuhEdThLMrZfpGDwJot/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (456, 9, N'FAN CPU DEEPCOOL AK400 Digital', N'Digital edition of AK400 air cooler', CAST(899000 AS Decimal(18, 0)), N'24 Months', N'Deepcool', N'LGA 1700, AM5', 5, N'https://drive.google.com/file/d/1NMoft_3MCW5Bwg0T0x5U9xsUh-5ejhXe/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (457, 9, N'FAN CPU DEEPCOOL AK620 Digital', N'Digital edition of AK620 dual-tower air cooler', CAST(1999000 AS Decimal(18, 0)), N'24 Months', N'Deepcool', N'LGA 1700, AM5', 8, N'https://drive.google.com/file/d/1gyDzcrYzcI_FYl6HEpTAYET3B-Z53---/view?usp=drive_link')
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (458, 9, N'FAN CPU DEEPCOOL ASSASSIN IV', N'High-end dual-tower air cooler', CAST(2499000 AS Decimal(18, 0)), N'24 Months', N'Deepcool', N'LGA 1700, AM5', 8, N'https://drive.google.com/file/d/1_xVHWcPPUCoizKg3Twx2jLPqaXWN4VKw/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (459, 9, N'FAN CPU DEEPCOOL AK620 WH Digital', N'Digital white edition of AK620 air cooler', CAST(1999000 AS Decimal(18, 0)), N'24 Months', N'Deepcool', N'LGA 1700, AM5', 8, N'https://drive.google.com/file/d/1zE_WdVt-kZv0vpw1ejg40KVMdOaB-yLd/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (460, 9, N'FAN CPU DEEPCOOL AG400 ARGB', N'ARGB budget air cooler', CAST(389000 AS Decimal(18, 0)), N'24 Months', N'Deepcool', N'LGA 1700, AM5', 5, N'https://drive.google.com/file/d/1KOGtbLFsqm-Hfw5bYXKXdjkZdI9nF8Ia/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (461, 9, N'FAN CPU JONSBO CR-1000 ARGB', N'ARGB air cooler with backplate 1700 included', CAST(429000 AS Decimal(18, 0)), N'24 Months', N'Jonsbo', N'LGA 1200. AM4', 5, N'https://drive.google.com/file/d/12A2OujN0xPsmLULAeUtFoTBIQhI_rI3_/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (462, 9, N'FAN CPU ID-Cooling CPU SE-226 - XT ARGB', N'ARGB air cooler with high performance', CAST(899000 AS Decimal(18, 0)), N'24 Months', N'ID-Cooling', N'LGA 1200. AM4', 8, N'https://drive.google.com/file/d/11GTlyMAZSAx92syOnL0U-NUNVKbbqgpD/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (463, 9, N'FAN CPU ID-Cooling CPU SE-214-XT ARGB', N'Compact ARGB air cooler for high efficiency', CAST(399000 AS Decimal(18, 0)), N'24 Months', N'ID-Cooling', N'LGA 1200. AM4', 5, N'https://drive.google.com/file/d/1t0SmtriVCT2NF0D6hLdHv9uxPWjtvL0a/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (464, 9, N'FAN CPU ID-Cooling CPU SE-234 ARGB V2', N'Updated ARGB air cooler for improved cooling', CAST(699000 AS Decimal(18, 0)), N'24 Months', N'ID-Cooling', N'LGA 1200. AM4', 5, N'https://drive.google.com/file/d/1z-iudcv3h5WYl31Hk9m896DjwT5V4y_M/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (466, 9, N'FAN CPU ID-Cooling CPU SE-214-XT ARGB White', N'ARGB white air cooler for efficient cooling', CAST(399000 AS Decimal(18, 0)), N'24 Months', N'ID-Cooling', N'LGA 1200. AM4', 5, N'https://drive.google.com/file/d/1t0SmtriVCT2NF0D6hLdHv9uxPWjtvL0a/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (468, 9, N'FAN CPU Coolermaster Hyper 212 Spectrum V3', N'Updated Spectrum V3 air cooler with ARGB', CAST(389000 AS Decimal(18, 0)), N'24 Months', N'Coolermaster', N'LGA 1200. AM4', 5, N'https://drive.google.com/file/d/1msCXns1cfEBiqISlbOO1L7Y3GMliWEOQ/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (469, 9, N'FAN CPU Cooler Master HYPER 620S', N'High-performance air cooler with enhanced cooling', CAST(829000 AS Decimal(18, 0)), N'24 Months', N'Coolermaster', N'LGA 1200. AM4', 8, N'https://drive.google.com/file/d/1XLDLW4q8RwVZh3aMAmmPvWP2mXKNayhH/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (471, 9, N'FAN CPU Antec A400i', N'Efficient air cooler with ARGB lighting', CAST(389000 AS Decimal(18, 0)), N'24 Months', N'Antec', N'LGA 1200. AM4', 5, N'https://drive.google.com/file/d/1oY8QzZen_Wa5r-SsfiEFedUzLtXuIBWe/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (474, 10, N'KEYBOARD FUHLEN L411 (USB/ÐEN)', N'Wired USB keyboard in black color', CAST(199000 AS Decimal(18, 0)), N'12 Months', N'Fuhlen', N'Wired', 0, N'https://drive.google.com/file/d/1e-fQnWQsFnJ44EDJx2FQIyPf__ssaZvW/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (475, 10, N'KEYBOARD LOGITECH K120 (USB/ÐEN)', N'Basic wired USB keyboard in black', CAST(159000 AS Decimal(18, 0)), N'12 Months', N'Logitech', N'Wired', 0, N'https://drive.google.com/file/d/1_kLTGy5_dvml25vHKH4MTYpU3VydWUMK/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (476, 10, N'MECHANICAL KEYBOARD LOGITECH G213 PRODIGY RGB GAMING', N'Gaming keyboard with RGB lighting', CAST(999000 AS Decimal(18, 0)), N'12 Months', N'Logitech', N'Wired', 0, N'https://drive.google.com/file/d/1e2p2dQUffHarZkTL4AosQmq8_KM65IKg/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (477, 10, N'KEYBOARD LOGITECH G613 WIRELESS (USB)', N'Wireless mechanical keyboard with USB connectivity', CAST(1699000 AS Decimal(18, 0)), N'12 Months', N'Logitech', N'Wireless', 0, N'https://drive.google.com/file/d/1xxXVmQ-hWUk2CY_Yk1uBC5hdc8j03hej/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (478, 10, N'MECHANICAL KEYBOARD DAREU LK145 USB BLACK', N'Wired USB keyboard in black', CAST(339000 AS Decimal(18, 0)), N'12 Months', N'Dareu', N'Wired', 0, N'https://drive.google.com/file/d/1S7emnD-6EiaZOJf5dS-du6RgA-7OpWZ8/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (479, 10, N'KEYBOARD CORSAIR K63 CHERRY MX RED (USB/RED LED) (CH-9115020-NA)', N'Mechanical keyboard with Cherry MX Red switches and red LED', CAST(1799000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'Wired', 0, N'https://drive.google.com/file/d/17WjpraokO_IzQIrwysSCxT9wpvbCllsZ/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (480, 10, N'KEYBOARD LOGITECH K270 WIRELESS (USB)', N'Wireless keyboard with USB receiver', CAST(399000 AS Decimal(18, 0)), N'12 Months', N'Logitech', N'Wireless', 0, N'https://drive.google.com/file/d/1CS5XvtSwEu4FrNtrQgiNC2Y1D3hnPxlO/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (481, 10, N'KEYBOARD DAREU LK185 USB BLACK', N'Affordable wired USB keyboard in black', CAST(139000 AS Decimal(18, 0)), N'12 Months', N'Dareu', N'Wired', 0, N'https://drive.google.com/file/d/1LFAr_IctcpUPsw5TWEVc6eSGQOu9YWZQ/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (482, 10, N'KEYBOARD DAREU LK135 USB BLACK', N'Wired USB keyboard in black color', CAST(199000 AS Decimal(18, 0)), N'12 Months', N'Dareu', N'Wired', 0, N'https://drive.google.com/file/d/1aMTHcAPJwOwd6M2cDaGigIk5EfMa6qD1/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (483, 10, N'MECHANICAL KEYBOARD LOGITECH G PRO X RGB LIGHTSYNC (USB/BLUE CLICKY SW/ÐEN)', N'RGB mechanical gaming keyboard with blue clicky switches', CAST(2399000 AS Decimal(18, 0)), N'24 Months', N'Logitech', N'Wired', 0, N'https://drive.google.com/file/d/1QBxA9k_Tj19sKg0JjqmnQBhH4DTTrP6E/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (484, 10, N'KEYBOARD L500S (USB/ÐEN)', N'Wired USB keyboard with red backlight', CAST(199000 AS Decimal(18, 0)), N'12 Months', N'Fuhlen', N'Wired', 0, N'https://drive.google.com/file/d/16idueo6Gs9J5obcNtsvZ6n-xbQkIe_I1/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (485, 10, N'KEYBOARD EDRA EK501 ÐEN', N'Basic wired keyboard in black', CAST(119000 AS Decimal(18, 0)), N'12 Months', N'E-Dra', N'Wired', 0, N'https://drive.google.com/file/d/1cxnaGoE8AQhWfbJHPj-RZV9YF8PDTUSx/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (486, 10, N'KEYBOARD DELL KB216B (USB/ÐEN)', N'Wired USB keyboard in black from Dell', CAST(249000 AS Decimal(18, 0)), N'12 Months', N'Dell', N'Wired', 0, N'https://drive.google.com/file/d/1heyBJzf0n-8AR32iGvBYj8zPZJLVh_58/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (487, 10, N'MECHANICAL KEYBOARD DAREU EK87 MULTI-LED BLACK (USB/BLUE SWITCH)', N'Mechanical keyboard with blue switches and multi-LED backlight', CAST(499000 AS Decimal(18, 0)), N'12 Months', N'Dareu', N'Wired', 0, N'https://drive.google.com/file/d/1rDbrK1xmFZ3YS3Lb3sZS2S71QjLebtEP/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (488, 10, N'KEYBOARD LOGITECH K480 BLUETOOTH ÐEN', N'Bluetooth keyboard compatible with multiple devices', CAST(749000 AS Decimal(18, 0)), N'12 Months', N'Logitech', N'Wireless', 0, N'https://drive.google.com/file/d/1TDVBfsyoi2Etfv1PO-ZIcrA7nGbIY14T/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (489, 10, N'MECHANICAL KEYBOARD LOGITECH G512 LIGHTSYNC RGB TACTILE (USB/GX BROWN)', N'RGB mechanical gaming keyboard with GX Brown switches', CAST(1979000 AS Decimal(18, 0)), N'24 Months', N'Logitech', N'Wired', 0, N'https://drive.google.com/file/d/1IfHNK0f1yYbmLxVPWKm6D1_HtdkzThDV/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (490, 10, N'MECHANICAL KEYBOARD E-DRA EK300 OPTICAL SWITCH LED USB', N'Optical switch mechanical keyboard with LED backlight', CAST(699000 AS Decimal(18, 0)), N'12 Months', N'E-Dra', N'Wired', 0, N'https://drive.google.com/file/d/1oJKE9DcNqD90c_RikoMd8gE3ubqBoDN4/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (491, 10, N'KEYBOARD E-DRA EK701 LED USB BLACK', N'Affordable wired keyboard with LED backlight', CAST(339000 AS Decimal(18, 0)), N'12 Months', N'E-Dra', N'Wired', 0, N'https://drive.google.com/file/d/13NFrlXeChGg8B4ovQi9oSLBfl8HU5mqX/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (492, 10, N'KEYBOARD EDRA EK502 ÐEN (USB)', N'Wired USB keyboard in black', CAST(189000 AS Decimal(18, 0)), N'12 Months', N'E-Dra', N'Wired', 0, N'https://drive.google.com/file/d/1beyyMP7EQtJBDFRCd2YpHmM2aa1HoidN/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (493, 10, N'MECHANICAL KEYBOARD LOGITECH G512 LIGHTSYNC RGB LINEAR (USB/GX RED)', N'RGB mechanical keyboard with GX Red switches', CAST(1979000 AS Decimal(18, 0)), N'24 Months', N'Logitech', N'Wired', 0, N'https://drive.google.com/file/d/1FY-mBMzTMJKOhx69qbEi9v8YDSrxHo-E/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (494, 10, N'MECHANICAL KEYBOARD DAREU EK810 MULTI-LED BLACK (USB/MULTI LED/BLUE SWITCH)', N'Mechanical keyboard with blue switches and multi-LED backlight', CAST(649000 AS Decimal(18, 0)), N'12 Months', N'Dareu', N'Wired', 0, N'https://drive.google.com/file/d/1OunbXQG4mG8Px1zHUHy9zAByux17JUFp/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (495, 10, N'KEYBOARD FUHLEN G500S (USB/LED/RED)', N'Wired USB keyboard with red LED backlight', CAST(619000 AS Decimal(18, 0)), N'12 Months', N'Fuhlen', N'Wired', 0, N'https://drive.google.com/file/d/19wOX5isT1XSQVtYCi3i0EgsbttLhr8_W/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (496, 10, N'MECHANICAL KEYBOARD DAREU EK810 MULTI-LED BLACK (USB/MULTI LED/RED SWITCH)', N'Mechanical keyboard with red switches and multi-LED backlight', CAST(649000 AS Decimal(18, 0)), N'12 Months', N'Dareu', N'Wired', 0, N'https://drive.google.com/file/d/1shDkUkJs-DC7HzPLtzyX_pAg2Sv1WdGD/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (497, 10, N'MECHANICAL KEYBOARD DAREU EK87 MULTI-LED BLACK (USB/RED SWITCH)', N'Mechanical keyboard with red switches and multi-LED backlight', CAST(499000 AS Decimal(18, 0)), N'12 Months', N'Dareu', N'Wired', 0, N'https://drive.google.com/file/d/1jEhSFIWV-FfG58CPbCi6GNoDvbswl-dM/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (498, 10, N'KEYBOARD LOGITECH G913 TKL LIGHTSPEED WIRELESS RGB RED LINEAR SWITCH', N'High-end wireless RGB mechanical keyboard with red linear switches', CAST(3699000 AS Decimal(18, 0)), N'24 Months', N'Logitech', N'Wireless', 0, N'https://drive.google.com/file/d/18fIr7z01hKQW5OiXnJ6X5PscrWei2MT5/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (499, 10, N'MECHANICAL KEYBOARD QUANG E-DRA EK308 RGB (USB/OPTICAL SWITCH/ÐEN)', N'Optical switch RGB mechanical keyboard', CAST(929000 AS Decimal(18, 0)), N'12 Months', N'E-Dra', N'Wired', 0, N'https://drive.google.com/file/d/1IE4wu3qtGZR0sZqVZrP4iuAi09sSGX7z/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (500, 10, N'MECHANICAL KEYBOARD LOGITECH G512 LIGHTSYNC RGB CLICKY (USB/GX BLUE)', N'RGB mechanical keyboard with GX Blue switches', CAST(1949000 AS Decimal(18, 0)), N'24 Months', N'Logitech', N'Wired', 0, N'https://drive.google.com/file/d/1Uv3gt1k36MKriOyMPZPjn38K9B1cHAYL/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (501, 10, N'MECHANICAL KEYBOARD LOGITECH G813 LIGHTSYNC RGB GL TACTILE (USB)', N'RGB mechanical gaming keyboard with GL Tactile switches', CAST(2699000 AS Decimal(18, 0)), N'24 Months', N'Logitech', N'Wired', 0, N'https://drive.google.com/file/d/1e35uvqehulYYTcZvTWDPd533LjIpvHZw/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (502, 10, N'KEYBOARD RAPOO NK1800 ÐEN (USB)', N'Basic wired keyboard in black from Rapoo', CAST(139000 AS Decimal(18, 0)), N'12 Months', N'Rapoo', N'Wired', 0, N'https://drive.google.com/file/d/1d01BTdbg2pU5Fxd6t01KrPPRDkinZvF_/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (503, 10, N'KEYBOARD CORSAIR K100 RGB SPEED SWITCH (CH-912A014-NA)', N'High-end mechanical keyboard with speed switches and RGB lighting', CAST(4999000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'Wired', 0, N'https://drive.google.com/file/d/1DzsQflleahDbDPVVZyTy2mobTl7d7Fco/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (504, 10, N'MECHANICAL KEYBOARD DAREU EK87 MULTI-LED BLACK (USB/BROWN SWITCH)', N'Mechanical keyboard with brown switches and multi-LED backlight', CAST(499000 AS Decimal(18, 0)), N'12 Months', N'Dareu', N'Wired', 0, N'https://drive.google.com/file/d/1KZ49kqkspTv9SoMJnn4huHaSkBaW4Oda/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (505, 10, N'KEYBOARD LOGITECH G913 TKL LIGHTSPEED WIRELESS RGB BROWN TACTILE SWITCH', N'Wireless RGB mechanical keyboard with brown tactile switches', CAST(3599000 AS Decimal(18, 0)), N'24 Months', N'Logitech', N'Wireless', 0, N'https://drive.google.com/file/d/1zKjqdJx3H2kW8JDjUX_ovC-qfZfKRXnE/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (506, 10, N'MECHANICAL KEYBOARD STEELSERIES APEX 7 TKL RGB MECHANICAL RED SWITCH US (64646)', N'RGB mechanical keyboard with red switches', CAST(2999000 AS Decimal(18, 0)), N'24 Months', N'Steelseries', N'Wired', 0, N'https://drive.google.com/file/d/15BwB9wABuNA4tZpSHvI3nNcFW-8b99Dk/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (507, 10, N'KEYBOARD CORSAIR K70 TKL RGB CHAMPION (USB/SPEED SW) (CH-9119014-NA)', N'Compact RGB mechanical keyboard with speed switches', CAST(3399000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'Wired', 0, N'https://drive.google.com/file/d/1goNrOJn5sa46xSYwT48Mk-TcHPqspiaP/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (508, 10, N'KEYBOARD GAMING NEWMEN GM368 MECHANICAL LED RGB USB BLACK (USB/MULTI LED/BLUE SW)', N'RGB mechanical gaming keyboard with blue switches', CAST(769000 AS Decimal(18, 0)), N'12 Months', N'Newmen', N'Wired', 0, N'https://drive.google.com/file/d/1LpKlh_1D25NI91h5OdvtcoXZcR1Vl00Z/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (509, 10, N'KEYBOARD CORSAIR K100 RGB OPTICAL SWITCH (OPX-RF) (CH-912A01A-NA)', N'High-end RGB mechanical keyboard with optical switches', CAST(5599000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'Wired', 0, N'https://drive.google.com/file/d/1mP2urJBxg1-ntMzXB50NVda3ORQ4Z_y6/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (510, 11, N'MOUSE FUHLEN L102 (USB/ÐEN)', N'Affordable wired USB mouse in black', CAST(139000 AS Decimal(18, 0)), N'12 Months', N'Fuhlen', N'Wired', 0, N'https://drive.google.com/file/d/1m9uI1TeCQIpqR8TU9KU__T0XLns0HeQe/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (511, 11, N'GAMING MOUSE LOGITECH G102 GEN2 BLACK (USB/RGB/ÐEN)', N'Gaming mouse with RGB lighting and USB connectivity', CAST(399000 AS Decimal(18, 0)), N'12 Months', N'Logitech', N'Wired', 0, N'https://drive.google.com/file/d/1CcS6TcaGA5BK_3kwycVl61y6Cv5OF4jT/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (512, 11, N'GAMING MOUSE FUHLEN G90 (USB/LED/ÐEN)', N'Gaming mouse with LED lighting and USB connectivity', CAST(399000 AS Decimal(18, 0)), N'12 Months', N'Fuhlen', N'Wired', 0, N'https://drive.google.com/file/d/1X7bMcppAbinUCOxbXXa-T3khubHYV7qo/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (513, 11, N'GAMING MOUSE LOGITECH G402 HYPERION FURY (USB/ÐEN)', N'High-speed gaming mouse with USB connectivity', CAST(639000 AS Decimal(18, 0)), N'12 Months', N'Logitech', N'Wired', 0, N'https://drive.google.com/file/d/1pN6VMseEUo_tUTJKA0RbalQvAjeg6Kn1/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (514, 11, N'WIRELESS MOUSE LOGITECH G304 ÐEN (USB)', N'Wireless gaming mouse with USB connectivity', CAST(769000 AS Decimal(18, 0)), N'12 Months', N'Logitech', N'Wireless', 0, N'https://drive.google.com/file/d/14SosD7dwIpO-EJISgc_Q0ONZ7iQ0_xX9/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (515, 11, N'GAMING MOUSE LOGITECH G703 HERO LIGHTSPEED WIRELESS GAMING', N'High-performance wireless gaming mouse', CAST(1899000 AS Decimal(18, 0)), N'24 Months', N'Logitech', N'Wireless', 0, N'https://drive.google.com/file/d/19lQPxJEfmS-dnkbSzt6oASDTLYpOFZVH/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (516, 11, N'MOUSE LOGITECH B100 BLACK (910-006605) (USB)', N'Basic wired mouse with USB connectivity', CAST(99000 AS Decimal(18, 0)), N'12 Months', N'Logitech', N'Wired', 0, N'https://drive.google.com/file/d/1q3DtNldNiXYbQM-ivYVAvDC3-51BCmOb/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (517, 11, N'WIRELESS MOUSE LOGITECH G PRO WIRELESS (USB/RGB/ÐEN) (910-005274)', N'High-end wireless gaming mouse with RGB lighting', CAST(1849000 AS Decimal(18, 0)), N'24 Months', N'Logitech', N'Wireless', 0, N'https://drive.google.com/file/d/18TOSIFODm2QEU4kcsh4WnXFOdkgO-p86/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (518, 11, N'GAMING MOUSE LOGITECH G403 HERO (USB/RGB/ÐEN)', N'Gaming mouse with RGB lighting and USB connectivity', CAST(999000 AS Decimal(18, 0)), N'12 Months', N'Logitech', N'Wired', 0, N'https://drive.google.com/file/d/1JAJyfY9_f4203MfV5QqpIcImzt7pFAKd/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (519, 11, N'GAMING MOUSE LOGITECH G102 GEN2 WHITE (USB-RGB-WHITE)', N'Gaming mouse with RGB lighting and USB connectivity, white color', CAST(399000 AS Decimal(18, 0)), N'12 Months', N'Logitech', N'Wired', 0, N'https://drive.google.com/file/d/1xQzBAIwftHR4aSri3PXWQZB1ubLfL5xj/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (520, 11, N'WIRELESS MOUSE LOGITECH M325/M325S WIRELESS (USB/ÐEN/SILVER)', N'Wireless mouse with USB connectivity, black and silver', CAST(399000 AS Decimal(18, 0)), N'12 Months', N'Logitech', N'Wireless', 0, N'https://drive.google.com/file/d/16umV0-jG4UOI83uJaZ2Brxl-EhA7Bvt8/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (521, 11, N'GAMING MOUSE LOGITECH G502 HERO (USB/RGB/ÐEN)', N'High-end gaming mouse with RGB lighting and USB connectivity', CAST(949000 AS Decimal(18, 0)), N'12 Months', N'Logitech', N'Wired', 0, N'https://drive.google.com/file/d/1ZZJgoGo9Ks1DF4O1NTZy49_sijJauC1B/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (522, 11, N'WIRELESS MOUSE LOGITECH M185 WIRELESS (USB/XÁM ÐEN)', N'Compact wireless mouse with USB connectivity, gray and black', CAST(229000 AS Decimal(18, 0)), N'12 Months', N'Logitech', N'Wireless', 0, N'https://drive.google.com/file/d/1JzrNw-_bPc-7decjxbvPYnCvRuCO6eEx/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (523, 11, N'MOUSE FUHLEN X102S (USB/ÐEN)', N'Affordable wired USB mouse in black', CAST(229000 AS Decimal(18, 0)), N'12 Months', N'Fuhlen', N'Wired', 0, N'https://drive.google.com/file/d/1W5yeqCuaa3gAiQIaXo-yClzbJ0Xz9tMi/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (524, 11, N'GAMING MOUSE LOGITECH G903 HERO LIGHTSPEED (USB/RGB/ÐEN) (910-005674)', N'High-end wireless gaming mouse with RGB lighting', CAST(2499000 AS Decimal(18, 0)), N'24 Months', N'Logitech', N'Wireless', 0, N'https://drive.google.com/file/d/1gS-gwGAbH7MOw-xLrRrpdDcGbQUc5fR9/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (525, 11, N'GAMING MOUSE RAZER DEATHADDER V2 RGB GAMING MOUSE BLACK (RZ01-03210100-R3M1)', N'High-performance gaming mouse with RGB lighting', CAST(899000 AS Decimal(18, 0)), N'12 Months', N'Razer', N'Wired', 0, N'https://drive.google.com/file/d/1ChOk7ycrYdSAbIwLGeMEQ7eMcK2ej63J/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (526, 11, N'WIRELESS MOUSE LOGITECH M331 (USB/MÀU ÐEN-XÁM)', N'Wireless mouse with USB connectivity, black-gray', CAST(329000 AS Decimal(18, 0)), N'12 Months', N'Logitech', N'Wireless', 0, N'https://drive.google.com/file/d/1VyvgTPqFIYoMWwCYHfNwySkLvMTj6dv8/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (527, 11, N'GAMING MOUSE DAREU LM115G WIRELESS BLACK', N'Affordable wireless gaming mouse in black', CAST(139000 AS Decimal(18, 0)), N'12 Months', N'Dareu', N'Wireless', 0, N'https://drive.google.com/file/d/1iIG17d-6xdSUz0Gs90GLtLswOK3MnGmN/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (528, 11, N'GAMING MOUSE FUHLEN G90 EVO (USB/LED/ÐEN)', N'Gaming mouse with LED lighting and USB connectivity', CAST(699000 AS Decimal(18, 0)), N'12 Months', N'Fuhlen', N'Wired', 0, N'https://drive.google.com/file/d/1WUwe2ViXbxgQdRU0vDEpsJGs4fnni6M8/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (529, 11, N'GAMING MOUSE CORSAIR HARPOON RGB PRO (CH-9301111AP)', N'Gaming mouse with RGB lighting and USB connectivity', CAST(449000 AS Decimal(18, 0)), N'12 Months', N'Corsair', N'Wired', 0, N'https://drive.google.com/file/d/1QnURZ8fvG6QVrKbmhyhLgUJEsFlDa2i7/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (530, 11, N'WIRELESS MOUSE LOGITECH B175 OPTICAL WIRELESS (USB/ÐEN)', N'Affordable wireless optical mouse with USB connectivity', CAST(169000 AS Decimal(18, 0)), N'12 Months', N'Logitech', N'Wireless', 0, N'https://drive.google.com/file/d/1GzjFf9sHtHDa4N_pJziRRWJmL9SQMS3C/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (531, 11, N'WIRELESS MOUSE FUHLEN A06G (USB/ÐEN/Ð?)', N'Wireless mouse with USB connectivity, black-red', CAST(149000 AS Decimal(18, 0)), N'12 Months', N'Fuhlen', N'Wireless', 0, N'https://drive.google.com/file/d/1FVNEaSJ8lnOj-4KKPC52dwifSt0JNAu2/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (532, 11, N'WIRELESS MOUSE CORSAIR HARPOON RGB WIRELESS (CH-9311011-AP)', N'Wireless gaming mouse with RGB lighting', CAST(1229000 AS Decimal(18, 0)), N'12 Months', N'Corsair', N'Wireless', 0, N'https://drive.google.com/file/d/1zLXbcVgrQKu0MLuXBgGqyzCLD1Cj-hCD/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (533, 11, N'GAMING MOUSE LOGITECH G PRO HERO (USB/ÐEN)', N'High-precision gaming mouse with USB connectivity', CAST(899000 AS Decimal(18, 0)), N'12 Months', N'Logitech', N'Wired', 0, N'https://drive.google.com/file/d/1LskZBhoysAJkpq7DqMCulFX_90nJQMgM/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (534, 11, N'GAMING MOUSE LOGITECH G604 HERO LIGHTSPEED (USB/ÐEN)', N'Wireless gaming mouse with high precision', CAST(1599000 AS Decimal(18, 0)), N'24 Months', N'Logitech', N'Wireless', 0, N'https://drive.google.com/file/d/1n3M-y1IYp2IjZZ8Tz2-tjyJ3hPUL-2N1/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (535, 11, N'WIRELESS MOUSE FUHLEN A09B (USB/ÐEN)', N'Affordable wireless mouse with USB connectivity', CAST(149000 AS Decimal(18, 0)), N'12 Months', N'Fuhlen', N'Wireless', 0, N'https://drive.google.com/file/d/12a4xEJD14fdx_BTLyG1KIPjkWQFsvZUK/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (536, 11, N'WIRELESS MOUSE LOGITECH G502 HERO LIGHTSPEED (USB/RGB/ÐEN)', N'High-end wireless gaming mouse with RGB lighting', CAST(2399000 AS Decimal(18, 0)), N'24 Months', N'Logitech', N'Wireless', 0, N'https://drive.google.com/file/d/1W9C4frxJgKEQ7E7bkupev5xm1cL-ochn/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (537, 11, N'MOUSE CORSAIR KATAR PRO (PAW3327) (CH-930C011-AP)', N'Affordable gaming mouse with PAW3327 sensor', CAST(369000 AS Decimal(18, 0)), N'12 Months', N'Corsair', N'Wired', 0, N'https://drive.google.com/file/d/1SZJVSjDrCsSKq3HGK3FXYyqQ9BnV1M3F/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (538, 12, N'Dell P2422H', N'24 inch, FHD, IPS, 60Hz, 5ms, HDMI, VGA, DP', CAST(3999000 AS Decimal(18, 0)), N'36 Months', N'Dell', N'Home', 0, N'https://drive.google.com/file/d/1g0M4ex5KXw8WppWvKvF3B2MrKjryayUi/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (539, 12, N'HP 24f', N'23.8 inch, FHD, IPS, 60Hz, 5ms, HDMI, VGA', CAST(3499000 AS Decimal(18, 0)), N'36 Months', N'HP', N'Home', 0, N'https://drive.google.com/file/d/1bpVViKLRrohcSNhMthGh0fyMapWgoJ0u/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (540, 12, N'Samsung LF24T350', N'24 inch, FHD, IPS, 75Hz, 5ms', CAST(2999000 AS Decimal(18, 0)), N'36 Months', N'Samsung', N'Home', 0, N'https://drive.google.com/file/d/18OudVyScQ0Kaap5rfAWb9IABIrhVQimG/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (541, 12, N'LG 24MK600M', N'24 inch, FHD, IPS, 75Hz, 5ms, HDMI, VGA', CAST(3299000 AS Decimal(18, 0)), N'36 Months', N'LG', N'Home', 0, N'https://drive.google.com/file/d/1jzsCb31wjQaO2fhpIuVXqXB6TwN44YVC/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (542, 12, N'Asus VG248QG', N'24 inch, FHD, TN, 165Hz, 0.5ms, HDMI, DP, DVI', CAST(5299000 AS Decimal(18, 0)), N'36 Months', N'Asus', N'Gaming', 0, N'https://drive.google.com/file/d/1Fg1nJULwEz2_Gvhsu64Air0eENmVRzjm/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (543, 12, N'Acer Nitro VG271UP', N'27 inch, QHD, IPS, 144Hz, 1ms, HDMI, DP', CAST(7499000 AS Decimal(18, 0)), N'36 Months', N'Acer', N'Gaming', 0, N'https://drive.google.com/file/d/1UC76szZre9WXmwl2DP28SgaceU911ilP/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (544, 12, N'BenQ GW2480', N'24 inch, FHD, IPS, 60Hz, 5ms, HDMI, VGA, DP', CAST(2999000 AS Decimal(18, 0)), N'36 Months', N'BenQ', N'Home', 0, N'https://drive.google.com/file/d/1W1OzGszf8yqpQU34isZcAHGggeJ7I3am/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (545, 12, N'Viewsonic VX2480', N'24 inch, FHD, IPS, 60Hz, 5ms, HDMI, VGA', CAST(3199000 AS Decimal(18, 0)), N'36 Months', N'Viewsonic', N'Home', 0, N'https://drive.google.com/file/d/1gxs8RgF5kkvKjjyXZC9xmi_EaZKHcSpq/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (546, 12, N'AOC 24G2', N'24 inch, FHD, IPS, 144Hz, 1ms, HDMI, DP', CAST(4199000 AS Decimal(18, 0)), N'36 Months', N'AOC', N'Gaming', 0, N'https://drive.google.com/file/d/1qNqBWNceusKSKdHzMaC_olo2zFciKYaz/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (547, 12, N'Dell SE2419HR', N'24 inch, FHD, IPS, 75Hz, 5ms, HDMI, VGA', CAST(3799000 AS Decimal(18, 0)), N'36 Months', N'Dell', N'Home', 0, N'https://drive.google.com/file/d/1GQNDLqzWxvSDh5T9osgll11gBnYEQeh-/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (548, 12, N'HP X27q', N'27 inch, QHD, IPS, 165Hz, 1ms, HDMI, DP', CAST(6999000 AS Decimal(18, 0)), N'36 Months', N'HP', N'Gaming', 0, N'https://drive.google.com/file/d/1Uc-mycY2-mtbwVO6Orm0awZSf_xAbO78/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (549, 12, N'Samsung LC27JG54QQWXXV', N'27 inch, QHD, VA, 144Hz, 4ms, HDMI, DP', CAST(5899000 AS Decimal(18, 0)), N'36 Months', N'Samsung', N'Gaming', 0, N'https://drive.google.com/file/d/1BCRtV5om5NAzcOBZzrmusKcEyLPvYW51/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (550, 12, N'LG 27UK850-W', N'27 inch, UHD, IPS, 60Hz, 5ms, HDMI, DP, USB-C', CAST(9999000 AS Decimal(18, 0)), N'36 Months', N'LG', N'Professional', 0, N'https://drive.google.com/file/d/1AgDf_LMRLLssxosdzPxe25XIKJavhS5z/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (551, 12, N'Asus ROG Swift PG278QR', N'27 inch, QHD, TN, 165Hz, 1ms, HDMI, DP', CAST(12499000 AS Decimal(18, 0)), N'36 Months', N'Asus', N'Gaming', 0, N'https://drive.google.com/file/d/1bSBvqOmB6EwzJJEF-_xDDhKrOw6pJYdL/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (552, 12, N'Acer Predator X34', N'34 inch, UWQHD, IPS, 100Hz, 4ms, HDMI, DP', CAST(14999000 AS Decimal(18, 0)), N'36 Months', N'Acer', N'Gaming', 0, N'https://drive.google.com/file/d/1fCpOtaLjyXVIcPsD1Papr-zNRTrhohR-/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (553, 12, N'Viewsonic VX3211-4K-MHD', N'32 inch, UHD, VA, 60Hz, 4ms, HDMI, DP', CAST(8499000 AS Decimal(18, 0)), N'36 Months', N'Viewsonic', N'Professional', 0, N'https://drive.google.com/file/d/1dWqzjhskqx4YTx4HB9LhOB6_fDCHd1Kx/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (554, 12, N'Dell U2720Q', N'27 inch, UHD, IPS, 60Hz, 5ms, HDMI, DP, USB-C', CAST(13999000 AS Decimal(18, 0)), N'36 Months', N'Dell', N'Professional', 0, N'https://drive.google.com/file/d/1aZ8ngtbaV65k5Oxq12IeMOl6XZpjJwrH/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (555, 12, N'Samsung C32F391FW', N'32 inch, FHD, VA, 60Hz, 4ms, HDMI', CAST(6299000 AS Decimal(18, 0)), N'36 Months', N'Samsung', N'Home', 0, N'https://drive.google.com/file/d/1d2hpbs3jSfMsGpnrpXwNIg5v2VNdGOPv/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (556, 12, N'AOC U2790VQ', N'27 inch, UHD, IPS, 60Hz, 5ms, HDMI, DP', CAST(6999000 AS Decimal(18, 0)), N'36 Months', N'AOC', N'Professional', 0, N'https://drive.google.com/file/d/1F5PnUp8dELTSUNdrQ_UkOnlohVEZRCIP/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (557, 12, N'LG 34WN80C-B', N'34 inch, UWQHD, IPS, 60Hz, 5ms, HDMI, DP, USB-C', CAST(13499000 AS Decimal(18, 0)), N'36 Months', N'LG', N'Professional', 0, N'https://drive.google.com/file/d/1VbFwAfW5muioKPyp7idg86I7wHws7aGq/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (558, 12, N'HP 27q', N'27 inch, QHD, IPS, 60Hz, 5ms, HDMI, DP', CAST(5999000 AS Decimal(18, 0)), N'36 Months', N'HP', N'Home', 0, N'https://drive.google.com/file/d/1aGIVbhLGWp1r1DRcMkacaJHsG_v3PxOl/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (559, 12, N'BenQ EX2780Q', N'27 inch, QHD, IPS, 144Hz, 5ms, HDMI, DP, USB-C', CAST(9499000 AS Decimal(18, 0)), N'36 Months', N'BenQ', N'Gaming', 0, N'https://drive.google.com/file/d/1CdgzMfXVPvlIoF2aXNk6KDN7oBlbBEuR/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (560, 12, N'Asus PA278QV', N'27 inch, QHD, IPS, 75Hz, 5ms, HDMI, DP', CAST(7999000 AS Decimal(18, 0)), N'36 Months', N'Asus', N'Professional', 0, N'https://drive.google.com/file/d/1782shny1AE4paNHQVons5hcEIwYQ2MtL/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (561, 12, N'Acer CB272U', N'27 inch, QHD, IPS, 75Hz, 4ms, HDMI, DP', CAST(6499000 AS Decimal(18, 0)), N'36 Months', N'Acer', N'Professional', 0, N'https://drive.google.com/file/d/1QEYJ2hbyW8xOOb31HCSrOe3oTBzC_0i4/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (562, 12, N'Dell SE2719HR', N'27 inch, FHD, IPS, 75Hz, 5ms, HDMI, VGA', CAST(4499000 AS Decimal(18, 0)), N'36 Months', N'Dell', N'Home', 0, N'https://drive.google.com/file/d/1KH49r-K7d1JSY-YrQP77uKAgwyJkglHm/view?usp=drive_link')
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (563, 12, N'Samsung LU28R550UQEXXV', N'28 inch, UHD, IPS, 60Hz, 4ms, HDMI, DP', CAST(7199000 AS Decimal(18, 0)), N'36 Months', N'Samsung', N'Professional', 0, N'https://drive.google.com/file/d/1sHjhR3wb87XhR-AWHINThKBXKPFeh4WN/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (564, 12, N'LG 27GN950-B', N'27 inch, UHD, IPS, 144Hz, 1ms, HDMI, DP', CAST(19499000 AS Decimal(18, 0)), N'36 Months', N'LG', N'Gaming', 0, N'https://drive.google.com/file/d/1PDU7f8qzr0W3dENm9hGU4KFQILeZE7_c/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (565, 12, N'HP 24mh', N'23.8 inch, FHD, IPS, 75Hz, 5ms, HDMI, DP, VGA', CAST(3799000 AS Decimal(18, 0)), N'36 Months', N'HP', N'Home', 0, N'https://drive.google.com/file/d/1iJF-i7uz8hmQrbBc0Synexxl0IwR-Eqg/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (566, 12, N'Viewsonic VX2481-MH', N'24 inch, FHD, IPS, 75Hz, 4ms, HDMI, VGA', CAST(3299000 AS Decimal(18, 0)), N'36 Months', N'Viewsonic', N'Home', 0, N'https://drive.google.com/file/d/1vY3BFx09Z0-5B_8u04COaiqkm6AJsh4N/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (567, 12, N'Dell U2723QE', N'27 inch, UHD, IPS, 60Hz, 5ms, HDMI, DP, USB-C', CAST(14199000 AS Decimal(18, 0)), N'36 Months', N'Dell', N'Professional', 0, N'https://drive.google.com/file/d/1UgfxYturhvEbB8IOBXQtNSvZ7N4UDX9F/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (568, 12, N'Samsung LF24T352FHEXXV', N'24 inch, FHD, IPS, 75Hz, 5ms, HDMI, VGA', CAST(2499000 AS Decimal(18, 0)), N'36 Months', N'Samsung', N'Home', 0, N'https://drive.google.com/file/d/1ccqhFvqQ7o9xMh5uoXOtbc3ujOFHrnTL/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (569, 12, N'Acer PM161Q', N'15.6 inch, FHD, IPS, 60Hz, 6ms, HDMI, USB-C', CAST(3199000 AS Decimal(18, 0)), N'36 Months', N'Acer', N'Home', 0, N'https://drive.google.com/file/d/1HxAyf1ajfIOfkC54W-I0cDWEU3sVVhPL/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (570, 12, N'Viewsonic VG1655', N'15.6 inch, FHD, IPS, 60Hz, 6ms, HDMI, USB-C', CAST(5199000 AS Decimal(18, 0)), N'36 Months', N'Viewsonic', N'Home', 0, N'https://drive.google.com/file/d/1wimHAKkh2mzhky-7HsmLwy7hvw9Hgyo9/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (571, 12, N'Lenovo ThinkVision M14', N'14 inch, FHD, IPS, 60Hz, 6ms, USB-C', CAST(5799000 AS Decimal(18, 0)), N'36 Months', N'Lenovo', N'Home', 0, N'https://drive.google.com/file/d/1-OsFpp-bx4_9lvCs6R-LJXQgOSg9R0aw/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (572, 12, N'LG 32UL950-W', N'31.5 inch, UHD, IPS, 60Hz, 5ms, HDMI, DP, USB-C', CAST(19999000 AS Decimal(18, 0)), N'36 Months', N'LG', N'Professional', 0, N'https://drive.google.com/file/d/1GogA-ONZSMu2e5JkheJ1vsfXriU8riXG/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (573, 12, N'Acer R241Ybmid', N'23.8 inch, FHD, IPS, 60Hz, 4ms, HDMI, VGA, DP', CAST(2499000 AS Decimal(18, 0)), N'36 Months', N'Acer', N'Home', 0, N'https://drive.google.com/file/d/1Z9a2alhUwX-PCmzVaZjyOM3hex7iBBCt/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (574, 12, N'Asus VG279Q1R', N'27 inch, FHD, IPS, 144Hz, 1ms, HDMI, DP', CAST(5299000 AS Decimal(18, 0)), N'36 Months', N'Asus', N'Gaming', 0, N'https://drive.google.com/file/d/1HmvXJwGSnZSIwMXzOO5qn8Jyv8EIgcw-/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (575, 12, N'LG 27GL650F-B', N'27 inch, FHD, IPS, 144Hz, 1ms, HDMI, DP', CAST(7299000 AS Decimal(18, 0)), N'36 Months', N'LG', N'Gaming', 0, N'https://drive.google.com/open?id=1-S9sHsWAhWwWynvwREjYrwfSTId2ZBmb&usp=drive_copy')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (576, 12, N'Asus VA24DQLB', N'23.8 inch, FHD, IPS, 75Hz, 5ms, HDMI, DP, VGA', CAST(3099000 AS Decimal(18, 0)), N'36 Months', N'Asus', N'Home', 0, N'https://drive.google.com/file/d/1J7twnzHZPmFxVh7jlSIjxG7Lg9DetrJf/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (577, 12, N'LG 24MK430H-B', N'23.8 inch, FHD, IPS, 75Hz, 5ms, HDMI, VGA', CAST(2999000 AS Decimal(18, 0)), N'36 Months', N'LG', N'Home', 0, N'https://drive.google.com/file/d/1R-Ax-Nigo2yM3gzycnDBfWk9UVL60grW/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (578, 1, N'CPU INTEL CORE I9-14900', N'24 cores 32 threads, Up to 5.8GHz', CAST(15999000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65, N'https://drive.google.com/file/d/1ciQriUzIt7AkEWEup5T2Ko8Ja6BMY7A5/view?usp=drive_link')
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP], [ImageLink]) VALUES (579, 3, N'TEAMGROUP DELTA RGB (TF3D416G3200HC16F01)', N'16GB (1x16GB) DDR4 3200MHz', CAST(1199000 AS Decimal(18, 0)), N'24 Months', N'TEAMGROUP', N'DDR4', 5, N'https://drive.google.com/file/d/1sIgPV03mYapOByB54p2RDIPPEwylxyh_/view?usp=drive_link')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (N'959a32e2-2780-40f3-a07b-123275f87a6d', N'bc81979e-170c-4434-adca-bb071b1262bd', 2, N'Trung Hoan')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (N'fb9181b2-225f-404c-b93b-1f34f830d401', N'570be968-a574-4ba6-87a0-e69ac3e91c56', 2, N'Aladin Rose')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (N'2825874e-21e4-47c0-a0bc-5425b2eb0b04', N'34ba998a-a6b0-4374-8549-47ed5fdd70ac', 1, N'Hồ Nguyên')
GO
SET IDENTITY_INSERT [dbo].[Store] ON 

INSERT [dbo].[Store] ([StoreID], [StoreName], [Address]) VALUES (1, N'Hà Đông Center', N'197 Trần Phú,Hà Đông,TP Hà Nội')
INSERT [dbo].[Store] ([StoreID], [StoreName], [Address]) VALUES (2, N'Tây Hồ Aqua', N'2 Trần Hưng Đạo,Tây Hồ,TP Hà Nội')
SET IDENTITY_INSERT [dbo].[Store] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__536C85E464BFAA45]    Script Date: 6/20/2024 1:51:39 AM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UQ__Account__536C85E464BFAA45] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__A9D10534B0F23F3E]    Script Date: 6/20/2024 1:51:39 AM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UQ__Account__A9D10534B0F23F3E] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Category__8517B2E09FD8F8A7]    Script Date: 6/20/2024 1:51:39 AM ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [UQ__Category__8517B2E09FD8F8A7] UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__5C7E359EC8E057B8]    Script Date: 6/20/2024 1:51:39 AM ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UQ__Customer__5C7E359EC8E057B8] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK__Bill__OrderID__59063A47] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK__Bill__OrderID__59063A47]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK__Cart__CustomerID__00200768] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK__Cart__CustomerID__00200768]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK__Cart__ProductID__5AEE82B9] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK__Cart__ProductID__5AEE82B9]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__Custome__0A9D95DB] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__Custome__0A9D95DB]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__Product__0B91BA14] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__Product__0B91BA14]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__ReplySt__02084FDA] FOREIGN KEY([ReplyStaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__ReplySt__02084FDA]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Account]
GO
ALTER TABLE [dbo].[FilterString]  WITH CHECK ADD  CONSTRAINT [FK_FilterString_FilterTypeCategory] FOREIGN KEY([FilterTypeCategoryID])
REFERENCES [dbo].[FilterTypeCategory] ([FilterTypeCategoryID])
GO
ALTER TABLE [dbo].[FilterString] CHECK CONSTRAINT [FK_FilterString_FilterTypeCategory]
GO
ALTER TABLE [dbo].[FilterTypeCategory]  WITH CHECK ADD  CONSTRAINT [FK_FilterTypeCategory_Category] FOREIGN KEY([FilterTypeID])
REFERENCES [dbo].[FilterType] ([FilterTypeID])
GO
ALTER TABLE [dbo].[FilterTypeCategory] CHECK CONSTRAINT [FK_FilterTypeCategory_Category]
GO
ALTER TABLE [dbo].[FilterTypeCategory]  WITH CHECK ADD  CONSTRAINT [FK_FilterTypeCategory_Category1] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[FilterTypeCategory] CHECK CONSTRAINT [FK_FilterTypeCategory_Category1]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Groups_PCBuild] FOREIGN KEY([PCBuildID])
REFERENCES [dbo].[PCBuild] ([PCBuildID])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Groups_PCBuild]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__CustomerI__05D8E0BE] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__CustomerI__05D8E0BE]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK__OrderItem__Order__60A75C0F] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK__OrderItem__Order__60A75C0F]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK__OrderItem__Warra__619B8048] FOREIGN KEY([WarrantyID])
REFERENCES [dbo].[ProductWarranty] ([WarrantyID])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK__OrderItem__Warra__619B8048]
GO
ALTER TABLE [dbo].[PCBuild]  WITH CHECK ADD  CONSTRAINT [FK__PCBuild__Custome__09A971A2] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[PCBuild] CHECK CONSTRAINT [FK__PCBuild__Custome__09A971A2]
GO
ALTER TABLE [dbo].[PCBuildParts]  WITH CHECK ADD  CONSTRAINT [FK__PCBuildPa__PartI__6383C8BA] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[PCBuildParts] CHECK CONSTRAINT [FK__PCBuildPa__PartI__6383C8BA]
GO
ALTER TABLE [dbo].[PCBuildParts]  WITH CHECK ADD  CONSTRAINT [FK__PCBuildPa__PCBui__6477ECF3] FOREIGN KEY([PCBuildID])
REFERENCES [dbo].[PCBuild] ([PCBuildID])
GO
ALTER TABLE [dbo].[PCBuildParts] CHECK CONSTRAINT [FK__PCBuildPa__PCBui__6477ECF3]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__Categor__656C112C] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__Categor__656C112C]
GO
ALTER TABLE [dbo].[ProductStore]  WITH CHECK ADD  CONSTRAINT [FK__ProductSt__Produ__66603565] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductStore] CHECK CONSTRAINT [FK__ProductSt__Produ__66603565]
GO
ALTER TABLE [dbo].[ProductStore]  WITH CHECK ADD  CONSTRAINT [FK__ProductSt__Store__08B54D69] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
ALTER TABLE [dbo].[ProductStore] CHECK CONSTRAINT [FK__ProductSt__Store__08B54D69]
GO
ALTER TABLE [dbo].[ProductWarranty]  WITH CHECK ADD  CONSTRAINT [FK__ProductWa__Produ__68487DD7] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductWarranty] CHECK CONSTRAINT [FK__ProductWa__Produ__68487DD7]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK__Staff__StoreID__7D439ABD] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store] ([StoreID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK__Staff__StoreID__7D439ABD]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Account]
GO
USE [master]
GO
ALTER DATABASE [SMARTPCDB] SET  READ_WRITE 
GO
