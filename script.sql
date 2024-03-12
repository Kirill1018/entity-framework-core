USE [C:\USERS\FEDOR\DATA.MDF]
GO
/****** Object:  Table [dbo].[artists]    Script Date: 12.03.2024 14:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[artists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[author] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[song_artists]    Script Date: 12.03.2024 14:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[song_artists](
	[Id] [int] NOT NULL,
	[song_id] [int] NOT NULL,
	[artist_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[songs]    Script Date: 12.03.2024 14:45:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[songs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[rating] [int] NULL,
	[size] [int] NOT NULL,
	[time] [int] NOT NULL,
	[date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[artists] ON 
GO
INSERT [dbo].[artists] ([Id], [author]) VALUES (1, N'beyonce')
GO
INSERT [dbo].[artists] ([Id], [author]) VALUES (2, N'rasmus')
GO
INSERT [dbo].[artists] ([Id], [author]) VALUES (3, N'анита цой')
GO
SET IDENTITY_INSERT [dbo].[artists] OFF
GO
SET IDENTITY_INSERT [dbo].[songs] ON 
GO
INSERT [dbo].[songs] ([Id], [title], [rating], [size], [time], [date]) VALUES (1, N'single ladies', 3, 7380, 193, CAST(N'2024-03-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[songs] ([Id], [title], [rating], [size], [time], [date]) VALUES (2, N'nothing', 4, 7000, 200, CAST(N'2024-03-02T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[songs] ([Id], [title], [rating], [size], [time], [date]) VALUES (3, N'небо', 5, 9000, 235, CAST(N'2024-03-03T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[songs] OFF
GO
ALTER TABLE [dbo].[song_artists]  WITH CHECK ADD  CONSTRAINT [fk_artist_id] FOREIGN KEY([artist_id])
REFERENCES [dbo].[artists] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[song_artists] CHECK CONSTRAINT [fk_artist_id]
GO
ALTER TABLE [dbo].[song_artists]  WITH CHECK ADD  CONSTRAINT [fk_song_id] FOREIGN KEY([song_id])
REFERENCES [dbo].[songs] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[song_artists] CHECK CONSTRAINT [fk_song_id]
GO
