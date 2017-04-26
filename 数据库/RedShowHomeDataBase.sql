USE [RedShowHome]
GO
/****** Object:  Table [dbo].[Seller_User]    Script Date: 04/26/2017 17:42:37 ******/
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
INSERT [dbo].[Seller_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'329ea96b-1747-4509-947b-c9e4701d645e', N'', N'北京市蓝色港湾', N'8646468', 50)
INSERT [dbo].[Seller_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'54d73052-37b7-4d17-9e83-5056724a3ef7', N'', N'北京市汽车博物馆', N'4654654163阿道夫', 10)
INSERT [dbo].[Seller_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'5d006732-eb58-4c01-96b1-d5f7ddeb6b41', N'', N'关东古巷', N'4564664', 100)
INSERT [dbo].[Seller_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'6dbd4c43-0e75-425e-b7f9-395628646da0', N'16416', N'哈理工', N'和覅乌尔禾ifO记埃尔文胸肌', 587)
INSERT [dbo].[Seller_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'74337148-e717-4e1b-87fa-7f2fc32cc2d3', N'48767', N'哈尔滨宜家', N'54654afe6awe', 40)
INSERT [dbo].[Seller_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'7916ca74-e6e1-4862-8ac9-7804e9c3eaff', N'486', N'丁香公园', N'6465456阿尔发二娃', 90)
INSERT [dbo].[Seller_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'a67476be-2efc-4483-b244-60dfa637430a', N'', N'国家大剧院', N'465464684 ', 778)
INSERT [dbo].[Seller_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'c044c6b4-d6e1-415d-836e-1ba98a0ccb6c', N'15564', N'和兴路地铁站', N'副科级额按我理解发我平均分哦', 45)
INSERT [dbo].[Seller_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'cb5856fd-d3db-45f2-9f26-095c663afc5e', N'48684', N'东北林业大学食堂', N'打分法', 4)
INSERT [dbo].[Seller_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'd4eac4fa-1a44-4e53-b6ab-685e955a8f1e', N'', N'黑龙江省植物园', N'发而非a', 87)
/****** Object:  Table [dbo].[RSH_User]    Script Date: 04/26/2017 17:42:37 ******/
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
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'101@qq.com', N'202CB962AC59075B964B07152D234B70', N'd34dcd94-5acf-46f7-9a33-efe6184dec12', N'普通用户11', 1)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'102@qq.com', N'202CB962AC59075B964B07152D234B70', N'01e88b42-14e9-4de6-9e16-03bedf15d3f1', N'普通用户12', 1)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'103@qq.com', N'202CB962AC59075B964B07152D234B70', N'2d5e1ad6-86b4-49e4-a5d1-1c602f1f56a3', N'普通用户13', 1)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'104@qq.com', N'202CB962AC59075B964B07152D234B70', N'0e2fe5d9-9f06-48b0-a88e-2b9fd973727f', N'普通用户14', 1)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'105@qq.com', N'202CB962AC59075B964B07152D234B70', N'8cfe43c1-1259-480d-af43-606c913f8223', N'普通用户15', 1)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'106@qq.com', N'65DED5353C5EE48D0B7D48C591B8F430', N'410049f9-65b5-46fc-8a79-8212d2d2a30c', N'普通用户16', 1)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'107@qq.com', N'202CB962AC59075B964B07152D234B70', N'5d19d5c5-6311-47f0-81cc-4503b56f6d83', N'普通用户17', 1)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'201@qq.com', N'202CB962AC59075B964B07152D234B70', N'93eab04d-bc50-4750-9775-b29a31f1cd23', N'设计师11', 2)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'202@qq.com', N'202CB962AC59075B964B07152D234B70', N'3433b66b-db2c-4b18-869e-1308c692ff1d', N'设计师12', 2)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'203@qq.com', N'202CB962AC59075B964B07152D234B70', N'565650ef-b78c-4843-be05-d7f3f6fecb6b', N'设计师13', 2)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'204@qq.com', N'202CB962AC59075B964B07152D234B70', N'86848348-182d-4118-ac48-a74b65bb4080', N'设计师14', 2)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'205@qq.com', N'202CB962AC59075B964B07152D234B70', N'2dca22d2-b818-47ee-8604-b8f642649ae8', N'设计师15', 2)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'206@qq.com', N'202CB962AC59075B964B07152D234B70', N'767d652c-02d8-4be2-9618-e6c76496981e', N'设计师16', 2)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'207@qq.com', N'202CB962AC59075B964B07152D234B70', N'724bbba8-08b2-4e6a-ba83-cc340c55830f', N'设计师17', 2)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'208@qq.com', N'202CB962AC59075B964B07152D234B70', N'bcf7589c-7e55-4ed3-8f40-3ea69eb8e654', N'设计师18', 2)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'209@qq.com', N'202CB962AC59075B964B07152D234B70', N'4816a312-22c3-42f7-98da-b37bc9a26acc', N'设计师19', 2)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'210@qq.com', N'202CB962AC59075B964B07152D234B70', N'cf2442ee-bd06-4901-aa40-8c77bd4888ca', N'设计师110', 2)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'211@qq.com', N'C20AD4D76FE97759AA27A0C99BFF6710', N'cd218573-3a0e-4e54-ba7f-452d70551efb', N'设计师111', 2)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'212@qq.com', N'202CB962AC59075B964B07152D234B70', N'e9de47f6-c33e-4f61-bb39-dc43db8b57ee', N'设计师112', 2)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'213@qq.com', N'202CB962AC59075B964B07152D234B70', N'd8dfa562-188c-4044-9dd1-621675e0c8a8', N'设计师113', 2)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'301@qq.com', N'202CB962AC59075B964B07152D234B70', N'2a6821f1-4e75-467d-8c45-88bd3e265aa9', N'家装公司11', 3)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'302@qq.com', N'202CB962AC59075B964B07152D234B70', N'85263b3b-6262-4b02-807a-eb6e51ccce79', N'家装公司12', 3)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'303@qq.com', N'202CB962AC59075B964B07152D234B70', N'dcf06fa2-3229-45e5-be9a-720d548c3e71', N'家装公司13', 3)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'304@qq.com', N'202CB962AC59075B964B07152D234B70', N'0786802d-5c87-4fdd-a138-16774dc6bcff', N'家装公司14', 3)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'305@qq.com', N'202CB962AC59075B964B07152D234B70', N'a5309b9d-024b-4441-8966-1c52aacf7fb4', N'家装公司15', 3)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'306@qq.com', N'202CB962AC59075B964B07152D234B70', N'2d9be3d1-259c-4437-bc7c-706b96ad5af3', N'家装公司16', 3)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'307@qq.com', N'202CB962AC59075B964B07152D234B70', N'945e3328-592e-4a01-a24d-c4cd495eaa31', N'家装公司17', 3)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'308@qq.com', N'202CB962AC59075B964B07152D234B70', N'866d8eb5-f689-4076-ba37-7b5559e1c3f8', N'家装公司18', 3)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'309@qq.com', N'202CB962AC59075B964B07152D234B70', N'a686fd52-08cd-4786-8a99-4a702942a249', N'家装公司19', 3)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'310@qq.com', N'202CB962AC59075B964B07152D234B70', N'971dc3b4-6e25-442f-a652-0f796fd9d474', N'家装公司110', 3)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'401@qq.com', N'202CB962AC59075B964B07152D234B70', N'cb5856fd-d3db-45f2-9f26-095c663afc5e', N'商户11', 4)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'402@qq.com', N'202CB962AC59075B964B07152D234B70', N'6dbd4c43-0e75-425e-b7f9-395628646da0', N'商户12', 4)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'403@qq.com', N'202CB962AC59075B964B07152D234B70', N'c044c6b4-d6e1-415d-836e-1ba98a0ccb6c', N'商户13', 4)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'404@qq.com', N'202CB962AC59075B964B07152D234B70', N'74337148-e717-4e1b-87fa-7f2fc32cc2d3', N'商户14', 4)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'405@qq.com', N'202CB962AC59075B964B07152D234B70', N'7916ca74-e6e1-4862-8ac9-7804e9c3eaff', N'商户15', 4)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'406@qq.com', N'C20AD4D76FE97759AA27A0C99BFF6710', N'5d006732-eb58-4c01-96b1-d5f7ddeb6b41', N'商户16', 4)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'407@qq.com', N'202CB962AC59075B964B07152D234B70', N'd4eac4fa-1a44-4e53-b6ab-685e955a8f1e', N'商户17', 4)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'408@qq.com', N'202CB962AC59075B964B07152D234B70', N'329ea96b-1747-4509-947b-c9e4701d645e', N'商户18', 4)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'409@qq.com', N'202CB962AC59075B964B07152D234B70', N'a67476be-2efc-4483-b244-60dfa637430a', N'商户19', 4)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'410@qq.com', N'202CB962AC59075B964B07152D234B70', N'54d73052-37b7-4d17-9e83-5056724a3ef7', N'商户110', 4)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'ceshi1', N'202CB962AC59075B964B07152D234B70', N'c4eb1606-cb1c-42d6-883b-7c86cb50be76', N'ceshi1', 1)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'ceshi2', N'202CB962AC59075B964B07152D234B70', N'520c861d-48f4-4b79-ad4e-d1f710ff5717', N'ceshi2', 2)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'ceshi3', N'202CB962AC59075B964B07152D234B70', N'1f836091-f51f-4a0c-ae9c-f3624d076461', N'ceshi3', 3)
/****** Object:  Table [dbo].[RSH_House]    Script Date: 04/26/2017 17:42:37 ******/
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
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'0f7b8a9e-0729-4e3e-98d6-f745bbfe3e3e', N'龙塔', 1, 465, 1, 1, N'龙的传人上  龙塔', NULL, N'1')
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'26823ae4-298b-42f7-882f-9a992e8f6e33', N'北京市京师园10号楼', 1, 78, 1, 1, N'哈发饿哦我我后覅偶尔胡椒粉日俄哦啊无法能看就奥数的你付款骄傲和覅uehaiou', NULL, N'1')
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'2b74addb-ed2e-4ee1-b264-73f5e6408303', N'奥林匹克公园', 1, 156, 1, 1, N'481564164北京欢迎你', NULL, N'1')
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'2cbf8e7f-eff7-4f3e-b85e-f1ccc65188ed', N'北京市朝阳公园', 1, 41513, 1, 1, N'', NULL, N'1')
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'3ac3b264-3231-4c8b-94cf-a14e7d89a53f', N'北京市北海公园', 1, 132, 1, 1, N'', NULL, N'1')
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'3e4a45de-a7af-4e65-959c-4ec3cfdc88e0', N'学府路四道街', 1, 888, 1, 1, N'测试我有很多的房子，气人不', N'', N'1')
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'4b277f78-e59a-4ba4-a403-3642d700798e', N'防洪纪念塔', 1, 102, 3, 2, N'我的家就在松花江上！', N'E:\RSH\House\201704220325_f08ca3f2-8583-4908-94b5-80eb1cf4ef9e.txt', N'1')
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'6ec15a9a-1575-4da0-bbb4-a26f89f84ba1', N'索菲亚教堂', 1, 998, 1, 1, N'我是一个人我信耶稣我要装修！！！！！！！！！111', NULL, N'1')
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'6f0c6a38-aa53-401a-a20b-8740a7473794', N'东北林业大学主楼', 2, 88, 2, 3, N'我们的主楼一点都不旧，我只是想要装修一下她', N'E:\RSH\House\201704220320_33b3517a-13a4-42b2-aed1-9f7185396834.txt', N'1')
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'7fdeae45-1d80-4a62-b7ce-f398e55fbebc', N'黑龙江中医药大学', 1, 12, 9, 1, N'肺癌UI反悔啊和服爱德华是否可见哈斯防洪哎好烦罚款及覅哦啊玩嘿嘿48947841654168848646464534354阿道夫含糊汾河湾凑字数', N'E:\RSH\House\201704220327_73fcc93a-68fe-4454-beef-e22475fdac1f.txt', N'1')
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'95ff3295-1d00-450f-94f7-6781de11ab21', N'科大小区10号楼', 1, 300, 8, 3, N'我住在科大小区院内，院里有特别多的好吃的，不过与装修无关，我希望找到一个牛逼有便宜的装修团队', N'E:\RSH\House\201704220322_6ba39ffc-a297-4b93-8fab-bedc6077dfd8.exe', N'1')
/****** Object:  Table [dbo].[Normal_User]    Script Date: 04/26/2017 17:42:37 ******/
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
INSERT [dbo].[Normal_User] ([UserID], [Sex], [Phone]) VALUES (N'01e88b42-14e9-4de6-9e16-03bedf15d3f1', N'女', N'1651')
INSERT [dbo].[Normal_User] ([UserID], [Sex], [Phone]) VALUES (N'0e2fe5d9-9f06-48b0-a88e-2b9fd973727f', N'男', N'468512303')
INSERT [dbo].[Normal_User] ([UserID], [Sex], [Phone]) VALUES (N'2d5e1ad6-86b4-49e4-a5d1-1c602f1f56a3', N'男', N'464651')
INSERT [dbo].[Normal_User] ([UserID], [Sex], [Phone]) VALUES (N'410049f9-65b5-46fc-8a79-8212d2d2a30c', N'男', N'5146')
INSERT [dbo].[Normal_User] ([UserID], [Sex], [Phone]) VALUES (N'5d19d5c5-6311-47f0-81cc-4503b56f6d83', N'男', N'84865')
INSERT [dbo].[Normal_User] ([UserID], [Sex], [Phone]) VALUES (N'8cfe43c1-1259-480d-af43-606c913f8223', N'男', N'75135')
INSERT [dbo].[Normal_User] ([UserID], [Sex], [Phone]) VALUES (N'd34dcd94-5acf-46f7-9a33-efe6184dec12', N'男', N'1008611')
/****** Object:  Table [dbo].[HouseOwner]    Script Date: 04/26/2017 17:42:37 ******/
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
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'01e88b42-14e9-4de6-9e16-03bedf15d3f1', N'4b277f78-e59a-4ba4-a403-3642d700798e', N'1')
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'0e2fe5d9-9f06-48b0-a88e-2b9fd973727f', N'0f7b8a9e-0729-4e3e-98d6-f745bbfe3e3e', N'1')
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'0e2fe5d9-9f06-48b0-a88e-2b9fd973727f', N'6ec15a9a-1575-4da0-bbb4-a26f89f84ba1', N'1')
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'2d5e1ad6-86b4-49e4-a5d1-1c602f1f56a3', N'7fdeae45-1d80-4a62-b7ce-f398e55fbebc', N'1')
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'410049f9-65b5-46fc-8a79-8212d2d2a30c', N'2b74addb-ed2e-4ee1-b264-73f5e6408303', N'1')
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'5d19d5c5-6311-47f0-81cc-4503b56f6d83', N'2cbf8e7f-eff7-4f3e-b85e-f1ccc65188ed', N'1')
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'5d19d5c5-6311-47f0-81cc-4503b56f6d83', N'3ac3b264-3231-4c8b-94cf-a14e7d89a53f', N'1')
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'8cfe43c1-1259-480d-af43-606c913f8223', N'26823ae4-298b-42f7-882f-9a992e8f6e33', N'1')
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'd34dcd94-5acf-46f7-9a33-efe6184dec12', N'3e4a45de-a7af-4e65-959c-4ec3cfdc88e0', N'1')
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'd34dcd94-5acf-46f7-9a33-efe6184dec12', N'6f0c6a38-aa53-401a-a20b-8740a7473794', N'1')
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'd34dcd94-5acf-46f7-9a33-efe6184dec12', N'95ff3295-1d00-450f-94f7-6781de11ab21', N'1')
/****** Object:  Table [dbo].[Foreman_User]    Script Date: 04/26/2017 17:42:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Foreman_User](
	[UserID] [varchar](36) NOT NULL,
	[Phone] [varchar](30) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[FansQuantity] [int] NOT NULL,
 CONSTRAINT [PK_Foreman_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnjoyStyle]    Script Date: 04/26/2017 17:42:37 ******/
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
/****** Object:  Table [dbo].[Designer_User]    Script Date: 04/26/2017 17:42:37 ******/
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
INSERT [dbo].[Designer_User] ([UserID], [Sex], [StartWorkTime], [Phone], [Address], [DesignConcept], [FansQuantity]) VALUES (N'2dca22d2-b818-47ee-8604-b8f642649ae8', N'男', CAST(0x85350B00 AS Date), N'5131', N'太阳岛风景区', N'我比所有人牛逼呢', 75)
INSERT [dbo].[Designer_User] ([UserID], [Sex], [StartWorkTime], [Phone], [Address], [DesignConcept], [FansQuantity]) VALUES (N'3433b66b-db2c-4b18-869e-1308c692ff1d', N'男', CAST(0x40310B00 AS Date), N'268464', N'哈一百', N'我比上面的牛逼', 876)
INSERT [dbo].[Designer_User] ([UserID], [Sex], [StartWorkTime], [Phone], [Address], [DesignConcept], [FansQuantity]) VALUES (N'4816a312-22c3-42f7-98da-b37bc9a26acc', N'男', CAST(0xA83C0B00 AS Date), N'1455', N'哈尔滨市东北虎林园', N'我的老家就住在这个院', 77)
INSERT [dbo].[Designer_User] ([UserID], [Sex], [StartWorkTime], [Phone], [Address], [DesignConcept], [FansQuantity]) VALUES (N'565650ef-b78c-4843-be05-d7f3f6fecb6b', N'男', CAST(0xCD390B00 AS Date), N'14561', N'省政府', N'我是比刚才那个牛逼', 42)
INSERT [dbo].[Designer_User] ([UserID], [Sex], [StartWorkTime], [Phone], [Address], [DesignConcept], [FansQuantity]) VALUES (N'724bbba8-08b2-4e6a-ba83-cc340c55830f', N'男', CAST(0xA43C0B00 AS Date), N'156415', N'哈工大', N'你们牛逼，全家都牛逼', 100)
INSERT [dbo].[Designer_User] ([UserID], [Sex], [StartWorkTime], [Phone], [Address], [DesignConcept], [FansQuantity]) VALUES (N'767d652c-02d8-4be2-9618-e6c76496981e', N'男', CAST(0x393B0B00 AS Date), N'46541564', N'东北农业大学', N'别吵了，我最牛逼', 45)
INSERT [dbo].[Designer_User] ([UserID], [Sex], [StartWorkTime], [Phone], [Address], [DesignConcept], [FansQuantity]) VALUES (N'86848348-182d-4118-ac48-a74b65bb4080', N'男', CAST(0xB83C0B00 AS Date), N'45145', N'哈尔滨西站', N'我才是牛逼呢', 47)
INSERT [dbo].[Designer_User] ([UserID], [Sex], [StartWorkTime], [Phone], [Address], [DesignConcept], [FansQuantity]) VALUES (N'93eab04d-bc50-4750-9775-b29a31f1cd23', N'男', CAST(0xFD360B00 AS Date), N'101084', N'乐松广场4楼', N'我最牛逼', 8)
INSERT [dbo].[Designer_User] ([UserID], [Sex], [StartWorkTime], [Phone], [Address], [DesignConcept], [FansQuantity]) VALUES (N'bcf7589c-7e55-4ed3-8f40-3ea69eb8e654', N'男', CAST(0xBD3C0B00 AS Date), N'154654', N'帽儿山', N'123456', 77)
INSERT [dbo].[Designer_User] ([UserID], [Sex], [StartWorkTime], [Phone], [Address], [DesignConcept], [FansQuantity]) VALUES (N'cd218573-3a0e-4e54-ba7f-452d70551efb', N'男', CAST(0xA63C0B00 AS Date), N'8754', N'北京市朝阳区北沙滩', N'4654', 87)
INSERT [dbo].[Designer_User] ([UserID], [Sex], [StartWorkTime], [Phone], [Address], [DesignConcept], [FansQuantity]) VALUES (N'cf2442ee-bd06-4901-aa40-8c77bd4888ca', N'男', CAST(0xA33C0B00 AS Date), N'1246', N'哈尔滨花卉大市场', N'464648', 34)
INSERT [dbo].[Designer_User] ([UserID], [Sex], [StartWorkTime], [Phone], [Address], [DesignConcept], [FansQuantity]) VALUES (N'd8dfa562-188c-4044-9dd1-621675e0c8a8', N'男', CAST(0xA83C0B00 AS Date), N'56', N'前门大街', N'大尖峰时刻连放假', 778)
INSERT [dbo].[Designer_User] ([UserID], [Sex], [StartWorkTime], [Phone], [Address], [DesignConcept], [FansQuantity]) VALUES (N'e9de47f6-c33e-4f61-bb39-dc43db8b57ee', N'男', CAST(0xA43C0B00 AS Date), N'564', N'北京林业大学', N'爱妃发哦', 78)
/****** Object:  Table [dbo].[DesignCompany_User]    Script Date: 04/26/2017 17:42:37 ******/
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
INSERT [dbo].[DesignCompany_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'0786802d-5c87-4fdd-a138-16774dc6bcff', N'848465', N'松花江公路大桥', N'74864864efaw5f4w6a4e6f84aw68发我阿尔法啊', 54)
INSERT [dbo].[DesignCompany_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'2a6821f1-4e75-467d-8c45-88bd3e265aa9', N'45453', N'东北林业大学体育馆', N'4654132135465阿尔法未发完发而非爱我', 857)
INSERT [dbo].[DesignCompany_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'2d9be3d1-259c-4437-bc7c-706b96ad5af3', N'', N'哈尔滨医科大学', N'而激发我巨额佛奥靳魏坤【怕我看【看颇为', 77)
INSERT [dbo].[DesignCompany_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'85263b3b-6262-4b02-807a-eb6e51ccce79', N'745153', N'黑龙江大学', N'发哈发呆快继父回家咖啡喝口浩丰科技二哈费劲儿和我恢复爱哦', 100)
INSERT [dbo].[DesignCompany_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'866d8eb5-f689-4076-ba37-7b5559e1c3f8', N'', N'南锣鼓巷', N'代发费无法', 55)
INSERT [dbo].[DesignCompany_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'945e3328-592e-4a01-a24d-c4cd495eaa31', N'48', N'教化广场', N'就饿哦皮挖掘防抛网金额彷佛家', 457)
INSERT [dbo].[DesignCompany_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'971dc3b4-6e25-442f-a652-0f796fd9d474', N'', N'北京市百度大厦', N'747464', 78)
INSERT [dbo].[DesignCompany_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'a5309b9d-024b-4441-8966-1c52aacf7fb4', N'546', N'黑龙江科技大学', N'阿尔阿飞飞安慰', 788)
INSERT [dbo].[DesignCompany_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'a686fd52-08cd-4786-8a99-4a702942a249', N'74', N'中国农业大学', N'48654684866', 47)
INSERT [dbo].[DesignCompany_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'dcf06fa2-3229-45e5-be9a-720d548c3e71', N'54156', N'文昌桥', N'发我破诶附近爱唯欧平均分配己二胺抛丸机佛i', 7)
/****** Object:  Table [dbo].[Demand]    Script Date: 04/26/2017 17:42:37 ******/
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
INSERT [dbo].[Demand] ([DemandID], [CreatorID], [HouseID], [DemandName], [Visible], [Valid]) VALUES (N'041427bb-8a71-4db3-86b5-a86aba765824', N'd34dcd94-5acf-46f7-9a33-efe6184dec12', N'3e4a45de-a7af-4e65-959c-4ec3cfdc88e0', N'ceshifabu', N'1', N'1')
INSERT [dbo].[Demand] ([DemandID], [CreatorID], [HouseID], [DemandName], [Visible], [Valid]) VALUES (N'25b234ec-0598-43d2-a396-434ff558002f', N'01e88b42-14e9-4de6-9e16-03bedf15d3f1', N'4b277f78-e59a-4ba4-a403-3642d700798e', N'三居室需要装修', N'1', N'1')
INSERT [dbo].[Demand] ([DemandID], [CreatorID], [HouseID], [DemandName], [Visible], [Valid]) VALUES (N'2dc09137-1a9f-4f85-ad20-654dc45c022d', N'd34dcd94-5acf-46f7-9a33-efe6184dec12', N'6f0c6a38-aa53-401a-a20b-8740a7473794', N'主楼装修', N'1', N'1')
INSERT [dbo].[Demand] ([DemandID], [CreatorID], [HouseID], [DemandName], [Visible], [Valid]) VALUES (N'38bb7985-1459-4d99-b00f-f9c1a3a3e8e8', N'd34dcd94-5acf-46f7-9a33-efe6184dec12', N'95ff3295-1d00-450f-94f7-6781de11ab21', N'科大小区需要装修，我的大别墅', N'1', N'1')
INSERT [dbo].[Demand] ([DemandID], [CreatorID], [HouseID], [DemandName], [Visible], [Valid]) VALUES (N'5601fae6-a8a5-4eaa-9510-aa52d00d237c', N'410049f9-65b5-46fc-8a79-8212d2d2a30c', N'2b74addb-ed2e-4ee1-b264-73f5e6408303', N'奥体中心装修', N'1', N'1')
INSERT [dbo].[Demand] ([DemandID], [CreatorID], [HouseID], [DemandName], [Visible], [Valid]) VALUES (N'5c56bb24-aaba-49ba-bf55-6a174d0e77f5', N'8cfe43c1-1259-480d-af43-606c913f8223', N'26823ae4-298b-42f7-882f-9a992e8f6e33', N'1居室装修', N'1', N'1')
INSERT [dbo].[Demand] ([DemandID], [CreatorID], [HouseID], [DemandName], [Visible], [Valid]) VALUES (N'7c5af7c1-a3e8-4c2b-89df-70cd67f95d20', N'5d19d5c5-6311-47f0-81cc-4503b56f6d83', N'3ac3b264-3231-4c8b-94cf-a14e7d89a53f', N'北海北', N'1', N'1')
INSERT [dbo].[Demand] ([DemandID], [CreatorID], [HouseID], [DemandName], [Visible], [Valid]) VALUES (N'7df4de32-61fd-4591-bf58-e53d5b809ffb', N'0e2fe5d9-9f06-48b0-a88e-2b9fd973727f', N'6ec15a9a-1575-4da0-bbb4-a26f89f84ba1', N'教堂装修', N'1', N'1')
INSERT [dbo].[Demand] ([DemandID], [CreatorID], [HouseID], [DemandName], [Visible], [Valid]) VALUES (N'c721ee0c-43de-4e8b-a34a-aecc91253ee9', N'5d19d5c5-6311-47f0-81cc-4503b56f6d83', N'2cbf8e7f-eff7-4f3e-b85e-f1ccc65188ed', N'装修把', N'1', N'1')
INSERT [dbo].[Demand] ([DemandID], [CreatorID], [HouseID], [DemandName], [Visible], [Valid]) VALUES (N'e3742b0a-eb46-4386-a500-f872c20765b4', N'2d5e1ad6-86b4-49e4-a5d1-1c602f1f56a3', N'7fdeae45-1d80-4a62-b7ce-f398e55fbebc', N'黑中医', N'1', N'1')
INSERT [dbo].[Demand] ([DemandID], [CreatorID], [HouseID], [DemandName], [Visible], [Valid]) VALUES (N'fd1c5752-6163-4221-ba66-436b38287acf', N'0e2fe5d9-9f06-48b0-a88e-2b9fd973727f', N'0f7b8a9e-0729-4e3e-98d6-f745bbfe3e3e', N'啊哈哈哈哈哈哈啊哈哈哈', N'1', N'1')
/****** Object:  Table [dbo].[Collection]    Script Date: 04/26/2017 17:42:37 ******/
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
/****** Object:  Table [dbo].[AddressPoint]    Script Date: 04/26/2017 17:42:37 ******/
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
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'奥林匹克公园', CAST(116.400494 AS Decimal(10, 6)), CAST(39.999603 AS Decimal(10, 6)), N'北京市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'北京林业大学', CAST(116.351554 AS Decimal(10, 6)), CAST(40.010336 AS Decimal(10, 6)), N'北京市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'北京市百度大厦', CAST(116.307689 AS Decimal(10, 6)), CAST(40.056974 AS Decimal(10, 6)), N'北京市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'北京市北海公园', CAST(116.395480 AS Decimal(10, 6)), CAST(39.932909 AS Decimal(10, 6)), N'北京市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'北京市朝阳公园', CAST(116.488036 AS Decimal(10, 6)), CAST(39.950229 AS Decimal(10, 6)), N'北京市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'北京市朝阳区北沙滩', CAST(116.378111 AS Decimal(10, 6)), CAST(40.009680 AS Decimal(10, 6)), N'北京市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'北京市京师园10号楼', CAST(116.378631 AS Decimal(10, 6)), CAST(40.022875 AS Decimal(10, 6)), N'北京市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'北京市蓝色港湾', CAST(116.482454 AS Decimal(10, 6)), CAST(39.955171 AS Decimal(10, 6)), N'北京市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'北京市汽车博物馆', CAST(116.308106 AS Decimal(10, 6)), CAST(39.835053 AS Decimal(10, 6)), N'北京市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'丁香公园', CAST(126.575352 AS Decimal(10, 6)), CAST(45.748575 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'东北林业大学食堂', CAST(126.662243 AS Decimal(10, 6)), CAST(45.714145 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'东北林业大学体育馆', CAST(126.644278 AS Decimal(10, 6)), CAST(45.726435 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'东北林业大学主楼', CAST(126.646723 AS Decimal(10, 6)), CAST(45.729408 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'东北农业大学', CAST(126.733743 AS Decimal(10, 6)), CAST(45.748588 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'防洪纪念塔', CAST(126.623610 AS Decimal(10, 6)), CAST(45.786847 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'关东古巷', CAST(126.573464 AS Decimal(10, 6)), CAST(45.740076 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'国家大剧院', CAST(116.396257 AS Decimal(10, 6)), CAST(39.911233 AS Decimal(10, 6)), N'北京市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'哈尔滨花卉大市场', CAST(126.724769 AS Decimal(10, 6)), CAST(45.691288 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'哈尔滨市东北虎林园', CAST(126.608064 AS Decimal(10, 6)), CAST(45.823364 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'哈尔滨西站', CAST(126.584349 AS Decimal(10, 6)), CAST(45.713001 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'哈尔滨医科大学', CAST(126.626450 AS Decimal(10, 6)), CAST(45.707637 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'哈尔滨宜家', CAST(126.599317 AS Decimal(10, 6)), CAST(45.700389 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'哈工大', CAST(126.639051 AS Decimal(10, 6)), CAST(45.749406 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'哈理工', CAST(126.623020 AS Decimal(10, 6)), CAST(45.721257 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'哈一百', CAST(126.630323 AS Decimal(10, 6)), CAST(45.775009 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'和兴路地铁站', CAST(126.621815 AS Decimal(10, 6)), CAST(45.738891 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'黑龙江大学', CAST(126.629092 AS Decimal(10, 6)), CAST(45.715225 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'黑龙江科技大学', CAST(126.660066 AS Decimal(10, 6)), CAST(45.825588 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'黑龙江省植物园', CAST(126.657437 AS Decimal(10, 6)), CAST(45.710461 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'黑龙江中医药大学', CAST(126.654760 AS Decimal(10, 6)), CAST(45.732735 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'教化广场', CAST(126.637025 AS Decimal(10, 6)), CAST(45.754127 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'科大小区10号楼', CAST(126.637243 AS Decimal(10, 6)), CAST(45.722028 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'乐松广场4楼', CAST(126.655513 AS Decimal(10, 6)), CAST(45.724973 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'龙塔', CAST(126.686975 AS Decimal(10, 6)), CAST(45.753640 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'帽儿山', CAST(127.519185 AS Decimal(10, 6)), CAST(45.281782 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'南锣鼓巷', CAST(116.409683 AS Decimal(10, 6)), CAST(39.939840 AS Decimal(10, 6)), N'北京市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'前门大街', CAST(116.404634 AS Decimal(10, 6)), CAST(39.899998 AS Decimal(10, 6)), N'北京市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'省政府', CAST(126.668380 AS Decimal(10, 6)), CAST(45.747701 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'松花江公路大桥', CAST(126.600280 AS Decimal(10, 6)), CAST(45.766384 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'索菲亚教堂', CAST(126.633567 AS Decimal(10, 6)), CAST(45.776704 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'太阳岛风景区', CAST(126.601722 AS Decimal(10, 6)), CAST(45.799504 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'文昌桥', CAST(126.646354 AS Decimal(10, 6)), CAST(45.735972 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'学府路四道街', CAST(126.615023 AS Decimal(10, 6)), CAST(45.711043 AS Decimal(10, 6)), N'哈尔滨市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'中国农业大学', CAST(116.364155 AS Decimal(10, 6)), CAST(40.010186 AS Decimal(10, 6)), N'北京市')
/****** Object:  Default [DF_AddressPoint_Longitute]    Script Date: 04/26/2017 17:42:37 ******/
ALTER TABLE [dbo].[AddressPoint] ADD  CONSTRAINT [DF_AddressPoint_Longitute]  DEFAULT ((0)) FOR [Longitute]
GO
/****** Object:  Default [DF_AddressPoint_Latitude]    Script Date: 04/26/2017 17:42:37 ******/
ALTER TABLE [dbo].[AddressPoint] ADD  CONSTRAINT [DF_AddressPoint_Latitude]  DEFAULT ((0)) FOR [Latitude]
GO
/****** Object:  Default [DF_Demand_Visible]    Script Date: 04/26/2017 17:42:37 ******/
ALTER TABLE [dbo].[Demand] ADD  CONSTRAINT [DF_Demand_Visible]  DEFAULT ((1)) FOR [Visible]
GO
/****** Object:  Default [DF_Demand_Valid]    Script Date: 04/26/2017 17:42:37 ******/
ALTER TABLE [dbo].[Demand] ADD  CONSTRAINT [DF_Demand_Valid]  DEFAULT ((1)) FOR [Valid]
GO
/****** Object:  Default [DF_DesignCompany_User_FansQuantity]    Script Date: 04/26/2017 17:42:37 ******/
ALTER TABLE [dbo].[DesignCompany_User] ADD  CONSTRAINT [DF_DesignCompany_User_FansQuantity]  DEFAULT ((0)) FOR [FansQuantity]
GO
/****** Object:  Default [DF_Designer_User_FansQuantity]    Script Date: 04/26/2017 17:42:37 ******/
ALTER TABLE [dbo].[Designer_User] ADD  CONSTRAINT [DF_Designer_User_FansQuantity]  DEFAULT ((0)) FOR [FansQuantity]
GO
/****** Object:  Default [DF_HouseOwner_Valid]    Script Date: 04/26/2017 17:42:37 ******/
ALTER TABLE [dbo].[HouseOwner] ADD  CONSTRAINT [DF_HouseOwner_Valid]  DEFAULT ((1)) FOR [Valid]
GO
/****** Object:  Default [DF_RSH_House_Valid]    Script Date: 04/26/2017 17:42:37 ******/
ALTER TABLE [dbo].[RSH_House] ADD  CONSTRAINT [DF_RSH_House_Valid]  DEFAULT ((1)) FOR [Valid]
GO
/****** Object:  Default [DF_Seller_User_FansQuantity]    Script Date: 04/26/2017 17:42:37 ******/
ALTER TABLE [dbo].[Seller_User] ADD  CONSTRAINT [DF_Seller_User_FansQuantity]  DEFAULT ((0)) FOR [FansQuantity]
GO
