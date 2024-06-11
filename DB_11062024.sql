USE [master]
GO
/****** Object:  Database [SMARTPC]    Script Date: 6/11/2024 9:00:49 PM ******/
CREATE DATABASE [SMARTPC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SMARTPC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SMARTPC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SMARTPC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SMARTPC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SMARTPC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SMARTPC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SMARTPC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SMARTPC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SMARTPC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SMARTPC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SMARTPC] SET ARITHABORT OFF 
GO
ALTER DATABASE [SMARTPC] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SMARTPC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SMARTPC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SMARTPC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SMARTPC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SMARTPC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SMARTPC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SMARTPC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SMARTPC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SMARTPC] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SMARTPC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SMARTPC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SMARTPC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SMARTPC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SMARTPC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SMARTPC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SMARTPC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SMARTPC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SMARTPC] SET  MULTI_USER 
GO
ALTER DATABASE [SMARTPC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SMARTPC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SMARTPC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SMARTPC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SMARTPC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SMARTPC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SMARTPC] SET QUERY_STORE = ON
GO
ALTER DATABASE [SMARTPC] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SMARTPC]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/11/2024 9:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[AccountType] [varchar](255) NOT NULL,
 CONSTRAINT [PK__Account__349DA5864118A1D6] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 6/11/2024 9:00:50 PM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 6/11/2024 9:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CustomerID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/11/2024 9:00:50 PM ******/
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
/****** Object:  Table [dbo].[Comment]    Script Date: 6/11/2024 9:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[CommentText] [nvarchar](max) NOT NULL,
	[CommentDate] [date] NOT NULL,
	[ReplyText] [nvarchar](max) NULL,
	[ReplyStaffID] [int] NULL,
 CONSTRAINT [PK__Comment__C3B4DFAAC51E26D2] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/11/2024 9:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Customer__A4AE64B8EB495964] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilterString]    Script Date: 6/11/2024 9:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilterString](
	[FilterStringID] [int] IDENTITY(1,1) NOT NULL,
	[FilterTypeCategoryID] [int] NULL,
	[FilterString] [varchar](50) NULL,
 CONSTRAINT [PK_FilterString] PRIMARY KEY CLUSTERED 
(
	[FilterStringID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilterType]    Script Date: 6/11/2024 9:00:50 PM ******/
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
/****** Object:  Table [dbo].[FilterTypeCategory]    Script Date: 6/11/2024 9:00:50 PM ******/
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
/****** Object:  Table [dbo].[Groups]    Script Date: 6/11/2024 9:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[PCBuildID] [int] IDENTITY(1,1) NOT NULL,
	[PCType] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/11/2024 9:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
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
/****** Object:  Table [dbo].[OrderItem]    Script Date: 6/11/2024 9:00:50 PM ******/
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
/****** Object:  Table [dbo].[PCBuild]    Script Date: 6/11/2024 9:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCBuild](
	[PCBuildID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[BuildDate] [date] NOT NULL,
 CONSTRAINT [PK__PCBuild__FB9BAC5128C69B39] PRIMARY KEY CLUSTERED 
(
	[PCBuildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCBuildParts]    Script Date: 6/11/2024 9:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCBuildParts](
	[PCBuildID] [int] NULL,
	[PartID] [int] NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/11/2024 9:00:50 PM ******/
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
 CONSTRAINT [PK__Product__B40CC6EDD02E4839] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStore]    Script Date: 6/11/2024 9:00:50 PM ******/
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
/****** Object:  Table [dbo].[ProductWarranty]    Script Date: 6/11/2024 9:00:50 PM ******/
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
/****** Object:  Table [dbo].[Staff]    Script Date: 6/11/2024 9:00:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[StoreID] [int] NULL,
	[FullName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Staff__96D4AAF7A071A3AE] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 6/11/2024 9:00:50 PM ******/
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
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (8, N'Case')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (9, N'Cooling System')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'CPU')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (10, N'Gears')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'HDD')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Mainboard')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (7, N'PSU')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'RAM')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'SSD')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'VGA')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (1, 1, N'CPU INTEL CORE I5-12400F', N'6 cores 12 threads, Up to 4.4GHz', CAST(2999000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (3, 1, N'CPU INTEL CORE I5-12400', N'6 cores 12 threads, Up to 4.4GHz', CAST(3799000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (4, 1, N'CPU INTEL CORE I5-13400', N'10 cores 16 threads, Up to 4.6GHz', CAST(5859000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (5, 1, N'CPU INTEL CORE I3-12100', N'4 cores 8 threads, 3.3GHz turbo up to 4.3GHz', CAST(2939000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 58)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (6, 1, N'CPU INTEL CORE I7-13700', N'16 cores 24 threads, Up to 5.2GHz', CAST(10499000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (7, 1, N'CPU INTEL CORE I5-13500', N'14 cores 20 threads, Up to 4.8GHz', CAST(6499000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (8, 1, N'CPU INTEL CORE I5-14600K', N'14 cores 20 threads, Up to 5.3GHz', CAST(8499000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (9, 1, N'CPU INTEL CORE I7-14700K', N'20 cores 28 threads, Up to 5.6GHz', CAST(11399000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (10, 1, N'CPU INTEL CORE I9-14900K', N'24 cores 32 threads, Up to 5.8GHz', CAST(15899000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (11, 1, N'CPU INTEL CORE I7-14700KF', N'20 cores 28 threads, Up to 5.6GHz', CAST(10799000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (12, 1, N'CPU INTEL CORE I7-13700K', N'16 cores 24 threads, Up to 5.4GHz', CAST(11199000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (13, 1, N'CPU INTEL CORE I3-10105', N'4 cores 8 threads, 3.7GHz turbo up to 4.4GHz', CAST(2699000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1200', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (14, 1, N'CPU INTEL CORE I9-12900K', N'16 cores 24 threads, 3.2GHz turbo up to 5.2GHz', CAST(10599000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (15, 1, N'CPU INTEL CORE I5-12600K', N'10 cores 16 threads, 3.7GHz turbo up to 4.9GHz', CAST(5149000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (16, 1, N'CPU INTEL CORE I5-12600KF', N'10 cores 16 threads, 3.7GHz turbo up to 4.9GHz', CAST(4499000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (17, 1, N'CPU INTEL CORE I5-13600K', N'14 cores 20 threads, 3.5GHz turbo up to 5.1GHz', CAST(8599000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (18, 1, N'CPU INTEL CORE I9-14900', N'24 cores 32 threads, Up to 5.8GHz', CAST(15999000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (19, 1, N'CPU INTEL CORE I3-13100F', N'4 cores 8 threads, Up to 4.5GHz', CAST(3099000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (20, 1, N'CPU INTEL CORE I7-12700F', N'12 cores 20 threads, Up to 4.8GHz', CAST(7099000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (21, 1, N'CPU INTEL CORE I7-12700', N'12 cores 20 threads, 3.6GHz turbo up to 4.9GHz', CAST(7799000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (22, 1, N'CPU INTEL CORE I9-13900', N'24 cores 32 threads, Up to 5.6GHz', CAST(15599000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (23, 1, N'CPU INTEL PENTIUM GOLD G7400', N'2 cores 4 threads, 3.7GHz', CAST(2359000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 46)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (24, 1, N'CPU INTEL CORE I7-12700K', N'12 cores 20 threads, 3.8GHz turbo up to 5.0GHz', CAST(7799000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (25, 1, N'CPU INTEL CORE I3-13100', N'4 cores 8 threads, Up to 4.5GHz', CAST(3899000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (26, 1, N'CPU INTEL CORE I5-13400F', N'10 cores 16 threads, Up to 4.6GHz', CAST(4899000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (27, 1, N'CPU INTEL CORE I3-14100', N'4 cores 8 threads, Up to 4.7GHz', CAST(3899000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 60)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (28, 1, N'CPU INTEL CORE I3-14100F', N'4 cores 8 threads, Up to 4.7GHz', CAST(3699000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 60)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (29, 1, N'CPU INTEL CORE I7-14700F', N'20 cores 28 threads, Up to 5.4GHz', CAST(10399000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (30, 1, N'CPU INTEL CORE I7-14700', N'20 cores 28 threads, Up to 5.4GHz', CAST(11499000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (31, 1, N'CPU INTEL CORE I5-14500', N'14 cores 20 threads, Up to 5.0GHz', CAST(6599000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (32, 1, N'CPU INTEL CORE I5-14400', N'10 cores 16 threads, Up to 4.7GHz', CAST(6299000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (33, 1, N'CPU INTEL CORE I7-13700K', N'16 cores 24 threads, Up to 5.4GHz', CAST(11199000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (34, 1, N'CPU INTEL CORE I5-13600K', N'14 cores 20 threads, Up to 5.1GHz', CAST(7699000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (35, 1, N'CPU INTEL CORE I5-13400F', N'10 cores 16 threads, Up to 4.6GHz', CAST(5199000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (36, 1, N'CPU INTEL CORE I3-10105F', N'4 cores 8 threads, Up to 4.4GHz', CAST(1699000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1200', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (37, 1, N'CPU INTEL CORE I7-12700K', N'12 cores 20 threads, Up to 5.0GHz', CAST(7799000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (38, 1, N'CPU INTEL CORE I5-10400', N'6 cores 12 threads, Up to 4.3GHz', CAST(3449000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1200', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (39, 1, N'CPU INTEL CORE I5-10400F', N'6 cores 12 threads, Up to 4.3GHz', CAST(2699000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1200', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (40, 1, N'CPU INTEL CORE I9-12900KS', N'16 cores 24 threads, Up to 5.5GHz', CAST(12599000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 150)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (41, 1, N'CPU INTEL CORE I9-13900K', N'24 cores 32 threads, Up to 5.8GHz', CAST(15599000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (42, 1, N'CPU INTEL CORE I9-13900KF', N'24 cores 32 threads, Up to 5.8GHz', CAST(14999000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (43, 1, N'CPU INTEL CORE I7-13700KF', N'16 cores 24 threads, Up to 5.4GHz', CAST(10499000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (44, 1, N'CPU INTEL CORE I5-13600KF', N'14 cores 20 threads, Up to 5.1GHz', CAST(7799000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (45, 1, N'CPU INTEL CORE I3-10105F', N'4 cores 8 threads, Up to 4.4GHz', CAST(1699000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (46, 1, N'CPU INTEL CORE I7-12700', N'12 cores 20 threads, Up to 4.9GHz', CAST(7799000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (47, 1, N'CPU INTEL CORE I3-12100', N'4 cores 8 threads, Up to 4.3GHz', CAST(2499000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 58)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (48, 1, N'CPU INTEL CORE I5-13400', N'10 cores 16 threads, Up to 4.6GHz', CAST(5199000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (49, 1, N'CPU INTEL CORE I5-12400F', N'6 cores 12 threads, Up to 4.4GHz', CAST(3199000 AS Decimal(18, 0)), N'36 Months', N'Intel', N'LGA 1700', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (50, 1, N'CPU AMD Ryzen 7 7800X3D', N'8 cores, 16 threads, 4.2GHz up to 5.0GHz', CAST(10699000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM5', 120)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (51, 1, N'CPU AMD Ryzen 9 7900X3D', N'12 cores, 24 threads, 4.4Ghz up to 5.6Ghz', CAST(14299900 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM5', 120)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (52, 1, N'CPU AMD Ryzen 9 7950X3D', N'16 cores, 32 threads, 4.2Ghz up to 5.7Ghz', CAST(18699000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM5', 120)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (53, 1, N'CPU AMD Ryzen 7 7700X', N'8 cores, 16 threads, 4.5 GHz Upto 5.4GHz', CAST(9299000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM5', 105)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (54, 1, N'CPU AMD Ryzen 9 7900X', N'12 cores, 24 threads, 4.7 GHz Upto 5.6GHz', CAST(12099000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM5', 170)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (55, 1, N'CPU AMD Ryzen 5 5600GT', N'6 cores, 12 threads, 3.6GHz Upto 4.6GHz', CAST(3799000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (56, 1, N'CPU AMD Ryzen 7 5700X3D', N'8 cores, 16 threads, 3.0GHz Upto 4.1GHz', CAST(6699000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 105)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (57, 1, N'CPU AMD Ryzen 7 8700G', N'8 cores, 16 threads, 4.2GHz Upto 5.1GHz', CAST(9499000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM5', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (58, 1, N'CPU AMD Ryzen 5 8600G', N'6 cores, 12 threads, 4.3GHz Upto 5.0GHz', CAST(6599000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM5', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (59, 1, N'CPU AMD Ryzen 5 8500G', N'6 cores, 12 threads, 3.5GHz Upto 5.0GHz', CAST(5199000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM5', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (60, 1, N'CPU AMD Ryzen 5 5600G', N'6 cores, 12 threads, 3.9GHz Upto 4.4GHz', CAST(3599000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (61, 1, N'CPU AMD Ryzen 9 7950X', N'16 cores, 32 threads, 4.5 GHz Upto 5.7GHz', CAST(17199000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM5', 170)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (62, 1, N'CPU AMD Ryzen 5 4600G', N'6 cores, 12 threads, 3.7 GHz turbo upto 4.2GHz', CAST(2659000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (63, 1, N'CPU AMD Ryzen 5 5500', N'6 cores, 12 threads, 3.6 GHz Upto 4.2GHz', CAST(2449000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (64, 1, N'CPU AMD Ryzen 5 5600', N'6 cores, 12 threads, 3.5 GHz Upto 4.4GHz', CAST(3399000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (65, 1, N'CPU AMD Ryzen 7 5800X3D', N'8 cores, 16 threads, 3.4 GHz Upto 4.5GHz', CAST(8899000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 105)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (66, 1, N'CPU AMD Ryzen 9 5900X', N'12 cores, 24 threads, 3.7 GHz Upto 4.8GHz', CAST(8399000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 105)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (67, 1, N'CPU AMD Ryzen 5 5600X', N'6 cores, 12 threads, 3.7 GHz Upto 4.6GHz', CAST(3999000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (68, 1, N'CPU AMD Athlon 3000G', N'2 cores, 4 threads, 3.5GHz', CAST(1289000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 35)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (69, 1, N'CPU AMD Ryzen 3 3200G', N'4 cores, 4 threads, 3.6GHz turbo up to 4.0GHz', CAST(1999000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (70, 1, N'CPU AMD Ryzen 7 5700G', N'8 cores, 16 threads, 3.8GHz Upto 4.6GHz', CAST(5199000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (71, 1, N'CPU AMD Ryzen 5 7600X', N'6 cores, 12 threads, 4.7 GHz Upto 5.3GHz', CAST(6599000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM5', 105)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (72, 1, N'CPU AMD Ryzen 3 4300G', N'4 cores, 8 threads, 3.8 GHz turbo upto 4.0GHz', CAST(2499000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (73, 1, N'CPU AMD Ryzen 7 5700X', N'8 cores, 16 threads, 3.4 GHz Upto 4.6GHz', CAST(5099000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (74, 1, N'CPU AMD Ryzen 5 7600', N'6 cores, 12 threads, 3.8 GHz Upto 5.1GHz', CAST(5599000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM5', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (75, 1, N'CPU AMD Ryzen 5 3600', N'6 cores, 12 threads, 3.6GHz turbo up to 4.2GHz', CAST(2199000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (76, 1, N'CPU AMD Ryzen 5 3500', N'6 cores, 6 threads, 3.6GHz turbo up to 4.1GHz', CAST(3299000 AS Decimal(18, 0)), N'24 months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (77, 1, N'CPU AMD Ryzen Threadripper Pro 7985WX', N'64 cores, 128 threads, 3.2Ghz up to 5.1Ghz', CAST(214999000 AS Decimal(18, 0)), N'36 months', N'AMD', N'sTR5', 350)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (78, 1, N'CPU AMD Ryzen 7 7700', N'8 cores, 16 threads, 3.8 GHz Upto 5.3GHz', CAST(8999000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM5', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (79, 1, N'CPU AMD Ryzen 9 7900', N'12 cores, 24 threads, 3.7 GHz Upto 5.4GHz', CAST(11699000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM5', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (80, 1, N'CPU AMD Ryzen Threadripper Pro 7975WX', N'32 cores, 64 threads, 4.0Ghz up to 5.3Ghz', CAST(111199000 AS Decimal(18, 0)), N'36 months', N'AMD', N'sTR5', 350)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (81, 1, N'CPU AMD Ryzen Threadripper Pro 7965WX', N'24 cores, 48 threads, 4.2Ghz up to 5.3Ghz', CAST(76599000 AS Decimal(18, 0)), N'36 months', N'AMD', N'sTR5', 350)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (82, 1, N'CPU AMD Ryzen 5 5500GT', N'6 cores, 12 threads, 4.4 GHz Upto 3.6 GHz', CAST(3499000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM5', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (83, 1, N'CPU AMD Ryzen Threadripper 7980X', N'64 cores, 128 threads, 3.2Ghz up to 5.1Ghz', CAST(143999000 AS Decimal(18, 0)), N'36 months', N'AMD', N'sTR5', 350)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (84, 1, N'CPU AMD Ryzen Threadripper Pro 5965WX', N'24 cores, 48 threads, 3.8 GHz Upto 4.5GHz', CAST(64999000 AS Decimal(18, 0)), N'36 months', N'AMD', N'sWRX8', 280)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (85, 1, N'CPU AMD Ryzen Threadripper Pro 5995WX', N'64 cores, 128 threads, 2.7 GHz Upto 4.5GHz', CAST(180999000 AS Decimal(18, 0)), N'36 months', N'AMD', N'sWRX8', 280)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (86, 1, N'CPU AMD Ryzen 3 4100', N'4 cores, 8 threads, 3.8 GHz turbo upto 4.0GHz', CAST(1699000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (87, 1, N'CPU AMD Ryzen 5 4500', N'6 cores, 12 threads, 3.6 GHz turbo upto 4.1GHz', CAST(1949000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (88, 1, N'CPU AMD Ryzen 7 5800X', N'8 cores, 16 threads, 3.8 GHz Upto 4.7GHz', CAST(6599000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM4', 105)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (89, 1, N'CPU AMD Ryzen 9 5950X', N'16 cores, 32 threads, 3.4 GHz Upto 4.9GHz', CAST(10599000 AS Decimal(18, 0)), N'36 months', N'AMD', N'AM4', 105)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (90, 2, N'Mainboard ASUS ROG MAXIMUS Z790 HERO', N'High-end gaming motherboard with extensive features.', CAST(16499000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 60)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (91, 2, N'Mainboard MSI MEG Z790 ACE DDR5', N'Premium motherboard with top-tier features for gamers and enthusiasts.', CAST(17599000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'E-ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 60)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (92, 2, N'Mainboard ASUS ROG STRIX Z790-A GAMING WIFI DDR5', N'Gaming-focused motherboard with advanced features.', CAST(13699000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 60)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (93, 2, N'Mainboard ASUS PROART Z790-CREATOR WIFI DDR5', N'Motherboard designed for creators with enhanced connectivity.', CAST(12299000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 60)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (94, 2, N'Mainboard GIGABYTE Z790 AORUS MASTER', N'High-end motherboard with robust performance and connectivity.', CAST(15499000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'E-ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 70)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (95, 2, N'Mainboard ASUS ROG STRIX Z790-E GAMING WIFI', N'Feature-rich motherboard with WiFi and gaming optimizations.', CAST(12999000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (96, 2, N'Mainboard GIGABYTE Z790 AERO G', N'Content creation motherboard with DDR5 support.', CAST(8459000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (97, 2, N'Mainboard ASUS TUF GAMING Z790-PLUS WIFI DDR5', N'Durable gaming motherboard with WiFi and DDR5 support.', CAST(7999000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (98, 2, N'Mainboard ASUS ROG STRIX Z790-H GAMING WIFI DDR4', N'High-performance gaming motherboard with WiFi support.', CAST(6499000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1700, DDR4, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (99, 2, N'Mainboard GIGABYTE Z790 UD AX DDR5', N'Reliable motherboard with DDR5 support.', CAST(6299000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (100, 2, N'Mainboard MSI MAG Z790 TOMAHAWK WIFI', N'Durable motherboard with extensive connectivity.', CAST(5999000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 60)
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (101, 2, N'Mainboard MSI Z790-A PRO DDR5', N'Affordable motherboard with DDR5 support.', CAST(5799000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (102, 2, N'Mainboard GIGABYTE Z790 UD AX', N'Reliable motherboard with WiFi support.', CAST(5799000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (103, 2, N'Mainboard GIGABYTE Z790 GAMING X AX DDR5', N'Affordable gaming motherboard with DDR5 support.', CAST(5799000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (104, 2, N'Mainboard ASUS TUF GAMING Z790-PLUS D4', N'Gaming motherboard with DDR4 memory support.', CAST(5499000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1700, DDR4, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (105, 2, N'Mainboard GIGABYTE Z790 UD', N'Affordable motherboard with reliable performance.', CAST(4899000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, LGA 1700, DDR4, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (106, 2, N'Mainboard MSI PRO Z790-A WIFI DDR4', N'Affordable motherboard with DDR4 support.', CAST(4899000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'ATX, LGA 1700, DDR4, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (107, 2, N'Mainboard ASUS TUF GAMING Z790-PLUS', N'Gaming motherboard with robust build quality.', CAST(5499000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1700, DDR4, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (108, 2, N'Mainboard GIGABYTE Z790 UD DDR4', N'Budget-friendly motherboard with essential features.', CAST(4999000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, LGA 1700, DDR4, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (109, 2, N'Mainboard GIGABYTE Z790 GAMING X AX', N'Budget-friendly motherboard with WiFi support.', CAST(4899000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (110, 2, N'Mainboard GIGABYTE Z790 UD AX DDR5', N'Reliable motherboard with DDR5 support.', CAST(5299000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, LGA 1700, DDR5, 128GB, SATA, M.2 NVMe, PCIe 5.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (111, 2, N'Mainboard ASUS ROG MAXIMUS XII APEX', N'High-end motherboard with overclocking capabilities.', CAST(11009000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (112, 2, N'Mainboard ASUS PROART Z490-CREATOR 10G', N'Motherboard designed for content creators with enhanced connectivity.', CAST(8989000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (113, 2, N'Mainboard MSI MEG Z490 UNIFY', N'Premium motherboard with unified aesthetics and performance.', CAST(8889000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'ATX, LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (114, 2, N'Mainboard MSI MEG Z490i UNIFY', N'Compact motherboard with powerful performance.', CAST(7679000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'Mini ITX, LGA 1200, DDR4, 64GB, SATA, M.2 NVMe, PCIe 3.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (115, 2, N'Mainboard ASUS ROG STRIX Z490-G GAMING', N'Gaming motherboard with compact form factor.', CAST(7149000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'mATX,  LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (116, 2, N'Mainboard ASUS PRIME Z490-A', N'Versatile motherboard with robust features.', CAST(6799000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (117, 2, N'Mainboard ASUS PRIME Z490M-PLUS', N'Micro ATX motherboard with reliable performance.', CAST(4229000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'mATX, LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (118, 2, N'Mainboard ASUS ROG STRIX B460-H GAMING', N'Gaming motherboard with budget-friendly price.', CAST(3499000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (119, 2, N'Mainboard ASUS PRIME B460-PLUS', N'Entry-level motherboard with essential features.', CAST(2929000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (120, 2, N'Mainboard ASROCK B460 PRO4', N'Reliable motherboard with sturdy build quality.', CAST(2829000 AS Decimal(18, 0)), N'36 Months', N'ASROCK', N'ATX, LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (121, 2, N'Mainboard Gigabyte B460M D3H', N'Micro ATX motherboard with DDR4 support.', CAST(2629000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'mATX, LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 3.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (122, 2, N'Mainboard Gigabyte B560M DS3H V3', N'Budget-friendly motherboard with modern features.', CAST(2299000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'mATX,  LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 4.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (123, 2, N'Mainboard MSI B560M PRO-E', N'Affordable motherboard with PCIe 4.0 support.', CAST(1999000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'mATX,  LGA 1200, DDR4, 128GB, SATA, M.2 NVMe, PCIe 4.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (124, 2, N'Mainboard ASROCK H410M-HDV/M.2', N'Micro ATX motherboard with M.2 support.', CAST(1819000 AS Decimal(18, 0)), N'36 Months', N'ASROCK', N'mATX,  LGA 1200, DDR4, 64GB, SATA, M.2 NVMe, PCIe 3.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (125, 2, N'Mainboard Gigabyte H510M-H V2', N'Entry-level motherboard with DDR4 support.', CAST(1709000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'mATX,  LGA 1200, DDR4, 64GB, SATA, M.2 NVMe, PCIe 3.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (126, 2, N'Mainboard MSI PRO H510M-B', N'Budget-friendly motherboard with reliable performance.', CAST(1689000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'mATX, LGA 1200, DDR4, 64GB, SATA, M.2 NVMe, PCIe 3.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (127, 2, N'Mainboard ASROCK H510M-H/M.2 SE', N'Micro ATX motherboard with M.2 support.', CAST(1599000 AS Decimal(18, 0)), N'36 Months', N'ASROCK', N'mATX,  LGA 1200, DDR4, 64GB, SATA, M.2 NVMe, PCIe 3.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (128, 2, N'Mainboard ASROCK H510M-HDV/M.2 SE', N'Micro ATX motherboard with M.2 support.', CAST(1599000 AS Decimal(18, 0)), N'36 Months', N'ASROCK', N'mATX, LGA 1200, DDR4, 64GB, SATA, M.2 NVMe, PCIe 3.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (129, 3, N'GSKILL TRIDENT Z NEO RGB (F4-3600C18D-64GTZN)', N'64GB (2x32GB) DDR4 3600MHz', CAST(4599000 AS Decimal(18, 0)), N'24 Months', N'GSKILL', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (130, 3, N'Corsair Vengeance RGB RS (CMG64GX4M2D3600C18)', N'64GB (2x32GB) DDR4 3600MHz', CAST(4499000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (131, 3, N'Klevv CRAS X RGB (KD4AGU880-36A180Z)', N'32GB (2x16GB) DDR4 3600MHz', CAST(4449000 AS Decimal(18, 0)), N'24 Months', N'Klevv', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (132, 3, N'Corsair Vengeance RGB RS (CMG64GX4M2E3200C16)', N'64GB (2x32GB) DDR4 3200MHz', CAST(4399000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (133, 3, N'Klevv CRAS X RGB (KD4AGU880-32A160X)', N'32GB (2x16GB) DDR4 3200MHz', CAST(3939000 AS Decimal(18, 0)), N'24 Months', N'Klevv', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (134, 3, N'Corsair Vengeance RGB RS (CMG64GX4M2E3200C16)', N'64GB (2x32GB) DDR4 3200MHz', CAST(4399000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (135, 3, N'Corsair Dominator Platinum Black RGB (CMT32GX4M2E3200C16)', N'32GB (2x16G) DDR4 3200MHz', CAST(3699000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (136, 3, N'Corsair Dominator Platinum White RGB (CMT32GX4M2E3200C16W)', N'32GB (2x16G) DDR4 3200MHz', CAST(3699000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (137, 3, N'Gskill Trident Z Neo RGB (F4-3600C18D-32GTZN)', N'32GB (2x16GB) DDR4 3600MHz', CAST(2699000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (138, 3, N'Kingston Fury Beast RGB (KF432C16BB12AK2/32)', N'32GB (2x16GB) DDR4 3200MHz', CAST(2699000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (139, 3, N'ADATA Spectrix D80 8GB/3200 (1x8GB) -Black', N'8GB (1x8GB) DDR4 3200MHz', CAST(2690000 AS Decimal(18, 0)), N'24 Months', N'ADATA', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (140, 3, N'Corsair Vengeance RGB RS (CMG32GX4M2D3600C18)', N'32GB (2x16GB) DDR4 3600MHz', CAST(2649000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (141, 3, N'Gskill Trident Z RGB (F4-3200C16D-32GTZR)', N'32GB (2x16GB) DDR4 3200MHz', CAST(2599000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (142, 3, N'Kingston Fury Beast (KF436C18BBK2/32)', N'32GB (2x16GB) DDR4 3600MHz', CAST(2599000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (143, 3, N'Corsair Vengeance RS RGB (CMG32GX4M2E3200C16)', N'32GB (2x16GB) DDR4 3200MHz', CAST(2599000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (144, 3, N'Klevv CRAS X RGB (KD48GU880-36A180Z)', N'16GB (2x8GB) DDR4 3600MHz', CAST(2529000 AS Decimal(18, 0)), N'24 Months', N'Klevv', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (145, 3, N'TEAMGROUP DELTA RGB WHITE (TF4D432G3200HC16F01)', N'32GB (1x32GB) DDR4 3200MHz', CAST(2299000 AS Decimal(18, 0)), N'24 Months', N'TEAMGROUP', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (146, 3, N'TEAMGROUP DELTA RGB (TF3D432G3200HC16F01)', N'32GB (1x16GB) DDR4 3200MHz', CAST(2299000 AS Decimal(18, 0)), N'24 Months', N'TEAMGROUP', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (147, 3, N'Klevv CRAS X RGB (KD48GU880-32A160X)', N'16GB (2x8GB) DDR4 3200MHz', CAST(2229000 AS Decimal(18, 0)), N'24 Months', N'Klevv', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (148, 3, N'ADATA XPG Spectrix D41 RGB Grey (AX4U30008G16A-DT41)', N'16GB (2x8GB) DDR4 3000MHz', CAST(2199000 AS Decimal(18, 0)), N'24 Months', N'ADATA', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (149, 3, N'Lexar Thor (LD4BU016G-R3200GDXG)', N'32GB (2x16GB) DDR4 3200MHz', CAST(1999000 AS Decimal(18, 0)), N'24 Months', N'Lexar', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (150, 3, N'Kingston Fury Beast RGB (KF436C17BB2AK2/16)', N'16GB (2x8GB) DDR4 3600MHz', CAST(1799000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (151, 3, N'Kingston Fury Beast White RGB (KF432C16BWAK2/16)', N'16GB (2x8GB) DDR4 3200MHz', CAST(1799000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (152, 3, N'Klevv BOLT X (KD4AGU880-32A160T)', N'16GB (1x16GB) DDR4 3200MHz', CAST(1719000 AS Decimal(18, 0)), N'24 Months', N'Klevv', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (153, 3, N'Corsair Vengeance RS RGB (CMG16GX4M2D3600C18)', N'16GB (2x8GB) DDR4 3600MHz', CAST(1699000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (154, 3, N'Corsair Vengeance RGB RS (CMG16GX4M2E3200C16)', N'16GB (2x8GB) DDR4 3200MHz', CAST(1699000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (155, 3, N'Gskill Trident Z Neo RGB (F4-3600C18D-16GTZN)', N'16GB (2x8GB) DDR4 3600MHz', CAST(1699000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (156, 3, N'Corsair Vengeance RS RGB (CMG16GX4M2E3200C16)', N'16GB (2x8GB) DDR4 3200MHz', CAST(1599000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (157, 3, N'Gskill Trident Z RGB (F4-3200C16D-16GTZR)', N'16GB (2x8GB) DDR4 3200MHz', CAST(1599000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (158, 3, N'Kingston Fury Beast (KF426C16BBK2/16)', N'16GB (2x8GB) DDR4 2666MHz', CAST(1549000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (159, 3, N'Klevv (KD4AGUA8M-26N190A)', N'16GB (1x16GB) DDR4 2666MHz', CAST(1519000 AS Decimal(18, 0)), N'24 Months', N'Klevv', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (160, 3, N'Kingston Fury Beast RGB (KF436C18BB2A/16)', N'16GB (1x16GB) DDR4 3600MHz', CAST(1499000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (161, 3, N'Kingston Fury Beast RGB (KF432C16BBAK2/16)', N'16GB (2x8GB) DDR4 3200MHz', CAST(1499000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (162, 3, N'Kingston Fury Beast (KF436C17BBK2/16)', N'16GB (2x8GB) DDR4 3600MHz', CAST(1499000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (163, 3, N'Kingston Fury Beast RGB (KF432C16BB2A/16)', N'16GB (1x16GB) DDR4 3200MHz', CAST(1439000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (164, 3, N'Corsair Vengeance RS RGB (CMG16GX4M1E3200C16)', N'16GB (1x16GB) DDR4 3200MHz', CAST(1399000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (165, 3, N'ADATA XPG Spectrix D60G RGB (AX4U36008G18I-DT60)', N'16GB (2x8GB) DDR4 3600MHz', CAST(1399000 AS Decimal(18, 0)), N'24 Months', N'ADATA', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (166, 3, N'Corsair Vengeance LPX (CMK16GX4M2E3200C16)', N'16GB (2x8GB) DDR4 3200MHz', CAST(1399000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (167, 3, N'Kingston (KSM26ED8/16HD)', N'16GB DDR4 2666MHz ECC', CAST(1299000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (168, 3, N'Corsair Vengeance LPX (CMK16GX4M1D3600C18)', N'16GB (1x16GB) DDR4 3600MHz', CAST(1299000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (169, 3, N'Kingston Fury Beast (KF426C16BB1/16)', N'16GB (1x16GB) DDR4 2666MHz', CAST(1269000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (170, 3, N'TEAMGROUP DELTA RGB (TF3D416G3200HC16F01)', N'16GB (1x16GB) DDR4 3200MHz', CAST(1199000 AS Decimal(18, 0)), N'24 Months', N'TEAMGROUP', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (202, 3, N'Kingston Fury Beast RGB (KF432C16BBAK2/16)', N'16GB (2x8GB) DDR4 3200MHz', CAST(1499000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (203, 3, N'Kingston Fury Beast (KF436C17BBK2/16)', N'16GB (2x8GB) DDR4 3600MHz', CAST(1499000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (204, 3, N'Kingston Fury Beast RGB (KF432C16BB2A/16)', N'16GB (1x16GB) DDR4 3200MHz', CAST(1439000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (205, 3, N'Corsair Vengeance RS RGB (CMG16GX4M1E3200C16)', N'16GB (1x16GB) DDR4 3200MHz', CAST(1399000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (206, 3, N'ADATA XPG Spectrix D60G RGB (AX4U36008G18I-DT60)', N'16GB (2x8GB) DDR4 3600MHz', CAST(1399000 AS Decimal(18, 0)), N'24 Months', N'ADATA', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (207, 3, N'Corsair Vengeance LPX (CMK16GX4M2E3200C16)', N'16GB (2x8GB) DDR4 3200MHz', CAST(1399000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (208, 3, N'Kingston (KSM26ED8/16HD)', N'16GB DDR4 2666MHz ECC', CAST(1299000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (209, 3, N'Corsair Vengeance LPX (CMK16GX4M1D3600C18)', N'16GB (1x16GB) DDR4 3600MHz', CAST(1299000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (210, 3, N'Kingston Fury Beast (KF426C16BB1/16)', N'16GB (1x16GB) DDR4 2666MHz', CAST(1269000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (211, 3, N'TEAMGROUP DELTA RGB (TF3D416G3200HC16F01)', N'16GB (1x16GB) DDR4 3200MHz', CAST(1199000 AS Decimal(18, 0)), N'24 Months', N'TEAMGROUP', N'DDR4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (212, 3, N'Gskill Trident Z Royal RGB (F5-6400J3239G32GX2-TR5S)', N'64GB (2x32GB) DDR5 6400MHz', CAST(9100000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (213, 3, N'Corsair Dominator Titanium RGB Black (CCMP64GX5M2B6000C30)', N'64GB (2x32GB) DDR5 6000MHz', CAST(8499000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (214, 3, N'Teamgroup Delta RGB (FF4D532G6200HC38ADC01)', N'32GB (2x16GB) DDR5 6200MHz', CAST(7699000 AS Decimal(18, 0)), N'24 Months', N'Teamgroup', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (215, 3, N'Teamgroup Delta RGB (FF3D532G6200HC38ADC01)', N'32GB (2x16GB) DDR5 6200MHz', CAST(7699000 AS Decimal(18, 0)), N'24 Months', N'Teamgroup', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (216, 3, N'Teamgroup Delta RGB (FF4D532G6000HC38ADC01)', N'32GB (2x16GB) DDR5 6000MHz', CAST(7499000 AS Decimal(18, 0)), N'24 Months', N'Teamgroup', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (217, 3, N'Teamgroup Delta RGB (FF3D532G6000HC38ADC01)', N'32GB (2x16GB) DDR5 6000MHz', CAST(7499000 AS Decimal(18, 0)), N'24 Months', N'Teamgroup', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (218, 3, N'Dominator Platinum RGB White (CMT64GX5M2B5600C40W)', N'64GB (2x32GB) DDR5 5600MHz', CAST(6999000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (219, 3, N'Kingston Fury Beast Black RGB XMP (KF560C40BBAK2-64)', N'64GB (2x32GB) DDR5 6000MHz', CAST(6999000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (220, 3, N'Corsair Dominator Platinum RGB Black (CMT64GX5M2B5600C40)', N'64GB (2x32GB) DDR5 5600MHz', CAST(6999000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (221, 3, N'Corsair Dominator Platinum RGB Black (CMT64GX5M2B5200C40)', N'64GB (2x32GB) DDR5 5200MHz', CAST(6799000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (222, 3, N'Corsair Dominator Platinum RGB White (CMT64GX5M2B5200C40W)', N'64GB (2x32GB) DDR5 5200MHz', CAST(6799000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (223, 3, N'Gskill Trident Z5 RGB (F5-6000J3636F32GX2-TZ5RK)', N'64GB (2x32GB) DDR5 6000MHz', CAST(6499000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (224, 3, N'Gskill Trident Z5 RGB Siliver (F5-6000J3238G32GX2-TZ5RS)', N'64GB (2x32GB) DDR5 6000MHz', CAST(6499000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (225, 3, N'Kingston Fury Beast RGB (KF556C40BBAK2-64)', N'64GB (2x32GB) DDR5 5600MHz', CAST(6299000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (226, 3, N'Kingston Fury Beast RGB (KF552C40BBAK2-64)', N'64GB (2x32GB) DDR5 5200MHz', CAST(5999000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (227, 3, N'Corsair Dominator Titanium RGB White (CMP32GX5M2B6000C30W)', N'32GB (2x16GB) DDR5 6000MHz', CAST(5399000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (228, 3, N'Gskill Trident Z Royal RGB (F5-6400J3239G16GX2-TR5S)', N'32GB (2x16GB) DDR5 6400MHz', CAST(5200000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (229, 3, N'Gskill Ripjaws M5 RGB (F5-5200J4040A32GX2-RM5RW)', N'64GB (2x32GB) DDR5 5200MHz', CAST(4990000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (230, 3, N'Gskill Ripjaws M5 RGB (F5-5200J4040A16GX2-RM5RK)', N'64GB (2x32GB) DDR5 5200MHz', CAST(4990000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (231, 3, N'Corsair Dominator Platinum RGB Black Heatspreader (CMT32GX5M2B5600C36)', N'32GB (2x16GB) DDR5 5600MHz', CAST(4599000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR5', 7)
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (232, 3, N'Corsair Dominator Platinum RGB Black (CMT32GX5M2B5200C40)', N'32GB (2x16GB) DDR5 5200MHz', CAST(4199000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (233, 3, N'Kingston Fury Beast (KF560C40BBK2-32)', N'32GB (2x16GB) DDR5 6000MHz', CAST(3699000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (234, 3, N'Kingston Fury Beast RGB (KF556C40BBAK2-32)', N'32GB (2x16GB) DDR5 5600MHz', CAST(3599000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (235, 3, N'Teamgroup Vulcan (FLBD532G5200HC40CDC01)', N'32GB (2x16GB) DDR5 5200MHz', CAST(3299000 AS Decimal(18, 0)), N'24 Months', N'Teamgroup', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (236, 3, N'Teamgroup Vulcan (FLRD532G5200HC40CDC01)', N'32GB (2x16GB) DDR5 5200MHz', CAST(3299000 AS Decimal(18, 0)), N'24 Months', N'Teamgroup', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (237, 3, N'Kingston Fury Beast (KF552C40BBK2-32)', N'32GB (2x16GB) DDR5 5200MHz', CAST(3199000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (238, 3, N'Corsair Vengeance RGB Heatspreader (CMH32GX5M2B5200C40)', N'32GB (2x16GB) DDR5 5200MHz', CAST(3199000 AS Decimal(18, 0)), N'24 Months', N'Corsair', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (239, 3, N'Kingston Fury Beast (KF548C38BBK2-32)', N'32GB (2x16GB) DDR5 4800MHz', CAST(3199000 AS Decimal(18, 0)), N'24 Months', N'Kingston', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (240, 3, N'Gskill Ripjaws S5 (F5-5600J4040C16GX2-RS5K)', N'32GB (2x16GB) DDR5 5600MHz', CAST(3099000 AS Decimal(18, 0)), N'24 Months', N'Gskill', N'DDR5', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (241, 5, N'Seagate Exos 24TB', N'3.5 inch HDD, SATA, 24TB storage capacity', CAST(20599000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (242, 5, N'Seagate Ironwolf Pro 20TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(19899000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (243, 5, N'Seagate Ironwolf Pro 20TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(19899000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (244, 5, N'Seagate SkyHawk AI 20TB', N'3.5 inch HDD', CAST(19599000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (245, 5, N'WD Purple Pro 22TB', N'3.5 inch HDD, 7200RPM, SATA, 512MB Cache', CAST(19399000 AS Decimal(18, 0)), N'60 Months', N'WD', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (246, 5, N'Seagate Exos 24TB', N'3.5 inch HDD, SATA, 24TB storage capacity', CAST(20599000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (247, 5, N'Seagate Ironwolf Pro 20TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(19899000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (248, 5, N'Seagate Ironwolf Pro 20TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(19899000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (249, 5, N'Seagate SkyHawk AI 20TB', N'3.5 inch HDD', CAST(19599000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (250, 5, N'WD Purple Pro 22TB', N'3.5 inch HDD, 7200RPM, SATA, 512MB Cache', CAST(19399000 AS Decimal(18, 0)), N'60 Months', N'WD', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (251, 5, N'Seagate SkyHawk AI 20TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(19599000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (252, 5, N'Seagate Ironwolf Pro 14TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(16899000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (253, 5, N'Seagate Ironwolf Pro 18TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(16299000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (254, 5, N'Seagate SkyHawk AI 18TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(15999000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (255, 5, N'WD Purple Pro 18TB', N'3.5 inch HDD, 7200RPM, SATA, 512MB Cache', CAST(15699000 AS Decimal(18, 0)), N'60 Months', N'WD', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (256, 5, N'Seagate Ironwolf Pro 16TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(13299000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (257, 5, N'Seagate SkyHawk AI 16TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(12599000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (258, 5, N'WD Purple Pro 14TB', N'3.5 inch HDD, 7200RPM, SATA, 512MB Cache', CAST(12399000 AS Decimal(18, 0)), N'60 Months', N'WD', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (259, 5, N'WD Enterprise Ultrastar DC HC550 16TB', N'3.5 inch HDD, 7200RPM, SATA, 512MB Cache', CAST(11499000 AS Decimal(18, 0)), N'60 Months', N'WD', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (260, 5, N'WD Gold 14TB', N'3.5 inch HDD, 7200RPM, SATA, 256MB Cache', CAST(14999000 AS Decimal(18, 0)), N'60 Months', N'WD', N'SATA', 30)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (261, 4, N'Kingston A400 240GB SATA III 2.5 inch', N'240GB SATA III 2.5 inch SSD', CAST(790000 AS Decimal(18, 0)), N'60 Months', N'Kingston', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (262, 4, N'Samsung 860 EVO 500GB SATA III 2.5 inch', N'500GB SATA III 2.5 inch SSD', CAST(2699000 AS Decimal(18, 0)), N'60 Months', N'Samsung', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (263, 4, N'Samsung 970 EVO 500GB M.2 NVMe PCIe Gen 3', N'500GB M.2 NVMe PCIe Gen 3 SSD', CAST(2899000 AS Decimal(18, 0)), N'60 Months', N'Samsung', N'M.2 NVMe', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (264, 4, N'Samsung 970 EVO Plus 1TB M.2 NVMe PCIe Gen 3', N'1TB M.2 NVMe PCIe Gen 3 SSD', CAST(4799000 AS Decimal(18, 0)), N'60 Months', N'Samsung', N'M.2 NVMe', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (265, 4, N'Samsung 970 EVO Plus 500GB M.2 NVMe PCIe Gen 3', N'500GB M.2 NVMe PCIe Gen 3 SSD', CAST(3399000 AS Decimal(18, 0)), N'60 Months', N'Samsung', N'M.2 NVMe', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (266, 4, N'Crucial BX500 120GB SATA III 2.5 inch', N'120GB SATA III 2.5 inch SSD', CAST(550000 AS Decimal(18, 0)), N'60 Months', N'Crucial', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (267, 4, N'ADATA XPG SX8200 Pro 512GB NVMe PCIe Gen 3', N'512GB NVMe PCIe Gen 3 SSD', CAST(2499000 AS Decimal(18, 0)), N'60 Months', N'ADATA', N'M.2 NVMe', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (268, 4, N'Crucial BX500 240GB SATA III 2.5 inch', N'240GB SATA III 2.5 inch SSD', CAST(750000 AS Decimal(18, 0)), N'60 Months', N'Crucial', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (269, 4, N'Kingston KC600 1TB SATA III 2.5 inch', N'1TB SATA III 2.5 inch SSD', CAST(3099000 AS Decimal(18, 0)), N'60 Months', N'Kingston', N'SATA', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (270, 4, N'Kingston KC600 256GB SATA III 2.5 inch', N'256GB SATA III 2.5 inch SSD', CAST(1049000 AS Decimal(18, 0)), N'60 Months', N'Kingston', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (271, 4, N'ADATA XPG SX6000 Lite 256GB M.2 NVMe PCIe Gen 3', N'256GB M.2 NVMe PCIe Gen 3 SSD', CAST(1299000 AS Decimal(18, 0)), N'60 Months', N'ADATA', N'M.2 NVMe', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (272, 4, N'ADATA SU650 240GB SATA III 2.5 inch', N'240GB SATA III 2.5 inch SSD', CAST(690000 AS Decimal(18, 0)), N'60 Months', N'ADATA', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (273, 4, N'Crucial MX500 500GB SATA III 2.5 inch', N'500GB SATA III 2.5 inch SSD', CAST(1599000 AS Decimal(18, 0)), N'60 Months', N'Crucial', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (274, 4, N'Crucial MX500 1TB SATA III 2.5 inch', N'1TB SATA III 2.5 inch SSD', CAST(3399000 AS Decimal(18, 0)), N'60 Months', N'Crucial', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (275, 4, N'WD Blue SN550 500GB M.2 NVMe PCIe Gen 3', N'500GB M.2 NVMe PCIe Gen 3 SSD', CAST(1799000 AS Decimal(18, 0)), N'60 Months', N'WD', N'M.2 NVMe', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (276, 4, N'WD Blue SN550 1TB M.2 NVMe PCIe Gen 3', N'1TB M.2 NVMe PCIe Gen 3 SSD', CAST(3199000 AS Decimal(18, 0)), N'60 Months', N'WD', N'M.2 NVMe', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (277, 4, N'Samsung 870 QVO 1TB SATA III 2.5 inch', N'1TB SATA III 2.5 inch SSD', CAST(2999000 AS Decimal(18, 0)), N'60 Months', N'Samsung', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (278, 4, N'Kingston UV500 480GB SATA III 2.5 inch', N'480GB SATA III 2.5 inch SSD', CAST(1399000 AS Decimal(18, 0)), N'60 Months', N'Kingston', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (279, 4, N'Crucial MX500 250GB SATA III 2.5 inch', N'250GB SATA III 2.5 inch SSD', CAST(1099000 AS Decimal(18, 0)), N'60 Months', N'Crucial', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (280, 4, N'Samsung 870 EVO 500GB SATA III 2.5 inch', N'500GB SATA III 2.5 inch SSD', CAST(2199000 AS Decimal(18, 0)), N'60 Months', N'Samsung', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (281, 4, N'ADATA SU800 1TB SATA III 2.5 inch', N'1TB SATA III 2.5 inch SSD', CAST(3199000 AS Decimal(18, 0)), N'60 Months', N'ADATA', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (282, 4, N'Crucial BX500 480GB SATA III 2.5 inch', N'480GB SATA III 2.5 inch SSD', CAST(1399000 AS Decimal(18, 0)), N'60 Months', N'Crucial', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (283, 4, N'Kingston A400 480GB SATA III 2.5 inch', N'480GB SATA III 2.5 inch SSD', CAST(1399000 AS Decimal(18, 0)), N'60 Months', N'Kingston', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (284, 4, N'WD Blue SN550 250GB M.2 NVMe PCIe Gen 3', N'250GB M.2 NVMe PCIe Gen 3 SSD', CAST(1099000 AS Decimal(18, 0)), N'60 Months', N'WD', N'M.2 NVMe', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (285, 4, N'Kingston UV500 240GB SATA III 2.5 inch', N'240GB SATA III 2.5 inch SSD', CAST(990000 AS Decimal(18, 0)), N'60 Months', N'Kingston', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (286, 4, N'Samsung 870 EVO 1TB SATA III 2.5 inch', N'1TB SATA III 2.5 inch SSD', CAST(3999000 AS Decimal(18, 0)), N'60 Months', N'Samsung', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (287, 4, N'WD Blue SN550 2TB M.2 NVMe PCIe Gen 3', N'2TB M.2 NVMe PCIe Gen 3 SSD', CAST(5999000 AS Decimal(18, 0)), N'60 Months', N'WD', N'M.2 NVMe', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (288, 4, N'ADATA SU800 2TB SATA III 2.5 inch', N'2TB SATA III 2.5 inch SSD', CAST(6499000 AS Decimal(18, 0)), N'60 Months', N'ADATA', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (289, 4, N'Crucial MX500 2TB SATA III 2.5 inch', N'2TB SATA III 2.5 inch SSD', CAST(6799000 AS Decimal(18, 0)), N'60 Months', N'Crucial', N'SATA', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (290, 4, N'Kingston A400 120GB SATA III 2.5 inch', N'120GB SATA III 2.5 inch SSD', CAST(490000 AS Decimal(18, 0)), N'60 Months', N'Kingston', N'SATA', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (291, 4, N'Samsung 860 EVO 250GB SATA III 2.5 inch', N'250GB SATA III 2.5 inch SSD', CAST(1299000 AS Decimal(18, 0)), N'60 Months', N'Samsung', N'SATA', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (292, 2, N'ASROCK B450M-HDV R4.0', N'Mainboard ASROCK B450M-HDV R4.0', CAST(1699000 AS Decimal(18, 0)), N'36 Months', N'ASROCK', N'mATX, AM4, DDR4, 64GB, SATA, M.2 NVMe, PCIe 4.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (293, 2, N'ASUS TUF GAMING B550M-PLUS', N'Mainboard ASUS TUF GAMING B550M-PLUS', CAST(3799000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'mATX, AM4, DDR4, 128GB, SATA, M.2 NVMe, PCIe 4.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (294, 2, N'MSI B450M PRO-VDH MAX', N'Mainboard MSI B450M PRO-VDH MAX', CAST(1849000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'mATX, AM4, DDR4, 64GB, SATA, M.2 NVMe, PCIe 4.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (295, 2, N'ASUS TUF GAMING B550M-PLUS (WI-FI)', N'Mainboard ASUS TUF GAMING B550M-PLUS', CAST(3999000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'mATX, AM4, DDR4, 128GB, SATA, M.2 NVMe, PCIe 4.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (296, 2, N'Gigabyte B550M AORUS ELITE AX', N'Mainboard Gigabyte B550M AORUS ELITE AX', CAST(3499000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'mATX, AM4, DDR4, 128GB, SATA, M.2 NVMe, PCIe 4.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (297, 2, N'Gigabyte X570S UD', N'Mainboard Gigabyte X570S UD', CAST(4699000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, AM4, DDR4, 128GB, SATA, M.2 NVMe, PCIe 4.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (298, 2, N'Gigabyte B550M AORUS ELITE', N'Mainboard Gigabyte B550M AORUS ELITE (AMD B550, Socket AM4, m-ATX, 4 khe RAM DDR4)', CAST(2599000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'mATX, AM4, DDR4, 128GB, SATA, M.2 NVMe, PCIe 4.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (299, 2, N'ASUS PRIME B450M-A II', N'Mainboard ASUS PRIME B450M-A II', CAST(1899000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'mATX, AM4, DDR4, 64GB, SATA, M.2 NVMe, PCIe 4.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (300, 2, N'ASUS PRIME A320M-K', N'Mainboard ASUS PRIME A320M-K (AMD A320, Socket AM4, ATX, 2 khe RAM DDR4)', CAST(1399000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'ATX, AM4, DDR4, 64GB, SATA, M.2 NVMe, PCIe 4.0', 55)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (301, 2, N'Gigabyte X670 AORUS ELITE AX', N'Supports AMD Ryzen™ 7000 and 8000 Series Processors. Twin 16+2+2 Digital VRM Design, Dual Channel DDR5, PCIe 5.0 Ready, Wi-Fi 6E, and more.', CAST(8699000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, AM5, DDR5, 128GB, SATA, M.2 NVMe, PCIe 4.0', 75)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (302, 2, N'Gigabyte B650 AORUS PRO AX DDR5', N'Supports AMD Ryzen™ 7000 Series Processors. Direct 8+2+2 Digital VRM Solution, Dual Channel DDR5, PCIe 4.0 slots, and more.', CAST(7999000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, AM5, DDR5, 128GB, SATA, M.2 NVMe, PCIe 4.0', 60)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (303, 2, N'Gigabyte B650 GAMING X AX DDR5', N'Supports AMD Ryzen™ 8000/7000 Series Processors. Enhanced Power Design, Dual Channel DDR5, PCIe 4.0 slot, Lightning Gen4 M.2, and more.', CAST(5599000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'ATX, AM5, DDR5, 128GB, SATA, M.2 NVMe, PCIe 4.0', 60)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (304, 2, N'Gigabyte B650M GAMING X AX DDR5', N'Supports AMD Ryzen™ 8000/7000 Series Processors. Enhanced Power Design, Dual Channel DDR5, PCIe 4.0 slot, Lightning Gen4 M.2, and more.', CAST(5099000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'mATX, AM5, DDR5, 128GB, SATA, M.2 NVMe, PCIe 4.0', 50)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (305, 2, N'MSI B650M GAMING PLUS WIFI', N'Supports AMD Ryzen™ 7000/8000 Series Processors. Direct 6+2+1 Digital VRM Solution, Dual Channel DDR5, PCIe 4.0 x4 M.2 connectors, and more.', CAST(4699000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'mATX, AM5, DDR5, 128GB, SATA, M.2 NVMe, PCIe 4.0', 50)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (306, 6, N'ASUS ROG STRIX RTX 4080 SUPER-O16G-GAMING', N'High-end', CAST(37999000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 320)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (307, 6, N'ASUS ROG STRIX RTX 4060-O8G-V2-GAMING', N'Mid-end', CAST(9399000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 115)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (308, 6, N'ASUS TUF-RTX 3060-12G-V2-GAMING', N'Mid-end', CAST(8899000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 130)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (309, 6, N'ASUS ROG STRIX RTX 4090-O24G-GAMING', N'High-end', CAST(62999000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 450)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (310, 6, N'ASUS DUAL RTX 3050-O8G-V2', N'Low-end', CAST(5899000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 130)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (311, 6, N'MSI RTX 3060 VENTUS 2X OC 12 GB', N'Mid-end', CAST(7999000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'PCIe 4.0', 170)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (312, 6, N'ASUS ROG STRIX-RTX 3060-O12G-V2-GAMING', N'Mid-end', CAST(9399000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 130)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (313, 6, N'ASUS ROG STRIX-RTX 3060-12G-V2-GAMING', N'Mid-end', CAST(9399000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 130)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (314, 6, N'ASUS TUF-RTX 3060-O12G-V2-GAMING', N'Mid-end', CAST(8999000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 130)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (315, 6, N'ASUS TUF-RTX 3060-12G-V2-GAMING', N'Mid-end', CAST(8299000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 130)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (316, 6, N'INNO3D RTX 4070 Ti SUPER X3 OC 16GB', N'High-end', CAST(23999000 AS Decimal(18, 0)), N'36 Months', N'INNO3D', N'PCIe 4.0', 300)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (317, 6, N'INNO3D RTX 4060 Ti Twin X2 16GB', N'Mid-end', CAST(12999000 AS Decimal(18, 0)), N'36 Months', N'INNO3D', N'PCIe 4.0', 185)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (318, 6, N'ASUS DUAL RX 6600 8GB-V3', N'Mid-end', CAST(5499000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 150)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (319, 6, N'ASUS DUAL RX 6600 8GB-V2', N'Mid-end', CAST(5499000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 165)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (320, 6, N'ASUS DUAL GTX 1650-4GD6-P-EVO', N'Low-end', CAST(3749000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 3.0', 70)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (321, 6, N'PNY RTX 4060 8GB XLR8 GAMING VERTO Overclocked Dual Fan', N'Mid-end', CAST(8099000 AS Decimal(18, 0)), N'36 Months', N'PNY', N'PCIe 4.0', 150)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (322, 6, N'ASUS RTX 4080 SUPER-O16G-NOCTUA', N'High-end', CAST(37999000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 400)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (323, 6, N'ASUS ROG STRIX RTX 4080 SUPER-16G-GAMING', N'High-end', CAST(37799000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 350)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (324, 6, N'MSI RTX 4070 Ti SUPER 16G VENTUS 3X OC', N'High-end', CAST(25999000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'PCIe 4.0', 300)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (325, 6, N'GIGABYTE RTX 4080 SUPER WINDFORCE V2-16G', N'High-end', CAST(33499000 AS Decimal(18, 0)), N'36 Months', N'GIGABYTE', N'PCIe 4.0', 320)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (326, 6, N'GIGABYTE RTX 4080 SUPER GAMING OC-16G', N'High-end', CAST(35499000 AS Decimal(18, 0)), N'36 Months', N'GIGABYTE', N'PCIe 4.0', 340)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (327, 6, N'GIGABYTE RTX 4080 SUPER AERO OC-16G', N'High-end', CAST(36999000 AS Decimal(18, 0)), N'36 Months', N'GIGABYTE', N'PCIe 4.0', 340)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (328, 6, N'MSI RTX 4080 SUPER 16G SUPRIM X', N'High-end', CAST(38499000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'PCIe 4.0', 340)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (329, 6, N'ASUS DUAL-RTX 4060 TI-O8G-EVO', N'Mid-end', CAST(11599000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 4.0', 220)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (330, 6, N'ASUS DUAL GTX 1650-O4GD6-P-EVO', N'Low-end', CAST(3799000 AS Decimal(18, 0)), N'36 Months', N'ASUS', N'PCIe 3.0', 75)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (331, 6, N'MSI RTX 4070 VENTUS 3X E 12G OC', N'Mid-end', CAST(17499000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'PCIe 4.0', 175)
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (332, 6, N'MSI RTX 3060 VENTUS 2X OC 12 GB', N'Mid-end', CAST(7999000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'PCIe 4.0', 170)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (333, 6, N'INNO3D GTX 1650 TWIN X2 OC 4GB GDDR6 / V3 (N16502-04D6X-171330N)', N'Low-end', CAST(3699000 AS Decimal(18, 0)), N'36 Months', N'INNO3D', N'PCIe 3.0', 70)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (336, 7, N'ASUS TUF Gaming 650W Bronze', N'80 Plus Bronze certification, black color', CAST(1459000 AS Decimal(18, 0)), N'60 Months', N'ASUS', N'Mid Tower, Full Tower', 650)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (337, 7, N'Jetek SWAT 650 650W', N'80 Plus Bronze certification, black color', CAST(1349000 AS Decimal(18, 0)), N'60 Months', N'Jetek', N'Mid Tower, Full Tower', 650)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (338, 7, N'FSP Power Supply HYN Series HYN550ATX', N'Active PFC, black color', CAST(659000 AS Decimal(18, 0)), N'60 Months', N'FSP', N'Mid Tower, Full Tower', 550)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (339, 7, N'Antec Atom V650 EC - 650W', N'650W power supply, black color', CAST(939000 AS Decimal(18, 0)), N'60 Months', N'Antec', N'Mid Tower, Full Tower', 650)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (340, 7, N'Gigabyte P650G 650W', N'80 Plus Gold certification, black color', CAST(1519000 AS Decimal(18, 0)), N'60 Months', N'Gigabyte', N'Mid Tower, Full Tower', 650)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (341, 7, N'Cooler Master Elite V3 230V PC600 600W', N'600W power supply, black color', CAST(939000 AS Decimal(18, 0)), N'60 Months', N'Cooler Master', N'Mid Tower, Full Tower', 600)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (342, 7, N'Gigabyte GP-P550B 550W', N'80 Plus Bronze certification, black color', CAST(999000 AS Decimal(18, 0)), N'60 Months', N'Gigabyte', N'Mid Tower, Full Tower', 550)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (343, 7, N'MSI MAG A550BN 550W', N'80 Plus Bronze certification, black color', CAST(1199000 AS Decimal(18, 0)), N'60 Months', N'MSI', N'Mid Tower, Full Tower', 550)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (344, 7, N'Xigmatek X-POWER III 650 - 600W', N'600W power supply, black color', CAST(899000 AS Decimal(18, 0)), N'60 Months', N'Xigmatek', N'Mid Tower, Full Tower', 600)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (345, 7, N'MSI MAG A650BN 650W', N'80 Plus Bronze certification, black color', CAST(1289000 AS Decimal(18, 0)), N'60 Months', N'MSI', N'Mid Tower, Full Tower', 650)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (346, 7, N'Antec Cuprum Strike CSK650 - 650W', N'80 Plus Bronze certification, black color', CAST(1339000 AS Decimal(18, 0)), N'60 Months', N'Antec', N'Mid Tower, Full Tower', 650)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (347, 7, N'CORSAIR RM750E ATX 3.0', N'80 Plus Gold certification, black color, full modular', CAST(2999000 AS Decimal(18, 0)), N'60 Months', N'Corsair', N'Mid Tower, Full Tower', 750)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (348, 7, N'SEGOTEP KL-M750G SFX', N'80 Plus Gold certification, black color, ATX 3.0 + PCIe 5.0', CAST(2849000 AS Decimal(18, 0)), N'60 Months', N'Segotep', N'SFX Case', 750)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (349, 7, N'Cooler Master MWE GOLD 750 - V2', N'80 Plus Gold certification, black color, full modular', CAST(2799000 AS Decimal(18, 0)), N'60 Months', N'Cooler Master', N'Mid Tower, Full Tower', 750)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (350, 7, N'FSP HPT2-750M PPA7505701', N'80 Plus Platinum certification, black color', CAST(2459000 AS Decimal(18, 0)), N'60 Months', N'FSP', N'Mid Tower, Full Tower', 750)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (351, 7, N'Cooler Master MWE GOLD 750-V2', N'80 Plus Gold certification, black color', CAST(2399000 AS Decimal(18, 0)), N'60 Months', N'Cooler Master', N'Mid Tower, Full Tower', 750)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (352, 7, N'Gigabyte GP-P750GM', N'80 Plus Gold certification, black color, full modular', CAST(2199000 AS Decimal(18, 0)), N'60 Months', N'Gigabyte', N'Mid Tower, Full Tower', 750)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (353, 7, N'Jetek SWAT750 EV1', N'PCIe 5.0, black color', CAST(1799000 AS Decimal(18, 0)), N'60 Months', N'Jetek', N'Mid Tower, Full Tower', 750)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (354, 7, N'ASUS TUF GAMING 750W Bronze', N'80 Plus Bronze certification, black color', CAST(1759000 AS Decimal(18, 0)), N'60 Months', N'ASUS', N'Mid Tower, Full Tower', 750)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (355, 7, N'MSI MAG A750BN PCIE5', N'80 Plus Bronze certification, black color', CAST(1599000 AS Decimal(18, 0)), N'60 Months', N'MSI', N'Mid Tower, Full Tower', 750)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (356, 7, N'Cooler Master MWE V2 230V 750', N'80 Plus Bronze certification, black color', CAST(1599000 AS Decimal(18, 0)), N'60 Months', N'Cooler Master', N'Mid Tower, Full Tower', 750)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (357, 7, N'Antec Cuprum Strike CSK750', N'80 Plus Bronze certification, black color', CAST(1549000 AS Decimal(18, 0)), N'60 Months', N'Antec', N'Mid Tower, Full Tower', 750)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (358, 7, N'Gigabyte P650G 650W', N'80 Plus Gold certification, black color', CAST(1519000 AS Decimal(18, 0)), N'60 Months', N'Gigabyte', N'Mid Tower, Full Tower', 650)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (359, 7, N'Cooler Master MWE V2 230V 650 650W', N'80 Plus Bronze certification, black color', CAST(1439000 AS Decimal(18, 0)), N'60 Months', N'Cooler Master', N'Mid Tower, Full Tower', 650)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (360, 7, N'DeepCool PK750D', N'80 Plus Bronze certification, black color', CAST(1399000 AS Decimal(18, 0)), N'60 Months', N'DeepCool', N'Mid Tower, Full Tower', 750)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (361, 7, N'AIGO GB750 750W', N'80 Plus Bronze certification, black color', CAST(1359000 AS Decimal(18, 0)), N'60 Months', N'AIGO', N'Mid Tower, Full Tower', 750)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (362, 7, N'Jetek SWAT 650 650W', N'80 Plus Bronze certification, black color', CAST(1349000 AS Decimal(18, 0)), N'60 Months', N'Jetek', N'Mid Tower, Full Tower', 650)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (363, 7, N'CORSAIR RM1000E ATX 3.0', N'80 Plus Gold certification, black color, full modular', CAST(4779000 AS Decimal(18, 0)), N'60 Months', N'Corsair', N'Mid Tower, Full Tower', 1000)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (364, 7, N'ASUS TUF Gaming 1000W Gold ATX3.0', N'PCIe Gen 5.0, 80 Plus Gold certification, black color, full modular', CAST(4449000 AS Decimal(18, 0)), N'60 Months', N'ASUS', N'Mid Tower, Full Tower', 1000)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (365, 7, N'MSI A1000G 1000W', N'80 Plus Gold certification, black color, full modular', CAST(4299000 AS Decimal(18, 0)), N'60 Months', N'MSI', N'Mid Tower, Full Tower', 1000)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (366, 7, N'NZXT C1000 - 1000W Gold', N'80 Plus Gold certification, black color, full modular', CAST(3999000 AS Decimal(18, 0)), N'60 Months', N'NZXT', N'Mid Tower, Full Tower', 1000)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (367, 7, N'Corsair RM850e ATX 3.0', N'80 Plus Gold certification, black color, full modular', CAST(3269000 AS Decimal(18, 0)), N'60 Months', N'Corsair', N'Mid Tower, Full Tower', 850)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (368, 7, N'MSI MAG A850GL PCIE 5.0', N'80 Plus Gold certification, black color, ATX 3.0', CAST(2899000 AS Decimal(18, 0)), N'60 Months', N'MSI', N'Mid Tower, Full Tower', 850)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (369, 7, N'FSP DAGGER PRO SDA2-850 Gen 5', N'80 Plus Gold certification, black color, PCIe 5.0, full modular', CAST(2799000 AS Decimal(18, 0)), N'60 Months', N'FSP', N'Mid Tower, Full Tower', 850)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (370, 7, N'Gigabyte GP-P850GM 850W', N'80 Plus Gold certification, black color, full modular', CAST(2699000 AS Decimal(18, 0)), N'60 Months', N'Gigabyte', N'Mid Tower, Full Tower', 850)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (371, 7, N'Super Flower Leadex Platinum 2000W SF-2000F14HP', N'80 Plus Platinum certification, black color, high wattage, full modular', CAST(11499000 AS Decimal(18, 0)), N'60 Months', N'Super Flower', N'Mid Tower, Full Tower', 2000)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (372, 7, N'CORSAIR HX1200I 2023', N'80 Plus Platinum certification, black color, full modular', CAST(6719000 AS Decimal(18, 0)), N'60 Months', N'CORSAIR', N'Mid Tower, Full Tower', 1200)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (373, 7, N'Cooler Master MWE GOLD 1250 - V2 1250W ATX3.0', N'PCIe 5.0, 80 Plus Gold certification, black color, full modular', CAST(5289000 AS Decimal(18, 0)), N'60 Months', N'Cooler Master', N'Mid Tower, Full Tower', 1250)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__536C85E464BFAA45]    Script Date: 6/11/2024 9:00:50 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UQ__Account__536C85E464BFAA45] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__A9D10534B0F23F3E]    Script Date: 6/11/2024 9:00:50 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UQ__Account__A9D10534B0F23F3E] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Category__8517B2E09FD8F8A7]    Script Date: 6/11/2024 9:00:50 PM ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [UQ__Category__8517B2E09FD8F8A7] UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Customer__349DA5871C1D1A42]    Script Date: 6/11/2024 9:00:50 PM ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UQ__Customer__349DA5871C1D1A42] UNIQUE NONCLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__5C7E359EC8E057B8]    Script Date: 6/11/2024 9:00:50 PM ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UQ__Customer__5C7E359EC8E057B8] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Staff__349DA58773975858]    Script Date: 6/11/2024 9:00:50 PM ******/
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [UQ__Staff__349DA58773975858] UNIQUE NONCLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK__Account__Account__0C85DE4D] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Customer] ([AccountID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK__Account__Account__0C85DE4D]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK__Account__Account__0D7A0286] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Staff] ([AccountID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK__Account__Account__0D7A0286]
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
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK__Groups__PCBuildI__5EBF139D] FOREIGN KEY([PCBuildID])
REFERENCES [dbo].[PCBuild] ([PCBuildID])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK__Groups__PCBuildI__5EBF139D]
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
ALTER TABLE [dbo].[PCBuildParts]  WITH CHECK ADD  CONSTRAINT [FK__PCBuildPa__PartI__6383C8BA] FOREIGN KEY([PartID])
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
USE [master]
GO
ALTER DATABASE [SMARTPC] SET  READ_WRITE 
GO
