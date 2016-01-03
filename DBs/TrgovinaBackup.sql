USE [Trgovina]
GO
/****** Object:  Table [dbo].[Kupac]    Script Date: 01.12.2015. 9:59:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kupac](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](50) NOT NULL,
	[Prezime] [varchar](50) NOT NULL,
	[DatumRodjenja] [datetime] NULL,
	[Sifra] [int] NOT NULL,
 CONSTRAINT [PK_Kupac] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proizvod]    Script Date: 01.12.2015. 9:59:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proizvod](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](50) NOT NULL,
	[Sifra] [int] NOT NULL,
	[Cijena] [money] NOT NULL,
 CONSTRAINT [PK_Proizvod] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Racun]    Script Date: 01.12.2015. 9:59:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Racun](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Broj] [int] NOT NULL,
	[DatumIzdavanja] [datetime] NOT NULL,
	[Placen] [bit] NOT NULL,
	[KupacID] [int] NOT NULL,
 CONSTRAINT [PK_Racun] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stavka]    Script Date: 01.12.2015. 9:59:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stavka](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProizvodID] [int] NOT NULL,
	[Kolicina] [int] NOT NULL,
	[RacunID] [int] NOT NULL,
 CONSTRAINT [PK_Stavka] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Kupac] ON 

GO
INSERT [dbo].[Kupac] ([ID], [Ime], [Prezime], [DatumRodjenja], [Sifra]) VALUES (1, N'Dario', N'Korinčić', CAST(0x00006B0100000000 AS DateTime), 12000)
GO
INSERT [dbo].[Kupac] ([ID], [Ime], [Prezime], [DatumRodjenja], [Sifra]) VALUES (6, N'Vedran', N'Zdešić', CAST(0x0000901A00000000 AS DateTime), 11111)
GO
SET IDENTITY_INSERT [dbo].[Kupac] OFF
GO
SET IDENTITY_INSERT [dbo].[Proizvod] ON 

GO
INSERT [dbo].[Proizvod] ([ID], [Naziv], [Sifra], [Cijena]) VALUES (2, N'Cipele L', 12, 1.0000)
GO
INSERT [dbo].[Proizvod] ([ID], [Naziv], [Sifra], [Cijena]) VALUES (3, N'Cipele Plave XL', 13, 1020.0000)
GO
INSERT [dbo].[Proizvod] ([ID], [Naziv], [Sifra], [Cijena]) VALUES (4, N'Jakna M', 14, 1000.0000)
GO
INSERT [dbo].[Proizvod] ([ID], [Naziv], [Sifra], [Cijena]) VALUES (5, N'Šal', 15, 1450.0000)
GO
INSERT [dbo].[Proizvod] ([ID], [Naziv], [Sifra], [Cijena]) VALUES (6, N'Ormar', 16, 2000.0000)
GO
SET IDENTITY_INSERT [dbo].[Proizvod] OFF
GO
SET IDENTITY_INSERT [dbo].[Racun] ON 

GO
INSERT [dbo].[Racun] ([ID], [Broj], [DatumIzdavanja], [Placen], [KupacID]) VALUES (5, 4, CAST(0x0000A32100000000 AS DateTime), 1, 1)
GO
INSERT [dbo].[Racun] ([ID], [Broj], [DatumIzdavanja], [Placen], [KupacID]) VALUES (13, 6, CAST(0x000098A900000000 AS DateTime), 0, 1)
GO
INSERT [dbo].[Racun] ([ID], [Broj], [DatumIzdavanja], [Placen], [KupacID]) VALUES (14, 7, CAST(0x0000973C00000000 AS DateTime), 1, 1)
GO
INSERT [dbo].[Racun] ([ID], [Broj], [DatumIzdavanja], [Placen], [KupacID]) VALUES (1008, 10, CAST(0x0000A41300000000 AS DateTime), 0, 6)
GO
SET IDENTITY_INSERT [dbo].[Racun] OFF
GO
SET IDENTITY_INSERT [dbo].[Stavka] ON 

GO
INSERT [dbo].[Stavka] ([ID], [ProizvodID], [Kolicina], [RacunID]) VALUES (7, 3, 2, 5)
GO
INSERT [dbo].[Stavka] ([ID], [ProizvodID], [Kolicina], [RacunID]) VALUES (8, 5, 3, 5)
GO
INSERT [dbo].[Stavka] ([ID], [ProizvodID], [Kolicina], [RacunID]) VALUES (9, 2, 4, 5)
GO
INSERT [dbo].[Stavka] ([ID], [ProizvodID], [Kolicina], [RacunID]) VALUES (15, 2, 5, 13)
GO
INSERT [dbo].[Stavka] ([ID], [ProizvodID], [Kolicina], [RacunID]) VALUES (1013, 2, 33, 1008)
GO
SET IDENTITY_INSERT [dbo].[Stavka] OFF
GO
ALTER TABLE [dbo].[Racun]  WITH CHECK ADD  CONSTRAINT [FK_Racun_Kupac] FOREIGN KEY([KupacID])
REFERENCES [dbo].[Kupac] ([ID])
GO
ALTER TABLE [dbo].[Racun] CHECK CONSTRAINT [FK_Racun_Kupac]
GO
ALTER TABLE [dbo].[Stavka]  WITH CHECK ADD  CONSTRAINT [FK_Stavka_Proizvod] FOREIGN KEY([ProizvodID])
REFERENCES [dbo].[Proizvod] ([ID])
GO
ALTER TABLE [dbo].[Stavka] CHECK CONSTRAINT [FK_Stavka_Proizvod]
GO
ALTER TABLE [dbo].[Stavka]  WITH CHECK ADD  CONSTRAINT [FK_Stavka_Racun] FOREIGN KEY([RacunID])
REFERENCES [dbo].[Racun] ([ID])
GO
ALTER TABLE [dbo].[Stavka] CHECK CONSTRAINT [FK_Stavka_Racun]
GO
ALTER TABLE [dbo].[Proizvod]  WITH CHECK ADD  CONSTRAINT [CK_Proizvod] CHECK  (([Cijena]>(0)))
GO
ALTER TABLE [dbo].[Proizvod] CHECK CONSTRAINT [CK_Proizvod]
GO
ALTER TABLE [dbo].[Racun]  WITH CHECK ADD  CONSTRAINT [CK_Racun] CHECK  (([DatumIzdavanja]>'1.1.2000'))
GO
ALTER TABLE [dbo].[Racun] CHECK CONSTRAINT [CK_Racun]
GO
