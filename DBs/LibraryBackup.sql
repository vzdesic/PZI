USE [Knjiznica_vzdesic]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 11.10.2015. 13:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Book](
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
/****** Object:  Table [dbo].[Borrowing]    Script Date: 11.10.2015. 13:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrowing](
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
/****** Object:  Table [dbo].[Employee]    Script Date: 11.10.2015. 13:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
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
/****** Object:  Table [dbo].[Genre]    Script Date: 11.10.2015. 13:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Genre](
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
/****** Object:  Table [dbo].[Member]    Script Date: 11.10.2015. 13:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
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
/****** Object:  Table [dbo].[Writer]    Script Date: 11.10.2015. 13:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Writer](
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
SET IDENTITY_INSERT [dbo].[Book] ON 

GO
INSERT [dbo].[Book] ([ID], [Naslov], [PisacID], [Kolicina], [ZanrID], [SlikaURL], [Opis], [Cijena]) VALUES (4, N'Informatika za najmlađe', 2, 15, 4, N'~/Content/Images/HarryPotter.jpg', N'Jednostavan opis osnovnih informatičkih pravila', 100.0000)
GO
INSERT [dbo].[Book] ([ID], [Naslov], [PisacID], [Kolicina], [ZanrID], [SlikaURL], [Opis], [Cijena]) VALUES (5, N'MS Office 2013', 1, 11, 7, N'~/Content/Images/BoskoBuha.jpg', N'Sve o MS Office paketu', 200.0000)
GO
INSERT [dbo].[Book] ([ID], [Naslov], [PisacID], [Kolicina], [ZanrID], [SlikaURL], [Opis], [Cijena]) VALUES (6, N'Word za neznalice', 1, 22, 4, N'~/Content/Images/BoskoBuha.jpg', N'Word za neznalice', NULL)
GO
INSERT [dbo].[Book] ([ID], [Naslov], [PisacID], [Kolicina], [ZanrID], [SlikaURL], [Opis], [Cijena]) VALUES (7, N'Automatizirano testiranje softvera', 4, 15, 7, N'~/Content/Images/BoskoBuha.jpg', N'Automatizirano testiranje softvera', NULL)
GO
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Borrowing] ON 

GO
INSERT [dbo].[Borrowing] ([ID], [ClanID], [KnjigaID], [Datum], [DjelatnikID], [Vraceno]) VALUES (6, 1, 4, CAST(0x0000A33D00000000 AS DateTime), 1, NULL)
GO
INSERT [dbo].[Borrowing] ([ID], [ClanID], [KnjigaID], [Datum], [DjelatnikID], [Vraceno]) VALUES (8, 1, 5, CAST(0x0000A34800000000 AS DateTime), 2, NULL)
GO
INSERT [dbo].[Borrowing] ([ID], [ClanID], [KnjigaID], [Datum], [DjelatnikID], [Vraceno]) VALUES (12, 3, 6, CAST(0x0000A34700000000 AS DateTime), 1, NULL)
GO
INSERT [dbo].[Borrowing] ([ID], [ClanID], [KnjigaID], [Datum], [DjelatnikID], [Vraceno]) VALUES (13, 3, 7, CAST(0x0000A34500000000 AS DateTime), 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Borrowing] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

GO
INSERT [dbo].[Employee] ([ID], [Ime], [Prezime], [DatumRodenja], [OIB], [DatumZaposlenja]) VALUES (1, N'Vedran', N'Zdešić', CAST(0x0000679D00000000 AS DateTime), N'12345678987', CAST(0x0000A2A600000000 AS DateTime))
GO
INSERT [dbo].[Employee] ([ID], [Ime], [Prezime], [DatumRodenja], [OIB], [DatumZaposlenja]) VALUES (2, N'Tvrtko', N'Begović', CAST(0x000063DF00000000 AS DateTime), N'22233456435', CAST(0x0000A2C500000000 AS DateTime))
GO
INSERT [dbo].[Employee] ([ID], [Ime], [Prezime], [DatumRodenja], [OIB], [DatumZaposlenja]) VALUES (3, N'Ozren', N'Kubelka', CAST(0x0000689F00000000 AS DateTime), N'32132132132', CAST(0x0000A2E100000000 AS DateTime))
GO
INSERT [dbo].[Employee] ([ID], [Ime], [Prezime], [DatumRodenja], [OIB], [DatumZaposlenja]) VALUES (4, N'Boris', N'Šorša', CAST(0x00005EFE00000000 AS DateTime), N'12345323454', NULL)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 

GO
INSERT [dbo].[Genre] ([ID], [Naziv]) VALUES (1, N'Roman')
GO
INSERT [dbo].[Genre] ([ID], [Naziv]) VALUES (2, N'Povijest')
GO
INSERT [dbo].[Genre] ([ID], [Naziv]) VALUES (3, N'Beletristika')
GO
INSERT [dbo].[Genre] ([ID], [Naziv]) VALUES (4, N'Priručnik')
GO
INSERT [dbo].[Genre] ([ID], [Naziv]) VALUES (5, N'Duhovnost')
GO
INSERT [dbo].[Genre] ([ID], [Naziv]) VALUES (6, N'Tehnika')
GO
INSERT [dbo].[Genre] ([ID], [Naziv]) VALUES (7, N'Informatika')
GO
INSERT [dbo].[Genre] ([ID], [Naziv]) VALUES (8, N'Znanost')
GO
INSERT [dbo].[Genre] ([ID], [Naziv]) VALUES (9, N'Umjetnost')
GO
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

GO
INSERT [dbo].[Member] ([ID], [Ime], [Prezime], [DatumRodenja], [OIB], [ClanarinaVrijediDo]) VALUES (1, N'Ivana', N'Anđel', CAST(0x00008EAC00000000 AS DateTime), N'11122233345', CAST(0x0000A41300000000 AS DateTime))
GO
INSERT [dbo].[Member] ([ID], [Ime], [Prezime], [DatumRodenja], [OIB], [ClanarinaVrijediDo]) VALUES (3, N'Ruža', N'Miljavac', CAST(0x00008D3F00000000 AS DateTime), N'22233344455', CAST(0x0000A58000000000 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Member] OFF
GO
SET IDENTITY_INSERT [dbo].[Writer] ON 

GO
INSERT [dbo].[Writer] ([ID], [Ime], [Prezime], [Država]) VALUES (1, N'Miroslav', N'Kiš', N'Hrvatska')
GO
INSERT [dbo].[Writer] ([ID], [Ime], [Prezime], [Država]) VALUES (2, N' Arijana', N'Blazić', N'Hrvatska')
GO
INSERT [dbo].[Writer] ([ID], [Ime], [Prezime], [Država]) VALUES (3, N'Brian', N'Read', N'Engleska')
GO
INSERT [dbo].[Writer] ([ID], [Ime], [Prezime], [Država]) VALUES (4, N'Wouter', N'Vrijen', N'Nizozemska')
GO
SET IDENTITY_INSERT [dbo].[Writer] OFF
GO
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [DF_Clanovi_Aktivan]  DEFAULT ((1)) FOR [ClanarinaVrijediDo]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Knjige_Pisci] FOREIGN KEY([PisacID])
REFERENCES [dbo].[Writer] ([ID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Knjige_Pisci]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Knjige_Zanr] FOREIGN KEY([ZanrID])
REFERENCES [dbo].[Genre] ([ID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Knjige_Zanr]
GO
ALTER TABLE [dbo].[Borrowing]  WITH CHECK ADD  CONSTRAINT [FK_Posudbe_Clanovi] FOREIGN KEY([ClanID])
REFERENCES [dbo].[Member] ([ID])
GO
ALTER TABLE [dbo].[Borrowing] CHECK CONSTRAINT [FK_Posudbe_Clanovi]
GO
ALTER TABLE [dbo].[Borrowing]  WITH CHECK ADD  CONSTRAINT [FK_Posudbe_Djelatnici] FOREIGN KEY([DjelatnikID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Borrowing] CHECK CONSTRAINT [FK_Posudbe_Djelatnici]
GO
ALTER TABLE [dbo].[Borrowing]  WITH CHECK ADD  CONSTRAINT [FK_Posudbe_Knjige] FOREIGN KEY([KnjigaID])
REFERENCES [dbo].[Book] ([ID])
GO
ALTER TABLE [dbo].[Borrowing] CHECK CONSTRAINT [FK_Posudbe_Knjige]
GO
