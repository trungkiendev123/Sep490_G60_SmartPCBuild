USE [master]
GO
/****** Object:  Database [SMARTPC]    Script Date: 6/10/2024 1:53:56 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 6/10/2024 1:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Bill]    Script Date: 6/10/2024 1:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[BillID] [int] NOT NULL,
	[OrderID] [int] NULL,
	[BillDate] [date] NULL,
	[TaxIN] [int] NULL,
	[Address] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 6/10/2024 1:53:56 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 6/10/2024 1:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 6/10/2024 1:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Customer]    Script Date: 6/10/2024 1:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Groups]    Script Date: 6/10/2024 1:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[PCBuildID] [int] NULL,
	[PCType] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/10/2024 1:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [date] NOT NULL,
	[OrderStatus] [varchar](20) NOT NULL,
	[OrderAddress] [nvarchar](255) NULL,
	[ReceiveDate] [date] NULL,
	[TotalAmount] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 6/10/2024 1:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[OrderItemID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[WarrantyID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PricePerItem] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCBuild]    Script Date: 6/10/2024 1:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCBuild](
	[PCBuildID] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[BuildDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCBuildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCBuildParts]    Script Date: 6/10/2024 1:53:56 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 6/10/2024 1:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] NOT NULL,
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
/****** Object:  Table [dbo].[ProductStore]    Script Date: 6/10/2024 1:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStore](
	[ProductStoreID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
	[StockQuantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductStoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductWarranty]    Script Date: 6/10/2024 1:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductWarranty](
	[WarrantyID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[WarrantySentDate] [date] NULL,
	[WarrantyReceive] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[WarrantyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 6/10/2024 1:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[StoreID] [int] NULL,
	[FullName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Staff__96D4AAF7A071A3AE] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 6/10/2024 1:53:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[StoreID] [int] NOT NULL,
	[StoreName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Store__3B82F0E14FF980B8] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([AccountID], [Username], [Email], [Password], [AccountType]) VALUES (1, N'Dong', N'dong@gmail.com', N'123456', N'1')
INSERT [dbo].[Account] ([AccountID], [Username], [Email], [Password], [AccountType]) VALUES (2, N'Duyen', N'Duyen@gmail.com', N'123456', N'1')
INSERT [dbo].[Account] ([AccountID], [Username], [Email], [Password], [AccountType]) VALUES (3, N'Son', N'Son@gmail.com', N'123456', N'1')
INSERT [dbo].[Account] ([AccountID], [Username], [Email], [Password], [AccountType]) VALUES (4, N'Hung', N'Hung@gmail.com', N'123456', N'1')
INSERT [dbo].[Account] ([AccountID], [Username], [Email], [Password], [AccountType]) VALUES (5, N'Kien', N'Kien@gmail.com', N'123456', N'1')
INSERT [dbo].[Account] ([AccountID], [Username], [Email], [Password], [AccountType]) VALUES (6, N'Nam', N'Nam@gmail.com', N'123456', N'2')
INSERT [dbo].[Account] ([AccountID], [Username], [Email], [Password], [AccountType]) VALUES (7, N'Dung', N'Dung@gmail.com', N'123456', N'2')
INSERT [dbo].[Account] ([AccountID], [Username], [Email], [Password], [AccountType]) VALUES (8, N'Nguyen', N'Nguyen@gmail.com', N'123456', N'2')
GO
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (1, 1, CAST(N'2023-03-22' AS Date), 2332000, N'Số 3 đường Lê Hồng Phong , Thành phố Ninh Bình')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (2, 2, CAST(N'2023-03-23' AS Date), 2467776, N'Số 15 đường Lê Hồng Phong , Thành phố Ninh Bình')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (3, 3, CAST(N'2023-03-23' AS Date), 3400000, N'Yên Khánh , Ninh Bình ')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (4, 4, CAST(N'2021-01-01' AS Date), 3200000, N'Khánh An , Yên Khánh , Ninh Bình')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (5, 5, CAST(N'2021-01-01' AS Date), 2100000, N'Khánh Phú , Yên Khánh , Ninh Bình')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (6, 6, CAST(N'2021-01-01' AS Date), 1800000, N'Khánh Cư , Yên Khánh , Ninh Bình')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (7, 7, CAST(N'2023-01-03' AS Date), 1240000, N'Khánh Thủy , Yên Khánh , Ninh Bình')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (8, 8, CAST(N'2022-08-01' AS Date), 1234560, N'Khánh Vân , Yên Khánh , Ninh Bình')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (9, 9, CAST(N'2023-01-01' AS Date), 4500000, N'Số 124 đường Lê Hồng Phong , Thành phố Ninh Bình')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (10, 10, CAST(N'2023-03-02' AS Date), 4300000, N'37 Nguyễn Thái Học , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (11, 11, CAST(N'2022-05-04' AS Date), 1890000, N'45 Nguyễn Thái Học , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (12, 12, CAST(N'2023-03-02' AS Date), 1234000, N'67 Nguyễn Thái Học , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (13, 13, CAST(N'2023-02-03' AS Date), 5400000, N'11 Nguyễn Thái Học , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (14, 14, CAST(N'2023-07-08' AS Date), 3200000, N'28 Hoàng Quốc Việt , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (15, 15, CAST(N'2024-01-01' AS Date), 1980000, N'21 Hoàng Quốc Việt , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (16, 16, CAST(N'2024-03-02' AS Date), 3200000, N'20 Hoàng Quốc Việt , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (17, 17, CAST(N'2024-02-02' AS Date), 89000, N'78 Hoàng Quốc Việt , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (18, 18, CAST(N'2024-02-03' AS Date), 67800, N'Sài Sơn , Quốc Oai , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (19, 19, CAST(N'2023-07-06' AS Date), 59900, N'Phú Cát , Quốc Oai , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (20, 20, CAST(N'2023-07-08' AS Date), 40000, N'Phượng Cách , Quốc Oai , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (21, 21, CAST(N'2023-07-09' AS Date), 89900, N'Yên Sơn , Quốc Oai , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (22, 22, CAST(N'2023-07-09' AS Date), 54600, N'Ngọc Mỹ , Quốc Oai , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (23, 23, CAST(N'2023-07-09' AS Date), 98000, N'Ngọc Liệp , Quốc Oai , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (24, 24, CAST(N'2023-09-11' AS Date), 65500, N'Liệp Tuyết , Quốc Oai , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (25, 25, CAST(N'2023-09-12' AS Date), 99900, N'Số 3 đường Ninh Sơn , Thành phố Ninh Bình')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (26, 26, CAST(N'2023-09-13' AS Date), 54600, N'Kiến Xương , Thái Bình')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (27, 27, CAST(N'2023-09-13' AS Date), 123000, N'Thị trấn Đông Hưng, huyện Đông Hưng, tỉnh Thái Bình')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (28, 28, CAST(N'2023-09-14' AS Date), 213000, N'Thị trấn Hưng Hà, huyện Hưng Hà, tỉnh Thái Bình')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (29, 29, CAST(N'2023-09-16' AS Date), 23000, N'Thị trấn Thanh Nê, huyện Kiến Xương, tỉnh Thái Bình')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (30, 30, CAST(N'2023-09-19' AS Date), 430000, N'Ân Thi , Hưng Yên')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (31, 31, CAST(N'2023-09-20' AS Date), 540000, N'Mỹ Hào , Hưng Yên')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (32, 32, CAST(N'2023-09-23' AS Date), 98900, N'Tiên Lữ , Hưng Yên')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (33, 33, CAST(N'2023-09-24' AS Date), 23000, N'Phù Cừ , Hưng Yên')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (34, 34, CAST(N'2023-09-24' AS Date), 231100, N'Văn Giang, Hưng Yên')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (35, 35, CAST(N'2023-09-25' AS Date), 39900, N'Bắc Hồng, Đông Anh , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (36, 36, CAST(N'2023-09-26' AS Date), 320000, N'Cổ Loa, Đông Anh , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (37, 37, CAST(N'2023-09-27' AS Date), 430000, N'Đại Mạch, Đông Anh , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (38, 38, CAST(N'2023-10-01' AS Date), 320000, N'Dục Tú , Đông Anh , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (39, 39, CAST(N'2023-10-02' AS Date), 49900, N'Ngõ 82 Nguyễn Phúc Lai, Đống Đa , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (40, 40, CAST(N'2023-10-03' AS Date), 549000, N'Ngõ 2 Nguyễn Phúc Lai, Đống Đa , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (41, 41, CAST(N'2023-10-05' AS Date), 230000, N'Đường Mai Anh Tuấn , Đống Đa , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (42, 42, CAST(N'2023-05-07' AS Date), 99900, N'Ngõ 133 Thái hà,Đống Đa , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (43, 43, CAST(N'2023-06-08' AS Date), 120000, N'Quốc Tử Giám, Văn Miếu,Đống Đa , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (44, 44, CAST(N'2023-04-04' AS Date), 320000, N'Đường Trần Hữu Tước, Đống Đa , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (45, 45, CAST(N'2024-01-02' AS Date), 120000, N'Ngõ 167 Tây Sơn,Đống Đa , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (46, 46, CAST(N'2024-01-07' AS Date), 120000, N'Ngõ 167 Tây Sơn,Đống Đa , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (47, 47, CAST(N'2024-03-02' AS Date), 320000, N'Bạch Đằng, Hoàn Kiếm , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (48, 48, CAST(N'2024-02-04' AS Date), 210000, N'Bảo Linh , Hoàn Kiếm , Hà Nội')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (49, 49, CAST(N'2024-02-04' AS Date), 1230000, N'Lê Lợi , Q1, TP Hồ Chí Minh')
INSERT [dbo].[Bill] ([BillID], [OrderID], [BillDate], [TaxIN], [Address]) VALUES (50, 50, CAST(N'2024-05-12' AS Date), 3200000, N'Đồng Khởi , Q1, TP Hồ Chí Minh')
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Cases')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (13, N'Cooling System')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'CPU')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'GPU')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'HDD')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (12, N'Keyboard')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (7, N'Mainboard')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (10, N'Monitor')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (11, N'Mouse')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (9, N'PSU')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (8, N'RAM')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'SSD')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'VGA')
GO
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [CommentText], [CommentDate], [ReplyText], [ReplyStaffID]) VALUES (1, 1, 1, N'Sản phẩm này có thiết kế đẹp mắt và hiện đại, tạo cảm giác sang trọng khi sử dụng. Tuy nhiên, tôi cảm thấy hiệu suất của nó không đạt được như mong đợi, đặc biệt là trong việc xử lý các tác vụ nặng', CAST(N'2023-07-15' AS Date), N'Tôi rất đồng ý với bạn về việc sản phẩm có thiết kế đẹp mắt, nhưng cũng đúng là hiệu suất không như mong đợi.', 1)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [CommentText], [CommentDate], [ReplyText], [ReplyStaffID]) VALUES (2, 2, 3, N'Máy tính này có hiệu suất rất ổn định và mạnh mẽ, phù hợp với nhu cầu làm việc và giải trí hàng ngày của tôi. Tuy nhiên, tôi cảm thấy rằng thiết kế của nó hơi cũ kỹ và không có nhiều tính năng tiện ích như các sản phẩm khác trên thị trường.', CAST(N'2023-09-16' AS Date), N'Sản phẩm có hiệu suất ổn định thực sự là một ưu điểm, nhưng thiết kế cũ kỹ có thể cần được cải thiện', 1)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [CommentText], [CommentDate], [ReplyText], [ReplyStaffID]) VALUES (3, 3, 2, N'Tôi rất ấn tượng với độ bền và độ tin cậy của sản phẩm này. Nó đã phục vụ tốt cho nhu cầu làm việc của tôi trong suốt một thời gian dài mà không gặp phải bất kỳ vấn đề nào. Tuy nhiên, tôi cảm thấy giá cả của nó hơi cao so với các sản phẩm tương tự trên thị trường.', CAST(N'2023-03-27' AS Date), N'Tôi cũng đã chia sẻ về những ấn tượng tích cực và tiêu cực của bạn đối với sản phẩm này. Rõ ràng, giá cả có thể là một yếu tố quan trọng.', 1)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [CommentText], [CommentDate], [ReplyText], [ReplyStaffID]) VALUES (4, 5, 5, N'Máy tính này có một loạt các tính năng tiên tiến và hiệu suất mạnh mẽ, làm cho việc làm việc và giải trí trở nên dễ dàng và thoải mái hơn bao giờ hết. Tuy nhiên, tôi đã gặp một số vấn đề kỹ thuật nhỏ sau khi sử dụng một thời gian dài.', CAST(N'2021-01-10' AS Date), N'Cũng giống như bạn, tôi cũng đã gặp một số vấn đề kỹ thuật nhỏ sau một thời gian sử dụng. Hy vọng nhà sản xuất sẽ cải thiện chất lượng hơn.', 1)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [CommentText], [CommentDate], [ReplyText], [ReplyStaffID]) VALUES (5, 6, 6, N'Sản phẩm này có một giao diện người dùng thân thiện và dễ sử dụng, giúp tôi tiết kiệm thời gian và nâng cao hiệu suất làm việc. Tuy nhiên, tôi cảm thấy rằng cấu hình của nó hơi thấp so với giá tiền, và tôi mong muốn có nhiều tùy chọn tùy chỉnh hơn.', CAST(N'2021-01-11' AS Date), N'Thực sự thích cách bạn mô tả sản phẩm. Có lẽ việc cải thiện thiết kế sẽ giúp nó trở nên hoàn hảo hơn.', 1)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [CommentText], [CommentDate], [ReplyText], [ReplyStaffID]) VALUES (6, 7, 12, N'Sản phẩm này có thiết kế nhỏ gọn và tiện lợi, phù hợp với không gian làm việc của tôi. Tuy nhiên, tôi gặp một số khó khăn trong việc cài đặt và sử dụng các tính năng nâng cao.', CAST(N'2023-01-06' AS Date), N'Điều này làm cho việc sử dụng trở nên khó khăn, nhưng tôi hy vọng bạn đã tìm ra giải pháp cho vấn đề này.', 6)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [CommentText], [CommentDate], [ReplyText], [ReplyStaffID]) VALUES (7, 8, 14, N'Tôi rất hài lòng với hiệu suất của sản phẩm này, đặc biệt là trong việc xử lý các ứng dụng đồ họa và game. Tuy nhiên, tôi cảm thấy rằng nó có thể được cải thiện thêm về mặt thiết kế để tạo ra một trải nghiệm người dùng tốt hơn.', CAST(N'2022-08-10' AS Date), N'Đồng tình với bạn về hiệu suất vượt trội của sản phẩm. Tuy nhiên, giá cả có thể là một trở ngại', 6)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [CommentText], [CommentDate], [ReplyText], [ReplyStaffID]) VALUES (8, 9, 15, N'Sản phẩm này có một loạt các tính năng đáng kinh ngạc và hiệu suất vượt trội, làm cho việc sáng tạo và làm việc hiệu quả hơn. Tuy nhiên, giá cả của nó có thể là một rào cản đối với một số người tiêu dùng.', CAST(N'2024-03-02' AS Date), N'Tôi cũng nhận thấy rằng sản phẩm này có một số tính năng độc đáo, nhưng cũng có một số hạn chế.', 6)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [CommentText], [CommentDate], [ReplyText], [ReplyStaffID]) VALUES (9, 10, 16, N'Tôi rất ấn tượng với tính linh hoạt của sản phẩm này, cho phép tôi thực hiện nhiều nhiệm vụ khác nhau một cách dễ dàng. Tuy nhiên, tôi gặp một số vấn đề kỹ thuật nhỏ trong quá trình sử dụng.', CAST(N'2024-03-02' AS Date), N'Chắc chắn rằng sự linh hoạt là một điểm mạnh, nhưng vấn đề kỹ thuật có thể gây phiền toái.', 6)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [CommentText], [CommentDate], [ReplyText], [ReplyStaffID]) VALUES (10, 11, 21, N'Máy tính này có thiết kế đơn giản nhưng hiệu quả, đáp ứng đầy đủ nhu cầu làm việc hàng ngày của tôi. Tuy nhiên, tôi mong muốn nó có thêm một số tính năng tiện ích để nâng cao trải nghiệm sử dụng.', CAST(N'2023-07-09' AS Date), N'Một sản phẩm đơn giản nhưng hiệu quả thật sự có giá trị, tuy nhiên việc thêm tính năng tiện ích cũng là một ý tưởng tốt.', 6)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [CommentText], [CommentDate], [ReplyText], [ReplyStaffID]) VALUES (11, 12, 21, N'CPU này có hiệu suất vượt trội và đáng tin cậy, giúp tôi thực hiện các tác vụ đa nhiệm và chơi game mượt mà. Tuy nhiên, tôi cảm thấy rằng nhiệt độ hoạt động có thể cao hơn một chút trong điều kiện tải nặng.', CAST(N'2024-03-02' AS Date), N'Tôi đồng ý với bạn về hiệu suất của CPU này, nhưng cũng cảm thấy lo ngại về vấn đề nhiệt độ. Hy vọng nhà sản xuất sẽ cải thiện điều này trong các phiên bản sau.', 11)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [CommentText], [CommentDate], [ReplyText], [ReplyStaffID]) VALUES (12, 13, 22, N'Tôi rất hài lòng với sức mạnh và tốc độ xử lý của CPU này. Nó cho phép tôi làm việc hiệu quả hơn và trải nghiệm các ứng dụng đồ họa mạnh mẽ. Tuy nhiên, tiêu thụ năng lượng của nó có thể cao hơn so với một số sản phẩm khác trên thị trường', CAST(N'2024-05-04' AS Date), N'Sự mạnh mẽ và sự ổn định của CPU thật sự là điều tuyệt vời, mặc dù việc tiêu thụ năng lượng có thể là một vấn đề. Tuy nhiên, tôi nghĩ rằng nó đáng giá với hiệu suất mà nó mang lại.', 11)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [CommentText], [CommentDate], [ReplyText], [ReplyStaffID]) VALUES (13, 14, 23, N'CPU này có hiệu suất ổn định và không gây tiếng ồn lớn trong quá trình hoạt động. Tuy nhiên, tôi mong muốn nó có thêm một số tính năng tiện ích như hỗ trợ overclocking để tối ưu hóa hiệu suất.', CAST(N'2024-05-05' AS Date), N'Tính ổn định của CPU là một điểm mạnh, nhưng đúng là nó có thể cải thiện thêm về tính năng. Hy vọng nhà sản xuất sẽ lắng nghe phản hồi của người dùng và cập nhật phần mềm để tối ưu hóa sản phẩm.', 14)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [CommentText], [CommentDate], [ReplyText], [ReplyStaffID]) VALUES (14, 15, 24, N'Sản phẩm này có một số tính năng tiên tiến như công nghệ đa luồng, giúp tăng cường hiệu suất xử lý đa nhiệm. Tuy nhiên, tôi cảm thấy rằng giá cả của nó có thể đắt hơn so với các sản phẩm tương tự', CAST(N'2024-05-06' AS Date), N'Sự tiên tiến của CPU này là rất đáng kinh ngạc, nhưng giá cả có thể là một vấn đề. Tuy nhiên, nếu nó mang lại hiệu suất cao và độ ổn định, thì đó sẽ là một lựa chọn tốt.', 18)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [CommentText], [CommentDate], [ReplyText], [ReplyStaffID]) VALUES (15, 16, 25, N'CPU này mang lại hiệu suất ấn tượng và đáng kinh ngạc, giúp tôi thực hiện các tác vụ nặng một cách mượt mà. Tuy nhiên, tôi đã gặp một số vấn đề kỹ thuật nhỏ như lỗi phần mềm sau khi sử dụng một thời gian dài.', CAST(N'2024-05-06' AS Date), N'Tôi đồng ý với bạn về hiệu suất ấn tượng của CPU, nhưng vấn đề về lỗi phần mềm là một điều đáng lo ngại. Hy vọng nhà sản xuất sẽ cải thiện chất lượng sản phẩm trong tương lai', 19)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [CommentText], [CommentDate], [ReplyText], [ReplyStaffID]) VALUES (16, 17, 61, N'Mainboard này có thiết kế đẹp mắt và tốt đáng khen ngợi, nhưng tôi gặp một số vấn đề về tương thích với các linh kiện khác. Hy vọng rằng nhà sản xuất sẽ cập nhật phần mềm để khắc phục điều này.', CAST(N'2023-09-21' AS Date), N'Tôi hoàn toàn đồng ý với bạn về đánh giá về thiết kế của Mainboard này và cũng mong rằng nhà sản xuất sẽ cải thiện tính tương thích của nó với các linh kiện khác', 21)
INSERT [dbo].[Comment] ([CommentID], [CustomerID], [ProductID], [CommentText], [CommentDate], [ReplyText], [ReplyStaffID]) VALUES (17, 18, 62, N'Tôi rất hài lòng với hiệu suất và tính linh hoạt của Mainboard này. Tuy nhiên, tôi mong muốn nó có thêm một số tính năng tiện ích như hỗ trợ overclocking để tối ưu hóa hiệu suất', CAST(N'2024-02-03' AS Date), N'Tính linh hoạt và hiệu suất của Mainboard thực sự là một điểm mạnh, và việc cập nhật các tính năng tiện ích như hỗ trợ overclocking sẽ thêm phần hấp dẫn.', 23)
GO
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (1, 1, N'098109999', N'Đinh Văn Đông', N'Số 3 đường Lê Hồng Phong , Thành phố Ninh Bình')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (2, 2, N'090910101', N'Đinh Văn Hiếu', N'Số 15 đường Lê Hồng Phong , Thành phố Ninh Bình')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (3, 3, N'065050000', N'Nguyễn Văn Nam', N'Yên Khánh , Ninh Bình ')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (4, 4, N'037565177', N'Nguyễn Thị Dung', N'Khánh An , Yên Khánh , Ninh Bình')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (5, 5, N'037500988', N'Trần Văn Anh', N'Khánh Phú , Yên Khánh , Ninh Bình')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (6, 6, N'035077545', N'Đinh Thị Hoàn', N'Khánh Cư , Yên Khánh , Ninh Bình')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (7, 7, N'034598866', N'Nguyễn Văn Sơn', N'Khánh Thủy , Yên Khánh , Ninh Bình')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (8, 8, N'098904577', N'Nguyễn Thị Xuân', N'Khánh Vân , Yên Khánh , Ninh Bình')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (9, 9, N'035679798', N'Nguyễn Đình Mạnh', N'Số 124 đường Lê Hồng Phong , Thành phố Ninh Bình')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (10, 10, N'038585855', N'Trần Đình Nam', N'37 Nguyễn Thái Học , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (11, 11, N'089888459', N'Lê Văn Ý', N'45 Nguyễn Thái Học , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (12, 12, N'034758585', N'Phùng Văn Nguyên', N'67 Nguyễn Thái Học , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (13, 13, N'057382822', N'Trần Văn Hạnh', N'11 Nguyễn Thái Học , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (14, 14, N'098348484', N'Lê Thị Hạnh', N'28 Hoàng Quốc Việt , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (15, 15, N'037948594', N'Vũ Văn Nam', N'21 Hoàng Quốc Việt , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (16, 16, N'099999833', N'Vũ Thị Lệ', N'20 Hoàng Quốc Việt , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (17, 17, N'090908443', N'Vũ Văn Đông', N'78 Hoàng Quốc Việt , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (18, 18, N'034857484', N'Chu Đức Duyên', N'Sài Sơn , Quốc Oai , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (19, 19, N'039485483', N'Chu Thị Ngọc', N'Phú Cát , Quốc Oai , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (20, 20, N'094747293', N'Phan Văn Nam', N'Phượng Cách , Quốc Oai , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (21, 21, N'034748394', N'Phan Văn Tuấn', N'Yên Sơn , Quốc Oai , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (22, 22, N'097468339', N'Phan Thị  Trinh', N'Ngọc Mỹ , Quốc Oai , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (23, 23, N'037463292', N'Ngô Bảo Châu', N'Ngọc Liệp , Quốc Oai , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (24, 24, N'036483843', N'Ngô Thị Lệ', N'Liệp Tuyết , Quốc Oai , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (25, 25, N'038948474', N'Ngô Bảo Nam', N'Số 3 đường Ninh Sơn , Thành phố Ninh Bình')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (26, 26, N'098743838', N'Đặng Thị Vui', N'Kiến Xương , Thái Bình')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (27, 27, N'038479383', N'Đặng Văn Thanh', N'Thị trấn Đông Hưng, huyện Đông Hưng, tỉnh Thái Bình')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (28, 28, N'093784848', N'Đặng Thành  Nam', N'Thị trấn Hưng Hà, huyện Hưng Hà, tỉnh Thái Bình')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (29, 29, N'067565453', N'Đặng Văn Nghĩa', N'Thị trấn Thanh Nê, huyện Kiến Xương, tỉnh Thái Bình.')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (30, 30, N'028474848', N'Ngô Thị Lành', N'Ân Thi , Hưng Yên')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (31, 31, N'038747383', N'Ngô Văn Nghĩa', N'Mỹ Hào , Hưng Yên')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (32, 32, N'094382393', N'Dương Tú', N'Tiên Lữ , Hưng Yên')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (33, 33, N'093748383', N'Dương Thị Xuân', N'Phù Cừ , Hưng Yên')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (34, 34, N'044728393', N'Lý Nhã Phi', N'Văn Giang, Hưng Yên')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (35, 35, N'090484748', N'Lý Nhã Kì', N'Bắc Hồng, Đông Anh , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (36, 36, N'093743833', N'Lý Văn An', N'Cổ Loa, Đông Anh , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (37, 37, N'076757567', N'Bùi Văn Đông', N'Đại Mạch, Đông Anh , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (38, 38, N'0786754433', N'Bùi Văn Nam', N'Dục Tú , Đông Anh , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (39, 39, N'0382328232', N'Bùi Văn Bắc', N'Ngõ 82 Nguyễn Phúc Lai, Đống Đa , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (40, 40, N'0898998989', N'Bùi Văn Ý', N'Ngõ 2 Nguyễn Phúc Lai, Đống Đa , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (41, 41, N'0897756434', N'Bùi Văn Tuấn', N'Đường Mai Anh Tuấn , Đống Đa , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (42, 42, N'0847478333', N'Võ Thị Sáu', N'Ngõ 133 Thái hà,Đống Đa , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (43, 43, N'0676756453', N'Võ Thị Bay', N'Quốc Tử Giám, Văn Miếu,Đống Đa , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (44, 44, N'0754434222', N'Võ Thị Tam', N'Đường Trần Hữu Tước, Đống Đa , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (45, 45, N'0465654565', N'Võ Thị Chin', N'Ngõ 167 Tây Sơn,Đống Đa , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (46, 46, N'0837464774', N'Võ Văn Nam', N'Bà Triệu , Hoàn Kiếm , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (47, 47, N'0786756565', N'Võ Văn Nhất', N'Bạch Đằng, Hoàn Kiếm , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (48, 48, N'0938464334', N'Đặng Thùy Linh', N'Bảo Linh , Hoàn Kiếm , Hà Nội')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (49, 49, N'0484737438', N'Đặng Văn Chung', N'Lê Lợi , Q1, TP Hồ Chí Minh')
INSERT [dbo].[Customer] ([CustomerID], [AccountID], [Phone], [FullName], [Address]) VALUES (50, 50, N'0899676767', N'Đặng Thị Thúy', N'Đồng Khởi , Q1, TP Hồ Chí Minh')
GO
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (1, N'PC Văn Phòng')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (2, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (3, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (4, N'PC Văn Phòng')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (5, N'PC Văn Phòng')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (6, N'PC Văn Phòng')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (7, N'PC Văn Phòng')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (8, N'PC Văn Phòng')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (9, N'PC Văn Phòng')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (10, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (11, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (12, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (13, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (14, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (15, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (16, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (17, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (18, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (19, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (20, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (21, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (22, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (23, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (24, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (25, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (26, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (27, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (28, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (29, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (30, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (31, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (32, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (33, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (34, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (35, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (36, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (37, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (38, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (39, N'PC Văn Phòng')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (40, N'PC Văn Phòng')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (41, N'PC Văn Phòng')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (42, N'PC Văn Phòng')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (43, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (44, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (45, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (46, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (47, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (48, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (49, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (50, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (51, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (52, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (54, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (55, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (56, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (57, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (58, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (59, N'PC Gaming')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (60, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (61, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (62, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (63, N'PC Học Tập ')
INSERT [dbo].[Groups] ([PCBuildID], [PCType]) VALUES (NULL, NULL)
GO
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (1, 1, CAST(N'2023-03-22' AS Date), N'Delivered', N'Số 3 đường Lê Hồng Phong , Thành phố Ninh Bình', CAST(N'2023-03-24' AS Date), CAST(23320000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (2, 2, CAST(N'2023-03-23' AS Date), N'Delivered', N'Số 15 đường Lê Hồng Phong , Thành phố Ninh Bình', CAST(N'2023-03-24' AS Date), CAST(24677767 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (3, 3, CAST(N'2023-03-23' AS Date), N'Delivered', N'Yên Khánh , Ninh Bình ', CAST(N'2024-03-25' AS Date), CAST(34000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (4, 4, CAST(N'2021-01-01' AS Date), N'Delivered', N'Khánh An , Yên Khánh , Ninh Bình', CAST(N'2021-01-05' AS Date), CAST(32000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (5, 5, CAST(N'2021-01-01' AS Date), N'Delivered', N'Khánh Phú , Yên Khánh , Ninh Bình', CAST(N'2021-01-03' AS Date), CAST(21000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (6, 6, CAST(N'2021-01-01' AS Date), N'Delivered', N'Khánh Cư , Yên Khánh , Ninh Bình', CAST(N'2021-01-03' AS Date), CAST(18000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (7, 7, CAST(N'2023-01-03' AS Date), N'Delivered', N'Khánh Thủy , Yên Khánh , Ninh Bình', CAST(N'2023-01-05' AS Date), CAST(12400000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (8, 8, CAST(N'2022-08-01' AS Date), N'Delivered', N'Khánh Vân , Yên Khánh , Ninh Bình', CAST(N'2022-08-08' AS Date), CAST(12345600 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (9, 9, CAST(N'2023-01-01' AS Date), N'Delivered', N'Số 124 đường Lê Hồng Phong , Thành phố Ninh Bình', CAST(N'2023-01-09' AS Date), CAST(45000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (10, 10, CAST(N'2023-03-02' AS Date), N'Delivered', N'37 Nguyễn Thái Học , Hà Nội', CAST(N'2023-03-04' AS Date), CAST(43000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (11, 11, CAST(N'2022-05-04' AS Date), N'Delivered', N'45 Nguyễn Thái Học , Hà Nội', CAST(N'2022-05-06' AS Date), CAST(18900000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (12, 12, CAST(N'2023-03-02' AS Date), N'Delivered', N'67 Nguyễn Thái Học , Hà Nội', CAST(N'2023-03-07' AS Date), CAST(12340000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (13, 13, CAST(N'2023-02-03' AS Date), N'Delivered', N'11 Nguyễn Thái Học , Hà Nội', CAST(N'2023-02-05' AS Date), CAST(54000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (14, 14, CAST(N'2023-07-08' AS Date), N'Delivered', N'28 Hoàng Quốc Việt , Hà Nội', CAST(N'2023-10-02' AS Date), CAST(32000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (15, 15, CAST(N'2024-01-01' AS Date), N'Delivered', N'21 Hoàng Quốc Việt , Hà Nội', CAST(N'2024-01-03' AS Date), CAST(19800000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (16, 16, CAST(N'2024-03-02' AS Date), N'Delivered', N'20 Hoàng Quốc Việt , Hà Nội', CAST(N'2024-03-04' AS Date), CAST(32000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (17, 17, CAST(N'2024-02-02' AS Date), N'Delivered', N'78 Hoàng Quốc Việt , Hà Nội', CAST(N'2024-02-03' AS Date), CAST(890000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (18, 18, CAST(N'2024-02-03' AS Date), N'Delivered', N'Sài Sơn , Quốc Oai , Hà Nội', CAST(N'2024-02-07' AS Date), CAST(678000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (19, 19, CAST(N'2023-07-06' AS Date), N'Delivered', N'Phú Cát , Quốc Oai , Hà Nội', CAST(N'2023-07-09' AS Date), CAST(599000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (20, 20, CAST(N'2023-07-08' AS Date), N'Delivered', N'Phượng Cách , Quốc Oai , Hà Nội', CAST(N'2023-07-10' AS Date), CAST(400000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (21, 21, CAST(N'2023-07-09' AS Date), N'Delivered', N'Yên Sơn , Quốc Oai , Hà Nội', CAST(N'2023-07-11' AS Date), CAST(899000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (22, 22, CAST(N'2023-07-09' AS Date), N'Delivered', N'Ngọc Mỹ , Quốc Oai , Hà Nội', CAST(N'2023-07-11' AS Date), CAST(546000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (23, 23, CAST(N'2023-07-09' AS Date), N'Delivered', N'Ngọc Liệp , Quốc Oai , Hà Nội', CAST(N'2023-07-11' AS Date), CAST(980000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (24, 24, CAST(N'2023-09-11' AS Date), N'Delivered', N'Liệp Tuyết , Quốc Oai , Hà Nội', CAST(N'2023-09-13' AS Date), CAST(655000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (25, 25, CAST(N'2023-09-12' AS Date), N'Delivered', N'Số 3 đường Ninh Sơn , Thành phố Ninh Bình', CAST(N'2023-09-18' AS Date), CAST(999000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (26, 26, CAST(N'2023-09-13' AS Date), N'Delivered', N'Kiến Xương , Thái Bình', CAST(N'2023-09-13' AS Date), CAST(546000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (27, 27, CAST(N'2023-09-13' AS Date), N'Delivered', N'Thị trấn Đông Hưng, huyện Đông Hưng, tỉnh Thái Bình', CAST(N'2023-09-17' AS Date), CAST(1230000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (28, 28, CAST(N'2023-09-14' AS Date), N'Delivered', N'Thị trấn Hưng Hà, huyện Hưng Hà, tỉnh Thái Bình', CAST(N'2023-09-16' AS Date), CAST(2130000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (29, 29, CAST(N'2023-09-16' AS Date), N'Delivered', N'Thị trấn Thanh Nê, huyện Kiến Xương, tỉnh Thái Bình.', CAST(N'2023-09-19' AS Date), CAST(230000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (30, 30, CAST(N'2023-09-19' AS Date), N'Delivered', N'Ân Thi , Hưng Yên', CAST(N'2023-09-21' AS Date), CAST(4300000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (31, 31, CAST(N'2023-09-20' AS Date), N'Delivered', N'Mỹ Hào , Hưng Yên', CAST(N'2023-09-23' AS Date), CAST(5400000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (32, 32, CAST(N'2023-09-23' AS Date), N'Delivered', N'Tiên Lữ , Hưng Yên', CAST(N'2023-09-27' AS Date), CAST(989000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (33, 33, CAST(N'2023-09-24' AS Date), N'Delivered', N'Phù Cừ , Hưng Yên', CAST(N'2023-09-27' AS Date), CAST(230000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (34, 34, CAST(N'2023-09-24' AS Date), N'Delivered', N'Văn Giang, Hưng Yên', CAST(N'2023-09-29' AS Date), CAST(2311000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (35, 35, CAST(N'2023-09-25' AS Date), N'Delivered', N'Bắc Hồng, Đông Anh , Hà Nội', CAST(N'2023-09-29' AS Date), CAST(399000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (36, 36, CAST(N'2023-09-26' AS Date), N'Delivered', N'Cổ Loa, Đông Anh , Hà Nội', CAST(N'2023-09-28' AS Date), CAST(3200000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (37, 37, CAST(N'2023-09-27' AS Date), N'Delivered', N'Đại Mạch, Đông Anh , Hà Nội', CAST(N'2023-09-30' AS Date), CAST(4300000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (38, 38, CAST(N'2023-10-01' AS Date), N'Delivered', N'Dục Tú , Đông Anh , Hà Nội', CAST(N'2023-10-03' AS Date), CAST(3200000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (39, 39, CAST(N'2023-10-02' AS Date), N'Delivered', N'Ngõ 82 Nguyễn Phúc Lai, Đống Đa , Hà Nội', CAST(N'2023-10-05' AS Date), CAST(499000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (40, 40, CAST(N'2023-10-03' AS Date), N'Delivered', N'Ngõ 2 Nguyễn Phúc Lai, Đống Đa , Hà Nội', CAST(N'2023-10-03' AS Date), CAST(549000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (41, 41, CAST(N'2023-10-05' AS Date), N'Delivered', N'Đường Mai Anh Tuấn , Đống Đa , Hà Nội', CAST(N'2023-10-05' AS Date), CAST(2300000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (42, 42, CAST(N'2023-05-07' AS Date), N'Delivered', N'Ngõ 133 Thái hà,Đống Đa , Hà Nội', CAST(N'2023-05-09' AS Date), CAST(999000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (43, 43, CAST(N'2023-06-08' AS Date), N'Delivered', N'Quốc Tử Giám, Văn Miếu,Đống Đa , Hà Nội', CAST(N'2023-06-09' AS Date), CAST(1200000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (44, 44, CAST(N'2023-04-04' AS Date), N'Delivered', N'Đường Trần Hữu Tước, Đống Đa , Hà Nội', CAST(N'2023-04-07' AS Date), CAST(3200000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (45, 45, CAST(N'2024-01-02' AS Date), N'Delivered', N'Ngõ 167 Tây Sơn,Đống Đa , Hà Nội', CAST(N'2024-01-07' AS Date), CAST(1200000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (46, 46, CAST(N'2024-02-03' AS Date), N'Delivered', N'Bà Triệu , Hoàn Kiếm , Hà Nội', CAST(N'2024-02-06' AS Date), CAST(4330000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (47, 47, CAST(N'2024-03-02' AS Date), N'Delivered', N'Bạch Đằng, Hoàn Kiếm , Hà Nội', CAST(N'2024-03-05' AS Date), CAST(3200000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (48, 48, CAST(N'2024-02-04' AS Date), N'Delivered', N'Bảo Linh , Hoàn Kiếm , Hà Nội', CAST(N'2024-02-06' AS Date), CAST(2100000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (49, 49, CAST(N'2024-02-04' AS Date), N'Delivered', N'Lê Lợi , Q1, TP Hồ Chí Minh', CAST(N'2024-02-12' AS Date), CAST(1230000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([OrderID], [CustomerID], [OrderDate], [OrderStatus], [OrderAddress], [ReceiveDate], [TotalAmount]) VALUES (50, 50, CAST(N'2024-05-12' AS Date), N'Delivered', N'Đồng Khởi , Q1, TP Hồ Chí Minh', CAST(N'2024-05-24' AS Date), CAST(3200000 AS Decimal(18, 0)))
GO
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (1, 1, 1, 1, CAST(234000 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (2, 2, 2, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (3, 3, 3, 1, CAST(120000 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (4, 4, 4, 1, CAST(123000 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (5, 5, 5, 1, CAST(89000 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (6, 6, 6, 1, CAST(78000 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (7, 7, 7, 1, CAST(76000 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (8, 8, 8, 1, CAST(68000 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (9, 9, 9, 1, CAST(98000 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (10, 10, 10, 1, CAST(123000 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (11, 11, 11, 1, CAST(648382 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (12, 12, 12, 1, CAST(242131 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (13, 13, 13, 1, CAST(244342 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (14, 14, 14, 1, CAST(442322 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (15, 15, 15, 1, CAST(434354 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (16, 16, 16, 1, CAST(132455 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (17, 17, 17, 1, CAST(432323 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (18, 18, 18, 1, CAST(434344 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (19, 19, 19, 1, CAST(243434 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (20, 20, 20, 1, CAST(775434 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (21, 21, 21, 1, CAST(354543 AS Decimal(18, 0)))
INSERT [dbo].[OrderItem] ([OrderItemID], [OrderID], [WarrantyID], [Quantity], [PricePerItem]) VALUES (22, 22, 22, 1, CAST(243242 AS Decimal(18, 0)))
GO
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (1, 1, CAST(N'2023-03-23' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (2, 2, CAST(N'2023-04-23' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (3, 3, CAST(N'2023-05-23' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (4, 4, CAST(N'2023-06-23' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (5, 5, CAST(N'2023-03-21' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (6, 6, CAST(N'2021-07-24' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (7, 7, CAST(N'2021-07-24' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (8, 7, CAST(N'2023-05-12' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (9, 7, CAST(N'2023-06-23' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (10, 7, CAST(N'2019-05-23' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (11, 8, CAST(N'2018-04-23' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (12, 9, CAST(N'2020-04-20' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (13, 8, CAST(N'2023-05-20' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (14, 9, CAST(N'2024-05-08' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (15, 9, CAST(N'2019-07-26' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (16, 10, CAST(N'2022-09-23' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (17, 10, CAST(N'2022-05-08' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (18, 10, CAST(N'2021-09-21' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (19, 11, CAST(N'2021-01-11' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (20, 11, CAST(N'2023-07-22' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (21, 11, CAST(N'2023-09-07' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (22, 12, CAST(N'2023-09-09' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (23, 12, CAST(N'2023-03-03' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (24, 13, CAST(N'2024-01-01' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (25, 13, CAST(N'2023-02-21' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (26, 14, CAST(N'2024-03-22' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (27, 15, CAST(N'2023-03-02' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (28, 16, CAST(N'2021-01-02' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (29, 17, CAST(N'2024-04-03' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (30, 18, CAST(N'2023-03-02' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (31, 19, CAST(N'2019-02-20' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (32, 20, CAST(N'2024-03-02' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (33, 21, CAST(N'2023-03-02' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (34, 22, CAST(N'2023-04-04' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (35, 23, CAST(N'2023-04-03' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (36, 24, CAST(N'2019-01-02' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (37, 25, CAST(N'2019-03-02' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (38, 26, CAST(N'2021-08-07' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (39, 27, CAST(N'2023-09-09' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (40, 28, CAST(N'2022-08-08' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (41, 29, CAST(N'2023-07-09' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (42, 30, CAST(N'2023-06-07' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (43, 31, CAST(N'2023-08-09' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (44, 33, CAST(N'2018-02-03' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (45, 32, CAST(N'2024-03-04' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (46, 34, CAST(N'2023-01-02' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (47, 35, CAST(N'2023-04-04' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (48, 36, CAST(N'2023-03-02' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (49, 37, CAST(N'2024-03-04' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (50, 38, CAST(N'2021-01-01' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (51, 39, CAST(N'2019-01-02' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (52, 40, CAST(N'2023-06-05' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (54, 41, CAST(N'2023-09-03' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (55, 42, CAST(N'2023-09-09' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (56, 43, CAST(N'2024-04-03' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (57, 44, CAST(N'2023-04-05' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (58, 45, CAST(N'2023-02-03' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (59, 46, CAST(N'2022-09-09' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (60, 47, CAST(N'2022-04-03' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (61, 48, CAST(N'2023-05-04' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (62, 49, CAST(N'2022-04-04' AS Date))
INSERT [dbo].[PCBuild] ([PCBuildID], [CustomerID], [BuildDate]) VALUES (63, 50, CAST(N'2023-08-09' AS Date))
GO
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (1, 1, 5)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (2, 2, 6)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (3, 3, 6)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (4, 4, 7)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (5, 5, 5)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (6, 6, 3)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (7, 7, 8)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (8, 8, 4)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (9, 9, 7)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (10, 10, 4)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (11, 11, 2)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (12, 12, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (13, 13, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (14, 14, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (15, 15, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (16, 16, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (17, 17, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (18, 18, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (19, 19, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (20, 20, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (21, 21, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (22, 22, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (23, 23, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (24, 24, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (25, 25, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (26, 26, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (27, 27, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (28, 28, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (29, 29, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (30, 30, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (31, 31, 3)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (32, 32, 2)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (33, 33, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (34, 34, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (35, 35, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (36, 36, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (37, 37, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (38, 38, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (39, 39, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (40, 40, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (41, 41, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (42, 42, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (43, 43, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (44, 44, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (45, 45, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (46, 46, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (47, 47, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (48, 48, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (49, 49, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (50, 50, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (51, 51, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (52, 52, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (54, 54, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (55, 55, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (56, 56, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (57, 57, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (58, 58, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (59, 59, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (60, 60, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (61, 61, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (62, 62, 1)
INSERT [dbo].[PCBuildParts] ([PCBuildID], [PartID], [Quantity]) VALUES (63, 63, 1)
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (1, 1, N'Samsung 980 PRO', N'High-speed NVMe SSD, exceptional performance', CAST(200000 AS Decimal(18, 0)), N'1 Year', N'Samsung', N'PCIe 4.0x4', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (2, 1, N'Samsung PM9A1', N'Enterprise-grade NVMe SSD, high performance and reliability', CAST(300000 AS Decimal(18, 0)), N'1 Year', N'Samsung', N'PCIe 4.0x4', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (3, 1, N'Samsung PM981a', N'High-performance NVMe SSD, reliable and efficient', CAST(250000 AS Decimal(18, 0)), N'1 year', N'Samsung', N'PCIe 3.0x4', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (4, 1, N'Samsung PM9B1', N'Reliable NVMe SSD, solid performance and durability', CAST(260000 AS Decimal(18, 0)), N'6 Months', N'Samsung', N'PCIe 3.0x4', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (5, 1, N'Samsung 990 Pro', N'Top-tier NVMe SSD, exceptional speed and reliability', CAST(450000 AS Decimal(18, 0)), N'1 Year', N'Samsung', N'PCIe 4.0x4', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (6, 1, N'Samsung 970 EVO Plus (Phoenix + V5)', N'High-performance NVMe SSD, reliable and fast', CAST(500000 AS Decimal(18, 0)), N'1 Year', N'Samsung', N'PCIe 3.0x4', 6)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (7, 1, N'Western Digital SN850X', N'High-speed NVMe SSD, excellent performance and reliability', CAST(250000 AS Decimal(18, 0)), N'6 Months', N'Toshiba', N'PCIe 4.0x4', 10)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (8, 1, N'Crucial P3 Plus', N'Fast NVMe SSD, reliable and affordable', CAST(270000 AS Decimal(18, 0)), N'6 Months', N'Micron', N'PCIe 4.0x4', 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (9, 1, N'Kingston KC3000 (Micron B47R)', N'High-speed NVMe SSD, reliable performance with Micron technology', CAST(200000 AS Decimal(18, 0)), N'6 Months', N'Micron', N'PCIe 3.0x4', 10)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (10, 1, N'Intel 660p', N'Budget-friendly NVMe SSD, decent performance for the price', CAST(180000 AS Decimal(18, 0)), N'6 Months', N'Micron', N'PCIe 3.0x4', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (11, 2, N'GeForce RTX 4090', N'Cutting-edge GPU, promising top-tier gaming performance and graphics rendering', CAST(300000 AS Decimal(18, 0)), N'6 Months', N'NVIDIA', N'PCIe 4.0x16', 450)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (12, 2, N'GeForce RTX 4060', N'Mid-range GPU, offers solid gaming performance at an affordable price point', CAST(290000 AS Decimal(18, 0)), N'6 Months', N'NVIDIA', N'PCIe 4.0x16', 115)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (13, 2, N'Radeon RX 580', N'Mid-range GPU, delivers good gaming performance and value for its price', CAST(280000 AS Decimal(18, 0)), N'1 Year', N'AMD', N'PCIe 3.0x16', 185)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (14, 2, N'GeForce RTX 3060 12 GB', N'Mid-range GPU, excellent performance for 1080p and 1440p gaming', CAST(300000 AS Decimal(18, 0)), N'2 Year', N'NVIDIA', N'PCIe 4.0x16', 170)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (15, 2, N'GeForce RTX 4070 SUPER	', N'High-end GPU, delivers exceptional gaming performance and graphics quality for enthusiasts', CAST(280000 AS Decimal(18, 0)), N'6 Months', N'NVIDIA', N'PCIe 4.0x16', 285)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (16, 2, N'Radeon RX 6600', N'Mid-range GPU, offers solid gaming performance and value for its price', CAST(200000 AS Decimal(18, 0)), N'6 Months', N'AMD', N'PCIe 3.0x16', 132)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (17, 2, N'GeForce RTX 3070', N'High-performance GPU, ideal for 1440p gaming with ray tracing capabilities', CAST(300000 AS Decimal(18, 0)), N'1 Year', N'NVIDIA', N'PCIe 4.0x16', 220)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (18, 2, N'Radeon 780M', N'Mobile GPU, delivers decent gaming performance for laptops', CAST(200000 AS Decimal(18, 0)), N'6 Months', N'AMD', N'Onboard', 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (19, 2, N'GeForce RTX 4080', N'Next-gen GPU, promises groundbreaking performance and cutting-edge graphics technology', CAST(230000 AS Decimal(18, 0)), N'6 Months', N'NVIDIA', N'PCIe 4.0x16', 320)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (20, 2, N'Radeon RX 7900 GRE', N'High-end GPU, offers exceptional gaming performance and graphics rendering capabilities', CAST(270000 AS Decimal(18, 0)), N'6 Months', N'AMD', N'PCIe 4.0x16', 260)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (21, 3, N'Ryzen 5 5600G', N'Mid-range CPU, delivers solid performance and integrated graphics for mainstream users', CAST(120000 AS Decimal(18, 0)), N'6 Months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (22, 3, N'Ryzen 5 5600', N'High-performance CPU, offering excellent multitasking and gaming capabilities', CAST(130000 AS Decimal(18, 0)), N'6 Months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (23, 3, N'Ryzen 7 7800X3D', N'A fictional hybrid CPU, blending AMD''s Ryzen performance with Intel''s X-series features for enthusiasts seeking top-tier performance', CAST(150000 AS Decimal(18, 0)), N'6 Months', N'AMD/Intel', N'AM5', 120)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (24, 3, N'Ryzen 3 3200G', N'Entry-level CPU with integrated graphics, suitable for budget gaming and everyday tasks', CAST(180000 AS Decimal(18, 0)), N'6 Months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (25, 3, N'A8-7600', N'Entry-level APU, offers basic computing performance and integrated graphics suitable for light tasks', CAST(110000 AS Decimal(18, 0)), N'3 Months', N'AMD', N'FM2+', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (26, 3, N'FX-6300', N'Mid-range CPU, provides decent performance for gaming and multitasking on a budget', CAST(100000 AS Decimal(18, 0)), N'3 Months', N'AMD', N'AM3+', 95)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (27, 3, N'Processor N100', N'Entry-level CPU series, suitable for basic computing tasks like web browsing and light productivity workloads, with low power consumption', CAST(150000 AS Decimal(18, 0)), N'6 Months', N'Intel', N'BGA 1264', 6)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (28, 3, N'Ryzen 5 PRO 4650G', N'Mid-range CPU with integrated graphics, offering strong performance for both productivity and light gaming tasks', CAST(123333 AS Decimal(18, 0)), N'6 Months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (29, 3, N'Ryzen 7 5700X3D', N'Fictional CPU combining Ryzen 7 performance with innovative 3D integration for groundbreaking computing capabilities', CAST(150000 AS Decimal(18, 0)), N'6 Months', N'AMD', N'AM4', 65)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (30, 3, N'Core i9-13900K', N'High-end CPU, offers exceptional performance for gaming and productivity tasks with advanced features and technologies', CAST(180000 AS Decimal(18, 0)), N'6 Months', N'Intel', N' LGA 1700', 125)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (31, 4, N'NZXT H510', N'Sleek mid-tower case with excellent airflow', CAST(1900000 AS Decimal(18, 0)), N'2 Years', N'NZXT ', N'Medium Case', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (32, 4, N'Corsair 4000D Airflow', N'Spacious mid-tower case with superb cooling options', CAST(1800000 AS Decimal(18, 0)), N'2 Years', N'Corsair', N'Medium Case', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (33, 4, N'Fractal Design Meshify C', N'Compact ATX case with optimized airflow', CAST(1700000 AS Decimal(18, 0)), N'3 Years', N'Fractal Design', N'Medium Case', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (34, 4, N'Phanteks Eclipse P400A', N'Stylish mid-tower case with high airflow capabilities', CAST(1600000 AS Decimal(18, 0)), N'2 Years', N'Phanteks', N'Medium Case', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (35, 4, N'Cooler Master MasterBox TD500 Mesh', N'ffordable mid-tower case with mesh front panel for airflow', CAST(1500000 AS Decimal(18, 0)), N'2 Years', N'Cooler Master', N'Large Case', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (36, 4, N'Lian Li Lancool II Mesh', N'Premium mid-tower case with excellent cable management and airflow', CAST(1400000 AS Decimal(18, 0)), N'2 Years', N'Lian Li', N'Large Case', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (37, 4, N'Thermaltake View 51 RGB', N'High-end full-tower case with tempered glass panels and RGB lighting', CAST(2000000 AS Decimal(18, 0)), N'2 Years', N'Thermaltake', N'Medium Case', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (38, 4, N'Be Quiet! Pure Base 500DX', N'Silent mid-tower case with excellent airflow and noise dampening features', CAST(2100000 AS Decimal(18, 0)), N'2 Years', N'Be Quiet!', N'Medium Case', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (39, 4, N'Corsair Crystal Series 680X RGB', N'High-end mid-tower case with tempered glass panels and RGB lighting', CAST(1899999 AS Decimal(18, 0)), N'2 Years', N'Corsair', N'Large Case', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (40, 4, N'MasterCase H500', N'Mid-tower case with a focus on airflow and modular design', CAST(2222222 AS Decimal(18, 0)), N'2 Years', N'Cooler Master', N'Large Case', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (41, 5, N'MI50 16 GB', N'High-performance GPU for data centers, with 16 GB of VRAM', CAST(8999999 AS Decimal(18, 0)), N'3 Months', N'AMD', N'PCIe 3.0', 300)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (42, 5, N'RX 7900 GRE 16 GB', N'High-end gaming GPU with 16 GB of VRAM for exceptional performance.






', CAST(7999999 AS Decimal(18, 0)), N'3 Months', N'Powercolor', N'PCIe 4.0x16', 260)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (43, 5, N'RTX 4070 Ti Super 16 GB', N'High-end gaming GPU with 16 GB of VRAM for exceptional gaming performance', CAST(7890000 AS Decimal(18, 0)), N'3 Months', N'Asus', N'PCIe 4.0x16', 300)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (44, 5, N'RTX 4080 Super 16 GB', N'Cutting-edge GPU offering 16 GB of VRAM for top-tier gaming and graphics rendering', CAST(6999999 AS Decimal(18, 0)), N'3 Months', N'Gigabyte', N'PCIe 4.0x16', 320)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (45, 5, N'RTX 4070 Ti Super 16 GB', N'High-performance gaming GPU with 16 GB of VRAM, delivering exceptional graphics power', CAST(5999999 AS Decimal(18, 0)), N'3 Months', N'Asus', N'PCIe 4.0x16', 300)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (46, 5, N'RTX 4070 Super 12 GB', N'High-performance gaming GPU with 12 GB of VRAM, offering excellent graphics capabilities', CAST(4999999 AS Decimal(18, 0)), N'3 Months', N'Palit', N'PCIe 4.0x16', 285)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (47, 5, N'RX 7900 XTX 24 GB', N'High-end gaming GPU with 24 GB of VRAM, delivering unparalleled gaming performance and graphics power', CAST(5000000 AS Decimal(18, 0)), N'4 Months', N'ASRock', N'PCIe 4.0x16', 355)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (48, 5, N'RTX 4060 Ti 8 GB', N'Mid-range gaming GPU with 8 GB of VRAM, providing solid performance for mainstream gaming', CAST(3999999 AS Decimal(18, 0)), N'3 Months', N'Asus', N'PCIe 4.0x16', 160)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (49, 5, N'RX 7900 XTX 24 GB', N'High-end gaming GPU with 24 GB of VRAM, offering exceptional gaming performance and graphics capabilities', CAST(5999999 AS Decimal(18, 0)), N'3 Months', N'AMD', N'PCIe 4.0x16', 355)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (50, 5, N'RX 7900 GRE 16 GB', N'Imaginary high-performance gaming GPU with 16 GB of VRAM for top-tier gaming experiences', CAST(6900000 AS Decimal(18, 0)), N'3 Months', N'Sapphire', N'PCIe 4.0x16', 260)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (51, 6, N'Western Digital Purple Pro 10TB', N'Reliable, high capacity', CAST(7500000 AS Decimal(18, 0)), N'36 Months', N'Western Digital', N'SATA 3', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (52, 6, N'Western Digital Caviar Black 2TB 64MB Cache', N'Fast, reliable, 64MB cache.', CAST(9000000 AS Decimal(18, 0)), N'36 Months', N'Western Digital', N'SATA 3', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (53, 6, N'WD Red Plus 2TB', N'Reliable, optimized for NAS, 64MB cache.', CAST(4000000 AS Decimal(18, 0)), N'36 Months', N'Western Digital', N'SATA 3', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (54, 6, N'WD Enterprise Ultrastar HC550 16TB', N'High-capacity, high-performance, 512MB cache', CAST(1200000 AS Decimal(18, 0)), N'36  Months', N'Western Digital', N'SATA 3', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (55, 6, N'Seagate IronWolf Pro 8TB', N'NAS optimized, reliable, 3.5" SATA', CAST(3500000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA 3', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (56, 6, N'Seagate IronWolf Pro 6TB', N'NAS-optimized, reliable, 3.5" SATA.', CAST(2200000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA 3', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (57, 6, N'Seagate Barracuda 1TB', N'Workstation powerhouse with dual Intel Xeon processors and high-performance graphics options for demanding Fast, reliable, large cache, 7200RPMtasks.', CAST(2100000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA 3', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (58, 6, N'Seagate IronWolf 4TB', N'NAS optimized, reliable, 5400RPM, 256MB cache', CAST(1900000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA 3', 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (59, 6, N'Seagate Barracuda 4TB', N' Fast, spacious, office-ready', CAST(3200000 AS Decimal(18, 0)), N'60 Months', N'Seagate', N'SATA 3', 9)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (60, 6, N'Samsung SSD 860 EVO 1TB', N'Fast, reliable, suitable for office tasks', CAST(1800000 AS Decimal(18, 0)), N'60 Months', N'Samsung', N'SATA 3', 3)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (61, 7, N'Gigabyte B450 AORUS M', N'Stable, efficient, suitable for office tasks', CAST(3200000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'Micro ATX, AM4, DDR4x4, 64GB, PCIe 3.0x16, PCIe 3.0x4, SATA3, AMD B450M', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (62, 7, N'MSI Pro Series B450M PRO-VDH Max', N'Durable, versatile', CAST(3300000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'Micro ATX, AM4, DDR4x4, 64GB, PCIe 3.0x16, PCIe 3.0x4, SATA3, AMD B450M', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (63, 7, N'ASRock B450M Steel Legend', N'High-quality, reliable', CAST(2800000 AS Decimal(18, 0)), N'36 Months', N'ASRock', N'Micro ATX, AM4, DDR4x4, 64GB, PCIe 3.0x16, PCIe 3.0x4, SATA3, AMD B450M', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (64, 7, N'ASUS ROG Strix Z590-E', N'High-performance, feature-rich', CAST(2500000 AS Decimal(18, 0)), N'36 Months', N'Asus', N'LGA 1200, DDR4x4, 128GB, PCIe 4.0x16, PCIe 4.0x4, SATA3, Intel Z590', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (65, 7, N'MSI MPG B550I Gaming Edge WiFi', N'Compact, powerful', CAST(2399999 AS Decimal(18, 0)), N'36 Months', N'MSI', N'AM4, DDR4 x4, 128GB,  PCIe 4.0x16, PCIe 4.0x4, SATA3, AMD B550M', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (66, 7, N'ASUS Prime B550M-A', N'Reliable, office-ready, feature-rich', CAST(1999999 AS Decimal(18, 0)), N'36 Months', N'Asus', N'Micro ATX, AM4, DDR4x4, 128GB, PCIe 4.0x16, PCIe 3.0x4, SATA3, AMD B550M', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (67, 7, N'Gigabyte Aorus X570 I Pro WiFi', N'Feature-rich, performance-oriented', CAST(3900000 AS Decimal(18, 0)), N'36 Months', N'Gigabyte', N'Mini-ITX, AM4, DDR4x2, 64GB, PCIe 4.0x16, PCIe 4.0x4, SATA3, AMD X570', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (68, 7, N'ASRock B550M-ITX/ac', N'Versatile, reliable', CAST(5900000 AS Decimal(18, 0)), N'36 Months', N'ASRock', N'Mini-ITX, AM4, DDR4x2, 64GB, PCIe 4.0x16, PCIe 4.0x4, SATA3, AMD B550M', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (69, 7, N'ASUS Prime B450M-A', N'Reliable, feature-rich', CAST(4900000 AS Decimal(18, 0)), N'36 Months', N'Asus', N'Micro ATX, AM4, DDR4x4, 64GB, PCIe 3.0x16, PCI e3.0x4, SATA3, AMD B450', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (70, 7, N'MSI Pro Series B450M PRO-VDH Max', N'Durable, versatile', CAST(5900000 AS Decimal(18, 0)), N'36 Months', N'MSI', N'Micro ATX, AM4, DDR4x4, 64GB, PCIe 3.0x16, PCI e3.0x4, SATA3, AMD B450', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (71, 8, N'HyperX Fury DDR4 16GB', N'High-performance, reliable memory module', CAST(4000000 AS Decimal(18, 0)), N'12 Months', N'Kingston', N'DDR4', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (72, 8, N'HyperX Predator DDR4 32GB', N'Fast, high-capacity RAM for gaming and content creation.', CAST(3000000 AS Decimal(18, 0)), N'12 Months', N'Kingston', N'DDR4', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (73, 8, N'ValueRAM DDR4 8GB', N'Budget-friendly, dependable memory option', CAST(3000000 AS Decimal(18, 0)), N'12 Months', N'Kingston', N'DDR4', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (74, 8, N'HyperX Impact DDR4 16GB', N'Low-profile, high-performance RAM for laptops and small form factor PCs.', CAST(2000000 AS Decimal(18, 0)), N'12 Months', N'Kingston', N'DDR4', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (75, 8, N'Vengeance LPX DDR4 16GB', N'High-performance, low-profile memory module', CAST(2500000 AS Decimal(18, 0)), N'12 Months', N'Corsair', N'DDR4', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (76, 8, N'Dominator Platinum RGB DDR4 32GB', N'Premium, high-speed RAM with customizable RGB lighting.', CAST(4800000 AS Decimal(18, 0)), N'12 Months', N'Corsair', N'DDR4', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (77, 8, N'Vengeance RGB Pro DDR4 16GB', N'Stylish, RGB-equipped memory for gaming and enthusiasts.
', CAST(8900000 AS Decimal(18, 0)), N'12 Months', N'Corsair', N'DDR4', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (78, 8, N'ValueSelect DDR4 8GB', N'Reliable, budget-friendly memory option for everyday computing needs.', CAST(2890000 AS Decimal(18, 0)), N'12 Months', N'Corsair', N'DDR4', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (79, 8, N'Crucial Ballistix DDR4 16GB', N'High-performance, reliable memory module', CAST(7690000 AS Decimal(18, 0)), N'12 Months', N'Micron', N'DDR4', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (80, 8, N'Crucial DDR4 32GB', N'Fast, efficient RAM for multitasking and gaming', CAST(8900000 AS Decimal(18, 0)), N'12 Months', N'Micron', N'DDR4', 1)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (81, 9, N'Thor 850W Platinum', N'High-performance PSU with Aura Sync RGB lighting', CAST(4350000 AS Decimal(18, 0)), N'36 Months', N'Asus', N'DDR4', 850)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (82, 9, N'Strix 750W Gold', N'Efficient, reliable power supply for gaming PCs', CAST(8900000 AS Decimal(18, 0)), N'36 Months', N'Asus', N'PSU', 750)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (83, 9, N'Gaming 650W Bronze', N'Durable, budget-friendly PSU for gaming builds', CAST(5432000 AS Decimal(18, 0)), N'36 Months', N'Asus', N'PSU', 650)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (84, 9, N'Strix 850W Titanium', N'Premium, high-efficiency power supply for enthusiasts', CAST(6578900 AS Decimal(18, 0)), N'36 Months', N'Asus', N'PSU', 850)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (85, 9, N'Prime 650W Gold', N'Quiet, stable power supply suitable for a variety of builds.', CAST(3456789 AS Decimal(18, 0)), N'36 Months', N'Asus', N'PSU', 650)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (86, 9, N'Corsair RM750x', N'High stability, Platinum efficiency, quiet operation.', CAST(5430000 AS Decimal(18, 0)), N'36 Months', N'Corsair', N'PSU', 750)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (87, 9, N'Corsair CX650M', N'Bronze efficiency, affordable price, reliable', CAST(6432000 AS Decimal(18, 0)), N'36 Months', N'Corsair', N'PSU', 750)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (88, 9, N'Corsair SF750 Platinum', N'Compact, Platinum efficiency, suitable for mini-ITX systems', CAST(3456000 AS Decimal(18, 0)), N'36 Months', N'Corsair', N'PSU', 750)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (89, 9, N'Corsair TX650M', N'Gold efficiency, high quality, good value.', CAST(6789000 AS Decimal(18, 0)), N'36 Months', N'Corsair', N'PSU', 650)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (90, 9, N'Corsair RM850i', N'Digital control, high efficiency, quiet operation', CAST(4350000 AS Decimal(18, 0)), N'36 Months', N'Corsair', N'PSU', 850)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (91, 10, N'ASUS ROG Swift PG279Q', N'High-performance gaming monitor with NVIDIA G-SYNC technology', CAST(4589900 AS Decimal(18, 0)), N'36 Months', N'Asus', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (92, 10, N'ASUS TUF Gaming VG27AQ', N'Fast IPS panel, high refresh rate, ideal for gaming.', CAST(4267000 AS Decimal(18, 0)), N'36 Months', N'Asus', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (93, 10, N'ASUS ProArt PA278QV', N'Professional-grade monitor with color accuracy for content creators.', CAST(5679900 AS Decimal(18, 0)), N'36 Months', N'Asus', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (94, 10, N'ASUS ZenScreen MB16AC', N'Portable, USB-powered monitor for on-the-go productivity.', CAST(3267000 AS Decimal(18, 0)), N'36 Months', N'Asus', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (95, 10, N'ASUS VA24DQ', N'Affordable, high-quality monitor for everyday computing tasks.', CAST(6789000 AS Decimal(18, 0)), N'36 Months', N'Asus', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (96, 10, N'LG UltraGear 27GL850-B', N'High-performance gaming monitor with Nano IPS technology and NVIDIA G-SYNC compatibility.', CAST(6437000 AS Decimal(18, 0)), N'36 Months', N'LG', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (97, 10, N'LG 27UK850-W', N'4K UHD monitor with HDR10 support, ideal for content creation and multimedia consumption.', CAST(4567800 AS Decimal(18, 0)), N'36 Months', N'LG', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (98, 10, N'LG 34WK95U-W', N'UltraWide 5K2K monitor with Nano IPS panel, perfect for multitasking and creative work.', CAST(12980000 AS Decimal(18, 0)), N'36 Months', N'LG', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (99, 10, N'MSI Optix MAG271CQR', N'Curved gaming monitor with WQHD resolution and 144Hz refresh rate for immersive gaming experience.', CAST(3200000 AS Decimal(18, 0)), N'36 Months', N'MSI', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (100, 10, N'MSI Optix G271', N'Full HD gaming monitor with IPS panel, 144Hz refresh rate, and 1ms response time for smooth gaming visuals.', CAST(7230000 AS Decimal(18, 0)), N'36 Months', N'MSI', NULL, 0)
GO
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (101, 10, N'MSI Optix MPG341CQR', N'UltraWide gaming monitor with UWQHD resolution, 144Hz refresh rate, and RGB lighting for immersive gaming.', CAST(4620000 AS Decimal(18, 0)), N'36 Months', N'MSI', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (102, 10, N'MSI Optix MAG251RX', N'eSports gaming monitor with Full HD resolution, 240Hz refresh rate, and NVIDIA G-SYNC compatibility for competitive gaming', CAST(7210000 AS Decimal(18, 0)), N'36 Months', N'MSI', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (103, 10, N'MSI Prestige PS341WU', N'Professional-grade monitor with 5K2K resolution, IPS panel, and DCI-P3 color gamut for content creation and design work.', CAST(5109000 AS Decimal(18, 0)), N'36 Months', N'MSI', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (104, 11, N'MSI Clutch GM41', N'Lightweight gaming mouse with high-performance PixArt sensor and customizable RGB lighting.', CAST(1235000 AS Decimal(18, 0)), N'24 Months', N'MSI', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (105, 11, N'MSI Clutch GM50', N'Ergonomic gaming mouse with customizable DPI settings and durable switches for long gaming sessions.', CAST(608000 AS Decimal(18, 0)), N'24 Months', N'MSI', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (106, 11, N'MSI Clutch GM30', N'Ambidextrous gaming mouse with symmetrical design, customizable RGB lighting, and high-precision sensor.', CAST(2300000 AS Decimal(18, 0)), N'24 Months', N'MSI', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (107, 11, N'MSI Clutch GM11', N'Budget-friendly gaming mouse with customizable DPI settings and durable construction for casual gaming.', CAST(3210000 AS Decimal(18, 0)), N'24 Months', N'MSI', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (108, 11, N'MSI Clutch GM10', N'Entry-level gaming mouse with precise optical sensor and ergonomic design for comfortable use.', CAST(2100000 AS Decimal(18, 0)), N'24 Months', N'MSI', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (109, 11, N'ASUS ROG Gladius III', N'High-performance gaming mouse with 19,000 DPI optical sensor and customizable Aura Sync RGB lighting.', CAST(3100000 AS Decimal(18, 0)), N'12 Months', N'Asus', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (110, 11, N'ASUS ROG Pugio II', N'Ambidextrous gaming mouse with swappable side buttons and wireless connectivity for versatile gaming.', CAST(2140000 AS Decimal(18, 0)), N'12 Months', N'Asus', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (111, 11, N'ASUS ROG Strix Impact II', N'Lightweight gaming mouse with 6,200 DPI sensor and customizable RGB lighting, suitable for FPS gaming.', CAST(4190000 AS Decimal(18, 0)), N'12 Months', N'Asus', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (112, 11, N'ASUS TUF Gaming M3', N'Durable gaming mouse with 7,200 DPI sensor and ergonomic design for comfortable gaming sessions.', CAST(598000 AS Decimal(18, 0)), N'12 Months', N'Asus', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (113, 11, N'ASUS ROG Keris Wireless', N'Ultra-lightweight wireless gaming mouse with 16,000 DPI sensor and swappable button covers for customizable grip.', CAST(1120000 AS Decimal(18, 0)), N'12 Months', N'Asus', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (114, 11, N'Microsoft Sculpt Ergonomic Mouse', N'Comfortable, ergonomic design to reduce strain on the wrist during long hours of use.', CAST(589000 AS Decimal(18, 0)), N'6 Months', N'Microsoft', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (115, 11, N'Microsoft Bluetooth Mobile Mouse 3600', N'Compact, wireless mouse with Bluetooth connectivity for on-the-go productivity.', CAST(678000 AS Decimal(18, 0)), N'6 Months', N'Microsoft', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (116, 11, N'Microsoft Classic IntelliMouse', N'Timeless design with modern features, suitable for everyday office tasks.', CAST(468000 AS Decimal(18, 0)), N'6 Months', N'Microsoft', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (117, 11, N'Microsoft Surface Precision Mouse', N'Premium, customizable mouse with adjustable DPI settings and programmable buttons for precise control and productivity.', CAST(1230000 AS Decimal(18, 0)), N'6 Months', N'Microsoft', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (118, 11, N'Fuhlen M53S Silent Wireless Black', N'wireless mouse with silent operation, perfect for office environments. Its sleek black design, combined with silent switches, minimizes noise. With wireless connectivity, it offers freedom of movement', CAST(354000 AS Decimal(18, 0)), N'6 Months', N'Fuhlen', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (119, 11, N'Fuhlen G60S Pro', N'gaming mouse designed for high-performance gaming. With its ergonomic design and customizable RGB lighting, it offers both style and comfort during extended gaming sessions. ', CAST(290000 AS Decimal(18, 0)), N'12 Months', N'Fuhlen', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (120, 11, N'Fuhlen T90S Wireless Mix', N'versatile wireless mouse suitable for various tasks. Its ergonomic design ensures comfortable usage, while wireless connectivity provides freedom of movement. With a mix of functionality, it''s suitable for both office work and casual browsing', CAST(899000 AS Decimal(18, 0)), N'12 Months', N'Fuhlen', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (121, 11, N'Fuhlen T90S Wireless Black', N'sleek and versatile wireless mouse designed for everyday use. With its ergonomic design, it provides comfortable handling during extended periods of use.', CAST(453000 AS Decimal(18, 0)), N'12 Months', N'Fuhlen', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (122, 12, N'Corsair K95 RGB Platinum XT', N'Premium mechanical keyboard with customizable RGB lighting and dedicated macro keys for gaming enthusiasts.', CAST(1340000 AS Decimal(18, 0)), N'12 Months', N'Corsair', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (123, 12, N'Corsair K70 RGB MK.2', N'High-performance mechanical keyboard with per-key RGB backlighting and aluminum frame for durability.', CAST(2310000 AS Decimal(18, 0)), N'12 Months', N'Corsair', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (124, 12, N'Corsair Strafe RGB MK.2', N'Mechanical gaming keyboard with Cherry MX switches and dynamic RGB backlighting for immersive gaming experiences.', CAST(4210000 AS Decimal(18, 0)), N'12 Months', N'Corsair', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (125, 12, N'Corsair K55 RGB', N'Membrane gaming keyboard with customizable RGB lighting and dedicated macro keys, suitable for budget-conscious gamers.', CAST(2100000 AS Decimal(18, 0)), N'12 Months', N'Corsair', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (126, 12, N'Corsair K65 RGB Mini', N'NULLCompact 60% mechanical gaming keyboard with customizable RGB lighting and detachable USB-C cable for portability.', CAST(2156000 AS Decimal(18, 0)), N'12 Months', N'Corsair', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (127, 12, N'Corsair K68 RGB', N'Water-resistant mechanical gaming keyboard with Cherry MX switches and per-key RGB backlighting for durability and style.', CAST(4120000 AS Decimal(18, 0)), N'12 Months', N'Corsair', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (128, 12, N'MonsGeek MG75 Black & Cyan Akko V3 Cream Blue switch', N'Membrane keyboard with customizable RGB lighting and dedicated media keys, suitable for everyday office use.', CAST(455000 AS Decimal(18, 0)), N'12 Months', N'AKKO', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (129, 12, N'MonsGeek MG75 Prunus Lannesiana Akko V3 Cream Blue switch', N'Compact wireless keyboard with Cherry MX switches and customizable blue backlighting, ideal for clutter-free workspace.', CAST(545000 AS Decimal(18, 0)), N'12 Months', N'AKKO', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (130, 12, N'MonsGeek MG108 Black & Cyan Akko CS Wine White switch', N'Low-profile mechanical keyboard with Cherry MX Low Profile switches and per-key RGB backlighting, perfect for typing comfort in the office.', CAST(999999 AS Decimal(18, 0)), N'12 Months', N'AKKO', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (131, 12, N'MonsGeek MG75 Prunus Lannesiana Akko V3 Cream Yellow switch', N'Full-size mechanical keyboard with Cherry MX switches and customizable RGB lighting, designed for productivity and gaming versatility.', CAST(898000 AS Decimal(18, 0)), N'12 Months', N'AKKO', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (132, 12, N'MonsGeek MG108 Black & Cyan Akko CS Wine Red switch', N'Mechanical keyboard with Cherry MX switches and dynamic RGB backlighting, offering reliable performance for office tasks.', CAST(768000 AS Decimal(18, 0)), N'12 Months', N'AKKO', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (133, 12, N'Wireless Keyboard', N'Reliable wireless keyboard with long battery life and comfortable typing experience, perfect for everyday use at an affordable price.', CAST(354000 AS Decimal(18, 0)), N'12 Months', N'Logitech', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (134, 12, N'Logitech K120 Wired Keyboard', N'Standard wired keyboard with durable keys and spill-resistant design, suitable for basic typing tasks at an economical price point.', CAST(656000 AS Decimal(18, 0)), N'12 Months', N'Logitech', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (135, 12, N'Logitech K360 Wireless Keyboard', N'Compact wireless keyboard with stylish design and convenient media keys, providing a clutter-free workspace at an affordable price.', CAST(767000 AS Decimal(18, 0)), N'12 Months', N'Logitech', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (136, 12, N'Logitech K480 Bluetooth Multi-Device Keyboard', N'Versatile Bluetooth keyboard that can connect to multiple devices simultaneously, featuring a built-in cradle for smartphones and tablets, making it a practical choice for multitasking users.', CAST(656000 AS Decimal(18, 0)), N'12 Months', N'Logitech', NULL, 0)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (137, 13, N'ASUS ROG Ryujin 360', N'This all-in-one liquid cooler features a 360mm radiator and customizable OLED display. With its high-quality build and excellent cooling performance, it''s a top choice for enthusiasts.', CAST(789000 AS Decimal(18, 0)), N'24 Months', N'Asus', NULL, 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (138, 13, N'ASUS ROG Ryuo 240', N'Similar to the Ryujin series, the Ryuo 240 is a liquid cooler with a 240mm radiator and customizable OLED display. It offers good cooling performance and a sleek design.', CAST(789000 AS Decimal(18, 0)), N'24 Months', N'Asus', NULL, 4)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (139, 13, N'ASUS ROG Strix LC 240', N'This liquid cooler features a 240mm radiator and RGB lighting, providing efficient cooling for your CPU while adding flair to your system.', CAST(989000 AS Decimal(18, 0)), N'24 Months', N'Asus', NULL, 3)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (140, 13, N'ASUS TUF Gaming LC 240 RGB', N'With a 240mm radiator and RGB lighting, this cooler delivers solid performance and aesthetics at a more budget-friendly price point.', CAST(767000 AS Decimal(18, 0)), N'24 Months', N'Asus', NULL, 3)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (141, 13, N'ASUS ROG Strix LC 360 RGB', N'For those needing maximum cooling capacity, this liquid cooler with a 360mm radiator and RGB lighting provides excellent performance for high-end systems.', CAST(897000 AS Decimal(18, 0)), N'24 Months', N'Asus', NULL, 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (142, 13, N'ASUS ROG Strix LC 120 RGB', N'This compact liquid cooler with a 120mm radiator is suitable for smaller cases or as a supplementary cooling solution.', CAST(579900 AS Decimal(18, 0)), N'24 Months', N'Asus', NULL, 3)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (143, 13, N'ASUS ROG Ryujin 240', N'Similar to the Ryujin 360, this AIO cooler features a 240mm radiator and customizable OLED display. It''s a reliable choice for cooling your CPU while adding aesthetic appeal to your build.', CAST(999999 AS Decimal(18, 0)), N'24 Months', N'Asus', NULL, 7)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (144, 13, N'Corsair Hydro Series H100i RGB Platinum', N'This all-in-one liquid cooler features a 240mm radiator and vibrant RGB lighting. With its excellent cooling performance and customizable aesthetics, it''s a popular choice among gamers and enthusiasts.', CAST(1123000 AS Decimal(18, 0)), N'24 Months', N'Corsair', NULL, 4)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (145, 13, N'Corsair Hydro Series H115i RGB Platinum', N'Similar to the H100i, this AIO liquid cooler offers a larger 280mm radiator for enhanced cooling capacity. It''s ideal for high-end gaming rigs and overclocked systems.', CAST(1320000 AS Decimal(18, 0)), N'24 Months', N'Corsair', NULL, 4)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (146, 13, N'Corsair Hydro Series H60', N'A compact and affordable liquid cooler with a 120mm radiator, providing efficient CPU cooling for smaller form factor builds or budget-conscious users.', CAST(1330000 AS Decimal(18, 0)), N'24 Months', N'Corsair', NULL, 3)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (147, 13, N'Corsair Hydro Series H150i PRO', N'This premium AIO liquid cooler boasts a massive 360mm radiator and customizable RGB lighting. It delivers exceptional cooling performance for demanding applications and intense gaming sessions.', CAST(2110000 AS Decimal(18, 0)), N'24 Months', N'Corsair', NULL, 4)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (148, 13, N'Corsair Hydro Series H80i v2', N'Featuring a 120mm radiator and dual fans in a push-pull configuration, this liquid cooler offers efficient CPU cooling while maintaining a compact footprint.', CAST(1890000 AS Decimal(18, 0)), N'24 Months', N'Corsair', NULL, 5)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (149, 13, N'NZXT Kraken X73', N'This all-in-one liquid cooler features a 360mm radiator and customizable RGB lighting. With its large radiator size and sleek design, it offers excellent cooling performance for high-end gaming systems.', CAST(567999 AS Decimal(18, 0)), N'24 Months', N'Coolermaster', NULL, 4)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (150, 13, N'NZXT Kraken X63', N'Similar to the X73, this AIO liquid cooler comes with a 280mm radiator, providing efficient cooling for overclocked CPUs while offering customizable RGB lighting for aesthetic appeal.', CAST(765000 AS Decimal(18, 0)), N'24 Months', N'Coolermaster', NULL, 4)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (151, 13, N'NZXT Kraken M22', N'A compact liquid cooler with a 120mm radiator, ideal for smaller form factor builds. Despite its size, it offers good cooling performance and features RGB lighting for added flair.', CAST(757000 AS Decimal(18, 0)), N'24 Months', N'Coolermaster', NULL, 4)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (152, 13, N'NZXT Kraken Z73', N'Featuring a 360mm radiator and an LCD display on the pump head, this AIO liquid cooler combines performance with style. It''s a premium option for users looking for both functionality and visual customization.', CAST(999999 AS Decimal(18, 0)), N'24 Months', N'Coolermaster', NULL, 4)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Description], [Price], [Warranty], [Brand], [Tag], [TDP]) VALUES (153, 1, N'Samsung PM9A1', N'An excellent choice for those needing a high-performance and durable SSD. ', CAST(767676 AS Decimal(18, 0)), N'24 Months ', N'Samsung', N'PCIe 4.0x4', 9)
GO
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (1, 1, 1, 23)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (2, 2, 2, 22)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (3, 3, 1, 23)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (4, 2, 1, 34)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (5, 4, 1, 22)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (6, 5, 1, 21)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (7, 6, 1, 22)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (8, 7, 1, 21)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (9, 8, 1, 23)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (10, 9, 1, 6)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (11, 10, 1, 8)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (12, 11, 1, 9)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (13, 12, 1, 6)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (14, 13, 1, 5)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (15, 14, 1, 9)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (16, 15, 1, 6)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (17, 16, 1, 131)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (18, 20, 1, 9)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (19, 21, 1, 15)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (20, 22, 1, 15)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (21, 23, 1, 12)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (22, 24, 1, 5)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (23, 25, 1, 8)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (24, 26, 1, 9)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (25, 27, 1, 9)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (26, 28, 1, 8)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (27, 30, 1, 9)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (28, 31, 1, 6)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (29, 32, 1, 121)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (30, 33, 1, 9)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (31, 33, 1, 7)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (32, 35, 1, 43)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (33, 36, 1, 8)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (34, 37, 1, 8)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (35, 39, 1, 12)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (36, 40, 1, 16)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (37, 41, 1, 17)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (38, 42, 1, 7)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (39, 43, 1, 12)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (40, 44, 1, 32)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (41, 45, 1, 32)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (42, 46, 1, 24)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (43, 47, 1, 12)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (44, 48, 1, 17)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (45, 49, 1, 17)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (46, 50, 1, 14)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (47, 51, 1, 100)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (48, 52, 1, 23)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (49, 53, 1, 23)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (50, 54, 1, 2)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (51, 55, 1, 8)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (52, 56, 1, 100)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (53, 57, 1, 7)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (54, 58, 1, 9)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (55, 59, 1, 9)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (56, 60, 1, 13)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (57, 61, 1, 18)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (58, 62, 1, 15)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (59, 64, 1, 17)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (60, 66, 1, 12)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (61, 68, 1, 18)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (62, 70, 1, 17)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (63, 71, 1, 16)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (64, 73, 1, 19)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (65, 75, 1, 27)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (66, 77, 1, 16)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (67, 79, 1, 34)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (68, 63, 1, 23)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (69, 65, 1, 24)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (70, 67, 1, 23)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (71, 69, 1, 22)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (72, 72, 1, 22)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (73, 74, 1, 22)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (74, 76, 1, 99)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (75, 78, 1, 24)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (76, 80, 1, 22)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (77, 81, 1, 15)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (78, 82, 1, 17)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (79, 83, 1, 12)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (80, 84, 1, 156)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (81, 85, 1, 17)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (82, 86, 1, 34)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (83, 87, 1, 23)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (84, 88, 1, 24)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (85, 89, 1, 11)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (86, 90, 1, 15)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (87, 91, 1, 15)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (88, 92, 1, 15)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (89, 93, 1, 16)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (90, 94, 1, 15)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (91, 95, 1, 17)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (92, 96, 1, 15)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (93, 97, 1, 19)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (94, 98, 1, 165)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (95, 99, 1, 15)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (96, 100, 1, 17)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (97, 101, 1, 14)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (98, 102, 1, 14)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (99, 103, 1, 18)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (100, 104, 1, 21)
GO
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (101, 105, 1, 24)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (102, 106, 1, 16)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (103, 107, 1, 10)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (104, 108, 1, 15)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (105, 109, 1, 19)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (106, 110, 1, 89)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (107, 111, 1, 21)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (108, 112, 1, 21)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (109, 113, 1, 12)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (110, 114, 1, 16)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (111, 115, 1, 12)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (112, 116, 1, 101)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (113, 117, 1, 16)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (114, 118, 1, 16)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (115, 119, 1, 15)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (116, 120, 1, 18)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (117, 121, 1, 18)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (118, 122, 1, 134)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (119, 123, 1, 14)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (120, 124, 1, 13)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (121, 125, 1, 15)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (122, 126, 1, 16)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (123, 127, 1, 15)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (124, 128, 1, 98)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (125, 129, 1, 14)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (126, 130, 1, 7)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (127, 131, 1, 8)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (128, 132, 1, 13)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (129, 133, 1, 101)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (130, 134, 1, 14)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (131, 135, 1, 15)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (132, 136, 1, 14)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (133, 137, 1, 14)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (134, 138, 1, 15)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (135, 139, 1, 14)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (136, 140, 1, 18)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (137, 141, 1, 87)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (138, 142, 1, 98)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (139, 143, 1, 14)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (140, 144, 1, 12)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (141, 145, 1, 12)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (142, 146, 1, 15)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (143, 147, 1, 11)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (144, 148, 1, 12)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (145, 149, 1, 9)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (146, 150, 1, 7)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (147, 151, 1, 9)
INSERT [dbo].[ProductStore] ([ProductStoreID], [ProductID], [StoreID], [StockQuantity]) VALUES (148, 152, 1, 14)
GO
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (1, 1, CAST(N'2023-03-02' AS Date), CAST(N'2023-03-04' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (2, 2, CAST(N'2023-03-21' AS Date), CAST(N'2023-03-24' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (3, 3, CAST(N'2023-03-20' AS Date), CAST(N'2023-03-26' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (4, 4, CAST(N'2023-03-23' AS Date), CAST(N'2023-03-29' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (5, 5, CAST(N'2023-03-29' AS Date), CAST(N'2023-04-03' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (6, 6, CAST(N'2023-04-03' AS Date), CAST(N'2023-04-08' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (7, 7, CAST(N'2023-04-03' AS Date), CAST(N'2023-04-09' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (8, 8, CAST(N'2023-04-01' AS Date), CAST(N'2023-04-03' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (9, 9, CAST(N'2023-04-09' AS Date), CAST(N'2023-04-13' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (10, 10, CAST(N'2023-04-06' AS Date), CAST(N'2023-04-10' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (11, 11, CAST(N'2023-04-11' AS Date), CAST(N'2023-04-15' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (12, 12, CAST(N'2023-04-11' AS Date), CAST(N'2023-04-16' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (13, 13, CAST(N'2023-01-01' AS Date), CAST(N'2023-01-06' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (14, 14, CAST(N'2023-02-01' AS Date), CAST(N'2023-03-01' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (15, 15, CAST(N'2023-01-10' AS Date), CAST(N'2023-01-14' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (16, 16, CAST(N'2023-01-11' AS Date), CAST(N'2023-01-17' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (17, 17, CAST(N'2023-01-12' AS Date), CAST(N'2023-01-18' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (18, 18, CAST(N'2023-01-14' AS Date), CAST(N'2023-01-19' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (19, 19, CAST(N'2023-01-15' AS Date), CAST(N'2023-01-19' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (20, 20, CAST(N'2023-01-13' AS Date), CAST(N'2023-01-19' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (21, 21, CAST(N'2023-01-14' AS Date), CAST(N'2023-01-18' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (22, 22, CAST(N'2023-02-01' AS Date), CAST(N'2023-02-05' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (23, 23, CAST(N'2023-02-03' AS Date), CAST(N'2023-02-09' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (24, 24, CAST(N'2023-02-04' AS Date), CAST(N'2023-02-09' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (25, 25, CAST(N'2023-02-06' AS Date), CAST(N'2023-02-10' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (26, 26, CAST(N'2023-02-08' AS Date), CAST(N'2023-02-12' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (27, 27, CAST(N'2023-02-10' AS Date), CAST(N'2023-02-15' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (28, 28, CAST(N'2023-02-11' AS Date), CAST(N'2023-02-17' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (29, 29, CAST(N'2023-02-12' AS Date), CAST(N'2023-02-18' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (30, 30, CAST(N'2023-02-14' AS Date), CAST(N'2023-02-19' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (31, 31, CAST(N'2023-02-01' AS Date), CAST(N'2023-02-14' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (32, 32, CAST(N'2023-02-11' AS Date), CAST(N'2023-02-19' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (33, 33, CAST(N'2023-03-01' AS Date), CAST(N'2023-03-10' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (34, 34, CAST(N'2023-03-02' AS Date), CAST(N'2023-03-09' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (35, 35, CAST(N'2023-03-04' AS Date), CAST(N'2023-03-11' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (36, 36, CAST(N'2023-03-05' AS Date), CAST(N'2023-03-12' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (37, 37, CAST(N'2023-03-05' AS Date), CAST(N'2023-03-14' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (38, 38, CAST(N'2023-03-06' AS Date), CAST(N'2023-03-10' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (39, 39, CAST(N'2024-03-01' AS Date), CAST(N'2024-03-10' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (40, 40, CAST(N'2024-03-02' AS Date), CAST(N'2024-03-11' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (41, 41, CAST(N'2024-03-08' AS Date), CAST(N'2024-03-17' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (42, 42, CAST(N'2024-03-10' AS Date), CAST(N'2024-03-19' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (43, 43, CAST(N'2024-03-07' AS Date), CAST(N'2024-03-14' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (44, 44, CAST(N'2024-03-09' AS Date), CAST(N'2024-03-19' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (45, 45, CAST(N'2024-03-11' AS Date), CAST(N'2024-03-20' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (46, 46, CAST(N'2024-03-20' AS Date), CAST(N'2024-03-26' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (47, 47, CAST(N'2024-03-21' AS Date), CAST(N'2024-03-29' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (48, 48, CAST(N'2024-03-22' AS Date), CAST(N'2024-03-29' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (49, 49, CAST(N'2024-04-20' AS Date), CAST(N'2024-04-25' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (50, 50, CAST(N'2024-04-25' AS Date), CAST(N'2024-04-29' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (51, 51, CAST(N'2024-04-25' AS Date), CAST(N'2024-04-30' AS Date))
INSERT [dbo].[ProductWarranty] ([WarrantyID], [ProductID], [WarrantySentDate], [WarrantyReceive]) VALUES (52, 52, CAST(N'2024-04-23' AS Date), CAST(N'2024-04-30' AS Date))
GO
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (1, 1, 1, N'Đinh Văn Đông')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (2, 2, 1, N'Bùi Văn Duyên')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (3, 3, 1, N'Nguyễn Văn Mạnh')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (4, 4, 1, N'Trần Văn Nam')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (5, 5, 2, N'Đinh Văn Phong')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (6, 6, 2, N'Nguyễn Văn Phát')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (7, 7, 2, N'Phùng Văn Kiên')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (8, 8, 2, N'Trần Thị Hoa')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (9, 9, 3, N'Phạm Thị Tuyết')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (10, 10, 3, N'Nguyễn Văn Tú')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (11, 11, 3, N'Trần Thị Tuyết')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (12, 12, 3, N'Phùng Xuân Nam')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (13, 13, 4, N'Nguyễn Thị Xuân')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (14, 14, 4, N'Đinh Huyền Diệp')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (15, 15, 4, N'Trần Mai Hoa')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (16, 16, 4, N'Nguyễn Văn Hùng')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (17, 17, 5, N'Đinh Văn Mạnh')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (18, 18, 5, N'Nguyễn Văn Mạnh')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (19, 19, 5, N'Nguyễn Thị Đào')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (20, 20, 5, N'Phùng Xuân Nhã')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (21, 21, 5, N'Lý Thị Xuân')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (22, 22, 5, N'Lý Văn Nam')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (23, 23, 5, N'Đinh Văn Nam')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (24, 24, 4, N'Nguyễn Mạnh Tuấn')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (25, 25, 4, N'Trần Văn Ánh')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (26, 26, 4, N'Khuất Thị Minh Ánh')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (27, 27, 4, N'Đinh Văn Kiên')
INSERT [dbo].[Staff] ([StaffID], [AccountID], [StoreID], [FullName]) VALUES (28, 28, 4, N'Nguyễn Tuấn Anh')
GO
INSERT [dbo].[Store] ([StoreID], [StoreName], [Address]) VALUES (1, N'An Phat Computer', N'151 Lê Thanh Nghị ,Hà Nội')
INSERT [dbo].[Store] ([StoreID], [StoreName], [Address]) VALUES (2, N'Media Mart', N'218 Đội Cấn')
INSERT [dbo].[Store] ([StoreID], [StoreName], [Address]) VALUES (3, N'Nguyen Kim', N'19 Nguyễn Chí Thanh , Ba Đình , Hà Nội')
INSERT [dbo].[Store] ([StoreID], [StoreName], [Address]) VALUES (4, N'Dien May Xanh', N'188 Trương Định')
INSERT [dbo].[Store] ([StoreID], [StoreName], [Address]) VALUES (5, N'PICO', N'173 Xuân Thủy ')
INSERT [dbo].[Store] ([StoreID], [StoreName], [Address]) VALUES (6, N'DigiCity', N'277 Nguyễn Trãi')
INSERT [dbo].[Store] ([StoreID], [StoreName], [Address]) VALUES (7, N'Eco-Mart', N'77 Phạm Văn Đồng')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__536C85E464BFAA45]    Script Date: 6/10/2024 1:53:56 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UQ__Account__536C85E464BFAA45] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__A9D10534B0F23F3E]    Script Date: 6/10/2024 1:53:56 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UQ__Account__A9D10534B0F23F3E] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Category__8517B2E0AC3FDE42]    Script Date: 6/10/2024 1:53:56 PM ******/
ALTER TABLE [dbo].[Category] ADD UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Customer__349DA5871C1D1A42]    Script Date: 6/10/2024 1:53:56 PM ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UQ__Customer__349DA5871C1D1A42] UNIQUE NONCLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__5C7E359EC8E057B8]    Script Date: 6/10/2024 1:53:56 PM ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UQ__Customer__5C7E359EC8E057B8] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Staff__349DA58773975858]    Script Date: 6/10/2024 1:53:56 PM ******/
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
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
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
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD FOREIGN KEY([PCBuildID])
REFERENCES [dbo].[PCBuild] ([PCBuildID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__CustomerI__05D8E0BE] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__CustomerI__05D8E0BE]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([WarrantyID])
REFERENCES [dbo].[ProductWarranty] ([WarrantyID])
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
ALTER TABLE [dbo].[PCBuildParts]  WITH CHECK ADD FOREIGN KEY([PCBuildID])
REFERENCES [dbo].[PCBuild] ([PCBuildID])
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
