USE [QuanLyBanHang]
GO
/****** Object:  Table [dbo].[order_items]    Script Date: 11/26/2018 12:00:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[order_items](
	[order_id] [int] NOT NULL,
	[product_id] [varchar](15) NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11/26/2018 12:00:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer] [nvarchar](30) NOT NULL,
	[customer_phone] [nchar](15) NULL,
	[deposits] [int] NULL,
	[created_by] [int] NULL,
	[created_at] [datetime] NULL,
	[total] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product_cats]    Script Date: 11/26/2018 12:00:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_cats](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_product_cats] PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[products]    Script Date: 11/26/2018 12:00:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[products](
	[id] [varchar](15) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[cat_id] [int] NOT NULL,
	[count] [int] NOT NULL,
	[price] [int] NOT NULL,
	[unit] [nvarchar](10) NULL,
	[status] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[promo_price] [int] NOT NULL CONSTRAINT [DF_products_promo_price]  DEFAULT ((0)),
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/26/2018 12:00:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nchar](10) NULL,
	[fullname] [nvarchar](30) NULL,
	[password] [nvarchar](100) NULL,
	[phone] [nvarchar](12) NULL,
	[email] [nvarchar](50) NULL,
	[role] [int] NOT NULL CONSTRAINT [DF_users_role]  DEFAULT ((1)),
	[gender] [int] NULL,
	[date_of_birth] [date] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity]) VALUES (2045, N'3236323', 1)
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity]) VALUES (2047, N'8091817', 2)
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity]) VALUES (2047, N'3236323', 1)
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity]) VALUES (2046, N'8091817', 1)
INSERT [dbo].[order_items] ([order_id], [product_id], [quantity]) VALUES (2046, N'3236323', 1)
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [customer], [customer_phone], [deposits], [created_by], [created_at], [total]) VALUES (2045, N'Triệu Tài Niêm', N'0395710844     ', 10000, 1, CAST(N'2017-11-23 02:29:04.000' AS DateTime), 2500)
INSERT [dbo].[orders] ([id], [customer], [customer_phone], [deposits], [created_by], [created_at], [total]) VALUES (2046, N'Triệu Thiên Sơn', N'123456789      ', 10000, 1, CAST(N'2018-11-24 02:32:17.000' AS DateTime), 5500)
INSERT [dbo].[orders] ([id], [customer], [customer_phone], [deposits], [created_by], [created_at], [total]) VALUES (2047, N'Niêm Triệu', N'23456789       ', 10000, 1, CAST(N'2018-11-24 15:27:11.000' AS DateTime), 8500)
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[product_cats] ON 

INSERT [dbo].[product_cats] ([cat_id], [name]) VALUES (1, N'Hoa Quả')
INSERT [dbo].[product_cats] ([cat_id], [name]) VALUES (2, N'Mì')
INSERT [dbo].[product_cats] ([cat_id], [name]) VALUES (4, N'Bít bi')
SET IDENTITY_INSERT [dbo].[product_cats] OFF
INSERT [dbo].[products] ([id], [name], [cat_id], [count], [price], [unit], [status], [created_at], [promo_price], [updated_at]) VALUES (N'3236323', N'Trứng gà', 2, 10, 2500, N'quả', 1, CAST(N'1900-01-01 00:00:46.703' AS DateTime), 2000, CAST(N'2018-11-25 23:21:42.000' AS DateTime))
INSERT [dbo].[products] ([id], [name], [cat_id], [count], [price], [unit], [status], [created_at], [promo_price], [updated_at]) VALUES (N'8091817', N'Mì tôm hảo hảo', 1, 4, 3000, N'gói', 1, CAST(N'1900-01-01 00:00:46.707' AS DateTime), 0, CAST(N'2018-11-25 23:21:48.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [fullname], [password], [phone], [email], [role], [gender], [date_of_birth], [created_at]) VALUES (1, N'thienson98', N'Triệu Tài Niêm', N'827ccb0eea8a706c4c34a16891f84e7b', N'01695710844', N'thienson.a1@gmail.com', 1, 0, CAST(N'1998-02-08' AS Date), CAST(N'2018-11-25 22:57:53.000' AS DateTime))
INSERT [dbo].[users] ([id], [username], [fullname], [password], [phone], [email], [role], [gender], [date_of_birth], [created_at]) VALUES (6, N'hohuy     ', N'Hồ Sỹ Huy', N'81dc9bdb52d04dc20036dbd8313ed055', N'12345678', N'asdadsasA@gmail.com', 1, 0, CAST(N'2018-11-25' AS Date), CAST(N'2018-11-25 23:10:45.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[users] OFF
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD  CONSTRAINT [FK_order_items_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_items] CHECK CONSTRAINT [FK_order_items_orders]
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD  CONSTRAINT [FK_order_items_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[order_items] CHECK CONSTRAINT [FK_order_items_products]
GO
ALTER TABLE [dbo].[orders]  WITH NOCHECK ADD  CONSTRAINT [FK_orders_users1] FOREIGN KEY([created_by])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] NOCHECK CONSTRAINT [FK_orders_users1]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_product_cats] FOREIGN KEY([cat_id])
REFERENCES [dbo].[product_cats] ([cat_id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_product_cats]
GO
