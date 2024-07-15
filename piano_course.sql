USE [asmPiano]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/15/2024 8:59:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 7/15/2024 8:59:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[courseId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[image] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[tuition_fee] [int] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[categoryId] [int] NULL,
	[createdBy] [int] NULL,
	[status] [bit] NULL,
	[quantity] [int] NULL,
	[lastUpdate] [datetime] NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[courseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/15/2024 8:59:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[order_details_id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NULL,
	[course_price] [int] NULL,
	[amount] [int] NULL,
	[order_id] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[order_details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/15/2024 8:59:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [datetime] NULL,
	[full_name] [nvarchar](50) NULL,
	[phone_number] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[user_id] [int] NULL,
	[total_cost] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/15/2024 8:59:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[role] [int] NULL,
	[full_name] [nvarchar](100) NULL,
	[address] [nvarchar](max) NULL,
	[phone_number] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [category_name]) VALUES (1, N'Beginner Courses')
INSERT [dbo].[Category] ([id], [category_name]) VALUES (2, N'Intermediate Courses')
INSERT [dbo].[Category] ([id], [category_name]) VALUES (3, N'Advanced Courses')
INSERT [dbo].[Category] ([id], [category_name]) VALUES (4, N'Jazz Courses')
INSERT [dbo].[Category] ([id], [category_name]) VALUES (5, N'Classical Courses')
INSERT [dbo].[Category] ([id], [category_name]) VALUES (6, N'Pop Courses')
INSERT [dbo].[Category] ([id], [category_name]) VALUES (7, N'Blues Courses')
INSERT [dbo].[Category] ([id], [category_name]) VALUES (8, N'Kids Courses')
INSERT [dbo].[Category] ([id], [category_name]) VALUES (9, N'Composition Courses')
INSERT [dbo].[Category] ([id], [category_name]) VALUES (10, N'Accompaniment Courses')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([courseId], [name], [image], [description], [tuition_fee], [start_date], [end_date], [categoryId], [createdBy], [status], [quantity], [lastUpdate]) VALUES (1, N'Piano Basics', N'https://i.etsystatic.com/26290866/r/il/77aa6b/4817228677/il_570xN.4817228677_oyq3.jpg', N'Introduction to piano playing for beginners.', 120000, CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-12-01T00:00:00.000' AS DateTime), 1, 1, 1, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Courses] ([courseId], [name], [image], [description], [tuition_fee], [start_date], [end_date], [categoryId], [createdBy], [status], [quantity], [lastUpdate]) VALUES (2, N'Intermediate Piano', N'https://i.etsystatic.com/26290866/r/il/77aa6b/4817228677/il_570xN.4817228677_oyq3.jpg', N'Intermediate piano techniques and theory.', 500000, CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-12-01T00:00:00.000' AS DateTime), 2, 1, 1, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Courses] ([courseId], [name], [image], [description], [tuition_fee], [start_date], [end_date], [categoryId], [createdBy], [status], [quantity], [lastUpdate]) VALUES (3, N'Advanced Piano', N'https://i.etsystatic.com/26290866/r/il/77aa6b/4817228677/il_570xN.4817228677_oyq3.jpg', N'Advanced piano playing and performance.', 250000, CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-12-01T00:00:00.000' AS DateTime), 3, 1, 1, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Courses] ([courseId], [name], [image], [description], [tuition_fee], [start_date], [end_date], [categoryId], [createdBy], [status], [quantity], [lastUpdate]) VALUES (4, N'Jazz Piano', N'https://i.etsystatic.com/26290866/r/il/77aa6b/4817228677/il_570xN.4817228677_oyq3.jpg', N'Learn to play jazz on the piano.', 1100, CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-12-01T00:00:00.000' AS DateTime), 4, 1, 1, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Courses] ([courseId], [name], [image], [description], [tuition_fee], [start_date], [end_date], [categoryId], [createdBy], [status], [quantity], [lastUpdate]) VALUES (5, N'Classical Piano', N'https://i.etsystatic.com/26290866/r/il/77aa6b/4817228677/il_570xN.4817228677_oyq3.jpg', N'Classical piano repertoire and techniques.', 1300, CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-12-01T00:00:00.000' AS DateTime), 5, 1, 1, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Courses] ([courseId], [name], [image], [description], [tuition_fee], [start_date], [end_date], [categoryId], [createdBy], [status], [quantity], [lastUpdate]) VALUES (6, N'Pop Piano', N'https://i.etsystatic.com/26290866/r/il/77aa6b/4817228677/il_570xN.4817228677_oyq3.jpg', N'Playing popular music on the piano.', 1400, CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-12-01T00:00:00.000' AS DateTime), 6, 1, 1, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Courses] ([courseId], [name], [image], [description], [tuition_fee], [start_date], [end_date], [categoryId], [createdBy], [status], [quantity], [lastUpdate]) VALUES (7, N'Blues Piano', N'https://i.etsystatic.com/26290866/r/il/77aa6b/4817228677/il_570xN.4817228677_oyq3.jpg', N'Blues piano techniques and improvisation.', 1600, CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-12-01T00:00:00.000' AS DateTime), 7, 1, 1, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Courses] ([courseId], [name], [image], [description], [tuition_fee], [start_date], [end_date], [categoryId], [createdBy], [status], [quantity], [lastUpdate]) VALUES (8, N'Piano for Kids', N'https://i.etsystatic.com/26290866/r/il/77aa6b/4817228677/il_570xN.4817228677_oyq3.jpg', N'Piano lessons designed for children.', 1700, CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-12-01T00:00:00.000' AS DateTime), 8, 1, 1, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Courses] ([courseId], [name], [image], [description], [tuition_fee], [start_date], [end_date], [categoryId], [createdBy], [status], [quantity], [lastUpdate]) VALUES (9, N'Piano Composition', N'https://i.etsystatic.com/26290866/r/il/77aa6b/4817228677/il_570xN.4817228677_oyq3.jpg', N'Composing music on the piano.', 1800, CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-12-01T00:00:00.000' AS DateTime), 9, 1, 1, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Courses] ([courseId], [name], [image], [description], [tuition_fee], [start_date], [end_date], [categoryId], [createdBy], [status], [quantity], [lastUpdate]) VALUES (10, N'Piano Accompaniment', N'https://i.etsystatic.com/26290866/r/il/77aa6b/4817228677/il_570xN.4817228677_oyq3.jpg', N'Techniques for accompanying singers and other instruments.', 1900, CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-12-01T00:00:00.000' AS DateTime), 10, 1, 1, 1, CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Courses] ([courseId], [name], [image], [description], [tuition_fee], [start_date], [end_date], [categoryId], [createdBy], [status], [quantity], [lastUpdate]) VALUES (11, N'pianoSuperBasic', N'img/addBlog.png', N'123', 450000, CAST(N'2024-07-07T00:00:00.000' AS DateTime), CAST(N'2024-07-19T00:00:00.000' AS DateTime), 4, 2, 1, 1, CAST(N'2024-07-03T14:31:43.867' AS DateTime))
INSERT [dbo].[Courses] ([courseId], [name], [image], [description], [tuition_fee], [start_date], [end_date], [categoryId], [createdBy], [status], [quantity], [lastUpdate]) VALUES (12, N'pianoSuperBasic', N'img/432360966_122192626028091095_5863289487999889641_n.jpg', N'123', 123, CAST(N'2024-07-03T00:00:00.000' AS DateTime), CAST(N'2024-07-11T00:00:00.000' AS DateTime), 1, 2, 1, 123, CAST(N'2024-07-03T14:32:23.477' AS DateTime))
INSERT [dbo].[Courses] ([courseId], [name], [image], [description], [tuition_fee], [start_date], [end_date], [categoryId], [createdBy], [status], [quantity], [lastUpdate]) VALUES (13, N'pianoSuperBasic', N'img/432360966_122192626028091095_5863289487999889641_n.jpg', N'123', 123, CAST(N'2024-07-03T00:00:00.000' AS DateTime), CAST(N'2024-07-12T00:00:00.000' AS DateTime), 1, 2, 1, 1, CAST(N'2024-07-03T00:02:30.830' AS DateTime))
INSERT [dbo].[Courses] ([courseId], [name], [image], [description], [tuition_fee], [start_date], [end_date], [categoryId], [createdBy], [status], [quantity], [lastUpdate]) VALUES (14, N'pianoSuperBasic', N'img/432360966_122192626028091095_5863289487999889641_n.jpg', N'hehe', 123, CAST(N'2024-07-03T00:00:00.000' AS DateTime), CAST(N'2024-07-13T00:00:00.000' AS DateTime), 1, 2, 1, 1, CAST(N'2024-07-03T00:04:31.833' AS DateTime))
INSERT [dbo].[Courses] ([courseId], [name], [image], [description], [tuition_fee], [start_date], [end_date], [categoryId], [createdBy], [status], [quantity], [lastUpdate]) VALUES (15, N'pianoSuperBasic', N'img/Screenshot 2024-06-17 223421.png', N'kaka', 123, CAST(N'2024-07-03T00:00:00.000' AS DateTime), CAST(N'2024-07-12T00:00:00.000' AS DateTime), 1, 2, 1, 1, CAST(N'2024-07-03T14:32:52.387' AS DateTime))
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([order_details_id], [course_id], [course_price], [amount], [order_id]) VALUES (1, 1, 120000, 3, 1)
INSERT [dbo].[OrderDetails] ([order_details_id], [course_id], [course_price], [amount], [order_id]) VALUES (2, 2, 500000, 1, 1)
INSERT [dbo].[OrderDetails] ([order_details_id], [course_id], [course_price], [amount], [order_id]) VALUES (3, 1, 120000, 1, 2)
INSERT [dbo].[OrderDetails] ([order_details_id], [course_id], [course_price], [amount], [order_id]) VALUES (4, 2, 500000, 1, 2)
INSERT [dbo].[OrderDetails] ([order_details_id], [course_id], [course_price], [amount], [order_id]) VALUES (5, 1, 120000, 1, 3)
INSERT [dbo].[OrderDetails] ([order_details_id], [course_id], [course_price], [amount], [order_id]) VALUES (6, 1, 120000, 1, 4)
INSERT [dbo].[OrderDetails] ([order_details_id], [course_id], [course_price], [amount], [order_id]) VALUES (7, 2, 500000, 1, 4)
INSERT [dbo].[OrderDetails] ([order_details_id], [course_id], [course_price], [amount], [order_id]) VALUES (8, 3, 250000, 1, 4)
INSERT [dbo].[OrderDetails] ([order_details_id], [course_id], [course_price], [amount], [order_id]) VALUES (9, 1, 120000, 1, 5)
INSERT [dbo].[OrderDetails] ([order_details_id], [course_id], [course_price], [amount], [order_id]) VALUES (10, 1, 120000, 1, 6)
INSERT [dbo].[OrderDetails] ([order_details_id], [course_id], [course_price], [amount], [order_id]) VALUES (11, 2, 500000, 1, 6)
INSERT [dbo].[OrderDetails] ([order_details_id], [course_id], [course_price], [amount], [order_id]) VALUES (12, 3, 250000, 1, 6)
INSERT [dbo].[OrderDetails] ([order_details_id], [course_id], [course_price], [amount], [order_id]) VALUES (13, 5, 1300, 1, 6)
INSERT [dbo].[OrderDetails] ([order_details_id], [course_id], [course_price], [amount], [order_id]) VALUES (14, 1, 120000, 1, 7)
INSERT [dbo].[OrderDetails] ([order_details_id], [course_id], [course_price], [amount], [order_id]) VALUES (15, 2, 500000, 1, 7)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [order_date], [full_name], [phone_number], [address], [user_id], [total_cost], [status]) VALUES (1, CAST(N'2024-06-29T18:32:11.943' AS DateTime), N'nguyenmanhtung', N'0123456789', N'hanoi', 0, 860000, 1)
INSERT [dbo].[Orders] ([order_id], [order_date], [full_name], [phone_number], [address], [user_id], [total_cost], [status]) VALUES (2, CAST(N'2024-06-30T22:08:41.530' AS DateTime), N'nguyenmanhtung', N'0123456789', N'hungyen', 1, 620000, 1)
INSERT [dbo].[Orders] ([order_id], [order_date], [full_name], [phone_number], [address], [user_id], [total_cost], [status]) VALUES (3, CAST(N'2024-06-30T22:13:46.663' AS DateTime), N'nguyenmanhtung', N'0123456789', N'hungyen', 1, 120000, 1)
INSERT [dbo].[Orders] ([order_id], [order_date], [full_name], [phone_number], [address], [user_id], [total_cost], [status]) VALUES (4, CAST(N'2024-06-30T22:15:35.067' AS DateTime), N'usernone', N'0123456789', N'hungyen', 0, 870000, 1)
INSERT [dbo].[Orders] ([order_id], [order_date], [full_name], [phone_number], [address], [user_id], [total_cost], [status]) VALUES (5, CAST(N'2024-07-01T21:33:55.477' AS DateTime), N'nguyentung', N'0123456789', N'hanoi', 0, 120000, 1)
INSERT [dbo].[Orders] ([order_id], [order_date], [full_name], [phone_number], [address], [user_id], [total_cost], [status]) VALUES (6, CAST(N'2024-07-03T13:24:14.867' AS DateTime), N'nguyenmanhtung', N'0123456789', N'hungyen', 1, 871300, 1)
INSERT [dbo].[Orders] ([order_id], [order_date], [full_name], [phone_number], [address], [user_id], [total_cost], [status]) VALUES (7, CAST(N'2024-07-03T14:52:06.047' AS DateTime), N'nguyenmanhtung', N'0123456789', N'hungyen', 1, 620000, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [role], [full_name], [address], [phone_number]) VALUES (1, N'P001', N'123', 0, N'nguyenmanhtung', N'hungyen', N'0123456789')
INSERT [dbo].[Users] ([id], [username], [password], [role], [full_name], [address], [phone_number]) VALUES (2, N'P002', N'123', 1, N'admin', N'hungyen', N'0123456789')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_order_date]  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Category]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Users] FOREIGN KEY([createdBy])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Users]
GO
