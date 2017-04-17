USE [RedShowHome]
GO
/****** Object:  Table [dbo].[Seller_User]    Script Date: 04/17/2017 20:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seller_User](
	[UserID] [varchar](36) NOT NULL,
	[Phone] [varchar](30) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[FansQuantity] [int] NOT NULL,
 CONSTRAINT [PK_Seller_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RSH_User]    Script Date: 04/17/2017 20:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RSH_User](
	[LoginEmail] [varchar](30) NOT NULL,
	[LoginPassword] [varchar](50) NOT NULL,
	[UserID] [varchar](36) NOT NULL,
	[UserName] [nvarchar](30) NOT NULL,
	[UserType] [int] NOT NULL,
 CONSTRAINT [PK_RSH_User_1] PRIMARY KEY CLUSTERED 
(
	[LoginEmail] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1-普通用户,2-设计师,3-家装公司,4-商户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RSH_User', @level2type=N'COLUMN',@level2name=N'UserType'
GO
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'1', N'C4CA4238A0B923820DCC509A6F75849B', N'6e513d9a-63ea-4262-b123-daa54b209f84', N'设计师1', 2)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'2', N'C81E728D9D4C2F636F067F89CC14862C', N'2d060818-9b1f-4c8d-8fb0-335ffb63f402', N'普通用户', 1)
/****** Object:  Table [dbo].[RSH_House]    Script Date: 04/17/2017 20:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RSH_House](
	[HouseID] [varchar](36) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Status] [int] NOT NULL,
	[Area] [float] NOT NULL,
	[HouseType] [int] NOT NULL,
	[DecorationWay] [int] NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Ichnography] [nvarchar](100) NULL,
	[Valid] [nchar](1) NOT NULL,
 CONSTRAINT [PK_RSH_House] PRIMARY KEY CLUSTERED 
(
	[HouseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'准备 = 1, 拆改 = 2, 水电 = 3, 泥木 = 4, 油漆 = 5, 竣工 = 6, 软装 = 7, 入住 = 8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RSH_House', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一居室 = 1, 二居室 = 2, 三居室 = 3, 四居室 = 4, 小户型 = 5, 公寓 = 6, 复式 = 7, 别墅 = 8,其他=9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RSH_House', @level2type=N'COLUMN',@level2name=N'HouseType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'清包 = 1, 半包 = 2, 全包 = 3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RSH_House', @level2type=N'COLUMN',@level2name=N'DecorationWay'
GO
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'0f9bf150-8b1d-41fb-a84a-51ddb6c3dcd6', N'故宫', 1, 888, 8, 1, N'真有钱哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或或或或或或或或反馈就啊诶hi卡尔文回复奥委会UI已护额UI阿会饿维护费活动空间拉双方均发丝的姐夫啊阿尔及of将诶沃家发', N'E:\RSH\House\201704170610_3c753d5d-f186-4fda-bd3d-3adc309e190e.jpg', N'1')
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'1caf98ec-fd92-4903-9768-4c4e3014e98e', N'山东', 1, 478, 1, 1, N'', NULL, N'1')
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'6975aaad-e246-4040-b38d-89d1e05334cb', N'东北林业大学', 0, 12, 1, 1, N'', NULL, N'1')
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'8d0ad0de-a719-4b76-8119-07aa2cad7dfe', N'', 1, 42, 1, 1, N'', N'E:\RSH\House\201704151137_adad1559-6f80-40d6-b4a5-abb671921c30.png', N'1')
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'cc6f0da8-f40a-4150-a8da-4846c610f47d', N'', 1, 12, 1, 1, N'', NULL, N'1')
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'db651ae2-6e68-4987-aba0-c1945bc4fdbc', N'北京', 0, 46.14, 1, 1, N'阿哥如果8', NULL, N'1')
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'efdb85d4-c6cb-44c7-a739-d857367738db', N'北京', 0, 46.14, 1, 1, N'阿哥如果8', NULL, N'1')
/****** Object:  Table [dbo].[Normal_User]    Script Date: 04/17/2017 20:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Normal_User](
	[UserID] [varchar](36) NOT NULL,
	[Sex] [nchar](1) NOT NULL,
	[Phone] [varchar](30) NULL,
 CONSTRAINT [PK_Normal_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Normal_User] ([UserID], [Sex], [Phone]) VALUES (N'2d060818-9b1f-4c8d-8fb0-335ffb63f402', N'男', N'48648561')
/****** Object:  Table [dbo].[HouseOwner]    Script Date: 04/17/2017 20:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HouseOwner](
	[UserID] [varchar](36) NOT NULL,
	[HouseID] [varchar](36) NOT NULL,
	[Valid] [nchar](1) NOT NULL,
 CONSTRAINT [PK_HouseOwner] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[HouseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'2d060818-9b1f-4c8d-8fb0-335ffb63f402', N'0f9bf150-8b1d-41fb-a84a-51ddb6c3dcd6', N'1')
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'2d060818-9b1f-4c8d-8fb0-335ffb63f402', N'1caf98ec-fd92-4903-9768-4c4e3014e98e', N'1')
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'2d060818-9b1f-4c8d-8fb0-335ffb63f402', N'6975aaad-e246-4040-b38d-89d1e05334cb', N'1')
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'2d060818-9b1f-4c8d-8fb0-335ffb63f402', N'8d0ad0de-a719-4b76-8119-07aa2cad7dfe', N'1')
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'2d060818-9b1f-4c8d-8fb0-335ffb63f402', N'cc6f0da8-f40a-4150-a8da-4846c610f47d', N'1')
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'2d060818-9b1f-4c8d-8fb0-335ffb63f402', N'db651ae2-6e68-4987-aba0-c1945bc4fdbc', N'1')
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'2d060818-9b1f-4c8d-8fb0-335ffb63f402', N'efdb85d4-c6cb-44c7-a739-d857367738db', N'1')
/****** Object:  Table [dbo].[EnjoyStyle]    Script Date: 04/17/2017 20:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EnjoyStyle](
	[UserID] [varchar](36) NOT NULL,
	[StyleType] [int] NOT NULL,
 CONSTRAINT [PK_EnjoyStyle] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[StyleType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地中海 = 1, 田园 = 2, 美式 = 3, 欧式 = 4, 东南亚 = 5, 日式 = 6, 中式 = 7, 古典 = 8, 简约 = 9, 现代 = 10, 混搭 = 11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EnjoyStyle', @level2type=N'COLUMN',@level2name=N'StyleType'
GO
/****** Object:  Table [dbo].[Designer_User]    Script Date: 04/17/2017 20:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designer_User](
	[UserID] [varchar](36) NOT NULL,
	[Sex] [nchar](1) NOT NULL,
	[StartWorkTime] [date] NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[DesignConcept] [nvarchar](30) NOT NULL,
	[FansQuantity] [int] NOT NULL,
 CONSTRAINT [PK_Designer_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Designer_User] ([UserID], [Sex], [StartWorkTime], [Phone], [Address], [DesignConcept], [FansQuantity]) VALUES (N'6e513d9a-63ea-4262-b123-daa54b209f84', N'男', CAST(0xC9390B00 AS Date), N'123', N'北沙滩', N'我是一个设计师，我牛逼', 0)
/****** Object:  Table [dbo].[DesignCompany_User]    Script Date: 04/17/2017 20:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DesignCompany_User](
	[UserID] [varchar](36) NOT NULL,
	[Phone] [varchar](30) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[FansQuantity] [int] NOT NULL,
 CONSTRAINT [PK_DesignCompany_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Demand]    Script Date: 04/17/2017 20:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Demand](
	[DemandID] [varchar](36) NOT NULL,
	[CreatorID] [varchar](36) NOT NULL,
	[HouseID] [varchar](36) NOT NULL,
	[DemandName] [nvarchar](30) NOT NULL,
	[Visible] [nchar](1) NOT NULL,
	[Valid] [nchar](1) NOT NULL,
 CONSTRAINT [PK_Demand] PRIMARY KEY CLUSTERED 
(
	[DemandID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Demand] ([DemandID], [CreatorID], [HouseID], [DemandName], [Visible], [Valid]) VALUES (N'738c70fb-d0eb-4b29-a025-8cac7668dbb4', N'2d060818-9b1f-4c8d-8fb0-335ffb63f402', N'0f9bf150-8b1d-41fb-a84a-51ddb6c3dcd6', N'一个牛逼的房子', N'1', N'1')
INSERT [dbo].[Demand] ([DemandID], [CreatorID], [HouseID], [DemandName], [Visible], [Valid]) VALUES (N'b1b2315d-2b43-4d7c-863a-4f6f1fe102b9', N'2d060818-9b1f-4c8d-8fb0-335ffb63f402', N'1caf98ec-fd92-4903-9768-4c4e3014e98e', N'一个需求额', N'1', N'1')
/****** Object:  Table [dbo].[Collection]    Script Date: 04/17/2017 20:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Collection](
	[UserID] [varchar](36) NOT NULL,
	[CollectUserID] [varchar](36) NOT NULL,
 CONSTRAINT [PK_Collection] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[CollectUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AddressPoint]    Script Date: 04/17/2017 20:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressPoint](
	[Address] [nvarchar](100) NOT NULL,
	[Longitute] [decimal](10, 6) NOT NULL,
	[Latitude] [decimal](10, 6) NOT NULL,
	[City] [nvarchar](30) NULL,
 CONSTRAINT [PK_AddressPoint] PRIMARY KEY CLUSTERED 
(
	[Address] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'北沙滩', CAST(116.375561 AS Decimal(10, 6)), CAST(40.007538 AS Decimal(10, 6)), N'北京市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'故宫', CAST(116.503438 AS Decimal(10, 6)), CAST(39.924455 AS Decimal(10, 6)), N'北京市')
/****** Object:  Default [DF_AddressPoint_Longitute]    Script Date: 04/17/2017 20:12:49 ******/
ALTER TABLE [dbo].[AddressPoint] ADD  CONSTRAINT [DF_AddressPoint_Longitute]  DEFAULT ((0)) FOR [Longitute]
GO
/****** Object:  Default [DF_AddressPoint_Latitude]    Script Date: 04/17/2017 20:12:49 ******/
ALTER TABLE [dbo].[AddressPoint] ADD  CONSTRAINT [DF_AddressPoint_Latitude]  DEFAULT ((0)) FOR [Latitude]
GO
/****** Object:  Default [DF_Demand_Visible]    Script Date: 04/17/2017 20:12:49 ******/
ALTER TABLE [dbo].[Demand] ADD  CONSTRAINT [DF_Demand_Visible]  DEFAULT ((1)) FOR [Visible]
GO
/****** Object:  Default [DF_Demand_Valid]    Script Date: 04/17/2017 20:12:49 ******/
ALTER TABLE [dbo].[Demand] ADD  CONSTRAINT [DF_Demand_Valid]  DEFAULT ((1)) FOR [Valid]
GO
/****** Object:  Default [DF_DesignCompany_User_FansQuantity]    Script Date: 04/17/2017 20:12:49 ******/
ALTER TABLE [dbo].[DesignCompany_User] ADD  CONSTRAINT [DF_DesignCompany_User_FansQuantity]  DEFAULT ((0)) FOR [FansQuantity]
GO
/****** Object:  Default [DF_Designer_User_FansQuantity]    Script Date: 04/17/2017 20:12:49 ******/
ALTER TABLE [dbo].[Designer_User] ADD  CONSTRAINT [DF_Designer_User_FansQuantity]  DEFAULT ((0)) FOR [FansQuantity]
GO
/****** Object:  Default [DF_HouseOwner_Valid]    Script Date: 04/17/2017 20:12:49 ******/
ALTER TABLE [dbo].[HouseOwner] ADD  CONSTRAINT [DF_HouseOwner_Valid]  DEFAULT ((1)) FOR [Valid]
GO
/****** Object:  Default [DF_RSH_House_Valid]    Script Date: 04/17/2017 20:12:49 ******/
ALTER TABLE [dbo].[RSH_House] ADD  CONSTRAINT [DF_RSH_House_Valid]  DEFAULT ((1)) FOR [Valid]
GO
/****** Object:  Default [DF_Seller_User_FansQuantity]    Script Date: 04/17/2017 20:12:49 ******/
ALTER TABLE [dbo].[Seller_User] ADD  CONSTRAINT [DF_Seller_User_FansQuantity]  DEFAULT ((0)) FOR [FansQuantity]
GO
