USE [gaz]
GO
/****** Object:  Table [dbo].[authorization]    Script Date: 21.12.2024 19:39:07 ******/
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
 CONSTRAINT [PK_authorization] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[distributionArz]    Script Date: 21.12.2024 19:39:08 ******/
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
/****** Object:  Table [dbo].[distributionNN]    Script Date: 21.12.2024 19:39:08 ******/
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
SET IDENTITY_INSERT [dbo].[authorization] ON 

INSERT [dbo].[authorization] ([id], [login], [password], [name], [role]) VALUES (1, N'admin', N'1111', N'Администратор', N'admin')
INSERT [dbo].[authorization] ([id], [login], [password], [name], [role]) VALUES (4, N'Empl', N'EMPL', N'Работник 1', N'empl')
INSERT [dbo].[authorization] ([id], [login], [password], [name], [role]) VALUES (5, N'emee', N'1412', N'Работник 2', N'empl')
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
