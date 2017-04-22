USE [RedShowHome]
GO
/****** Object:  Table [dbo].[Seller_User]    Script Date: 04/22/2017 10:39:52 ******/
INSERT [dbo].[Seller_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'385b8474-21cd-4b63-85e9-9640c2de87c2', N'45454864', N'北沙滩红星美凯龙', N'专业从事家具专卖60年', 0)
/****** Object:  Table [dbo].[RSH_User]    Script Date: 04/22/2017 10:39:52 ******/
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'1@qq.com', N'C4CA4238A0B923820DCC509A6F75849B', N'c3a1bc98-8c94-4288-ac58-d8e24d9b1c6d', N'普通用户1', 1)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'2@qq.com', N'C81E728D9D4C2F636F067F89CC14862C', N'f73fa2e1-e65a-4a9b-be52-5ca0f50d74f6', N'设计师1', 2)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'3@qq.com', N'ECCBC87E4B5CE2FE28308FD9F2A7BAF3', N'3fe821d1-0d1c-466d-aeaf-ea5aa52b2a2d', N'家装公司1', 3)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'4@qq.com', N'A87FF679A2F3E71D9181A67B7542122C', N'385b8474-21cd-4b63-85e9-9640c2de87c2', N'商户1', 4)
INSERT [dbo].[RSH_User] ([LoginEmail], [LoginPassword], [UserID], [UserName], [UserType]) VALUES (N'5@qq.com', N'E4DA3B7FBBCE2345D7772B0674A318D5', N'2773fb13-367b-4655-9e4b-fa40f731f88c', N'设计师2', 2)
/****** Object:  Table [dbo].[RSH_House]    Script Date: 04/22/2017 10:39:52 ******/
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'6362feac-3770-4bfc-a15f-da14ad6dc43f', N'南锣鼓巷', 1, 382, 8, 1, N'我有一个大大的别墅，我有钱，我任性', N'E:\RSH\House\201704200243_d6dafbe8-8e74-493b-ab75-6f4b2a0cb4fb.png', N'1')
INSERT [dbo].[RSH_House] ([HouseID], [Address], [Status], [Area], [HouseType], [DecorationWay], [Description], [Ichnography], [Valid]) VALUES (N'fac34eb3-11de-4b98-8f16-aac378793e26', N'北沙滩1号院37号楼', 1, 88, 2, 3, N'我喜欢美式风格家居环境，要环保便宜的', N'E:\RSH\House\201704200152_f844e1c2-27ee-47e7-9d2d-f6e2fcc2ff4d.png', N'1')
/****** Object:  Table [dbo].[Normal_User]    Script Date: 04/22/2017 10:39:52 ******/
INSERT [dbo].[Normal_User] ([UserID], [Sex], [Phone]) VALUES (N'c3a1bc98-8c94-4288-ac58-d8e24d9b1c6d', N'男', N'188109')
/****** Object:  Table [dbo].[HouseOwner]    Script Date: 04/22/2017 10:39:52 ******/
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'c3a1bc98-8c94-4288-ac58-d8e24d9b1c6d', N'6362feac-3770-4bfc-a15f-da14ad6dc43f', N'1')
INSERT [dbo].[HouseOwner] ([UserID], [HouseID], [Valid]) VALUES (N'c3a1bc98-8c94-4288-ac58-d8e24d9b1c6d', N'fac34eb3-11de-4b98-8f16-aac378793e26', N'1')
/****** Object:  Table [dbo].[EnjoyStyle]    Script Date: 04/22/2017 10:39:52 ******/
/****** Object:  Table [dbo].[Designer_User]    Script Date: 04/22/2017 10:39:52 ******/
INSERT [dbo].[Designer_User] ([UserID], [Sex], [StartWorkTime], [Phone], [Address], [DesignConcept], [FansQuantity]) VALUES (N'2773fb13-367b-4655-9e4b-fa40f731f88c', N'男', CAST(0x82350B00 AS Date), N'184165', N'前门大街', N'楼上那位没有我牛b', 100)
INSERT [dbo].[Designer_User] ([UserID], [Sex], [StartWorkTime], [Phone], [Address], [DesignConcept], [FansQuantity]) VALUES (N'f73fa2e1-e65a-4a9b-be52-5ca0f50d74f6', N'女', CAST(0xD0390B00 AS Date), N'189651468', N'北京林业大学', N'我de设计最牛B', 60)
/****** Object:  Table [dbo].[DesignCompany_User]    Script Date: 04/22/2017 10:39:52 ******/
INSERT [dbo].[DesignCompany_User] ([UserID], [Phone], [Address], [Description], [FansQuantity]) VALUES (N'3fe821d1-0d1c-466d-aeaf-ea5aa52b2a2d', N'2561351', N'奥林匹克公园', N'我的老家哎就住在这个屯', 50)
/****** Object:  Table [dbo].[Demand]    Script Date: 04/22/2017 10:39:52 ******/
INSERT [dbo].[Demand] ([DemandID], [CreatorID], [HouseID], [DemandName], [Visible], [Valid]) VALUES (N'ad8b0604-afbc-4be6-b1b3-e695641a6ce6', N'c3a1bc98-8c94-4288-ac58-d8e24d9b1c6d', N'6362feac-3770-4bfc-a15f-da14ad6dc43f', N'大别墅谁来装', N'1', N'1')
INSERT [dbo].[Demand] ([DemandID], [CreatorID], [HouseID], [DemandName], [Visible], [Valid]) VALUES (N'f2ed349d-76b8-443e-b29e-1af16477b6ec', N'c3a1bc98-8c94-4288-ac58-d8e24d9b1c6d', N'fac34eb3-11de-4b98-8f16-aac378793e26', N'北沙滩二居室装修', N'1', N'1')
/****** Object:  Table [dbo].[Collection]    Script Date: 04/22/2017 10:39:52 ******/
/****** Object:  Table [dbo].[AddressPoint]    Script Date: 04/22/2017 10:39:52 ******/
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'奥林匹克公园', CAST(116.400494 AS Decimal(10, 6)), CAST(39.999603 AS Decimal(10, 6)), N'北京市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'北京林业大学', CAST(116.351554 AS Decimal(10, 6)), CAST(40.010336 AS Decimal(10, 6)), N'北京市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'北沙滩1号院37号楼', CAST(116.377722 AS Decimal(10, 6)), CAST(40.008907 AS Decimal(10, 6)), N'北京市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'北沙滩红星美凯龙', CAST(116.376866 AS Decimal(10, 6)), CAST(40.008717 AS Decimal(10, 6)), N'北京市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'南锣鼓巷', CAST(116.409683 AS Decimal(10, 6)), CAST(39.939840 AS Decimal(10, 6)), N'北京市')
INSERT [dbo].[AddressPoint] ([Address], [Longitute], [Latitude], [City]) VALUES (N'前门大街', CAST(116.404634 AS Decimal(10, 6)), CAST(39.899998 AS Decimal(10, 6)), N'北京市')
