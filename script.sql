USE [master]
GO
/****** Object:  Database [gaz]    Script Date: 18-May-25 10:52:59 AM ******/
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
/****** Object:  Table [dbo].[authorization]    Script Date: 18-May-25 10:53:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authorization](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](25) NOT NULL,
	[password] [nvarchar](25) NOT NULL,
	[name] [nvarchar](25) NOT NULL,
	[role] [nvarchar](25) NOT NULL,
	[tasks] [int] NULL,
 CONSTRAINT [PK_authorization] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[distributionArz]    Script Date: 18-May-25 10:53:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[distributionArz](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[length] [decimal](8, 2) NOT NULL,
	[status] [nvarchar](10) NOT NULL,
	[endpoint] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_distribution] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[distributionNN]    Script Date: 18-May-25 10:53:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[distributionNN](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[length] [decimal](8, 2) NOT NULL,
	[status] [nvarchar](10) NOT NULL,
	[endpoint] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_distributionNN] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 18-May-25 10:53:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[EventType] [nvarchar](100) NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[PipelineID] [int] NULL,
	[EmployeeID] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[IsCritical] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pipelines]    Script Date: 18-May-25 10:53:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pipelines](
	[PipelineID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [int] NOT NULL,
	[Location] [nvarchar](250) NULL,
	[InstallationDate] [date] NULL,
	[LastInspectionDate] [date] NULL,
	[NextInspectionDate] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[Pressure] [float] NULL,
	[Length] [float] NULL,
	[Notes] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[PipelineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTasks]    Script Date: 18-May-25 10:53:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskName] [nvarchar](50) NULL,
	[EmployeeId] [int] NULL,
	[Description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[authorization] ON 

INSERT [dbo].[authorization] ([id], [login], [password], [name], [role], [tasks]) VALUES (1, N'admin', N'1111', N'Администратор', N'admin', NULL)
INSERT [dbo].[authorization] ([id], [login], [password], [name], [role], [tasks]) VALUES (4, N'Empl', N'EMPL', N'Работник 1', N'empl', NULL)
INSERT [dbo].[authorization] ([id], [login], [password], [name], [role], [tasks]) VALUES (5, N'emee', N'1412', N'Работник 2', N'empl', NULL)
SET IDENTITY_INSERT [dbo].[authorization] OFF
GO
SET IDENTITY_INSERT [dbo].[distributionArz] ON 

INSERT [dbo].[distributionArz] ([id], [code], [name], [length], [status], [endpoint]) VALUES (1, 1312, N'Арзамасский район, газопровод-вход с.Водватово, ул гагарина, д. 1,2,4,15,20', CAST(4560.55 AS Decimal(8, 2)), N'в работе', N'г. Арзамас')
INSERT [dbo].[distributionArz] ([id], [code], [name], [length], [status], [endpoint]) VALUES (5, 12, N'Арзамасский район, газопровод-вход, Кириловка, ул. Герцена, д. 1,2,5,7,10,23', CAST(4003.10 AS Decimal(8, 2)), N'в работе', N'г. Арзамас')
INSERT [dbo].[distributionArz] ([id], [code], [name], [length], [status], [endpoint]) VALUES (6, 1231, N'asdasd', CAST(1231.00 AS Decimal(8, 2)), N'в работе', N'г. Арзамас')
INSERT [dbo].[distributionArz] ([id], [code], [name], [length], [status], [endpoint]) VALUES (7, 112, N'Арзамас, ул. Карла-Маркса, д. 1,4,5,10', CAST(1212.00 AS Decimal(8, 2)), N'в ожидании', N'Нижний Новгород')
INSERT [dbo].[distributionArz] ([id], [code], [name], [length], [status], [endpoint]) VALUES (12, 13, N'Арзамасский район, Кириловка, ул. Курчатова, д. 1,5,10', CAST(1241.00 AS Decimal(8, 2)), N'в ожидании', N'г. Арзамас')
SET IDENTITY_INSERT [dbo].[distributionArz] OFF
GO
SET IDENTITY_INSERT [dbo].[distributionNN] ON 

INSERT [dbo].[distributionNN] ([id], [code], [name], [length], [status], [endpoint]) VALUES (1, 1312, N'Нижний Новгород, ул. Гагарина, д. 1, 12, 14', CAST(5000.00 AS Decimal(8, 2)), N'в работе', N'г. Казань')
INSERT [dbo].[distributionNN] ([id], [code], [name], [length], [status], [endpoint]) VALUES (2, 31, N'Нижегородская обл, Дальнее Константиново', CAST(3500.00 AS Decimal(8, 2)), N'в работе', N'г. Арзамас')
INSERT [dbo].[distributionNN] ([id], [code], [name], [length], [status], [endpoint]) VALUES (3, 1231, N'Кстово, ул. Гагарина, д. 12, 14', CAST(1231.00 AS Decimal(8, 2)), N'в работе', N'г. Арзамас')
INSERT [dbo].[distributionNN] ([id], [code], [name], [length], [status], [endpoint]) VALUES (4, 144, N'г.Нижний Новгород, ул. Карла-Маркса, д. 1,4,5,10', CAST(15152.00 AS Decimal(8, 2)), N'в ожидании', N'Выкса')
INSERT [dbo].[distributionNN] ([id], [code], [name], [length], [status], [endpoint]) VALUES (5, 17, N'Нижегородская область, г. Выкса, ул. Курчатова, д. 1,5,10', CAST(2000.12 AS Decimal(8, 2)), N'в ожидании', N'Нижний Новгород')
SET IDENTITY_INSERT [dbo].[distributionNN] OFF
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

INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (12, 111, N'Участок A', CAST(N'2015-05-01' AS Date), CAST(N'2024-06-10' AS Date), CAST(N'2025-06-10' AS Date), N'В эксплуатации', 1.2, 320.5, N'Основной магистральный')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (13, 112, N'Участок B', CAST(N'2017-09-15' AS Date), CAST(N'2023-08-01' AS Date), CAST(N'2024-08-01' AS Date), N'В эксплуатации', 1.1, 150, N'')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (14, 113, N'Участок C', CAST(N'2010-11-20' AS Date), CAST(N'2022-05-20' AS Date), CAST(N'2023-05-20' AS Date), N'Выведен из эксплуатации', 0.9, 90.3, N'Утечка в 2022')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (15, 114, N'Участок D', CAST(N'2018-03-30' AS Date), CAST(N'2023-04-15' AS Date), CAST(N'2024-04-15' AS Date), N'На ремонте', 1, 210, N'')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (16, 115, N'Участок E', CAST(N'2016-12-10' AS Date), CAST(N'2023-12-01' AS Date), CAST(N'2024-12-01' AS Date), N'В эксплуатации', 1.3, 180.7, N'')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (17, 116, N'Участок F', CAST(N'2014-07-01' AS Date), CAST(N'2022-07-01' AS Date), CAST(N'2023-07-01' AS Date), N'В эксплуатации', 1, 240.2, N'Плановая модернизация')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (18, 117, N'Участок G', CAST(N'2019-01-05' AS Date), CAST(N'2023-01-05' AS Date), CAST(N'2024-01-05' AS Date), N'В эксплуатации', 1.4, 310.8, N'')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (19, 118, N'Участок H', CAST(N'2020-10-01' AS Date), CAST(N'2024-01-01' AS Date), CAST(N'2025-01-01' AS Date), N'В эксплуатации', 1.1, 170, N'')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (20, 119, N'Участок I', CAST(N'2022-06-15' AS Date), CAST(N'2023-06-15' AS Date), CAST(N'2024-06-15' AS Date), N'В эксплуатации', 1.2, 130.6, N'')
INSERT [dbo].[Pipelines] ([PipelineID], [Code], [Location], [InstallationDate], [LastInspectionDate], [NextInspectionDate], [Status], [Pressure], [Length], [Notes]) VALUES (21, 110, N'Участок J', CAST(N'2023-02-01' AS Date), CAST(N'2024-02-01' AS Date), CAST(N'2025-02-01' AS Date), N'В эксплуатации', 1.3, 250, N'')
SET IDENTITY_INSERT [dbo].[Pipelines] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTasks] ON 

INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description]) VALUES (1, N'Проверка давления', 4, N'Измерить давление на участке A перед запуском.')
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description]) VALUES (2, N'Осмотр оборудования', 5, N'Проверить состояние запорной арматуры.')
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description]) VALUES (3, N'Подготовка отчёта', 4, N'Сформировать отчёт по итогам майской проверки.')
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description]) VALUES (4, N'Ремонт участка', 5, N'Заменить повреждённый участок трубы на линии B.')
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description]) VALUES (5, N'Плановая проверка', 4, N'Проверить исправность датчиков давления.')
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description]) VALUES (6, N'Настройка системы', 5, N'Провести калибровку оборудования после обновления.')
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description]) VALUES (7, N'Сбор данных', 4, N'Собрать показания с датчиков участка C.')
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description]) VALUES (8, N'Участие в совещании', 5, N'Обсудить меры по улучшению контроля.')
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description]) VALUES (9, N'Анализ аварии', 4, N'Рассмотреть причины утечки газа 12 мая.')
INSERT [dbo].[UserTasks] ([Id], [TaskName], [EmployeeId], [Description]) VALUES (10, N'Обновление ПО', 5, N'Установить обновления для ПО мониторинга.')
SET IDENTITY_INSERT [dbo].[UserTasks] OFF
GO
ALTER TABLE [dbo].[Events] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Events] ADD  DEFAULT ((0)) FOR [IsCritical]
GO
ALTER TABLE [dbo].[Pipelines] ADD  DEFAULT ('? ????????????') FOR [Status]
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
USE [master]
GO
ALTER DATABASE [gaz] SET  READ_WRITE 
GO
