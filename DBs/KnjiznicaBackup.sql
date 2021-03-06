USE [Knjiznica_vzdesic]
GO
/****** Object:  Table [dbo].[Clanovi]    Script Date: 30.12.2014. 17:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clanovi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](50) NULL,
	[Prezime] [varchar](50) NOT NULL,
	[DatumRodenja] [datetime] NULL,
	[OIB] [varchar](11) NOT NULL,
	[ClanarinaVrijediDo] [datetime] NOT NULL,
 CONSTRAINT [PK_Clanovi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Djelatnici]    Script Date: 30.12.2014. 17:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Djelatnici](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](50) NULL,
	[Prezime] [varchar](50) NOT NULL,
	[DatumRodenja] [datetime] NULL,
	[OIB] [varchar](11) NOT NULL,
	[DatumZaposlenja] [datetime] NULL,
 CONSTRAINT [PK_Djelatnici] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Knjige]    Script Date: 30.12.2014. 17:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Knjige](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naslov] [varchar](max) NOT NULL,
	[PisacID] [int] NOT NULL,
	[Kolicina] [int] NOT NULL,
	[ZanrID] [int] NOT NULL,
	[SlikaURL] [varchar](50) NULL,
	[Opis] [varchar](max) NULL,
	[Cijena] [money] NULL,
 CONSTRAINT [PK_Knjige] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pisci]    Script Date: 30.12.2014. 17:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pisci](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](50) NOT NULL,
	[Prezime] [varchar](50) NOT NULL,
	[Država] [varchar](50) NULL,
 CONSTRAINT [PK_Pisci] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Posudbe]    Script Date: 30.12.2014. 17:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posudbe](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClanID] [int] NOT NULL,
	[KnjigaID] [int] NOT NULL,
	[Datum] [datetime] NOT NULL,
	[DjelatnikID] [int] NOT NULL,
	[Vraceno] [bit] NULL,
 CONSTRAINT [PK_Posudbe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Zanr]    Script Date: 30.12.2014. 17:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Zanr](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Zanr] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Clanovi] ON 

GO
INSERT [dbo].[Clanovi] ([ID], [Ime], [Prezime], [DatumRodenja], [OIB], [ClanarinaVrijediDo]) VALUES (1, N'Ivana', N'Anđel', CAST(0x00008EAC00000000 AS DateTime), N'11122233345', CAST(0x0000A41300000000 AS DateTime))
GO
INSERT [dbo].[Clanovi] ([ID], [Ime], [Prezime], [DatumRodenja], [OIB], [ClanarinaVrijediDo]) VALUES (3, N'Ruža', N'Miljavac', CAST(0x00008D3F00000000 AS DateTime), N'22233344455', CAST(0x0000A58000000000 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Clanovi] OFF
GO
SET IDENTITY_INSERT [dbo].[Djelatnici] ON 

GO
INSERT [dbo].[Djelatnici] ([ID], [Ime], [Prezime], [DatumRodenja], [OIB], [DatumZaposlenja]) VALUES (1, N'Vedran', N'Zdešić', CAST(0x0000679D00000000 AS DateTime), N'12345678987', CAST(0x0000A2A600000000 AS DateTime))
GO
INSERT [dbo].[Djelatnici] ([ID], [Ime], [Prezime], [DatumRodenja], [OIB], [DatumZaposlenja]) VALUES (2, N'Tvrtko', N'Begović', CAST(0x000063DF00000000 AS DateTime), N'22233456435', CAST(0x0000A2C500000000 AS DateTime))
GO
INSERT [dbo].[Djelatnici] ([ID], [Ime], [Prezime], [DatumRodenja], [OIB], [DatumZaposlenja]) VALUES (3, N'Ozren', N'Kubelka', CAST(0x0000689F00000000 AS DateTime), N'32132132132', CAST(0x0000A2E100000000 AS DateTime))
GO
INSERT [dbo].[Djelatnici] ([ID], [Ime], [Prezime], [DatumRodenja], [OIB], [DatumZaposlenja]) VALUES (4, N'Boris', N'Šorša', CAST(0x00005EFE00000000 AS DateTime), N'12345323454', NULL)
GO
SET IDENTITY_INSERT [dbo].[Djelatnici] OFF
GO
SET IDENTITY_INSERT [dbo].[Knjige] ON 

GO
INSERT [dbo].[Knjige] ([ID], [Naslov], [PisacID], [Kolicina], [ZanrID], [SlikaURL], [Opis], [Cijena]) VALUES (4, N'Informatika za najmlađe', 2, 15, 4, N'~/Content/Images/HarryPotter.jpg', N'Jednostavan opis osnovnih informatičkih pravila', 100.0000)
GO
INSERT [dbo].[Knjige] ([ID], [Naslov], [PisacID], [Kolicina], [ZanrID], [SlikaURL], [Opis], [Cijena]) VALUES (5, N'MS Office 2013', 1, 11, 7, N'~/Content/Images/BoskoBuha.jpg', N'Sve o MS Office paketu', 200.0000)
GO
INSERT [dbo].[Knjige] ([ID], [Naslov], [PisacID], [Kolicina], [ZanrID], [SlikaURL], [Opis], [Cijena]) VALUES (6, N'Word za neznalice', 1, 22, 4, N'~/Content/Images/BoskoBuha.jpg', N'Word za neznalice', NULL)
GO
INSERT [dbo].[Knjige] ([ID], [Naslov], [PisacID], [Kolicina], [ZanrID], [SlikaURL], [Opis], [Cijena]) VALUES (7, N'Automatizirano testiranje softvera', 4, 15, 7, N'~/Content/Images/BoskoBuha.jpg', N'Automatizirano testiranje softvera', NULL)
GO
SET IDENTITY_INSERT [dbo].[Knjige] OFF
GO
SET IDENTITY_INSERT [dbo].[Pisci] ON 

GO
INSERT [dbo].[Pisci] ([ID], [Ime], [Prezime], [Država]) VALUES (1, N'Miroslav', N'Kiš', N'Hrvatska')
GO
INSERT [dbo].[Pisci] ([ID], [Ime], [Prezime], [Država]) VALUES (2, N' Arijana', N'Blazić', N'Hrvatska')
GO
INSERT [dbo].[Pisci] ([ID], [Ime], [Prezime], [Država]) VALUES (3, N'Brian', N'Read', N'Engleska')
GO
INSERT [dbo].[Pisci] ([ID], [Ime], [Prezime], [Država]) VALUES (4, N'Wouter', N'Vrijen', N'Nizozemska')
GO
SET IDENTITY_INSERT [dbo].[Pisci] OFF
GO
SET IDENTITY_INSERT [dbo].[Posudbe] ON 

GO
INSERT [dbo].[Posudbe] ([ID], [ClanID], [KnjigaID], [Datum], [DjelatnikID], [Vraceno]) VALUES (6, 1, 4, CAST(0x0000A33D00000000 AS DateTime), 1, NULL)
GO
INSERT [dbo].[Posudbe] ([ID], [ClanID], [KnjigaID], [Datum], [DjelatnikID], [Vraceno]) VALUES (8, 1, 5, CAST(0x0000A34800000000 AS DateTime), 2, NULL)
GO
INSERT [dbo].[Posudbe] ([ID], [ClanID], [KnjigaID], [Datum], [DjelatnikID], [Vraceno]) VALUES (12, 3, 6, CAST(0x0000A34700000000 AS DateTime), 1, NULL)
GO
INSERT [dbo].[Posudbe] ([ID], [ClanID], [KnjigaID], [Datum], [DjelatnikID], [Vraceno]) VALUES (13, 3, 7, CAST(0x0000A34500000000 AS DateTime), 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Posudbe] OFF
GO
SET IDENTITY_INSERT [dbo].[Zanr] ON 

GO
INSERT [dbo].[Zanr] ([ID], [Naziv]) VALUES (1, N'Roman')
GO
INSERT [dbo].[Zanr] ([ID], [Naziv]) VALUES (2, N'Povijest')
GO
INSERT [dbo].[Zanr] ([ID], [Naziv]) VALUES (3, N'Beletristika')
GO
INSERT [dbo].[Zanr] ([ID], [Naziv]) VALUES (4, N'Priručnik')
GO
INSERT [dbo].[Zanr] ([ID], [Naziv]) VALUES (5, N'Duhovnost')
GO
INSERT [dbo].[Zanr] ([ID], [Naziv]) VALUES (6, N'Tehnika')
GO
INSERT [dbo].[Zanr] ([ID], [Naziv]) VALUES (7, N'Informatika')
GO
INSERT [dbo].[Zanr] ([ID], [Naziv]) VALUES (8, N'Znanost')
GO
INSERT [dbo].[Zanr] ([ID], [Naziv]) VALUES (9, N'Umjetnost')
GO
SET IDENTITY_INSERT [dbo].[Zanr] OFF
GO
ALTER TABLE [dbo].[Clanovi] ADD  CONSTRAINT [DF_Clanovi_Aktivan]  DEFAULT ((1)) FOR [ClanarinaVrijediDo]
GO
ALTER TABLE [dbo].[Knjige]  WITH CHECK ADD  CONSTRAINT [FK_Knjige_Pisci] FOREIGN KEY([PisacID])
REFERENCES [dbo].[Pisci] ([ID])
GO
ALTER TABLE [dbo].[Knjige] CHECK CONSTRAINT [FK_Knjige_Pisci]
GO
ALTER TABLE [dbo].[Knjige]  WITH CHECK ADD  CONSTRAINT [FK_Knjige_Zanr] FOREIGN KEY([ZanrID])
REFERENCES [dbo].[Zanr] ([ID])
GO
ALTER TABLE [dbo].[Knjige] CHECK CONSTRAINT [FK_Knjige_Zanr]
GO
ALTER TABLE [dbo].[Posudbe]  WITH CHECK ADD  CONSTRAINT [FK_Posudbe_Clanovi] FOREIGN KEY([ClanID])
REFERENCES [dbo].[Clanovi] ([ID])
GO
ALTER TABLE [dbo].[Posudbe] CHECK CONSTRAINT [FK_Posudbe_Clanovi]
GO
ALTER TABLE [dbo].[Posudbe]  WITH CHECK ADD  CONSTRAINT [FK_Posudbe_Djelatnici] FOREIGN KEY([DjelatnikID])
REFERENCES [dbo].[Djelatnici] ([ID])
GO
ALTER TABLE [dbo].[Posudbe] CHECK CONSTRAINT [FK_Posudbe_Djelatnici]
GO
ALTER TABLE [dbo].[Posudbe]  WITH CHECK ADD  CONSTRAINT [FK_Posudbe_Knjige] FOREIGN KEY([KnjigaID])
REFERENCES [dbo].[Knjige] ([ID])
GO
ALTER TABLE [dbo].[Posudbe] CHECK CONSTRAINT [FK_Posudbe_Knjige]
GO
