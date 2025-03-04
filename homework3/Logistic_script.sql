USE [master]
GO
/****** Object:  Database [Logistic]    Script Date: 10.02.2025 16:18:19 ******/
CREATE DATABASE [Logistic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Logistic', FILENAME = N'D:\DB\projects\homework3\Logistic.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Logistic_log', FILENAME = N'D:\DB\projects\homework3\Logistic_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Logistic] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Logistic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Logistic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Logistic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Logistic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Logistic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Logistic] SET ARITHABORT OFF 
GO
ALTER DATABASE [Logistic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Logistic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Logistic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Logistic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Logistic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Logistic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Logistic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Logistic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Logistic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Logistic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Logistic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Logistic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Logistic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Logistic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Logistic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Logistic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Logistic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Logistic] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Logistic] SET  MULTI_USER 
GO
ALTER DATABASE [Logistic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Logistic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Logistic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Logistic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Logistic] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Logistic] SET QUERY_STORE = OFF
GO
USE [Logistic]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 10.02.2025 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[street] [nvarchar](100) NULL,
	[city_id] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10.02.2025 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 10.02.2025 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[region_id] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 10.02.2025 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 10.02.2025 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[supplier_id] [int] NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
	[date_of_delivery] [date] NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 10.02.2025 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[percnt] [real] NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measurement]    Script Date: 10.02.2025 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](200) NULL,
 CONSTRAINT [PK_Description] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 10.02.2025 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[address_id] [int] NOT NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10.02.2025 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[category_id] [int] NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
	[producer_id] [int] NULL,
	[measurement_id] [int] NULL,
	[discount_id] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 10.02.2025 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[country_id] [int] NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 10.02.2025 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
	[date_of_sale] [date] NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 10.02.2025 16:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[address_id] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (1, N'ул. Дерибасовская, 15', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (2, N'пр. Шевченко, 9', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (3, N'ул. Пушкинская, 42', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (4, N'ул. Льва Толстого, 30', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (5, N'ул. Малая Арнаутская, 10', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (6, N'пр. Пролетарский, 4', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (7, N'ул. Мечникова, 5', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (8, N'ул. Канатная, 21', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (9, N'ул. Французский бульвар, 72', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (10, N'ул. Ришельевская, 56', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (11, N'ул. Архитектора Уткина, 6', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (12, N'пр. Гагарина, 19', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (13, N'ул. Ленина, 36', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (14, N'ул. Днепропетровская дорога, 41', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (15, N'ул. Полтавская, 3', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (16, N'пр. Независимости, 20', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (17, N'ул. Садовая, 48', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (18, N'ул. Буніна, 8', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (19, N'пр. Южный, 25', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (20, N'ул. Воронежская, 13', 3)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (21, N'ул. Сумская, 10', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (22, N'пр. Гагарина, 24', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (23, N'ул. Пушкинская, 17', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (24, N'ул. Академика Павлова, 21', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (25, N'ул. Валентиновская, 5', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (26, N'ул. Ярослава Мудрого, 32', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (27, N'пр. Ленина, 46', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (28, N'ул. Балакиревская, 11', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (29, N'ул. Клочковская, 8', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (30, N'ул. Механизаторов, 54', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (31, N'пр. Независимости, 15', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (32, N'ул. Плеханова, 22', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (33, N'ул. 23 августа, 13', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (34, N'ул. Триумфальная, 19', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (35, N'ул. Ахсарова, 30', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (36, N'ул. Чернишевская, 17', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (37, N'ул. Проспект 50 лет, 9', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (38, N'ул. Героев Сталинграда, 3', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (39, N'пр. Московский, 10', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (40, N'ул. Славы, 29', 2)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (41, N'ул. Шевченка, 12', 5)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (42, N'пр. Свободы, 5', 5)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (43, N'ул. Сахарова, 8', 5)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (44, N'ул. Галицкая, 14', 5)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (45, N'ул. Богдана Хмельницкого, 11', 5)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (46, N'ул. Драгоманова, 3', 5)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (47, N'ул. Франка, 9', 5)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (48, N'пр. Леси Украинки, 27', 5)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (49, N'ул. Грекова, 22', 5)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (50, N'ул. Симона Петлюры, 10', 5)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (51, N'ул. Киевская, 3', 17)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (52, N'ул. Победы, 6', 17)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (53, N'пр. Независимости, 15', 17)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (54, N'ул. Чудновская, 8', 17)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (55, N'ул. Коростенская, 19', 17)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (56, N'ул. Победы, 11', 17)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (57, N'ул. Южная, 2', 17)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (58, N'ул. Маяковского, 14', 17)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (59, N'ул. Грушевского, 7', 17)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (60, N'ул. Спортивная, 10', 17)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (61, N'ул. Вознесенская, 18', 7)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (62, N'пр. Соборный, 22', 7)
INSERT [dbo].[Address] ([id], [street], [city_id]) VALUES (63, N'ул. Гагарина, 14', 7)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Молочные продукты')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Мясо и мясные изделия')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Рыба и морепродукты')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Фрукты')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Овощи')
INSERT [dbo].[Category] ([id], [name]) VALUES (6, N'Крупы и зерновые')
INSERT [dbo].[Category] ([id], [name]) VALUES (7, N'Хлебобулочные изделия')
INSERT [dbo].[Category] ([id], [name]) VALUES (8, N'Замороженные продукты')
INSERT [dbo].[Category] ([id], [name]) VALUES (9, N'Напитки (безалкогольные)')
INSERT [dbo].[Category] ([id], [name]) VALUES (10, N'Кондитерские изделия')
INSERT [dbo].[Category] ([id], [name]) VALUES (11, N'Специи и приправы')
INSERT [dbo].[Category] ([id], [name]) VALUES (12, N'Бакалея')
INSERT [dbo].[Category] ([id], [name]) VALUES (13, N'Масла и жиры')
INSERT [dbo].[Category] ([id], [name]) VALUES (14, N'Продукты для детского питания')
INSERT [dbo].[Category] ([id], [name]) VALUES (15, N'Диетические продукты')
INSERT [dbo].[Category] ([id], [name]) VALUES (16, N'Снэки и чипсы')
INSERT [dbo].[Category] ([id], [name]) VALUES (17, N'Консервация')
INSERT [dbo].[Category] ([id], [name]) VALUES (18, N'Соусы и заправки')
INSERT [dbo].[Category] ([id], [name]) VALUES (19, N'Продукты для вегетарианцев')
INSERT [dbo].[Category] ([id], [name]) VALUES (20, N'Готовые блюда и полуфабрикаты')
INSERT [dbo].[Category] ([id], [name]) VALUES (21, N'Алкогольные напитки')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (1, N'Киев', 10)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (2, N'Харьков', 20)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (3, N'Одесса', 15)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (4, N'Днепр', 4)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (5, N'Львов', 13)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (6, N'Донецк', 5)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (7, N'Запорожье', 8)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (8, N'Кривой Рог', 4)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (9, N'Николаев', 14)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (10, N'Мариуполь', 5)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (11, N'Луганск', 12)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (12, N'Винница', 2)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (13, N'Полтава', 16)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (14, N'Чернигов', 24)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (15, N'Черкассы', 23)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (16, N'Сумы', 18)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (17, N'Житомир', 6)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (18, N'Хмельницкий', 22)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (19, N'Черновцы', 25)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (20, N'Тернополь', 19)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (21, N'Ровно', 17)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (22, N'Ивано-Франковск', 9)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (23, N'Кременчуг', 16)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (24, N'Каменское', 4)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (25, N'Славянск', 5)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (26, N'Кропивницкий', 11)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (27, N'Мелитополь', 8)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (28, N'Бровары', 10)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (29, N'Буча', 10)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (30, N'Ирпень', 10)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (31, N'Белая Церковь', 10)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (32, N'Бахмут', 5)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (33, N'Конотоп', 18)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (34, N'Лисичанск', 12)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (35, N'Сумы', 18)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (36, N'Краматорск', 5)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (37, N'Павлоград', 4)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (38, N'Каменец-Подольский', 22)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (39, N'Мукачево', 7)
INSERT [dbo].[City] ([id], [name], [region_id]) VALUES (40, N'Ужгород', 7)
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([id], [name]) VALUES (1, N'Украина')
INSERT [dbo].[Country] ([id], [name]) VALUES (2, N'Австралия')
INSERT [dbo].[Country] ([id], [name]) VALUES (3, N'Австрия')
INSERT [dbo].[Country] ([id], [name]) VALUES (4, N'Албания')
INSERT [dbo].[Country] ([id], [name]) VALUES (5, N'Ангола')
INSERT [dbo].[Country] ([id], [name]) VALUES (6, N'Андорра')
INSERT [dbo].[Country] ([id], [name]) VALUES (7, N'Антигуа и Барбуда')
INSERT [dbo].[Country] ([id], [name]) VALUES (8, N'Аргентина')
INSERT [dbo].[Country] ([id], [name]) VALUES (9, N'Афганистан')
INSERT [dbo].[Country] ([id], [name]) VALUES (10, N'Багамские Острова')
INSERT [dbo].[Country] ([id], [name]) VALUES (11, N'Бангладеш')
INSERT [dbo].[Country] ([id], [name]) VALUES (12, N'Барбадос')
INSERT [dbo].[Country] ([id], [name]) VALUES (13, N'Беларусь')
INSERT [dbo].[Country] ([id], [name]) VALUES (14, N'Белиз')
INSERT [dbo].[Country] ([id], [name]) VALUES (15, N'Бельгия')
INSERT [dbo].[Country] ([id], [name]) VALUES (16, N'Бенин')
INSERT [dbo].[Country] ([id], [name]) VALUES (17, N'Болгария')
INSERT [dbo].[Country] ([id], [name]) VALUES (18, N'Боливия')
INSERT [dbo].[Country] ([id], [name]) VALUES (19, N'Босния и Герцеговина')
INSERT [dbo].[Country] ([id], [name]) VALUES (20, N'Ботсвана')
INSERT [dbo].[Country] ([id], [name]) VALUES (21, N'Бразилия')
INSERT [dbo].[Country] ([id], [name]) VALUES (22, N'Буркина - Фасо')
INSERT [dbo].[Country] ([id], [name]) VALUES (23, N'Бурунди')
INSERT [dbo].[Country] ([id], [name]) VALUES (24, N'Бутан')
INSERT [dbo].[Country] ([id], [name]) VALUES (25, N'Вануату')
INSERT [dbo].[Country] ([id], [name]) VALUES (26, N'Ватикан')
INSERT [dbo].[Country] ([id], [name]) VALUES (27, N'Великобритания')
INSERT [dbo].[Country] ([id], [name]) VALUES (28, N'Венгрия')
INSERT [dbo].[Country] ([id], [name]) VALUES (29, N'Вьетнам')
INSERT [dbo].[Country] ([id], [name]) VALUES (30, N'Габон')
INSERT [dbo].[Country] ([id], [name]) VALUES (31, N'Гаити')
INSERT [dbo].[Country] ([id], [name]) VALUES (32, N'Гайана')
INSERT [dbo].[Country] ([id], [name]) VALUES (33, N'Гамбия')
INSERT [dbo].[Country] ([id], [name]) VALUES (34, N'Гватемала')
INSERT [dbo].[Country] ([id], [name]) VALUES (35, N'Гвинея')
INSERT [dbo].[Country] ([id], [name]) VALUES (36, N'Гвинея - Бисау')
INSERT [dbo].[Country] ([id], [name]) VALUES (37, N'Германия')
INSERT [dbo].[Country] ([id], [name]) VALUES (38, N'Гондурас')
INSERT [dbo].[Country] ([id], [name]) VALUES (39, N'Гренада')
INSERT [dbo].[Country] ([id], [name]) VALUES (40, N'Греция')
INSERT [dbo].[Country] ([id], [name]) VALUES (41, N'Грузия')
INSERT [dbo].[Country] ([id], [name]) VALUES (42, N'Дания')
INSERT [dbo].[Country] ([id], [name]) VALUES (43, N'Демократическая Республика Конго')
INSERT [dbo].[Country] ([id], [name]) VALUES (44, N'Джибути')
INSERT [dbo].[Country] ([id], [name]) VALUES (45, N'Доминика')
INSERT [dbo].[Country] ([id], [name]) VALUES (46, N'Доминиканская Республика')
INSERT [dbo].[Country] ([id], [name]) VALUES (47, N'Замбия')
INSERT [dbo].[Country] ([id], [name]) VALUES (48, N'Зимбабве')
INSERT [dbo].[Country] ([id], [name]) VALUES (49, N'Индия')
INSERT [dbo].[Country] ([id], [name]) VALUES (50, N'Индонезия')
INSERT [dbo].[Country] ([id], [name]) VALUES (51, N'Ирландия')
INSERT [dbo].[Country] ([id], [name]) VALUES (52, N'Исландия')
INSERT [dbo].[Country] ([id], [name]) VALUES (53, N'Испания')
INSERT [dbo].[Country] ([id], [name]) VALUES (54, N'Италия')
INSERT [dbo].[Country] ([id], [name]) VALUES (55, N'Кабо - Верде')
INSERT [dbo].[Country] ([id], [name]) VALUES (56, N'Казахстан')
INSERT [dbo].[Country] ([id], [name]) VALUES (57, N'Камбоджа')
INSERT [dbo].[Country] ([id], [name]) VALUES (58, N'Камерун')
INSERT [dbo].[Country] ([id], [name]) VALUES (59, N'Канада')
INSERT [dbo].[Country] ([id], [name]) VALUES (60, N'Кения')
INSERT [dbo].[Country] ([id], [name]) VALUES (61, N'Кипр')
INSERT [dbo].[Country] ([id], [name]) VALUES (62, N'Кирибати')
INSERT [dbo].[Country] ([id], [name]) VALUES (63, N'Китай')
INSERT [dbo].[Country] ([id], [name]) VALUES (64, N'Колумбия')
INSERT [dbo].[Country] ([id], [name]) VALUES (65, N'Коморские Острова')
INSERT [dbo].[Country] ([id], [name]) VALUES (66, N'Конго')
INSERT [dbo].[Country] ([id], [name]) VALUES (67, N'Корейская Народно-Демократическая Республика (Северная Корея)')
INSERT [dbo].[Country] ([id], [name]) VALUES (68, N'Косово')
INSERT [dbo].[Country] ([id], [name]) VALUES (69, N'Коста - Рика')
INSERT [dbo].[Country] ([id], [name]) VALUES (70, N'Кот - дИвуар')
INSERT [dbo].[Country] ([id], [name]) VALUES (71, N'Куба')
INSERT [dbo].[Country] ([id], [name]) VALUES (72, N'Лаосская Народно-Демократическая Республика')
INSERT [dbo].[Country] ([id], [name]) VALUES (73, N'Латвия')
INSERT [dbo].[Country] ([id], [name]) VALUES (74, N'Лесото')
INSERT [dbo].[Country] ([id], [name]) VALUES (75, N'Либерия')
INSERT [dbo].[Country] ([id], [name]) VALUES (76, N'Литва')
INSERT [dbo].[Country] ([id], [name]) VALUES (77, N'Лихтенштейн')
INSERT [dbo].[Country] ([id], [name]) VALUES (78, N'Люксембург')
INSERT [dbo].[Country] ([id], [name]) VALUES (79, N'Маврикий')
INSERT [dbo].[Country] ([id], [name]) VALUES (80, N'Мавритания')
INSERT [dbo].[Country] ([id], [name]) VALUES (81, N'Мадагаскар')
INSERT [dbo].[Country] ([id], [name]) VALUES (82, N'Малави')
INSERT [dbo].[Country] ([id], [name]) VALUES (83, N'Малайзия')
INSERT [dbo].[Country] ([id], [name]) VALUES (84, N'Мали')
INSERT [dbo].[Country] ([id], [name]) VALUES (85, N'Мальдивские Острова')
INSERT [dbo].[Country] ([id], [name]) VALUES (86, N'Мальта')
INSERT [dbo].[Country] ([id], [name]) VALUES (87, N'Маршалловы Острова')
INSERT [dbo].[Country] ([id], [name]) VALUES (88, N'Мексика')
INSERT [dbo].[Country] ([id], [name]) VALUES (89, N'Микронезия (Федеративные Штаты)')
INSERT [dbo].[Country] ([id], [name]) VALUES (90, N'Мозамбик')
INSERT [dbo].[Country] ([id], [name]) VALUES (91, N'Молдова')
INSERT [dbo].[Country] ([id], [name]) VALUES (92, N'Монако')
INSERT [dbo].[Country] ([id], [name]) VALUES (93, N'Монголия')
INSERT [dbo].[Country] ([id], [name]) VALUES (94, N'Мьянма (Бирма)')
INSERT [dbo].[Country] ([id], [name]) VALUES (95, N'Намибия')
INSERT [dbo].[Country] ([id], [name]) VALUES (96, N'Науру')
INSERT [dbo].[Country] ([id], [name]) VALUES (97, N'Непал')
INSERT [dbo].[Country] ([id], [name]) VALUES (98, N'Нигер')
INSERT [dbo].[Country] ([id], [name]) VALUES (99, N'Нигерия')
GO
INSERT [dbo].[Country] ([id], [name]) VALUES (100, N'Нидерланды')
INSERT [dbo].[Country] ([id], [name]) VALUES (101, N'Никарагуа')
INSERT [dbo].[Country] ([id], [name]) VALUES (102, N'Новая Зеландия')
INSERT [dbo].[Country] ([id], [name]) VALUES (103, N'Норвегия')
INSERT [dbo].[Country] ([id], [name]) VALUES (104, N'Объединенная Республика Танзания')
INSERT [dbo].[Country] ([id], [name]) VALUES (105, N'Острова Кука')
INSERT [dbo].[Country] ([id], [name]) VALUES (106, N'Пакистан')
INSERT [dbo].[Country] ([id], [name]) VALUES (107, N'Палау')
INSERT [dbo].[Country] ([id], [name]) VALUES (108, N'Панама')
INSERT [dbo].[Country] ([id], [name]) VALUES (109, N'Папуа - Новая Гвинея')
INSERT [dbo].[Country] ([id], [name]) VALUES (110, N'Парагвай')
INSERT [dbo].[Country] ([id], [name]) VALUES (111, N'Перу')
INSERT [dbo].[Country] ([id], [name]) VALUES (112, N'Польша')
INSERT [dbo].[Country] ([id], [name]) VALUES (113, N'Португалия')
INSERT [dbo].[Country] ([id], [name]) VALUES (114, N'Республика Корея (Южная Корея)')
INSERT [dbo].[Country] ([id], [name]) VALUES (115, N'Россия')
INSERT [dbo].[Country] ([id], [name]) VALUES (116, N'Руанда')
INSERT [dbo].[Country] ([id], [name]) VALUES (117, N'Румыния')
INSERT [dbo].[Country] ([id], [name]) VALUES (118, N'Самоа')
INSERT [dbo].[Country] ([id], [name]) VALUES (119, N'Сан - Марино')
INSERT [dbo].[Country] ([id], [name]) VALUES (120, N'Сан - Томе и Принсипи')
INSERT [dbo].[Country] ([id], [name]) VALUES (121, N'Северная Македония')
INSERT [dbo].[Country] ([id], [name]) VALUES (122, N'Сейшельские Острова')
INSERT [dbo].[Country] ([id], [name]) VALUES (123, N'Сенегал')
INSERT [dbo].[Country] ([id], [name]) VALUES (124, N'Сент - Винсент и Гренадины')
INSERT [dbo].[Country] ([id], [name]) VALUES (125, N'Сент - Люсия')
INSERT [dbo].[Country] ([id], [name]) VALUES (126, N'Сербия')
INSERT [dbo].[Country] ([id], [name]) VALUES (127, N'Сингапур')
INSERT [dbo].[Country] ([id], [name]) VALUES (128, N'Словакия')
INSERT [dbo].[Country] ([id], [name]) VALUES (129, N'Словения')
INSERT [dbo].[Country] ([id], [name]) VALUES (130, N'Соломоновы Острова')
INSERT [dbo].[Country] ([id], [name]) VALUES (131, N'Сомали')
INSERT [dbo].[Country] ([id], [name]) VALUES (132, N'Судан')
INSERT [dbo].[Country] ([id], [name]) VALUES (133, N'Сур')
INSERT [dbo].[Country] ([id], [name]) VALUES (134, N'США')
INSERT [dbo].[Country] ([id], [name]) VALUES (135, N'Сьерра - Леоне')
INSERT [dbo].[Country] ([id], [name]) VALUES (136, N'Таиланд')
INSERT [dbo].[Country] ([id], [name]) VALUES (137, N'Тимор-Лешти')
INSERT [dbo].[Country] ([id], [name]) VALUES (138, N'Того')
INSERT [dbo].[Country] ([id], [name]) VALUES (139, N'Тонга')
INSERT [dbo].[Country] ([id], [name]) VALUES (140, N'Тринидад и Тобаго')
INSERT [dbo].[Country] ([id], [name]) VALUES (141, N'Тувалу')
INSERT [dbo].[Country] ([id], [name]) VALUES (142, N'Уганда')
INSERT [dbo].[Country] ([id], [name]) VALUES (143, N'Фиджи')
INSERT [dbo].[Country] ([id], [name]) VALUES (144, N'Филиппины')
INSERT [dbo].[Country] ([id], [name]) VALUES (145, N'Финляндия')
INSERT [dbo].[Country] ([id], [name]) VALUES (146, N'Франция')
INSERT [dbo].[Country] ([id], [name]) VALUES (147, N'Хорватия')
INSERT [dbo].[Country] ([id], [name]) VALUES (148, N'Центральноафриканская Республика')
INSERT [dbo].[Country] ([id], [name]) VALUES (149, N'Чад')
INSERT [dbo].[Country] ([id], [name]) VALUES (150, N'Черногория')
INSERT [dbo].[Country] ([id], [name]) VALUES (151, N'Чехия')
INSERT [dbo].[Country] ([id], [name]) VALUES (152, N'Чили')
INSERT [dbo].[Country] ([id], [name]) VALUES (153, N'Швейцария')
INSERT [dbo].[Country] ([id], [name]) VALUES (154, N'Швеция')
INSERT [dbo].[Country] ([id], [name]) VALUES (155, N'Шри-Ланка')
INSERT [dbo].[Country] ([id], [name]) VALUES (156, N'Эквадор')
INSERT [dbo].[Country] ([id], [name]) VALUES (157, N'Экваториальная Гвинея')
INSERT [dbo].[Country] ([id], [name]) VALUES (158, N'Эритрея')
INSERT [dbo].[Country] ([id], [name]) VALUES (159, N'Эсватини')
INSERT [dbo].[Country] ([id], [name]) VALUES (160, N'Эстония')
INSERT [dbo].[Country] ([id], [name]) VALUES (161, N'Эфиопия')
INSERT [dbo].[Country] ([id], [name]) VALUES (162, N'Ямайка')
INSERT [dbo].[Country] ([id], [name]) VALUES (163, N'Япония')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (1, 82, 62, 180.0000, 15, CAST(N'2025-01-02' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (2, 188, 15, 85.0000, 20, CAST(N'2024-11-09' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (3, 6, 52, 190.0000, 14, CAST(N'2024-12-29' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (4, 442, 6, 50.0000, 100, CAST(N'2024-09-30' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (5, 63, 46, 160.0000, 20, CAST(N'2025-01-22' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (6, 29, 55, 20.0000, 60, CAST(N'2025-01-12' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (7, 435, 60, 45.0000, 85, CAST(N'2024-10-10' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (8, 227, 33, 30.0000, 60, CAST(N'2024-11-14' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (9, 553, 53, 80.0000, 60, CAST(N'2024-10-29' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (10, 157, 40, 40.0000, 50, CAST(N'2025-02-07' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (11, 288, 45, 60.0000, 35, CAST(N'2024-08-04' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (12, 345, 25, 45.0000, 50, CAST(N'2024-11-02' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (13, 223, 53, 45.0000, 40, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (14, 129, 43, 85.0000, 30, CAST(N'2024-12-20' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (15, 497, 41, 80.0000, 50, CAST(N'2024-12-28' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (16, 427, 55, 45.0000, 85, CAST(N'2024-10-02' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (17, 45, 5, 55.0000, 25, CAST(N'2024-09-01' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (18, 267, 26, 45.0000, 30, CAST(N'2025-01-09' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (19, 171, 57, 70.0000, 15, CAST(N'2024-10-05' AS Date))
INSERT [dbo].[Delivery] ([id], [product_id], [supplier_id], [price], [quantity], [date_of_delivery]) VALUES (20, 97, 3, 270.0000, 18, CAST(N'2025-02-01' AS Date))
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (1, N'1%', 0.01)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (2, N'2%', 0.02)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (3, N'3%', 0.03)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (4, N'4%', 0.04)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (5, N'5%', 0.05)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (6, N'6%', 0.06)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (7, N'7%', 0.07)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (8, N'8%', 0.08)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (9, N'9%', 0.09)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (10, N'10%', 0.1)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (11, N'11%', 0.11)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (12, N'12%', 0.12)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (13, N'13%', 0.13)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (14, N'14%', 0.14)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (15, N'15%', 0.15)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (16, N'16%', 0.16)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (17, N'17%', 0.17)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (18, N'18%', 0.18)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (19, N'19%', 0.19)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (20, N'20%', 0.2)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (21, N'25%', 0.25)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (22, N'30%', 0.3)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (23, N'35%', 0.35)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (24, N'40%', 0.4)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (25, N'45%', 0.45)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (26, N'50%', 0.5)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (27, N'55%', 0.55)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (28, N'60%', 0.65)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (29, N'70%', 0.7)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (30, N'75%', 0.75)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (31, N'80%', 0.8)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (32, N'85%', 0.85)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (33, N'90%', 0.9)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (34, N'SALE!', 0.99)
INSERT [dbo].[Discount] ([id], [name], [percnt]) VALUES (35, N'FULL PRICE', 1)
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Measurement] ON 

INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (1, N'Килограмм(кг)', N'стандартная единица массы для тяжелых продуктов')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (2, N'Грамм(г)', N'единица массы для мелких и легких продуктов')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (3, N'Миллилитр(мл)', N'единица объема для жидких веществ в небольших количествах')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (4, N'Литр(л)', N'единица объема для жидкостей и сыпучих продуктов')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (5, N'Штука(шт)', N'измерение количества отдельных предметов')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (6, N'Пачка', N'упаковка, обычно содержит несколько единиц товара')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (7, N'Бутылка', N'контейнер для жидкостей, обычно с крышкой')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (8, N'Коробка', N' упаковка с твердыми стенками, может быть как картонной, так и пластиковой')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (9, N'Плитка', N'упаковка, обычно используемая для шоколада, плиток масла и других продуктов')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (10, N'Упаковка', N'общий термин для упаковки товара в различных формах')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (11, N'Банка', N'металлический или стеклянный контейнер с герметичной крышкой')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (12, N'Контейнер', N' емкость для хранения товаров, может быть пластиковым, металлическим и других материалов')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (13, N'Лист', N'плоский предмет, часто используется для овощей или зелени')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (14, N'Пакет', N'гибкая упаковка, обычно из пластика или бумаги')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (15, N'Картонная коробка', N'упаковка из картона, используемая для транспортировки')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (16, N'Кусок', N'часть целого предмета или продукта')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (17, N'Порция', N'стандартное количество пищи, предназначенное для одного человека')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (18, N'Пакетик', N'маленький пакет для хранения небольших количеств товара')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (19, N'Стакан', N'емкость для жидкостей, обычно для питья')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (20, N'Чашка', N'емкость для горячих напитков, например, чая или кофе')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (21, N'Трубочка', N'гибкий или пластиковый трубчатый элемент для питья напитков')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (22, N'Глоток', N'минимальное количество жидкости, которое можно выпить за один раз')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (23, N'Ложка столовая', N'стандартная ложка для еды')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (24, N'Ложка чайная', N'ложка, используемая для чая и кофе')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (25, N'Мешок', N'большая упаковка, обычно из ткани или пластика')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (26, N'Сетка', N'упаковка в виде сетки, часто используется для фруктов или овощей')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (27, N'Картридж', N'упаковка для расходных материалов, например, для принтеров или вейпов')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (28, N'Блок', N'упаковка, содержащая несколько элементов одного типа, например, бумаги')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (29, N'Пакет для заморозки', N'пластиковый пакет, предназначенный для хранения продуктов в морозильной камере')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (30, N'Дозатор', N'устройство для точного дозирования жидкости или порошка')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (31, N'Туба', N'упаковка в виде гибкой трубочки, часто используется для паст, кремов')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (32, N'Кубик', N'небольшая форма или порция, например, кубик льда или сахара')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (33, N'Блок', N'упаковка, содержащая несколько единиц товара, сгруппированых вместе в единую упаковку или единицу')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (34, N'Поллитра', N'половина литра, используемая для жидкостей')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (35, N'Тонна(т)', N'единица массы, эквивалентная 1000 кг')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (36, N'Картонная упаковка', N'упаковка из картона, часто используется для транспортировки товаров')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (37, N'Пластиковая бутылка', N'емкость из пластика, используемая для жидкостей')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (38, N'Дозатор', N'устройство для точного дозирования вещества или жидкости')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (39, N'Тетрапак', N'упаковка из многослойного материала, часто используется для сока и молока')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (40, N'Паллет', N'платформа для транспортировки товаров, обычно деревянная или пластиковая')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (45, N'Головка', N'часть овоща или фрукта, например, капусты или чеснока')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (46, N'Корнеплод', N'корень растения, обычно съедобный, например, морковь или свекла')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (47, N'Гроздь', N'связка плодов, например, винограда')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (48, N'Кочан', N'головка определенных овощей, например, капусты')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (49, N'Болтушка', N'жидкость или смесь, которая требует встряхивания перед употреблением')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (51, N'Бокал', N'стеклянная посуда для напитков, обычно для вина или шампанского')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (54, N'Флакон', N'небольшой сосуд для жидкости, обычно с дозатором')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (55, N'Колба', N'сосуд, обычно с широким горлом, используется в лабораториях и для напитков')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (56, N'Кувшин', N'сосуд для жидкостей, обычно с ручкой и носиком')
SET IDENTITY_INSERT [dbo].[Measurement] OFF
GO
SET IDENTITY_INSERT [dbo].[Producer] ON 

INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (1, N'Молочный край', 1)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (2, N'Вершина вкуса', 1)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (3, N'Молочная ферма', 1)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (4, N'Мир мяса', 2)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (6, N'Мясной кусок', 2)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (7, N'Вкус дикой природы', 2)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (8, N'Морская свежесть', 3)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (9, N'Акваделик', 3)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (10, N'Голубая лагуна', 3)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (11, N'Солнечные сады', 4)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (12, N'ФруктоГрад', 4)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (13, N'Дары природы', 4)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (14, N'Зеленый урожай', 5)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (15, N'Вкусный огород', 5)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (16, N'Органический мир овощей', 5)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (17, N'Золотой колос', 6)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (18, N'Зерно чистоты', 6)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (19, N'Родное поле', 6)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (20, N'Душистый хлеб', 7)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (21, N'Пшеничная горка', 7)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (22, N'Ветеран пекарни', 7)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (23, N'Ледяная свежесть', 8)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (24, N'Арктический выбор', 8)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (25, N'Замороженная линия', 8)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (26, N'Северный сок', 9)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (27, N'Дары природы', 9)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (28, N'Наш сок', 9)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (29, N'Шоколадный рай', 10)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (30, N'Сладкая традиция', 10)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (31, N'Кондитерская магия', 10)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (32, N'Восточные ароматы', 11)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (33, N'Спец-вкус', 11)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (34, N'Планета пряностей', 11)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (35, N'Бакалейная лавка', 12)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (36, N'Богатство полей', 12)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (37, N'Сельский продукт', 12)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (38, N'Золотое масло', 13)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (39, N'Чистый жир', 13)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (40, N'Оливковый путь', 13)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (41, N'Малышок', 14)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (42, N'Детская радость', 14)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (43, N'Довольный пупс', 14)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (44, N'Легкий выбор', 15)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (45, N'Диета+', 15)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (46, N'Пища здоровья', 15)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (47, N'Чипс-Мания', 16)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (48, N'SnackTime', 16)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (49, N'Крустикс', 16)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (50, N'КонсерваПродукт', 17)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (51, N'Летний урожай', 17)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (52, N'Зимняя банка', 17)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (53, N'Соусная линия', 18)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (54, N'Томатный сюрприз', 18)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (55, N'Помощница', 18)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (56, N'Зеленый стол', 19)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (57, N'Веганская радость', 19)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (58, N'Эко-единица', 19)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (59, N'Готовый вкус', 20)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (60, N'Шеф на кухне', 20)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (61, N'Домашняя еда', 20)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (62, N'Винный мир', 21)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (63, N'Древний град', 21)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (64, N'Эльфорти', 21)
INSERT [dbo].[Producer] ([id], [name], [address_id]) VALUES (65, NULL, 1)
SET IDENTITY_INSERT [dbo].[Producer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (1, N'Молоко селянське', 1, 57.0000, 30, 1, 4, 10)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (2, N'Творог домашний', 1, 80.0000, 10, 2, 10, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (3, N'Сметана 2,5%', 1, 44.0000, 15, 3, 14, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (4, N'Йогурт черничный', 1, 54.0000, 24, 1, 19, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (5, N'Сыр Комо', 1, 400.0000, 13, 2, 10, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (6, N'Говядина', 2, 190.0000, 14, 4, 1, 10)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (7, N'Свинина', 2, 140.0000, 15, 6, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (8, N'Курица целая', 2, 130.0000, 16, 7, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (9, N'Курица филе', 2, 140.0000, 17, 4, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (10, N'Курица грудка', 2, 150.0000, 18, 6, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (11, N'Колбаса', 2, 130.0000, 19, 7, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (12, N'Сало', 2, 200.0000, 20, 4, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (13, N'Лосось', 3, 800.0000, 21, 8, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (14, N'Тунец копченый', 3, 900.0000, 22, 9, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (15, N'Камбала копченый', 3, 500.0000, 23, 10, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (16, N'Креветки копченый', 3, 800.0000, 24, 8, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (17, N'Мидии копченые', 3, 400.0000, 25, 9, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (18, N'Толстолоб соленый', 3, 250.0000, 26, 10, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (19, N'Карп соленый', 3, 300.0000, 27, 8, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (20, N'Карась вяленый', 3, 150.0000, 28, 9, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (21, N'Скумбрия копченая', 3, 180.0000, 29, 10, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (22, N'Сельдь соленая', 3, 150.0000, 30, 8, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (23, N'Кальмары копчено-вяленые', 3, 300.0000, 31, 9, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (24, N'Икра мойвы соленая', 3, 180.0000, 32, 10, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (25, N'Щука', 3, 190.0000, 33, 8, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (26, N'Молоко', 1, 25.0000, 50, 3, 39, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (27, N'Сметана', 1, 30.0000, 40, 2, 14, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (28, N'Творог', 1, 45.0000, 30, 1, 10, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (29, N'Йогурт', 1, 20.0000, 60, 3, 19, 15)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (30, N'Кефир', 1, 22.0000, 55, 2, 14, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (31, N'Масло сливочное', 1, 80.0000, 25, 1, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (32, N'Сыр', 1, 120.0000, 20, 3, 10, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (33, N'Сыр творожный', 1, 85.0000, 15, 1, 10, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (34, N'Молочный шоколад', 1, 60.0000, 50, 2, 9, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (35, N'Плавленый сыр', 1, 75.0000, 40, 3, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (36, N'Ряженка', 1, 25.0000, 70, 2, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (37, N'Молочная смесь', 1, 200.0000, 10, 1, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (38, N'Козье молоко', 1, 50.0000, 30, 3, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (39, N'Молочные коктейли', 1, 35.0000, 45, 2, 39, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (40, N'Кисломолочные напитки', 1, 28.0000, 50, 1, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (41, N'Молоко сухое', 1, 150.0000, 20, 3, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (42, N'Молоко сгущенное', 1, 40.0000, 30, 1, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (43, N'Йогурт питьевой', 1, 22.0000, 60, 2, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (44, N'Сметана 20%', 1, 35.0000, 50, 3, 14, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (45, N'Творог 9%', 1, 55.0000, 25, 1, 10, 20)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (46, N'Сыр фета', 1, 95.0000, 30, 2, 10, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (47, N'Творог обезжиренный', 1, 50.0000, 40, 3, 10, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (48, N'Сыроежка', 1, 100.0000, 35, 1, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (49, N'Творожные десерты', 1, 65.0000, 60, 2, 19, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (50, N'Кефир 3%', 1, 23.0000, 80, 3, 14, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (51, N'Козий сыр', 1, 110.0000, 20, 1, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (52, N'Сыр моцарелла', 1, 140.0000, 15, 2, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (53, N'Сыр чеддер', 1, 160.0000, 25, 3, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (54, N'Молочная пастила', 1, 55.0000, 50, 1, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (55, N'Крем-сыр', 1, 95.0000, 40, 2, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (56, N'Говядина', 2, 180.0000, 20, 4, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (57, N'Свинина', 2, 150.0000, 30, 6, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (58, N'Курица', 2, 75.0000, 50, 7, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (59, N'Индейка', 2, 120.0000, 25, 4, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (60, N'Баранина', 2, 200.0000, 15, 6, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (61, N'Колбаса вареная', 2, 100.0000, 40, 7, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (62, N'Колбаса копченая', 2, 120.0000, 35, 4, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (63, N'Шинка', 2, 160.0000, 20, 6, 1, 15)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (64, N'Куриные грудки', 2, 85.0000, 45, 7, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (65, N'Куриные бедра', 2, 70.0000, 60, 4, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (66, N'Говяжьи ребра', 2, 250.0000, 12, 6, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (67, N'Свинина на кости', 2, 160.0000, 25, 7, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (68, N'Говяжий фарш', 2, 130.0000, 50, 4, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (69, N'Свиной фарш', 2, 120.0000, 40, 6, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (70, N'Куриный фарш', 2, 90.0000, 55, 7, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (71, N'Ветчина', 2, 110.0000, 30, 4, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (72, N'Говяжий стейк', 2, 250.0000, 18, 6, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (73, N'Свиной стейк', 2, 180.0000, 22, 7, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (74, N'Говяжий язык', 2, 210.0000, 10, 4, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (75, N'Копченая курица', 2, 130.0000, 30, 6, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (76, N'Котлеты мясные', 2, 100.0000, 40, 7, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (77, N'Телятина', 2, 220.0000, 20, 4, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (78, N'Куриная печень', 2, 45.0000, 60, 6, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (79, N'Свиной окорок', 2, 190.0000, 25, 7, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (80, N'Говяжья печень', 2, 50.0000, 50, 4, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (81, N'Мясные сосиски', 2, 95.0000, 45, 6, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (82, N'Буженина', 2, 180.0000, 15, 7, 1, 15)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (83, N'Мясо утки', 2, 230.0000, 12, 4, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (84, N'Куриные крылья', 2, 65.0000, 70, 6, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (85, N'Креветки', 3, 250.0000, 20, 8, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (86, N'Мидии', 3, 180.0000, 25, 9, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (87, N'Кальмары', 3, 200.0000, 30, 10, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (88, N'Треска', 3, 150.0000, 35, 8, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (89, N'Лосось', 3, 350.0000, 15, 9, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (90, N'Скумбрия', 3, 120.0000, 40, 10, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (91, N'Палтус', 3, 250.0000, 10, 8, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (92, N'Угорь', 3, 400.0000, 12, 9, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (93, N'Раковые шейки', 3, 300.0000, 18, 10, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (94, N'Сельдь', 3, 85.0000, 50, 8, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (95, N'Тунец', 3, 350.0000, 20, 9, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (96, N'Камбала', 3, 220.0000, 25, 10, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (97, N'Морской язык', 3, 270.0000, 18, 8, 1, 20)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (98, N'Окунь', 3, 190.0000, 30, 9, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (99, N'Крабовые палочки', 3, 80.0000, 60, 10, 6, 35)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (100, N'Морской гребешок', 3, 320.0000, 10, 8, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (101, N'Лангустины', 3, 350.0000, 15, 9, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (102, N'Рыба пангасиус', 3, 100.0000, 55, 10, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (103, N'Черные морские гребешки', 3, 330.0000, 12, 8, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (104, N'Краб', 3, 400.0000, 8, 9, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (105, N'Морская рыба (микс)', 3, 200.0000, 40, 10, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (106, N'Осьминог', 3, 250.0000, 20, 8, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (107, N'Лобстер', 3, 500.0000, 10, 9, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (108, N'Филе минтая', 3, 150.0000, 30, 10, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (109, N'Скумбрия копченая', 3, 180.0000, 25, 8, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (110, N'Суши-рыба', 3, 400.0000, 20, 9, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (111, N'Моллюски', 3, 200.0000, 45, 10, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (112, N'Анчоусы', 3, 150.0000, 50, 8, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (113, N'Морская капуста', 3, 90.0000, 70, 9, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (114, N'Яблоки', 4, 30.0000, 50, 11, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (115, N'Бананы', 4, 40.0000, 60, 12, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (116, N'Груши', 4, 35.0000, 45, 13, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (117, N'Апельсины', 4, 50.0000, 40, 11, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (118, N'Лимоны', 4, 60.0000, 30, 12, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (119, N'Виноград', 4, 90.0000, 25, 13, 47, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (120, N'Персики', 4, 80.0000, 20, 11, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (121, N'Нектарины', 4, 75.0000, 35, 12, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (122, N'Киви', 4, 45.0000, 50, 13, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (123, N'Манго', 4, 100.0000, 15, 11, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (124, N'Арбуз', 4, 30.0000, 60, 12, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (125, N'Дыня', 4, 40.0000, 55, 13, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (126, N'Сливы', 4, 60.0000, 40, 11, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (127, N'Черешня', 4, 120.0000, 20, 12, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (128, N'Клубника', 4, 70.0000, 50, 13, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (129, N'Малина', 4, 85.0000, 30, 11, 1, 27)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (130, N'Ежевика', 4, 100.0000, 25, 12, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (131, N'Инжир', 4, 150.0000, 15, 13, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (132, N'Абрикосы', 4, 70.0000, 45, 11, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (133, N'Гранат', 4, 90.0000, 30, 12, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (134, N'Кокос', 4, 110.0000, 20, 13, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (135, N'Папайя', 4, 120.0000, 10, 11, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (136, N'Ананас', 4, 100.0000, 25, 12, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (137, N'Финики', 4, 140.0000, 15, 13, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (138, N'Гуава', 4, 80.0000, 35, 11, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (139, N'Личи', 4, 130.0000, 12, 12, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (140, N'Мандарины', 4, 55.0000, 50, 13, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (141, N'Помело', 4, 120.0000, 20, 11, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (142, N'Фрукты микс', 4, 90.0000, 40, 12, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (143, N'Картофель', 5, 25.0000, 50, 14, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (144, N'Морковь', 5, 20.0000, 60, 15, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (145, N'Лук репчатый', 5, 15.0000, 70, 16, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (146, N'Чеснок', 5, 40.0000, 30, 14, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (147, N'Помидоры', 5, 60.0000, 40, 15, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (148, N'Огурцы', 5, 45.0000, 50, 16, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (149, N'Капуста белокочанная', 5, 25.0000, 45, 14, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (150, N'Капуста цветная', 5, 35.0000, 35, 15, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (151, N'Перец болгарский', 5, 70.0000, 25, 16, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (152, N'Баклажаны', 5, 50.0000, 40, 14, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (153, N'Цветная капуста', 5, 45.0000, 30, 16, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (154, N'Фасоль стручковая', 5, 60.0000, 20, 15, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (155, N'Кукуруза', 5, 55.0000, 30, 14, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (156, N'Редис', 5, 25.0000, 60, 15, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (157, N'Шпинат', 5, 40.0000, 50, 16, 14, 31)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (158, N'Зеленый лук', 5, 20.0000, 65, 14, 14, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (159, N'Петрушка', 5, 15.0000, 80, 15, 14, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (160, N'Укроп', 5, 15.0000, 75, 16, 14, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (161, N'Томаты черри', 5, 90.0000, 20, 15, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (162, N'Патиссоны', 5, 50.0000, 35, 15, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (163, N'Сельдерей', 5, 50.0000, 40, 16, 14, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (164, N'Тыква', 5, 30.0000, 55, 15, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (165, N'Листовой салат', 5, 25.0000, 60, 15, 14, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (166, N'Брокколи', 5, 60.0000, 30, 14, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (167, N'Руккола', 5, 45.0000, 40, 14, 14, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (168, N'Артемия', 5, 30.0000, 50, 16, 14, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (169, N'Мангольд', 5, 50.0000, 40, 16, 14, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (170, N'Кабачки', 5, 35.0000, 50, 14, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (171, N'Ревень', 5, 70.0000, 15, 15, 14, 30)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (172, N'Рис', 6, 40.0000, 50, 17, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (173, N'Гречка', 6, 45.0000, 40, 18, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (174, N'Пшено', 6, 30.0000, 60, 19, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (175, N'Овсянка', 6, 25.0000, 70, 17, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (176, N'Кукурузная крупа', 6, 35.0000, 50, 18, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (177, N'Манка', 6, 20.0000, 80, 19, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (178, N'Перловка', 6, 30.0000, 40, 17, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (179, N'Ячневая крупа', 6, 25.0000, 60, 18, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (180, N'Семена льна', 6, 60.0000, 30, 19, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (181, N'Чечевица', 6, 50.0000, 45, 17, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (182, N'Горошек зеленый', 6, 35.0000, 55, 18, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (183, N'Киноа', 6, 150.0000, 15, 19, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (184, N'Амарант', 6, 120.0000, 20, 17, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (185, N'Соя', 6, 60.0000, 25, 18, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (186, N'Фасоль', 6, 40.0000, 50, 19, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (187, N'Булгур', 6, 80.0000, 30, 17, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (188, N'Кускус', 6, 85.0000, 20, 18, 1, 5)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (189, N'Гречневая мука', 6, 75.0000, 15, 19, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (190, N'Ржаная мука', 6, 70.0000, 25, 17, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (191, N'Мука пшеничная', 6, 40.0000, 50, 18, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (192, N'Мука кукурузная', 6, 45.0000, 35, 19, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (193, N'Кукурузные хлопья', 6, 55.0000, 40, 17, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (194, N'Овсяные хлопья', 6, 50.0000, 45, 18, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (195, N'Мюсли', 6, 80.0000, 25, 19, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (196, N'Пшеничные отруби', 6, 30.0000, 60, 17, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (197, N'Рисовая мука', 6, 60.0000, 20, 18, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (198, N'Чиа семена', 6, 120.0000, 15, 19, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (199, N'Льняные семена', 6, 55.0000, 40, 17, 1, 35)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (200, N'Теф', 6, 140.0000, 10, 18, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (201, N'Белый хлеб', 7, 30.0000, 50, 20, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (202, N'Чёрный хлеб', 7, 35.0000, 60, 21, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (203, N'Булка', 7, 25.0000, 70, 22, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (204, N'Батон', 7, 28.0000, 65, 20, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (205, N'Сдоба', 7, 50.0000, 40, 21, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (206, N'Крендели', 7, 15.0000, 80, 22, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (207, N'Рогалики', 7, 20.0000, 75, 20, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (208, N'Лаваш', 7, 22.0000, 85, 21, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (209, N'Пита', 7, 30.0000, 45, 22, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (210, N'Пшеничный хлеб', 7, 40.0000, 50, 20, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (211, N'Ржаной хлеб', 7, 35.0000, 60, 21, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (212, N'Кукурузный хлеб', 7, 45.0000, 30, 22, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (213, N'Хлеб с отрубями', 7, 38.0000, 50, 20, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (214, N'Чиабатта', 7, 50.0000, 40, 21, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (215, N'Фокачча', 7, 60.0000, 25, 22, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (216, N'Багет', 7, 35.0000, 55, 20, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (217, N'Калач', 7, 45.0000, 35, 21, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (218, N'Хлеб тостовый нарезной', 7, 15.0000, 80, 22, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (219, N'Пампушки', 7, 20.0000, 75, 20, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (220, N'Хлебцы', 7, 25.0000, 65, 21, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (221, N'Сушки', 7, 18.0000, 90, 22, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (222, N'Пряники', 7, 40.0000, 50, 20, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (223, N'Кексы', 7, 45.0000, 40, 21, 1, 24)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (224, N'Пироги', 7, 60.0000, 30, 22, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (225, N'Штрудель', 7, 55.0000, 25, 20, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (226, N'Тортильи', 7, 50.0000, 40, 21, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (227, N'Песочное печенье', 7, 30.0000, 60, 22, 1, 14)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (228, N'Бублички', 7, 15.0000, 80, 20, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (229, N'Молочный хлеб', 7, 45.0000, 50, 21, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (230, N'Тостовый хлеб', 7, 40.0000, 60, 22, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (231, N'Замороженные креветки', 8, 250.0000, 30, 23, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (232, N'Замороженная рыба', 8, 200.0000, 40, 24, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (233, N'Замороженные овощи', 8, 60.0000, 50, 25, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (234, N'Замороженные фрукты', 8, 80.0000, 45, 23, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (235, N'Замороженные ягоды', 8, 90.0000, 35, 24, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (236, N'Замороженные картофельные пюре', 8, 70.0000, 55, 25, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (237, N'Замороженные картофельные пельмени', 8, 100.0000, 50, 23, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (238, N'Замороженные пиццы', 8, 120.0000, 30, 24, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (239, N'Замороженные морепродукты', 8, 300.0000, 20, 25, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (240, N'Замороженные куриные грудки', 8, 180.0000, 40, 23, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (241, N'Замороженные тефтели', 8, 120.0000, 25, 24, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (242, N'Замороженная свинина', 8, 220.0000, 30, 25, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (243, N'Замороженные бургеры', 8, 130.0000, 40, 23, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (244, N'Замороженные супы', 8, 110.0000, 50, 24, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (245, N'Замороженные соевые продукты', 8, 90.0000, 60, 25, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (246, N'Замороженные молочные изделия', 8, 100.0000, 55, 23, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (247, N'Замороженные тесто', 8, 80.0000, 65, 24, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (248, N'Замороженные грибы', 8, 70.0000, 75, 25, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (249, N'Замороженная индейка', 8, 250.0000, 20, 23, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (250, N'Замороженная пшенная каша', 8, 60.0000, 50, 24, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (251, N'Замороженные куриные ножки', 8, 160.0000, 45, 25, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (252, N'Замороженные сырники', 8, 110.0000, 30, 23, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (253, N'Замороженные мясные полуфабрикаты', 8, 150.0000, 35, 24, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (254, N'Замороженные оладьи', 8, 90.0000, 60, 25, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (255, N'Замороженная фасоль', 8, 50.0000, 65, 23, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (256, N'Замороженная капуста', 8, 40.0000, 70, 24, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (257, N'Замороженные сыры', 8, 180.0000, 25, 25, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (258, N'Замороженные колбаски', 8, 200.0000, 30, 24, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (259, N'Замороженная лапша', 8, 50.0000, 45, 23, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (260, N'Минеральная вода', 9, 20.0000, 60, 26, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (261, N'Газированная вода', 9, 18.0000, 50, 27, 37, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (262, N'Сок апельсиновый', 9, 40.0000, 45, 28, 39, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (263, N'Сок яблочный', 9, 35.0000, 50, 26, 39, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (264, N'Сок томатный', 9, 30.0000, 55, 27, 39, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (265, N'Лимонад', 9, 35.0000, 40, 28, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (266, N'Чай зелёный', 9, 50.0000, 25, 26, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (267, N'Чай чёрный', 9, 45.0000, 30, 27, 1, 5)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (268, N'Фруктовый напиток', 9, 60.0000, 20, 28, 39, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (269, N'Кофе без кофеина', 9, 80.0000, 15, 26, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (270, N'Молочный коктейль', 9, 70.0000, 25, 27, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (271, N'Минеральная вода с лимоном', 9, 25.0000, 45, 28, 37, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (272, N'Энергетический напиток', 9, 50.0000, 35, 26, 37, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (273, N'Гранатовый сок', 9, 90.0000, 15, 27, 39, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (274, N'Ледяной чай', 9, 55.0000, 40, 28, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (275, N'Кокосовая вода', 9, 60.0000, 30, 26, 39, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (276, N'Напиток на основе имбиря', 9, 50.0000, 25, 27, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (277, N'Растительный напиток', 9, 45.0000, 50, 28, 37, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (278, N'Морс', 9, 40.0000, 55, 26, 37, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (279, N'Лимонад с мятой', 9, 45.0000, 30, 27, 37, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (280, N'Фреш', 9, 65.0000, 20, 28, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (281, N'Томатный сок', 9, 30.0000, 50, 26, 39, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (282, N'Напиток из ягоды бузины', 9, 50.0000, 40, 27, 37, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (283, N'Клюквенный сок', 9, 55.0000, 30, 28, 39, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (284, N'Вода с минералами', 9, 35.0000, 60, 26, 37, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (285, N'Чай с ягодами', 9, 50.0000, 25, 27, 37, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (286, N'Фруктовый смузи', 9, 80.0000, 15, 28, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (287, N'Молочный напиток', 9, 45.0000, 50, 26, 39, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (288, N'Безалкогольное пиво', 9, 60.0000, 35, 27, 11, 7)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (289, N'Шоколад', 10, 40.0000, 50, 29, 9, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (290, N'Торты', 10, 150.0000, 25, 30, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (291, N'Печенье', 10, 30.0000, 60, 31, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (292, N'Кексы', 10, 45.0000, 40, 29, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (293, N'Марципан', 10, 80.0000, 30, 30, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (294, N'Пастила', 10, 50.0000, 50, 31, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (295, N'Зефир', 10, 60.0000, 40, 29, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (296, N'Пирожные', 10, 55.0000, 35, 30, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (297, N'Карамель', 10, 25.0000, 70, 31, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (298, N'Конфеты', 10, 35.0000, 45, 29, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (299, N'Пироги', 10, 90.0000, 30, 30, 1, 35)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (300, N'Сахарный песок', 10, 20.0000, 100, 31, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (301, N'Желейные конфеты', 10, 40.0000, 60, 29, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (302, N'Шоколадные батончики', 10, 50.0000, 50, 30, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (303, N'Пудинг', 10, 30.0000, 75, 31, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (304, N'Мармелад', 10, 45.0000, 40, 29, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (305, N'Бисквиты', 10, 35.0000, 65, 30, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (306, N'Профитроли', 10, 60.0000, 30, 31, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (307, N'Суфле', 10, 50.0000, 45, 29, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (308, N'Чизкейк', 10, 120.0000, 25, 30, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (309, N'Мороженое', 10, 60.0000, 35, 31, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (310, N'Пончики', 10, 35.0000, 50, 29, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (311, N'Трюфели', 10, 70.0000, 20, 30, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (312, N'Крем-брюле', 10, 80.0000, 25, 31, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (313, N'Тарталетки', 10, 65.0000, 40, 29, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (314, N'Эклеры', 10, 55.0000, 30, 30, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (315, N'Сиропы для коктейлей', 10, 50.0000, 50, 31, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (316, N'Банановая пастила', 10, 40.0000, 45, 29, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (317, N'Печенье с кремом', 10, 35.0000, 60, 30, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (318, N'Маршмеллоу', 10, 25.0000, 70, 31, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (319, N'Соль', 11, 15.0000, 100, 32, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (320, N'Перец чёрный молотый', 11, 25.0000, 80, 33, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (321, N'Чеснок сушёный', 11, 30.0000, 50, 34, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (322, N'Базилик', 11, 40.0000, 60, 32, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (323, N'Органик перец чили', 11, 35.0000, 40, 33, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (324, N'Куркума', 11, 45.0000, 30, 34, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (325, N'Майоран', 11, 50.0000, 25, 32, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (326, N'Корица', 11, 30.0000, 55, 33, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (327, N'Имбирь молотый', 11, 40.0000, 50, 34, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (328, N'Паприка', 11, 35.0000, 60, 32, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (329, N'Тмин', 11, 25.0000, 70, 33, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (330, N'Чили молотый', 11, 45.0000, 40, 34, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (331, N'Горчица молотая', 11, 20.0000, 80, 32, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (332, N'Семена кориандра', 11, 30.0000, 60, 33, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (333, N'Карри', 11, 50.0000, 30, 34, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (334, N'Чёрный перец горошком', 11, 40.0000, 55, 32, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (335, N'Гвоздика', 11, 45.0000, 25, 33, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (336, N'Лавровый лист', 11, 15.0000, 85, 34, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (337, N'Сахар ванильный', 11, 35.0000, 50, 32, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (338, N'Зира', 11, 40.0000, 45, 33, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (339, N'Кардамон', 11, 60.0000, 35, 34, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (340, N'Розмарин', 11, 55.0000, 30, 32, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (341, N'Чеснок гранулированный', 11, 30.0000, 65, 33, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (342, N'Чили перец молотый', 11, 50.0000, 40, 34, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (343, N'Петрушка сушёная', 11, 20.0000, 75, 32, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (344, N'Мускатный орех', 11, 60.0000, 25, 33, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (345, N'Тимьян', 11, 45.0000, 50, 34, 6, 26)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (346, N'Чёрный кунжут', 11, 35.0000, 60, 32, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (347, N'Сушёный лук', 11, 30.0000, 65, 33, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (348, N'Рис', 12, 35.0000, 100, 35, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (349, N'Гречка', 12, 40.0000, 80, 36, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (350, N'Макароны', 12, 25.0000, 120, 37, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (351, N'Мука', 12, 20.0000, 150, 35, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (352, N'Сахар', 12, 30.0000, 200, 36, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (353, N'Соль', 12, 15.0000, 180, 37, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (354, N'Каши быстрого приготовления', 12, 50.0000, 70, 35, 8, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (355, N'Пшеничная крупа', 12, 22.0000, 90, 36, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (356, N'Кукурузная крупа', 12, 18.0000, 110, 37, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (357, N'Фасоль', 12, 40.0000, 100, 35, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (358, N'Чечевица', 12, 35.0000, 120, 36, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (359, N'Гречневая крупа', 12, 45.0000, 85, 37, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (360, N'Пшеничная крупа', 12, 25.0000, 130, 35, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (361, N'Перловая крупа', 12, 28.0000, 90, 36, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (362, N'Молоко сгущенное', 12, 60.0000, 55, 37, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (363, N'Молоко в пакетах', 12, 35.0000, 120, 35, 39, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (364, N'Кокосовая стружка', 12, 45.0000, 50, 36, 18, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (365, N'Какао порошок', 12, 55.0000, 40, 37, 18, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (366, N'Масло растительное', 12, 75.0000, 80, 35, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (367, N'Оливковое масло', 12, 150.0000, 30, 36, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (368, N'Уксус', 12, 25.0000, 100, 37, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (369, N'Сода пищевая', 12, 10.0000, 160, 35, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (370, N'Крахмал', 12, 20.0000, 140, 36, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (371, N'Горох', 12, 35.0000, 110, 37, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (372, N'Мак', 12, 40.0000, 90, 35, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (373, N'Миндаль', 12, 120.0000, 40, 36, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (374, N'Фундук', 12, 150.0000, 30, 37, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (375, N'Кунжут', 12, 50.0000, 60, 35, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (376, N'Сухари', 12, 35.0000, 80, 36, 14, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (377, N'Пекарский порошок', 12, 15.0000, 90, 37, 18, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (378, N'Подсолнечное масло', 13, 50.0000, 100, 38, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (379, N'Оливковое масло', 13, 150.0000, 30, 39, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (380, N'Масло сливочное', 13, 80.0000, 70, 40, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (381, N'Масло кокосовое', 13, 120.0000, 50, 38, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (382, N'Масло льняное', 13, 90.0000, 40, 39, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (383, N'Кукурузное масло', 13, 60.0000, 60, 40, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (384, N'Масло грецкого ореха', 13, 200.0000, 20, 38, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (385, N'Масло кунжутное', 13, 140.0000, 35, 39, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (386, N'Масло рапсовое', 13, 70.0000, 50, 40, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (387, N'Масло виноградных косточек', 13, 130.0000, 40, 38, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (388, N'Маргарин', 13, 55.0000, 80, 39, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (389, N'Масло топлёное', 13, 85.0000, 65, 40, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (390, N'Масло соевое', 13, 60.0000, 90, 38, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (391, N'Масло тыквенное', 13, 100.0000, 50, 39, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (392, N'Масло из грецкого ореха', 13, 150.0000, 30, 40, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (393, N'Масло авокадо', 13, 180.0000, 25, 38, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (394, N'Масло ши', 13, 200.0000, 15, 39, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (395, N'Масло из семян чиа', 13, 160.0000, 20, 40, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (396, N'Масло ореховое', 13, 110.0000, 45, 38, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (397, N'Масло сафлоровое', 13, 95.0000, 55, 39, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (398, N'Масло каноловое', 13, 75.0000, 65, 40, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (399, N'Масло из виноградных косточек', 13, 130.0000, 50, 38, 4, 35)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (400, N'Жир говяжий', 13, 70.0000, 80, 39, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (401, N'Жир куриный', 13, 60.0000, 100, 40, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (402, N'Жир свиной', 13, 50.0000, 120, 38, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (403, N'Крем для выпечки', 13, 90.0000, 45, 39, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (404, N'Жир бараний', 13, 110.0000, 35, 40, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (405, N'Масло для жарки', 13, 50.0000, 90, 38, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (406, N'Кокосовое масло для жарки', 13, 150.0000, 40, 39, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (407, N'Детское молоко 1', 14, 60.0000, 80, 41, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (408, N'Детское молоко 2', 14, 70.0000, 60, 42, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (409, N'Пюре из яблок', 14, 30.0000, 100, 43, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (410, N'Пюре из груш', 14, 35.0000, 90, 41, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (411, N'Детская каша овсяная', 14, 50.0000, 80, 42, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (412, N'Детская каша гречневая', 14, 45.0000, 85, 43, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (413, N'Детская каша рисовая', 14, 40.0000, 100, 41, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (414, N'Пюре из картофеля', 14, 25.0000, 120, 42, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (415, N'Детские соки яблочные', 14, 30.0000, 100, 43, 39, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (416, N'Детские соки грушевые', 14, 35.0000, 90, 41, 39, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (417, N'Пюре из моркови', 14, 20.0000, 110, 42, 39, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (418, N'Пюре из кабачков', 14, 25.0000, 120, 43, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (419, N'Печенье детское', 14, 40.0000, 80, 41, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (420, N'Сухари детские', 14, 30.0000, 100, 42, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (421, N'Детские крекеры', 14, 25.0000, 120, 43, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (422, N'Детское питание с мясом', 14, 55.0000, 70, 41, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (423, N'Детские каши с фруктами', 14, 60.0000, 60, 42, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (424, N'Пюре с мясом', 14, 50.0000, 80, 43, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (425, N'Детские йогурты', 14, 40.0000, 90, 41, 19, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (426, N'Детские пельмени', 14, 70.0000, 50, 42, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (427, N'Детские пасты', 14, 45.0000, 85, 43, 6, 27)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (428, N'Каша кукурузная детская', 14, 50.0000, 75, 41, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (429, N'Детское пюре с ягодами', 14, 40.0000, 90, 42, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (430, N'Детские смеси для кормления', 14, 80.0000, 40, 43, 8, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (431, N'Детские сосиски', 14, 60.0000, 60, 41, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (432, N'Детское пюре с мясом курицы', 14, 55.0000, 70, 42, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (433, N'Детская кашка с бананом', 14, 50.0000, 80, 43, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (434, N'Детская кашка с изюмом', 14, 40.0000, 100, 41, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (435, N'Детский творог', 14, 45.0000, 85, 42, 6, 32)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (436, N'Диетическое молоко', 15, 55.0000, 80, 44, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (437, N'Диетическая каша овсяная', 15, 40.0000, 100, 45, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (438, N'Диетическое печенье', 15, 35.0000, 120, 46, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (439, N'Диетический хлеб', 15, 45.0000, 85, 44, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (440, N'Печенье без сахара', 15, 50.0000, 90, 45, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (441, N'Диетическая паста', 15, 60.0000, 75, 46, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (442, N'Диетический йогурт', 15, 50.0000, 100, 44, 19, 31)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (443, N'Суп диетический', 15, 55.0000, 60, 45, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (444, N'Каша гречневая без соли', 15, 40.0000, 110, 46, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (445, N'Творог диетический', 15, 45.0000, 80, 44, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (446, N'Диетическое мясо курицы', 15, 75.0000, 70, 46, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (447, N'Фрукты для диетического питания', 15, 35.0000, 130, 46, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (448, N'Рыба диетическая', 15, 65.0000, 90, 44, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (449, N'Пюре из овощей', 15, 30.0000, 120, 45, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (450, N'Диетические крекеры', 15, 40.0000, 100, 46, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (451, N'Диетические соки', 15, 25.0000, 130, 44, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (452, N'Диетическое масло', 15, 70.0000, 60, 46, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (453, N'Масло оливковое диетическое', 15, 100.0000, 50, 45, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (454, N'Желатин диетический', 15, 20.0000, 150, 44, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (455, N'Шоколад диетический', 15, 80.0000, 40, 45, 9, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (456, N'Пюре из яблок без сахара', 15, 30.0000, 110, 46, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (457, N'Овощи замороженные диетические', 15, 45.0000, 90, 44, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (458, N'Орехи для диетического питания', 15, 60.0000, 75, 45, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (459, N'Кефир диетический', 15, 50.0000, 85, 46, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (460, N'Гречка для диетического питания', 15, 35.0000, 100, 44, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (461, N'Мука овсяная диетическая', 15, 40.0000, 90, 45, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (462, N'Пшено диетическое', 15, 30.0000, 120, 46, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (463, N'Чай травяной диетический', 15, 25.0000, 130, 44, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (464, N'Мед для диетического питания', 15, 90.0000, 50, 45, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (465, N'Плантент диетический', 15, 60.0000, 80, 46, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (466, N'Чипсы картофельные', 16, 35.0000, 100, 47, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (467, N'Чипсы со вкусом сыра', 16, 40.0000, 90, 48, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (468, N'Чипсы с солью', 16, 30.0000, 120, 49, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (469, N'Чипсы с уксусом', 16, 35.0000, 100, 47, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (470, N'Снеки из кукурузы', 16, 50.0000, 80, 48, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (471, N'Снеки с паприкой', 16, 45.0000, 90, 49, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (472, N'Чипсы с барбекю', 16, 40.0000, 110, 47, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (473, N'Снеки со вкусом сметаны', 16, 50.0000, 85, 48, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (474, N'Попкорн сладкий', 16, 30.0000, 150, 49, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (475, N'Попкорн соленый', 16, 25.0000, 160, 47, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (476, N'Чипсы с беконом', 16, 45.0000, 95, 48, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (477, N'Снеки с морковью', 16, 40.0000, 110, 49, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (478, N'Тортилья чипсы', 16, 55.0000, 80, 47, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (479, N'Снеки с сыром', 16, 50.0000, 85, 48, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (480, N'Снеки из картофельного пюре', 16, 40.0000, 100, 49, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (481, N'Чипсы с солью и перцем', 16, 40.0000, 90, 47, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (482, N'Кукурузные чипсы', 16, 45.0000, 95, 48, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (483, N'Снеки со вкусом лимона', 16, 50.0000, 80, 49, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (484, N'Чипсы из сладкого картофеля', 16, 60.0000, 70, 47, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (485, N'Снеки с томатом', 16, 45.0000, 90, 48, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (486, N'Чипсы с чесноком', 16, 40.0000, 100, 49, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (487, N'Снеки со вкусом зелени', 16, 45.0000, 90, 47, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (488, N'Кукурузные палочки', 16, 25.0000, 140, 48, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (489, N'Снеки с курицей', 16, 50.0000, 85, 49, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (490, N'Чипсы с перцем чили', 16, 50.0000, 80, 47, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (491, N'Чипсы с морской солью', 16, 40.0000, 95, 48, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (492, N'Снеки с сыром и зеленью', 16, 55.0000, 70, 49, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (493, N'Чипсы с беконом и сыром', 16, 60.0000, 65, 47, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (494, N'Снеки с куриным вкусом', 16, 45.0000, 90, 48, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (495, N'Консервация помидоров', 17, 40.0000, 100, 50, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (496, N'Консервация огурцов', 17, 35.0000, 110, 51, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (497, N'Тушенка говяжья', 17, 80.0000, 50, 52, 11, 23)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (498, N'Консервация баклажанов', 17, 45.0000, 90, 50, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (499, N'Консервация кукурузы', 17, 50.0000, 80, 51, 11, 35)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (500, N'Консервация ананасов', 17, 60.0000, 70, 52, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (501, N'Консервация яблок', 17, 40.0000, 100, 50, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (502, N'Консервация фасоли', 17, 50.0000, 85, 51, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (503, N'Консервация горошка', 17, 45.0000, 90, 52, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (504, N'Консервация персиков', 17, 55.0000, 75, 50, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (505, N'Консервация мясных продуктов', 17, 100.0000, 50, 51, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (506, N'Консервация свеклы', 17, 35.0000, 120, 52, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (507, N'Консервация моркови', 17, 30.0000, 130, 50, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (508, N'Консервация яблок и груш', 17, 50.0000, 80, 51, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (509, N'Консервация перца', 17, 60.0000, 70, 52, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (510, N'Консервация томатного сока', 17, 45.0000, 90, 50, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (511, N'Консервация сливы', 17, 50.0000, 80, 51, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (512, N'Консервация винограда', 17, 65.0000, 60, 52, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (513, N'Консервация грибов', 17, 75.0000, 55, 50, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (514, N'Консервация апельсинов', 17, 70.0000, 65, 51, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (515, N'Консервация помидоров с чесноком', 17, 50.0000, 90, 52, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (516, N'Консервация картофеля', 17, 40.0000, 100, 50, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (517, N'Консервация вишни', 17, 60.0000, 70, 51, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (518, N'Консервация сардельки', 17, 80.0000, 50, 52, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (519, N'Консервация креветок', 17, 120.0000, 40, 50, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (520, N'Консервация мидий', 17, 130.0000, 30, 51, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (521, N'Консервация горошка зеленого', 17, 45.0000, 90, 52, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (522, N'Консервация кукурузных початков', 17, 55.0000, 70, 50, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (523, N'Консервация пастеризованного молока', 17, 60.0000, 80, 51, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (524, N'Консервация красной рыбы', 17, 150.0000, 30, 52, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (525, N'Томатный соус', 18, 40.0000, 100, 53, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (526, N'Майонез', 18, 50.0000, 120, 54, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (527, N'Кетчуп', 18, 45.0000, 110, 55, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (528, N'Соус барбекю', 18, 60.0000, 90, 53, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (529, N'Греческий соус', 18, 70.0000, 80, 54, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (530, N'Чесночный соус', 18, 55.0000, 100, 55, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (531, N'Соус тартар', 18, 65.0000, 75, 53, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (532, N'Соус чили', 18, 60.0000, 90, 54, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (533, N'Соус соевый', 18, 30.0000, 130, 55, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (534, N'Винегретная заправка', 18, 40.0000, 110, 53, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (535, N'Соус для пасты', 18, 50.0000, 100, 54, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (536, N'Соус карри', 18, 65.0000, 85, 55, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (537, N'Салатная заправка', 18, 45.0000, 120, 53, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (538, N'Соус из йогурта', 18, 50.0000, 90, 54, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (539, N'Сливочный соус', 18, 75.0000, 80, 55, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (540, N'Сальса', 18, 60.0000, 85, 53, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (541, N'Соус бешамель', 18, 70.0000, 70, 54, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (542, N'Тахини соус', 18, 80.0000, 60, 55, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (543, N'Соус песто', 18, 90.0000, 50, 53, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (544, N'Соус с вином', 18, 65.0000, 75, 54, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (545, N'Соус с горчицей', 18, 50.0000, 95, 55, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (546, N'Соус с медом', 18, 70.0000, 85, 53, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (547, N'Томатно-чесночный соус', 18, 55.0000, 90, 54, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (548, N'Соус пицца', 18, 65.0000, 80, 55, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (549, N'Соус для шашлыка', 18, 60.0000, 100, 53, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (550, N'Кисло-сладкий соус', 18, 50.0000, 110, 54, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (551, N'Соус курага-слива', 18, 75.0000, 70, 55, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (552, N'Заправка для сэндвичей', 18, 45.0000, 120, 53, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (553, N'Соус винный', 18, 80.0000, 60, 54, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (554, N'Молочный соус', 18, 55.0000, 95, 55, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (555, N'Тофу', 19, 70.0000, 100, 56, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (556, N'Соевое молоко', 19, 45.0000, 110, 57, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (557, N'Темпе', 19, 80.0000, 80, 58, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (558, N'Вегетарианские котлеты', 19, 60.0000, 90, 56, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (559, N'Гречка', 19, 30.0000, 120, 57, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (560, N'Чечевица', 19, 40.0000, 100, 58, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (561, N'Киноа', 19, 90.0000, 70, 56, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (562, N'Брокколи', 19, 50.0000, 110, 57, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (563, N'Спирулина', 19, 150.0000, 40, 58, 1, 22)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (564, N'Орехи кешью', 19, 110.0000, 60, 56, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (565, N'Орехи миндаль', 19, 120.0000, 55, 57, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (566, N'Семена чиа', 19, 80.0000, 80, 58, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (567, N'Фалафель', 19, 65.0000, 90, 56, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (568, N'Авокадо', 19, 50.0000, 100, 57, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (569, N'Соевый соус', 19, 35.0000, 120, 58, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (570, N'Рис басмати', 19, 40.0000, 100, 56, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (571, N'Томаты черри', 19, 45.0000, 110, 57, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (572, N'Картофель', 19, 25.0000, 150, 58, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (573, N'Грибы шампиньоны', 19, 60.0000, 90, 56, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (574, N'Печеные бобы', 19, 50.0000, 95, 57, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (575, N'Миндальное молоко', 19, 55.0000, 100, 58, 7, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (576, N'Семена льна', 19, 40.0000, 120, 56, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (577, N'Томатная паста', 19, 30.0000, 130, 57, 27, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (578, N'Сухие водоросли', 19, 90.0000, 70, 58, 27, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (579, N'Соя', 19, 45.0000, 110, 56, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (580, N'Бобовые смеси', 19, 50.0000, 100, 57, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (581, N'Морковь', 19, 25.0000, 140, 58, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (582, N'Авокадо паста', 19, 60.0000, 85, 56, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (583, N'Листья шпината', 19, 55.0000, 95, 57, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (584, N'Орехи пекан', 19, 130.0000, 50, 58, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (585, N'Пельмени с мясом', 20, 80.0000, 100, 59, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (586, N'Пельмени с курицей', 20, 75.0000, 110, 60, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (587, N'Котлеты из говядины', 20, 90.0000, 80, 61, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (588, N'Котлеты из курицы', 20, 85.0000, 90, 59, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (589, N'Чебуреки с мясом', 20, 95.0000, 70, 60, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (590, N'Вареники с картошкой', 20, 60.0000, 120, 61, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (591, N'Вареники с вишней', 20, 65.0000, 110, 59, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (592, N'Пирог с капустой', 20, 70.0000, 100, 60, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (593, N'Пирог с мясом', 20, 80.0000, 90, 61, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (594, N'Голубцы', 20, 95.0000, 80, 59, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (595, N'Суп из фасоли', 20, 50.0000, 130, 60, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (596, N'Суп из грибов', 20, 60.0000, 110, 61, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (597, N'Суп харчо', 20, 70.0000, 90, 59, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (598, N'Запеканка картофельная', 20, 75.0000, 80, 60, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (599, N'Картошка фри замороженная', 20, 55.0000, 120, 61, 1, 35)
GO
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (600, N'Рагу из овощей', 20, 65.0000, 110, 59, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (601, N'Куриные наггетсы', 20, 85.0000, 100, 60, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (602, N'Солянка', 20, 80.0000, 90, 61, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (603, N'Жареная рыба', 20, 120.0000, 60, 59, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (604, N'Лазанья с мясом', 20, 95.0000, 70, 60, 12, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (605, N'Лазанья с овощами', 20, 90.0000, 80, 61, 12, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (606, N'Блины с мясом', 20, 65.0000, 100, 59, 12, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (607, N'Блины с творогом', 20, 60.0000, 110, 60, 12, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (608, N'Гречневая каша с мясом', 20, 75.0000, 90, 61, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (609, N'Гречневая каша с грибами', 20, 70.0000, 100, 59, 11, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (610, N'Каша овсяная', 20, 50.0000, 130, 60, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (611, N'Рыбные котлеты', 20, 95.0000, 80, 61, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (612, N'Фаршированные перцы', 20, 90.0000, 75, 59, 1, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (613, N'Чизкейк замороженный', 20, 100.0000, 70, 60, 6, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (614, N'Пицца маргарита замороженная', 20, 85.0000, 90, 61, 5, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (615, N'Вино красное сухое', 21, 150.0000, 50, 62, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (616, N'Вино белое полусладкое', 21, 120.0000, 60, 63, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (617, N'Шампанское', 21, 180.0000, 40, 64, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (618, N'Пиво светлое', 21, 30.0000, 150, 62, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (619, N'Коньяк', 21, 350.0000, 20, 63, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (620, N'Виски', 21, 450.0000, 30, 64, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (621, N'Ром', 21, 220.0000, 40, 62, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (622, N'Текила', 21, 300.0000, 25, 63, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (623, N'Ликер шоколадный', 21, 250.0000, 35, 64, 4, 35)
INSERT [dbo].[Product] ([id], [name], [category_id], [price], [quantity], [producer_id], [measurement_id], [discount_id]) VALUES (624, N'Джин', 21, 280.0000, 30, 62, 4, 35)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (1, N'Автономная Республика Крым', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (2, N'Винницкая область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (3, N'Волынская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (4, N'Днепропетровская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (5, N'Донецкая область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (6, N'Житомирская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (7, N'Закарпатская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (8, N'Запорожская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (9, N'Ивано-Франковская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (10, N'Киевская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (11, N'Кировоградская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (12, N'Луганская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (13, N'Львовская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (14, N'Николаевская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (15, N'Одесская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (16, N'Полтавская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (17, N'Ровненская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (18, N'Сумская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (19, N'Тернопольская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (20, N'Харьковская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (21, N'Херсонская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (22, N'Хмельницкая область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (23, N'Черкасская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (24, N'Черниговская область', 1)
INSERT [dbo].[Region] ([id], [name], [country_id]) VALUES (25, N'Черновицкая область', 1)
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (1, 1, 51.3000, 5, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (2, 6, 171.0000, 14, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (3, 29, 17.0000, 60, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (4, 45, 44.0000, 25, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (5, 63, 136.0000, 20, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (6, 82, 153.0000, 15, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (7, 97, 216.0000, 18, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (8, 129, 38.2500, 30, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (9, 157, 8.0000, 50, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (10, 171, 17.5000, 15, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (11, 188, 80.7500, 20, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (12, 223, 27.0000, 40, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (13, 227, 25.8000, 60, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (14, 267, 42.7500, 30, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (15, 288, 55.8000, 35, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (16, 345, 22.5000, 50, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (17, 427, 20.2500, 85, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (18, 435, 6.7500, 85, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (19, 442, 10.0000, 100, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (20, 497, 52.0000, 50, CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Sale] ([id], [product_id], [price], [quantity], [date_of_sale]) VALUES (21, 563, 105.0000, 40, CAST(N'2025-02-08' AS Date))
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (1, N'Молочная Река', 1)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (2, N'ЭкоМолоко', 2)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (3, N'Лавка молока', 3)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (4, N'Мясной Мир', 4)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (5, N'Говядина и свинина', 5)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (6, N'Фермерский уголок', 6)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (7, N'Голубая вода', 7)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (8, N'Морская свежесть', 8)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (9, N'АкваПродукт', 9)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (10, N'Фрукты от природы', 10)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (11, N'ЭкоПлод', 11)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (12, N'Зеленый сад', 12)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (13, N'Овощи с поля', 13)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (14, N'Зеленая огородина', 14)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (15, N'Фермерский урожай', 15)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (16, N'Зерновая долина', 16)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (17, N'Поле и поле', 17)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (18, N'Гречка и рис', 18)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (19, N'Хлебный дом', 19)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (20, N'Пекарня счастья', 20)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (21, N'Хлебный уголок', 21)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (22, N'Зимний вкус', 22)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (23, N'Ледяной рынок', 23)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (24, N'Замороженная свежесть', 24)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (25, N'Чистая вода', 25)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (26, N'Вкус жизни', 26)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (27, N'Натуральные напитки', 27)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (28, N'Сладкая мечта', 28)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (29, N'Шоколадный рай', 29)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (30, N'Десертный уголок', 30)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (31, N'Пряности мира', 31)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (32, N'Пикантные нотки', 32)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (33, N'Мир специй', 33)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (34, N'Бакалея на ладони', 34)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (35, N'Продукты с душой', 35)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (36, N'Шелковый путь', 36)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (37, N'Масляный берег', 37)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (38, N'Чистое масло', 38)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (39, N'Оливковый рай', 39)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (40, N'Детский мир', 40)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (41, N'Маленький гурман', 41)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (42, N'Светлый путь', 42)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (43, N'Здоровая еда', 43)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (44, N'Фитнес питание', 44)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (45, N'Легкость в каждом продукте', 45)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (46, N'Снэк-Бар', 46)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (47, N'Чипсы&Снэки', 47)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (48, N'Вкусняшка', 48)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (49, N'Консервный завод', 49)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (50, N'Золотая банка', 50)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (51, N'Полка с банками', 51)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (52, N'Вкусно и просто', 52)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (53, N'Соусные традиции', 53)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (54, N'Гармония вкуса', 54)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (55, N'Зеленый рай', 55)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (56, N'Веганский мир', 56)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (57, N'Сила природы', 57)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (58, N'Быстрая еда', 58)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (59, N'Готовим с любовью', 59)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (60, N'Полуфабрикаты для вас', 60)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (61, N'Вино и Ликеры', 61)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (62, N'Элитные напитки', 62)
INSERT [dbo].[Supplier] ([id], [name], [address_id]) VALUES (63, N'Пивоварня', 63)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
ALTER TABLE [dbo].[Discount] ADD  CONSTRAINT [DF_Discount_percent]  DEFAULT ((0)) FOR [percnt]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_City] FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_City]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Region] FOREIGN KEY([region_id])
REFERENCES [dbo].[Region] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Region]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Product]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Supplier] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Supplier] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Supplier]
GO
ALTER TABLE [dbo].[Producer]  WITH CHECK ADD  CONSTRAINT [FK_Producer_Address] FOREIGN KEY([address_id])
REFERENCES [dbo].[Address] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Producer] CHECK CONSTRAINT [FK_Producer_Address]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Discount] FOREIGN KEY([discount_id])
REFERENCES [dbo].[Discount] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Discount]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Measurement] FOREIGN KEY([measurement_id])
REFERENCES [dbo].[Measurement] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Measurement]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Producer] FOREIGN KEY([producer_id])
REFERENCES [dbo].[Producer] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Producer]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country] FOREIGN KEY([country_id])
REFERENCES [dbo].[Country] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Region_Country]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Product]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Address] FOREIGN KEY([address_id])
REFERENCES [dbo].[Address] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Address]
GO
USE [master]
GO
ALTER DATABASE [Logistic] SET  READ_WRITE 
GO
