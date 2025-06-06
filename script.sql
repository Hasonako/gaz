USE [master]
GO
/****** Object:  Database [gaz]    Script Date: 01-Jun-25 9:24:56 PM ******/
CREATE DATABASE [gaz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gaz', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\gaz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gaz_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\gaz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [gaz] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gaz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gaz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gaz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gaz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gaz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gaz] SET ARITHABORT OFF 
GO
ALTER DATABASE [gaz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gaz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gaz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gaz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gaz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gaz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gaz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gaz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gaz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gaz] SET  DISABLE_BROKER 
GO
ALTER DATABASE [gaz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gaz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gaz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gaz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gaz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gaz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gaz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gaz] SET RECOVERY FULL 
GO
ALTER DATABASE [gaz] SET  MULTI_USER 
GO
ALTER DATABASE [gaz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gaz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gaz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gaz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [gaz] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [gaz] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'gaz', N'ON'
GO
ALTER DATABASE [gaz] SET QUERY_STORE = ON
GO
ALTER DATABASE [gaz] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [gaz]
GO
/****** Object:  Table [dbo].[authorization]    Script Date: 01-Jun-25 9:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authorization](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](25) NOT NULL,
	[password] [nvarchar](25) NOT NULL,
	[name] [nvarchar](25) NOT NULL,
	[tasks] [int] NULL,
	[rights] [int] NOT NULL,
 CONSTRAINT [PK_authorization] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 01-Jun-25 9:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[PipelineID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[IsCritical] [bit] NULL,
 CONSTRAINT [PK__Events__7944C870A474F9E3] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pipelines]    Script Date: 01-Jun-25 9:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pipelines](
	[PipelineID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [int] NOT NULL,
	[Location] [nvarchar](250) NOT NULL,
	[InstallationDate] [date] NOT NULL,
	[LastInspectionDate] [date] NOT NULL,
	[NextInspectionDate] [date] NOT NULL,
	[Status] [int] NOT NULL,
	[Pressure] [decimal](5, 2) NOT NULL,
	[Length] [decimal](18, 2) NOT NULL,
	[Notes] [nvarchar](500) NULL,
 CONSTRAINT [PK__Pipeline__DD425CAF05792A09] PRIMARY KEY CLUSTERED 
(
	[PipelineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PipeLogs]    Script Date: 01-Jun-25 9:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PipeLogs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[description] [nvarchar](150) NOT NULL,
	[date] [date] NOT NULL,
	[PipeId] [int] NULL,
 CONSTRAINT [PK_PipeLogs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PipeStatus]    Script Date: 01-Jun-25 9:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PipeStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PipeStatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskStatus]    Script Date: 01-Jun-25 9:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TaskStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRights]    Script Date: 01-Jun-25 9:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRights](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RightsName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRights] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTasks]    Script Date: 01-Jun-25 9:24:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskName] [nvarchar](50) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK__UserTask__3214EC07A2A7F264] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[authorization] ON 

INSERT [dbo].[authorization] ([id], [login], [password], [name], [tasks], [rights]) VALUES (1, N'admin', N'asd', N'Администратор', NULL, 1)
INSERT [dbo].[authorization] ([id], [login], [password], [name], [tasks], [rights]) VALUES (4, N'Empl', N'EMPL', N'Работник 1', NULL, 2)
INSERT [dbo].[authorization] ([id], [login], [password], [name], [tasks], [rights]) VALUES (5, N'emee', N'1412', N'Работник 2', NULL, 2)
INSERT [dbo].[authorization] ([id], [login], [password], [name], [tasks], [rights]) VALUES (6, N'ad', N'admin', N'Administrato111', NULL, 1)
INSERT [dbo].[authorization] ([id], [login], [password], [name], [tasks], [rights]) VALUES (7, N'add', N'dada', N'Administ', NULL, 1)
SET IDENTITY_INSERT [dbo].[authorization] OFF
GO
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([EventID], [EventType], [EventDate], [Description], [PipelineID], [EmployeeID], [CreatedAt], [IsCritical]) VALUES (2, N'Проверка', CAST(N'2025-05-01T10:00:00.000' AS DateTime), N'Плановая проверка', 12, 4, CAST(N'2025-05-17T18:48:52.640' AS DateTime), 0)
INSERT [dbo].[Events] ([EventID], [EventType], [EventDate], [Description], [PipelineID], [EmployeeID], [CreatedAt], [IsCritical]) VALUES (3, N'Напоминание', CAST(N'2025-05-10T08:00:00.000' AS DateTime), N'Проверка через неделю', 21, 4, CAST(N'2025-05-17T18:48:52.640' AS DateTime), 0)
INSERT [dbo].[Events] ([EventID], [EventType], [EventDate], [Description], [PipelineID], [EmployeeID], [CreatedAt], [IsCritical]) VALUES (4, N'Авария', CAST(N'2024-12-25T15:30:00.000' AS DateTime), N'Обнаружена утечка газа', 13, 4, CAST(N'2025-05-17T18:48:52.640' AS DateTime), 1)
INSERT [dbo].[Events] ([EventID], [EventType], [EventDate], [Description], [PipelineID], [EmployeeID], [CreatedAt], [IsCritical]) VALUES (5, N'Проверка', CAST(N'2025-06-15T09:00:00.000' AS DateTime), N'ВИК-контроль', 14, 4, CAST(N'2025-05-17T18:48:52.640' AS DateTime), 0)
INSERT [dbo].[Events] ([EventID], [EventType], [EventDate], [Description], [PipelineID], [EmployeeID], [CreatedAt], [IsCritical]) VALUES (6, N'Ремонт', CAST(N'2025-04-22T11:00:00.000' AS DateTime), N'Замена клапана', 15, 4, CAST(N'2025-05-17T18:48:52.640' AS DateTime), 1)
INSERT [dbo].[Events] ([EventID], [EventType], [EventDate], [Description], [PipelineID], [EmployeeID], [CreatedAt], [IsCritical]) VALUES (7, N'Проверка', CAST(N'2025-07-05T12:00:00.000' AS DateTime), N'Гидроиспытание', 16, 5, CAST(N'2025-05-17T18:48:52.640' AS DateTime), 0)
INSERT [dbo].[Events] ([EventID], [EventType], [EventDate], [Description], [PipelineID], [EmployeeID], [CreatedAt], [IsCritical]) VALUES (8, N'Инспекция', CAST(N'2025-05-20T14:00:00.000' AS DateTime), N'Внеплановая инспекция', 17, 5, CAST(N'2025-05-17T18:48:52.640' AS DateTime), 1)
INSERT [dbo].[Events] ([EventID], [EventType], [EventDate], [Description], [PipelineID], [EmployeeID], [CreatedAt], [IsCritical]) VALUES (9, N'План', CAST(N'2025-08-01T09:30:00.000' AS DateTime), N'План на 3 квартал', 18, 5, CAST(N'2025-05-17T18:48:52.640' AS DateTime), 0)
INSERT [dbo].[Events] ([EventID], [EventType], [EventDate], [Description], [PipelineID], [EmployeeID], [CreatedAt], [IsCritical]) VALUES (10, N'Напоминание', CAST(N'2025-05-17T07:00:00.000' AS DateTime), N'Срок поверки истекает через 10 дней', 19, 5, CAST(N'2025-05-17T18:48:52.640' AS DateTime), 0)
INSERT [dbo].[Events] ([EventID], [EventType], [EventDate], [Description], [PipelineID], [EmployeeID], [CreatedAt], [IsCritical]) VALUES (11, N'Авария', CAST(N'2023-11-11T18:00:00.000' AS DateTime), N'Коррозия на участке', 20, 5, CAST(N'2025-05-17T18:48:52.640' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Events] OFF
GO
SET IDENTITY_INSERT [dbo].[Pipelines] ON 

INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (12, 111, N'Участок A', CAST(N'2015-05-01' AS Date), CAST(N'2024-06-10' AS Date), CAST(N'2025-06-10' AS Date), 1, CAST(1.20 AS Decimal(5, 2)), CAST(320.50 AS Decimal(18, 2)), N'Основной магистральный')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (13, 112, N'Участок B', CAST(N'2017-09-15' AS Date), CAST(N'2023-08-01' AS Date), CAST(N'2024-08-01' AS Date), 2, CAST(1.10 AS Decimal(5, 2)), CAST(150.00 AS Decimal(18, 2)), N'')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (14, 113, N'Участок C', CAST(N'2010-11-20' AS Date), CAST(N'2022-05-20' AS Date), CAST(N'2023-05-20' AS Date), 3, CAST(0.90 AS Decimal(5, 2)), CAST(90.30 AS Decimal(18, 2)), N'Утечка в 2022')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (15, 114, N'Участок D', CAST(N'2018-03-30' AS Date), CAST(N'2023-04-15' AS Date), CAST(N'2024-04-15' AS Date), 1, CAST(1.00 AS Decimal(5, 2)), CAST(210.00 AS Decimal(18, 2)), N'')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (16, 115, N'Участок E', CAST(N'2016-12-10' AS Date), CAST(N'2023-12-01' AS Date), CAST(N'2024-12-01' AS Date), 2, CAST(1.30 AS Decimal(5, 2)), CAST(180.70 AS Decimal(18, 2)), N'')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (17, 116, N'Участок F', CAST(N'2014-07-01' AS Date), CAST(N'2022-07-01' AS Date), CAST(N'2023-07-01' AS Date), 3, CAST(1.00 AS Decimal(5, 2)), CAST(240.20 AS Decimal(18, 2)), N'Плановая модернизация')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (18, 117, N'Участок G', CAST(N'2019-01-05' AS Date), CAST(N'2023-01-05' AS Date), CAST(N'2024-01-05' AS Date), 1, CAST(1.40 AS Decimal(5, 2)), CAST(310.80 AS Decimal(18, 2)), N'')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (19, 118, N'Участок H', CAST(N'2020-10-01' AS Date), CAST(N'2024-01-01' AS Date), CAST(N'2025-01-01' AS Date), 2, CAST(1.10 AS Decimal(5, 2)), CAST(170.00 AS Decimal(18, 2)), N'')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (20, 119, N'Участок I', CAST(N'2022-06-15' AS Date), CAST(N'2023-06-15' AS Date), CAST(N'2024-06-15' AS Date), 3, CAST(1.20 AS Decimal(5, 2)), CAST(130.60 AS Decimal(18, 2)), N'')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (21, 110, N'Участок J', CAST(N'2023-02-01' AS Date), CAST(N'2024-02-01' AS Date), CAST(N'2025-02-01' AS Date), 1, CAST(1.30 AS Decimal(5, 2)), CAST(250.00 AS Decimal(18, 2)), N'')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (26, 123, N'asd', CAST(N'2025-05-28' AS Date), CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), 1, CAST(0.40 AS Decimal(5, 2)), CAST(1000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (27, 123, N'asd', CAST(N'2025-05-31' AS Date), CAST(N'0001-01-01' AS Date), CAST(N'2025-06-06' AS Date), 1, CAST(0.10 AS Decimal(5, 2)), CAST(123.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (28, 1234, N'asd', CAST(N'2025-06-01' AS Date), CAST(N'0001-01-01' AS Date), CAST(N'2025-06-05' AS Date), 1, CAST(1.00 AS Decimal(5, 2)), CAST(1000.00 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Pipelines] OFF
GO
SET IDENTITY_INSERT [dbo].[PipeLogs] ON 

INSERT [dbo].[PipeLogs] ([id], [title], [description], [date], [PipeId]) VALUES (1, N'Сбой', N'Проверка линии', CAST(N'2023-02-12' AS Date), 12)
INSERT [dbo].[PipeLogs] ([id], [title], [description], [date], [PipeId]) VALUES (2, N'Очистка участка', N'Механическая очистка трубопровода от отложений.', CAST(N'2023-02-15' AS Date), 12)
INSERT [dbo].[PipeLogs] ([id], [title], [description], [date], [PipeId]) VALUES (3, N'Проверка давления', N'Проверка герметичности и стабильности давления.', CAST(N'2023-03-10' AS Date), 13)
INSERT [dbo].[PipeLogs] ([id], [title], [description], [date], [PipeId]) VALUES (4, N'Плановая диагностика', N'Стандартная проверка состояния перед запуском.', CAST(N'2023-04-05' AS Date), 14)
INSERT [dbo].[PipeLogs] ([id], [title], [description], [date], [PipeId]) VALUES (5, N'Замена фланцев', N'Произведена замена старых фланцев на новые.', CAST(N'2023-05-01' AS Date), 15)
INSERT [dbo].[PipeLogs] ([id], [title], [description], [date], [PipeId]) VALUES (6, N'Устранение утечки', N'Ликвидация небольшой утечки в районе соединения.', CAST(N'2023-06-18' AS Date), 16)
INSERT [dbo].[PipeLogs] ([id], [title], [description], [date], [PipeId]) VALUES (7, N'Проверка изоляции', N'Контроль качества изоляционного покрытия.', CAST(N'2023-07-22' AS Date), 17)
INSERT [dbo].[PipeLogs] ([id], [title], [description], [date], [PipeId]) VALUES (8, N'Гидроиспытание', N'Проведено гидроиспытание на прочность.', CAST(N'2023-08-14' AS Date), 18)
INSERT [dbo].[PipeLogs] ([id], [title], [description], [date], [PipeId]) VALUES (9, N'Капитальный ремонт', N'Заменён участок трубопровода длиной 45 метров.', CAST(N'2023-09-10' AS Date), 19)
INSERT [dbo].[PipeLogs] ([id], [title], [description], [date], [PipeId]) VALUES (10, N'Внеплановый осмотр', N'Осмотр после зафиксированной аварийной остановки.', CAST(N'2023-10-03' AS Date), 20)
INSERT [dbo].[PipeLogs] ([id], [title], [description], [date], [PipeId]) VALUES (11, N'Поверка оборудования', N'Поверка измерительных приборов на участке.', CAST(N'2023-11-28' AS Date), 20)
SET IDENTITY_INSERT [dbo].[PipeLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[PipeStatus] ON 

INSERT [dbo].[PipeStatus] ([id], [name]) VALUES (1, N'В эксплуатации')
INSERT [dbo].[PipeStatus] ([id], [name]) VALUES (2, N'На ремонте')
INSERT [dbo].[PipeStatus] ([id], [name]) VALUES (3, N'Выведен из эксплуатации')
SET IDENTITY_INSERT [dbo].[PipeStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[TaskStatus] ON 

INSERT [dbo].[TaskStatus] ([Id], [Name]) VALUES (1, N'Новая     ')
INSERT [dbo].[TaskStatus] ([Id], [Name]) VALUES (2, N'Срочная   ')
INSERT [dbo].[TaskStatus] ([Id], [Name]) VALUES (3, N'В работе  ')
INSERT [dbo].[TaskStatus] ([Id], [Name]) VALUES (4, N'Готова    ')
SET IDENTITY_INSERT [dbo].[TaskStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRights] ON 

INSERT [dbo].[UserRights] ([id], [RightsName]) VALUES (1, N'Admin')
INSERT [dbo].[UserRights] ([id], [RightsName]) VALUES (2, N'ComUser')
SET IDENTITY_INSERT [dbo].[UserRights] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTasks] ON 

INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description], [Status]) VALUES (1, N'Проверка давления', 4, N'Измерить давление на участке A перед запуском.', 1)
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description], [Status]) VALUES (2, N'Осмотр оборудования', 5, N'Проверить состояние запорной арматуры.', 2)
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description], [Status]) VALUES (3, N'Подготовка отчёта', 4, N'Сформировать отчёт по итогам майской проверки.', 3)
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description], [Status]) VALUES (4, N'Ремонт участка', 5, N'Заменить повреждённый участок трубы на линии B.', 1)
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description], [Status]) VALUES (5, N'Плановая проверка', 4, N'Проверить исправность датчиков давления.', 1)
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description], [Status]) VALUES (6, N'Настройка системы', 5, N'Провести калибровку оборудования после обновления.', 1)
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description], [Status]) VALUES (7, N'Сбор данных', 4, N'Собрать показания с датчиков участка C.', 1)
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description], [Status]) VALUES (8, N'Участие в совещании', 5, N'Обсудить меры по улучшению контроля.', 1)
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description], [Status]) VALUES (9, N'Анализ аварии', 4, N'Рассмотреть причины утечки газа 12 мая.', 1)
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description], [Status]) VALUES (10, N'Обновление ПО', 5, N'Установить обновления для ПО мониторинга.', 1)
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description], [Status]) VALUES (11, N'asdas', 5, N'asdasda', 1)
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description], [Status]) VALUES (12, N'Проверка', 4, N'Проверить работоспособность газопровода с кодом "111"', 1)
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description], [Status]) VALUES (13, N'asd', 1, N'asd', 1)
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description], [Status]) VALUES (14, N'asd', 5, N'asd', 1)
SET IDENTITY_INSERT [dbo].[UserTasks] OFF
GO
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [DF__Events__CreatedA__4316F928]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [DF__Events__IsCritic__440B1D61]  DEFAULT ((0)) FOR [IsCritical]
GO
ALTER TABLE [dbo].[authorization]  WITH CHECK ADD  CONSTRAINT [FK_authorization_UserRights] FOREIGN KEY([rights])
REFERENCES [dbo].[UserRights] ([id])
GO
ALTER TABLE [dbo].[authorization] CHECK CONSTRAINT [FK_authorization_UserRights]
GO
ALTER TABLE [dbo].[authorization]  WITH CHECK ADD  CONSTRAINT [FK_User_Task] FOREIGN KEY([tasks])
REFERENCES [dbo].[UserTasks] ([Id])
GO
ALTER TABLE [dbo].[authorization] CHECK CONSTRAINT [FK_User_Task]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[authorization] ([id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Employees]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Pipelines] FOREIGN KEY([PipelineID])
REFERENCES [dbo].[Pipelines] ([PipelineID])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Pipelines]
GO
ALTER TABLE [dbo].[Pipelines]  WITH CHECK ADD  CONSTRAINT [FK_Pipelines_PipeStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[PipeStatus] ([id])
GO
ALTER TABLE [dbo].[Pipelines] CHECK CONSTRAINT [FK_Pipelines_PipeStatus]
GO
ALTER TABLE [dbo].[PipeLogs]  WITH CHECK ADD  CONSTRAINT [FK_PipeLogs_Pipelines] FOREIGN KEY([PipeId])
REFERENCES [dbo].[Pipelines] ([PipelineID])
GO
ALTER TABLE [dbo].[PipeLogs] CHECK CONSTRAINT [FK_PipeLogs_Pipelines]
GO
ALTER TABLE [dbo].[UserTasks]  WITH CHECK ADD  CONSTRAINT [FK_UserTasks_TaskStatus] FOREIGN KEY([Status])
REFERENCES [dbo].[TaskStatus] ([Id])
GO
ALTER TABLE [dbo].[UserTasks] CHECK CONSTRAINT [FK_UserTasks_TaskStatus]
GO
USE [master]
GO
ALTER DATABASE [gaz] SET  READ_WRITE 
GO
