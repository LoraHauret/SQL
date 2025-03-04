USE [master]
GO
/****** Object:  Database [Store]    Script Date: 06.02.2025 12:48:10 ******/
CREATE DATABASE [Store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Store', FILENAME = N'D:\DB\projects\homework1\Store.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Store_log', FILENAME = N'D:\DB\projects\homework1\Store_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Store] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Store] SET ARITHABORT OFF 
GO
ALTER DATABASE [Store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Store] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Store] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Store] SET  MULTI_USER 
GO
ALTER DATABASE [Store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Store] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Store] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Store] SET QUERY_STORE = OFF
GO
USE [Store]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 06.02.2025 12:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[category] [nvarchar](100) NULL,
	[price] [float] NULL,
	[discount] [float] NULL,
	[quantity] [int] NULL,
	[measurement] [nvarchar](50) NULL,
	[producer] [nvarchar](50) NULL,
	[country] [nvarchar](100) NULL,
	[supplier] [nvarchar](100) NULL,
	[date_of_delivery] [date] NULL,
	[expire_date] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (1, N'Яблоки Gala', N'Фрукты', 53.13, 10, 10, N'кг', N'Фермерское хозяйство', N'Украина', N'Фрукты Доставка', CAST(N'2025-02-04' AS Date), CAST(N'2025-03-04' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (2, N'Помидоры черри', N'Овощи', 120, 5, 15, N'кг', N'Теплица "Лагідне"', N'Украина', N'Овощи Поставка', CAST(N'2025-02-06' AS Date), CAST(N'2025-02-15' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (3, N'Молоко 3.2%', N'Молочные продукты', 53, 3, 5, N'литр', N'Вкусно и точка', N'Украина', N'Молочная поставка', CAST(N'2025-02-05' AS Date), CAST(N'2025-03-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (4, N'Хлеб ржаной', N'Хлебобулочные изделия', 18, 2, 25, N'шт', N'Хлебзавод №2', N'Украина', N'Пекарня "Рынок"', CAST(N'2025-02-06' AS Date), CAST(N'2025-02-07' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (5, N'Куриные грудки', N'Мясо', 300, 15, 20, N'кг', N'Бройлер Плюс', N'Украина', N'Мясо Продукты', CAST(N'2025-02-05' AS Date), CAST(N'2025-02-20' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (6, N'Сметана 15%', N'Молочные продукты', 84, 0, 36, N'банка 200 г', N'Молочный Миг', N'	AgroMilk', N'Молочная Поставка', CAST(N'2025-02-05' AS Date), CAST(N'2025-03-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (7, N'Картофель', N'Овощи', 32, 0, 400, N'кг', N'	AgroField', N'FarmGroup', N'Овощи Поставка', CAST(N'2025-02-04' AS Date), CAST(N'2025-08-04' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (8, N'Фета', N'Сыры', 420, 5, 10, N'кг', N'GreekDairy', N'Греция', N'CheeseSupply', CAST(N'2025-02-04' AS Date), CAST(N'2025-04-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (9, N'Пармезан', N'Сыры', 750, 5, 8, N'кг', N'ParmigianoReggiano', N'Италия', N'ItalianCheese', CAST(N'2025-02-04' AS Date), CAST(N'2025-06-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (10, N'Горький шоколад 85%', N'Сладости', 280, 10, 15, N'кг', N'DarkCacao', N'Бельгия', N'SweetImport', CAST(N'2025-02-05' AS Date), CAST(N'2026-09-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (11, N'Оливковое масло экстра вирджин', N'Масла', 620, 5, 20, N'литр', N'OlivePress', N'Испания', N'OilSupplier', CAST(N'2025-02-04' AS Date), CAST(N'2026-12-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (12, N'Жасминовый чай', N'Чай и кофе', 350, 5, 12, N'кг', N'JasmineTeaCo', N'Китай', N'TeaSupplier', CAST(N'2025-02-04' AS Date), CAST(N'2026-07-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (13, N'Кленовый сироп', N'Сладости', 350, 5, 10, N'литр', N'MapleFarm', N'Канада', N'SweetImport', CAST(N'2025-02-04' AS Date), CAST(N'2026-12-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (14, N'Французский камамбер', N'Сыры', 500, 10, 8, N'кг', N'FromageFermier', N'Франция', N'CheeseImport', CAST(N'2025-02-05' AS Date), CAST(N'2025-03-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (15, N'Итальянская моцарелла', N'Сыры', 450, 5, 12, N'кг', N'MozzaDella', N'Италия', N'CheeseSupply', CAST(N'2025-02-04' AS Date), CAST(N'2025-02-20' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (16, N'Авокадо Хасс', N'Фрукты', 120, 0, 25, N'кг', N'GreenFarms', N'Мексика', N'FreshImport', CAST(N'2025-02-04' AS Date), CAST(N'2025-02-10' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (17, N'Клубника свежая', N'Фрукты', 300, 5, 20, N'кг', N'BerryGarden', N'Египет', N'FruitSupply', CAST(N'2025-02-04' AS Date), CAST(N'2025-02-15' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (18, N'Голубика', N'Фрукты', 400, 0, 15, N'кг', N'BlueBerryFarm', N'Чили', N'BerryImport', CAST(N'2025-02-04' AS Date), CAST(N'2025-02-18' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (19, N'Манго Альфонсо', N'Фрукты', 350, 10, 12, N'кг', N'MangoExport', N'Индия', N'FruitImport', CAST(N'2025-02-04' AS Date), CAST(N'2025-02-12' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (20, N'Какао-порошок', N'Кондитерские ингредиенты', 220, 5, 10, N'кг', N'CocoaWorld', N'Гана', N'AgroCocoa', CAST(N'2025-02-04' AS Date), CAST(N'2026-11-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (21, N'Арабика Эфиопия', N'Чай и кофе', 450, 5, 10, N'кг', N'EthiopianCoffee', N'Эфиопия', N'CoffeeImport', CAST(N'2025-02-04' AS Date), CAST(N'2026-06-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (22, N'Матча японская', N'Чай и кофе', 700, 5, 5, N'кг', N'KyotoMatcha', N'Япония', N'TeaSupplier', CAST(N'2025-02-04' AS Date), CAST(N'2026-05-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (23, N'Оливки Каламата', N'Консервы', 320, 0, 18, N'кг', N'GreekOlives', N'Греция', N'OliveSupply', CAST(N'2025-02-04' AS Date), CAST(N'2026-08-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (24, N'Соевый соус Киккоман', N'Соусы', 180, 5, 15, N'литр', N'Kikkoman', N'Япония', N'SauceImport', CAST(N'2025-02-04' AS Date), CAST(N'2026-12-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (25, N'Рис басмати', N'Крупы', 150, 0, 30, N'кг', N'BasmatiFields', N'Пакистан', N'GrainSupply', CAST(N'2025-02-04' AS Date), CAST(N'2026-10-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (26, N'Чечевица красная', N'Бобовые', 120, 0, 20, N'кг', N'LentilFarm', N'Турция', N'BeanSupplier', CAST(N'2025-02-04' AS Date), CAST(N'2026-09-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (27, N'Кедровые орехи', N'Орехи', 600, 5, 10, N'кг', N'SiberianPine', N'Россия', N'NutImport', CAST(N'2025-02-04' AS Date), CAST(N'2026-07-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (28, N'Яблоки Гала', N'Фрукты', 35, 5, 10, N'кг', N'FreshFruit', N'Украина', N'AgroFresh', CAST(N'2025-02-04' AS Date), CAST(N'2025-03-10' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (29, N'Груши Конференция', N'Фрукты', 40, 10, 15, N'кг', N'GreenOrchard', N'Польша', N'FreshImport', CAST(N'2025-02-04' AS Date), CAST(N'2025-03-12' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (30, N'Апельсины Навел', N'Фрукты', 55, 0, 12, N'кг', N'SunnyOranges', N'Испания', N'CitrusWorld', CAST(N'2025-02-04' AS Date), CAST(N'2025-03-15' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (31, N'Бананы Эквадор', N'Фрукты', 45, 5, 20, N'кг', N'TropicFruit', N'Эквадор', N'BananaTrade', CAST(N'2025-02-04' AS Date), CAST(N'2025-02-14' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (32, N'Черника', N'Ягоды', 140, 5, 3, N'кг', N'WildBerries', N'Украина', N'BerrySupply', CAST(N'2025-02-04' AS Date), CAST(N'2025-02-09' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (33, N'Картофель Белый', N'Овощи', 15, 0, 50, N'кг', N'AgroField', N'Украина', N'FarmGroup', CAST(N'2025-02-04' AS Date), CAST(N'2025-03-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (34, N'Морковь молодая', N'Овощи', 18, 5, 25, N'кг', N'HealthyVeggies', N'Украина', N'GreenSupply', CAST(N'2025-02-04' AS Date), CAST(N'2025-02-20' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (35, N'Лук красный', N'Овощи', 22, 0, 30, N'кг', N'OnionFarm', N'Польша', N'AgroFresh', CAST(N'2025-02-04' AS Date), CAST(N'2025-03-10' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (36, N'Молоко 2.5% жирности', N'Молочные продукты', 38, 4, 20, N'литр', N'DairyFarm', N'Украина', N'MilkSupplier', CAST(N'2025-02-04' AS Date), CAST(N'2025-02-05' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (37, N'Кефир 1% жирности', N'Молочные продукты', 32, 0, 15, N'литр', N'FreshDairy', N'Украина', N'AgroMilk', CAST(N'2025-02-04' AS Date), CAST(N'2025-02-07' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (38, N'Творог 5% жирности', N'Молочные продукты', 80, 5, 10, N'кг', N'DairyLand', N'Украина', N'FarmCheese', CAST(N'2025-02-04' AS Date), CAST(N'2025-02-06' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (39, N'Йогурт клубничный', N'Молочные продукты', 25, 5, 30, N'шт', N'BerryDairy', N'Украина', N'YogurtSupply', CAST(N'2025-02-04' AS Date), CAST(N'2025-02-10' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (40, N'Масло сливочное 82%', N'Молочные продукты', 150, 0, 8, N'кг', N'ButterFarm', N'Украина', N'DairySupply', CAST(N'2025-02-04' AS Date), CAST(N'2025-03-15' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (41, N'Говядина филе', N'Мясо', 350, 0, 5, N'кг', N'MeatFactory', N'Украина', N'MeatSupplier', CAST(N'2025-02-04' AS Date), CAST(N'2025-02-05' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (42, N'Свинина ошеек', N'Мясо', 280, 5, 6, N'кг', N'PorkLand', N'Украина', N'FarmMeat', CAST(N'2025-02-04' AS Date), CAST(N'2025-02-07' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (43, N'Куриное филе', N'Мясо', 180, 10, 10, N'кг', N'ChickenFarm', N'Украина', N'AgroChicken', CAST(N'2025-02-04' AS Date), CAST(N'2025-02-08' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (44, N'Лосось охлажденный', N'Рыба', 420, 5, 4, N'кг', N'OceanFish', N'Норвегия', N'FishImport', CAST(N'2025-02-04' AS Date), CAST(N'2025-02-06' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (45, N'Минтай', N'Рыба', 120, 0, 7, N'кг', N'SeaHarvest', N'Украина', N'FishSupply', CAST(N'2025-02-04' AS Date), CAST(N'2025-02-15' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (46, N'Гречка', N'Крупы', 65, 0, 30, N'кг', N'GrainFarm', N'Украина', N'AgroGrain', CAST(N'2025-02-04' AS Date), CAST(N'2026-02-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (47, N'Макароны твердые сорта', N'Бакалея', 45, 0, 40, N'кг', N'PastaFactory', N'Италия', N'AgroPasta', CAST(N'2025-02-04' AS Date), CAST(N'2026-03-08' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (48, N'Оливковое масло Extra Virgin', N'Масло', 250, 5, 15, N'литр', N'OliveFarm', N'Испания', N'ImportOil', CAST(N'2025-02-04' AS Date), CAST(N'2026-07-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (49, N'Подсолнечное масло рафинированное', N'Масло', 80, 0, 20, N'литр	', N'SunOil', N'Украина', N'AgroOil', CAST(N'2025-02-04' AS Date), CAST(N'2026-06-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (50, N'Сахар белый', N'Сахар и соль', 32, 0, 50, N'кг', N'SugarPlant', N'Украина', N'SugarSupply', CAST(N'2025-02-04' AS Date), CAST(N'2026-12-31' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (51, N'Соль морская', N'Сахар и соль', 40, 0, 30, N'кг', N'SaltWorks', N'Франция', N'ImportSpices', CAST(N'2025-02-04' AS Date), CAST(N'2026-12-31' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (52, N'Чёрный чай Ассам', N'Чай и кофе', 120, 5, 20, N'кг', N'AssamTea', N'Индия', N'TeaImport', CAST(N'2025-02-04' AS Date), CAST(N'2026-05-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (53, N'Кофе арабика в зёрнах', N'Чай и кофе', 320, 10, 10, N'кг', N'CoffeeFarm', N'Бразилия', N'CoffeeSupplier', CAST(N'2025-02-04' AS Date), CAST(N'2026-06-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (54, N'Шоколад молочный 70%', N'Сладости', 85, 0, 30, N'шт', N'ChocoFactory', N'Швейцария', N'ChocoImport', CAST(N'2025-02-04' AS Date), CAST(N'2026-04-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (55, N'Мед цветочный', N'Сладости', 200, 5, 10, N'кг', N'BeeFarm', N'Украина', N'HoneySupplier', CAST(N'2025-02-04' AS Date), CAST(N'2026-09-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (56, N'Яйца куриные (С1)', N'Яйца', 55, 0, 60, N'десяток', N'ChickenFarm', N'Украина', N'AgroEggs', CAST(N'2025-02-04' AS Date), CAST(N'2025-03-12' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (57, N'Майонез Провансаль', N'Соусы', 50, 0, 25, N'кг', N'SauceFactory', N'Украина', N'AgroSauce', CAST(N'2025-02-04' AS Date), CAST(N'2025-05-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (58, N'Кетчуп томатный', N'Соусы', 45, 0, 20, N'кг', N'TomatoSauce', N'Украина', N'GreenSauce', CAST(N'2025-02-04' AS Date), CAST(N'2025-06-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (59, N'Горчица острая', N'Соусы', 40, 0, 15, N'кг', N'SpicyFactory', N'Украина', N'SpiceSupplier', CAST(N'2025-02-04' AS Date), CAST(N'2025-06-15' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (60, N'Минеральная вода газированная', N'Напитки', 25, 0, 50, N'литр', N'AquaSpring', N'Украина', N'WaterSupply', CAST(N'2025-02-04' AS Date), CAST(N'2026-01-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (61, N'Лимонад апельсиновый', N'Напитки', 30, 5, 40, N'литр', N'FreshDrinks', N'Украина', N'SodaSupply', CAST(N'2025-02-04' AS Date), CAST(N'2025-07-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (62, N'Сок яблочный', N'Напитки', 50, 5, 30, N'литр', N'FruitJuice', N'Украина', N'JuiceSupply', CAST(N'2025-02-04' AS Date), CAST(N'2025-08-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (63, N'Кукурузные хлопья', N'Завтраки', 85, 5, 20, N'кг', N'CerealFactory', N'Украина', N'AgroCereal', CAST(N'2025-02-04' AS Date), CAST(N'2026-04-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (64, N'Овсяные хлопья', N'Завтраки', 65, 0, 25, N'кг', N'OatFarm', N'Украина', N'GrainSupply', CAST(N'2025-02-04' AS Date), CAST(N'2026-05-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (65, N'Батон белый', N'Хлебобулочные', 20, 0, 10, N'шт', N'BreadFactory', N'Украина', N'FreshBakery', CAST(N'2025-02-04' AS Date), CAST(N'2025-03-02' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (66, N'Багет французский', N'Хлебобулочные', 30, 0, 12, N'шт', N'FrenchBakery', N'Украина', N'AgroBakery', CAST(N'2025-02-04' AS Date), CAST(N'2025-03-03' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (67, N'Лавровый лист', N'Специи', 25, 0, 5, N'кг', N'SpiceWorld', N'Грузия', N'ImportSpices', CAST(N'2025-02-04' AS Date), CAST(N'2026-12-31' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (68, N'Перец чёрный молотый', N'Специи', 80, 0, 5, N'кг', N'SpiceWorld', N'Индия', N'SpiceSupply', CAST(N'2025-02-04' AS Date), CAST(N'2026-11-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (69, N'Куркума молотая', N'Специи', 70, 5, 5, N'кг', N'SpiceWorld', N'Индия', N'SpiceImport', CAST(N'2025-02-04' AS Date), CAST(N'2026-10-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (70, N'Сухофрукты (изюм, курага, чернослив)', N'Сухофрукты', 160, 10, 10, N'кг', N'DriedFruits', N'Узбекистан', N'ImportFruit', CAST(N'2025-02-04' AS Date), CAST(N'2026-09-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (71, N'Орехи грецкие', N'Орехи', 180, 0, 15, N'кг', N'WalnutFarm', N'Украина', N'NutSupplier', CAST(N'2025-02-04' AS Date), CAST(N'2026-08-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (72, N'Миндаль', N'Орехи', 240, 0, 10, N'кг', N'AlmondWorld', N'США', N'ImportNuts', CAST(N'2025-02-04' AS Date), CAST(N'2026-07-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (73, N'Фисташки солёные', N'Орехи', 300, 5, 8, N'кг', N'NutFactory', N'Иран', N'AgroNuts', CAST(N'2025-02-04' AS Date), CAST(N'2026-06-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (77, N'Манго сушёное', N'Сухофрукты', 320, 0, 15, N'кг', N'TropicalFruits', N'Таиланд', N'ExoticSupplier', CAST(N'2025-02-06' AS Date), CAST(N'2025-12-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (78, N'Кускус', N'Крупы', 190, 0, 25, N'кг', N'BerberGrains', N'Марокко', N'GrainTrade', CAST(N'2025-02-06' AS Date), CAST(N'2026-05-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (79, N'Бобы Тонка', N'Бобы', 1200, 5, 5, N'кг', N'SiberianNuts', N'Россия', N'NutSupplier', CAST(N'2025-02-06' AS Date), CAST(N'2025-10-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (80, N'Мацун', N'Молочные продукты', 260, 5, 10, N'литр', N'ArmenianDairy', N'Армения', N'DairySupply', CAST(N'2025-02-06' AS Date), CAST(N'2025-03-01' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (81, N'Папайя сушёная', N'Сухофрукты', 280, 0, 12, N'кг', N'TropicalFruits', N'Вьетнам', N'ExoticSupplier', CAST(N'2025-02-06' AS Date), CAST(N'2025-11-15' AS Date))
INSERT [dbo].[Product] ([id], [name], [category], [price], [discount], [quantity], [measurement], [producer], [country], [supplier], [date_of_delivery], [expire_date]) VALUES (82, N'продукт "кот в мешке"', N'категория Х', 100, 0, 1, N'кг', N'неизвестный производитель', N'Украина', N'неизвестный поставщик', CAST(N'2025-02-06' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Product]    Script Date: 06.02.2025 12:48:11 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Product] ON [dbo].[Product]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_discount]  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_quantity]  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [CK_Product_1] CHECK  (([expire_date]>=[date_of_delivery]))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [CK_Product_1]
GO
USE [master]
GO
ALTER DATABASE [Store] SET  READ_WRITE 
GO
