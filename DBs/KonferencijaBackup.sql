USE [Konferencija]
GO
/****** Object:  StoredProcedure [dbo].[Dvorana_Modificiranje]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Dvorana_Modificiranje]
	-- Add the parameters for the stored procedure here
	@Operacija char(1),
	@id int out,  
	@Naziv nvarchar(50),
	@BrojMjesta int
AS
BEGIN
	if @Operacija='I' 
		begin
			insert into Dvorana (Naziv, BrojMjesta) 
			values (@Naziv, @BrojMjesta)

			set @id=@@IDENTITY
		end
	else if @Operacija='U'
		begin
			update Dvorana 
			set naziv=@Naziv, BrojMjesta=@BrojMjesta
			where id=@id
		end
	else if @Operacija='D'
		begin
			delete from Dvorana where id=@id
		end

END


GO
/****** Object:  Table [dbo].[Dvorana]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dvorana](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](50) NOT NULL,
	[BrojMjesta] [int] NULL,
	[_Created] [datetime] NULL,
	[_Modified] [datetime] NULL,
 CONSTRAINT [PK_Dvorana] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Gradovi]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gradovi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](250) NOT NULL,
	[PostanskiBroj] [char](5) NOT NULL,
 CONSTRAINT [PK_Gradovi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hoteli]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hoteli](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](50) NOT NULL,
	[Adresa] [varchar](50) NOT NULL,
	[GradID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Organizator]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Organizator](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](50) NULL,
	[Prezime] [varchar](50) NOT NULL,
	[Sifra] [char](5) NULL,
 CONSTRAINT [PK_Organizator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Povijest]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Povijest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Komanda] [varchar](max) NOT NULL,
	[VrijemeIzvrsavanja] [datetime] NOT NULL,
 CONSTRAINT [PK_Povijest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Predavac]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Predavac](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](50) NULL,
	[Prezime] [varchar](50) NOT NULL,
	[Titula] [varchar](10) NULL,
	[Telefon] [varchar](20) NULL,
	[OIB] [char](11) NOT NULL,
	[Spol] [bit] NULL,
	[DatumRodenja] [datetime] NULL,
	[_Created] [datetime] NULL,
	[_Modified] [datetime] NULL,
 CONSTRAINT [PK_Predavac] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Predavac_Predavanje]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Predavac_Predavanje](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PredavacID] [int] NOT NULL,
	[PredavanjeID] [int] NOT NULL,
 CONSTRAINT [PK_Predavac_Predavanje] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Predavanje]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Predavanje](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SmjerID] [int] NULL,
	[Naziv] [varchar](50) NOT NULL,
	[Napomena] [varchar](max) NULL,
	[Trajanje] [tinyint] NULL,
	[Pocetak] [datetime] NULL,
	[DvoranaID] [int] NULL,
	[Ocjena] [tinyint] NULL,
 CONSTRAINT [PK_Predavanje] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Racun]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Racun](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Broj] [char](10) NOT NULL,
	[Iznos] [money] NULL,
	[OrganizatorID] [int] NULL,
 CONSTRAINT [PK_Racun] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Smjer]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Smjer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](50) NOT NULL,
	[Opis] [varchar](max) NULL,
 CONSTRAINT [PK_Smjer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sudionici]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sudionici](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [varchar](50) NULL,
	[Prezime] [varchar](50) NOT NULL,
	[OIB] [char](11) NULL,
	[Titula] [varchar](10) NULL,
	[RacunID] [int] NOT NULL,
 CONSTRAINT [PK_Sudionici] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sudionici_Predavanje]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sudionici_Predavanje](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SudionikID] [int] NOT NULL,
	[PredavanjeID] [int] NOT NULL,
 CONSTRAINT [PK_Sudionici_Predavanje] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[BrojPredavanjaPoSmjeru]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BrojPredavanjaPoSmjeru]
AS
SELECT        dbo.Smjer.Naziv, COUNT(*) AS Expr1
FROM            dbo.Predavanje INNER JOIN
                         dbo.Smjer ON dbo.Predavanje.SmjerID = dbo.Smjer.ID
GROUP BY dbo.Predavanje.SmjerID, dbo.Smjer.Naziv

GO
/****** Object:  View [dbo].[PregledPredavaca]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PregledPredavaca]
AS
SELECT        Ime + ' ' + Prezime AS 'Naziv osobe'
FROM            dbo.Predavac

GO
/****** Object:  View [dbo].[PregledPredavacaIPredavanja]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PregledPredavacaIPredavanja]
AS
SELECT        dbo.Predavac.ID, dbo.Predavac.Ime, dbo.Predavac.Prezime, dbo.Predavac.Titula, dbo.Predavac.Telefon, dbo.Predavac.OIB, dbo.Predavac.Spol, 
                         dbo.Predavac.DatumRodenja, dbo.Predavac._Created, dbo.Predavac._Modified, dbo.Predavac_Predavanje.ID AS Expr1, dbo.Predavac_Predavanje.PredavacID, 
                         dbo.Predavac_Predavanje.PredavanjeID, dbo.Predavanje.ID AS Expr2, dbo.Predavanje.SmjerID, dbo.Predavanje.Naziv, dbo.Predavanje.Napomena, 
                         dbo.Predavanje.Trajanje, dbo.Predavanje.Pocetak, dbo.Predavanje.DvoranaID, dbo.Predavanje.Ocjena
FROM            dbo.Predavac INNER JOIN
                         dbo.Predavac_Predavanje ON dbo.Predavac.ID = dbo.Predavac_Predavanje.PredavacID INNER JOIN
                         dbo.Predavanje ON dbo.Predavanje.ID = dbo.Predavac_Predavanje.PredavanjeID

GO
SET IDENTITY_INSERT [dbo].[Dvorana] ON 

GO
INSERT [dbo].[Dvorana] ([ID], [Naziv], [BrojMjesta], [_Created], [_Modified]) VALUES (3, N'Srebrna', 499, CAST(0x00008EAC00000000 AS DateTime), CAST(0x00008EAC00000000 AS DateTime))
GO
INSERT [dbo].[Dvorana] ([ID], [Naziv], [BrojMjesta], [_Created], [_Modified]) VALUES (5, N'Brončana', 100, CAST(0x00008EAC00000000 AS DateTime), CAST(0x00008EAC00000000 AS DateTime))
GO
INSERT [dbo].[Dvorana] ([ID], [Naziv], [BrojMjesta], [_Created], [_Modified]) VALUES (6, N'Dijamantna', 300, CAST(0x0000A479014CF841 AS DateTime), CAST(0x0000A479014CF841 AS DateTime))
GO
INSERT [dbo].[Dvorana] ([ID], [Naziv], [BrojMjesta], [_Created], [_Modified]) VALUES (13, N'Test', 100, CAST(0x0000A4B20145AFF6 AS DateTime), CAST(0x0000A4B20145AFF6 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Dvorana] OFF
GO
SET IDENTITY_INSERT [dbo].[Gradovi] ON 

GO
INSERT [dbo].[Gradovi] ([ID], [Naziv], [PostanskiBroj]) VALUES (3, N'Zagreb', N'10000')
GO
SET IDENTITY_INSERT [dbo].[Gradovi] OFF
GO
SET IDENTITY_INSERT [dbo].[Povijest] ON 

GO
INSERT [dbo].[Povijest] ([ID], [Komanda], [VrijemeIzvrsavanja]) VALUES (1, N'DROP TABLE [dbo].[Test]', CAST(0x0000A47A0148AC85 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Povijest] OFF
GO
SET IDENTITY_INSERT [dbo].[Predavac] ON 

GO
INSERT [dbo].[Predavac] ([ID], [Ime], [Prezime], [Titula], [Telefon], [OIB], [Spol], [DatumRodenja], [_Created], [_Modified]) VALUES (3, N'Vedran', N'Zdešić', N'ing', N'1111', N'12322222222', 1, CAST(0x00008EAC00000000 AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Predavac] ([ID], [Ime], [Prezime], [Titula], [Telefon], [OIB], [Spol], [DatumRodenja], [_Created], [_Modified]) VALUES (4, N'Jura', N'Jurić', N'sss', N'2222', N'33333333333', 1, CAST(0x00008F0700000000 AS DateTime), NULL, CAST(0x0000A4B2013848E5 AS DateTime))
GO
INSERT [dbo].[Predavac] ([ID], [Ime], [Prezime], [Titula], [Telefon], [OIB], [Spol], [DatumRodenja], [_Created], [_Modified]) VALUES (5, N'Ivan', N'Ivić', N'Dr.', N'222', N'11111111111', 0, CAST(0x00008EAC00000000 AS DateTime), CAST(0x0000A47A013A4B26 AS DateTime), CAST(0x0000A47A013DB07A AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Predavac] OFF
GO
SET IDENTITY_INSERT [dbo].[Predavac_Predavanje] ON 

GO
INSERT [dbo].[Predavac_Predavanje] ([ID], [PredavacID], [PredavanjeID]) VALUES (5, 3, 5)
GO
INSERT [dbo].[Predavac_Predavanje] ([ID], [PredavacID], [PredavanjeID]) VALUES (6, 3, 6)
GO
INSERT [dbo].[Predavac_Predavanje] ([ID], [PredavacID], [PredavanjeID]) VALUES (7, 3, 7)
GO
INSERT [dbo].[Predavac_Predavanje] ([ID], [PredavacID], [PredavanjeID]) VALUES (8, 5, 8)
GO
SET IDENTITY_INSERT [dbo].[Predavac_Predavanje] OFF
GO
SET IDENTITY_INSERT [dbo].[Predavanje] ON 

GO
INSERT [dbo].[Predavanje] ([ID], [SmjerID], [Naziv], [Napomena], [Trajanje], [Pocetak], [DvoranaID], [Ocjena]) VALUES (5, 1, N'Razvoj desktop aplikacija', N'Razvoj desktop aplikacija', 60, NULL, 3, NULL)
GO
INSERT [dbo].[Predavanje] ([ID], [SmjerID], [Naziv], [Napomena], [Trajanje], [Pocetak], [DvoranaID], [Ocjena]) VALUES (6, 3, N'Razvoj mobilnih aplikacija', N'Razvoj mobilnih aplikacija', 45, NULL, 5, NULL)
GO
INSERT [dbo].[Predavanje] ([ID], [SmjerID], [Naziv], [Napomena], [Trajanje], [Pocetak], [DvoranaID], [Ocjena]) VALUES (7, 1, N'Razvoj web aplikacija', N'Razvoj web aplikacija', 60, NULL, 5, NULL)
GO
INSERT [dbo].[Predavanje] ([ID], [SmjerID], [Naziv], [Napomena], [Trajanje], [Pocetak], [DvoranaID], [Ocjena]) VALUES (8, NULL, N'MVC radna okolina', N'MVC', 40, NULL, 6, NULL)
GO
SET IDENTITY_INSERT [dbo].[Predavanje] OFF
GO
SET IDENTITY_INSERT [dbo].[Racun] ON 

GO
INSERT [dbo].[Racun] ([ID], [Broj], [Iznos], [OrganizatorID]) VALUES (1, N'01/2015   ', 1000000.0000, NULL)
GO
INSERT [dbo].[Racun] ([ID], [Broj], [Iznos], [OrganizatorID]) VALUES (2, N'02/2015   ', 12345.0000, NULL)
GO
SET IDENTITY_INSERT [dbo].[Racun] OFF
GO
SET IDENTITY_INSERT [dbo].[Smjer] ON 

GO
INSERT [dbo].[Smjer] ([ID], [Naziv], [Opis]) VALUES (1, N'Development', N'Prakse iz programiranja')
GO
INSERT [dbo].[Smjer] ([ID], [Naziv], [Opis]) VALUES (3, N'Mobile', N'Razvoj za mobilne uređaje')
GO
INSERT [dbo].[Smjer] ([ID], [Naziv], [Opis]) VALUES (11, N'IT', N'Mreže')
GO
SET IDENTITY_INSERT [dbo].[Smjer] OFF
GO
SET IDENTITY_INSERT [dbo].[Sudionici] ON 

GO
INSERT [dbo].[Sudionici] ([ID], [Ime], [Prezime], [OIB], [Titula], [RacunID]) VALUES (5, N'Ante', N'Karan', N'22233344455', N'Dr.', 1)
GO
INSERT [dbo].[Sudionici] ([ID], [Ime], [Prezime], [OIB], [Titula], [RacunID]) VALUES (7, N'Vedran', N'Jurić', N'22222343234', N'Dr.', 2)
GO
SET IDENTITY_INSERT [dbo].[Sudionici] OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Dvorana_Naziv]    Script Date: 01.12.2015. 10:20:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Dvorana_Naziv] ON [dbo].[Dvorana]
(
	[Naziv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Gradovi_Naziv_PostanskiBroj]    Script Date: 01.12.2015. 10:20:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Gradovi_Naziv_PostanskiBroj] ON [dbo].[Gradovi]
(
	[Naziv] ASC,
	[PostanskiBroj] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Predavac_OIB]    Script Date: 01.12.2015. 10:20:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Predavac_OIB] ON [dbo].[Predavac]
(
	[OIB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sudionici_RacunID]    Script Date: 01.12.2015. 10:20:24 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Sudionici_RacunID] ON [dbo].[Sudionici]
(
	[RacunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Predavac] ADD  CONSTRAINT [DF_Predavac_Titula]  DEFAULT ('Dr.') FOR [Titula]
GO
ALTER TABLE [dbo].[Predavac] ADD  CONSTRAINT [DF_Predavac_Spol]  DEFAULT ((1)) FOR [Spol]
GO
ALTER TABLE [dbo].[Sudionici] ADD  DEFAULT ('Dr.') FOR [Titula]
GO
ALTER TABLE [dbo].[Predavac_Predavanje]  WITH CHECK ADD  CONSTRAINT [FK_Predavac_Predavanje_Predavac] FOREIGN KEY([PredavacID])
REFERENCES [dbo].[Predavac] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Predavac_Predavanje] CHECK CONSTRAINT [FK_Predavac_Predavanje_Predavac]
GO
ALTER TABLE [dbo].[Predavac_Predavanje]  WITH CHECK ADD  CONSTRAINT [FK_Predavac_Predavanje_Predavanje] FOREIGN KEY([PredavanjeID])
REFERENCES [dbo].[Predavanje] ([ID])
GO
ALTER TABLE [dbo].[Predavac_Predavanje] CHECK CONSTRAINT [FK_Predavac_Predavanje_Predavanje]
GO
ALTER TABLE [dbo].[Predavanje]  WITH CHECK ADD  CONSTRAINT [FK_Predavanje_Dvorana] FOREIGN KEY([DvoranaID])
REFERENCES [dbo].[Dvorana] ([ID])
GO
ALTER TABLE [dbo].[Predavanje] CHECK CONSTRAINT [FK_Predavanje_Dvorana]
GO
ALTER TABLE [dbo].[Predavanje]  WITH CHECK ADD  CONSTRAINT [FK_Predavanje_Smjer] FOREIGN KEY([SmjerID])
REFERENCES [dbo].[Smjer] ([ID])
GO
ALTER TABLE [dbo].[Predavanje] CHECK CONSTRAINT [FK_Predavanje_Smjer]
GO
ALTER TABLE [dbo].[Racun]  WITH CHECK ADD  CONSTRAINT [FK_Racun_Organizator] FOREIGN KEY([OrganizatorID])
REFERENCES [dbo].[Organizator] ([ID])
GO
ALTER TABLE [dbo].[Racun] CHECK CONSTRAINT [FK_Racun_Organizator]
GO
ALTER TABLE [dbo].[Sudionici]  WITH CHECK ADD  CONSTRAINT [FK_Sudionici_Racun] FOREIGN KEY([RacunID])
REFERENCES [dbo].[Racun] ([ID])
GO
ALTER TABLE [dbo].[Sudionici] CHECK CONSTRAINT [FK_Sudionici_Racun]
GO
ALTER TABLE [dbo].[Sudionici_Predavanje]  WITH CHECK ADD  CONSTRAINT [FK_Sudionici_Predavanje_Predavanje] FOREIGN KEY([PredavanjeID])
REFERENCES [dbo].[Predavanje] ([ID])
GO
ALTER TABLE [dbo].[Sudionici_Predavanje] CHECK CONSTRAINT [FK_Sudionici_Predavanje_Predavanje]
GO
ALTER TABLE [dbo].[Sudionici_Predavanje]  WITH CHECK ADD  CONSTRAINT [FK_Sudionici_Predavanje_Sudionici] FOREIGN KEY([SudionikID])
REFERENCES [dbo].[Sudionici] ([ID])
GO
ALTER TABLE [dbo].[Sudionici_Predavanje] CHECK CONSTRAINT [FK_Sudionici_Predavanje_Sudionici]
GO
ALTER TABLE [dbo].[Dvorana]  WITH CHECK ADD  CONSTRAINT [CK_Dvorana_BrojMjesta] CHECK  (([BrojMjesta]>(0) AND [BrojMjesta]<(500)))
GO
ALTER TABLE [dbo].[Dvorana] CHECK CONSTRAINT [CK_Dvorana_BrojMjesta]
GO
ALTER TABLE [dbo].[Gradovi]  WITH CHECK ADD  CONSTRAINT [CK_Gradovi_PostanskiBroj] CHECK  (([PostanskiBroj] like '[1-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Gradovi] CHECK CONSTRAINT [CK_Gradovi_PostanskiBroj]
GO
ALTER TABLE [dbo].[Organizator]  WITH CHECK ADD  CONSTRAINT [CK_Organizator_Sifra] CHECK  (([Sifra] like '[A-Z][A-Z][A-Z][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Organizator] CHECK CONSTRAINT [CK_Organizator_Sifra]
GO
ALTER TABLE [dbo].[Predavac]  WITH CHECK ADD  CONSTRAINT [CK_Predavac_DatumRodenja] CHECK  (([DatumRodenja]>'1.1.1900' AND [DatumRodenja]<getdate()))
GO
ALTER TABLE [dbo].[Predavac] CHECK CONSTRAINT [CK_Predavac_DatumRodenja]
GO
ALTER TABLE [dbo].[Predavac]  WITH CHECK ADD  CONSTRAINT [CK_Predavac_OIB] CHECK  ((len([OIB])=(11)))
GO
ALTER TABLE [dbo].[Predavac] CHECK CONSTRAINT [CK_Predavac_OIB]
GO
/****** Object:  Trigger [dbo].[TriggerZaInsertDvorane]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TriggerZaInsertDvorane]
	ON [dbo].[Dvorana]
	AFTER INSERT
AS
BEGIN
	UPDATE Dvorana
	SET 
		_Created = GETDATE(),
		_Modified = GETDATE()
	WHERE ID IN(SELECT ID FROM inserted)
END

GO
/****** Object:  Trigger [dbo].[TriggerOnInsertPredavac]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TriggerOnInsertPredavac]
	ON [dbo].[Predavac]
	AFTER INSERT
AS
BEGIN
	UPDATE Predavac
		SET _Created = GETDATE()
	WHERE ID IN(SELECT ID FROM inserted)
END
GO
/****** Object:  Trigger [dbo].[TriggerOnUpdatePredavac]    Script Date: 01.12.2015. 10:20:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TriggerOnUpdatePredavac]
	ON [dbo].[Predavac]
	AFTER UPDATE
AS
BEGIN
	UPDATE Predavac
		SET _Modified = GETDATE()
	WHERE ID IN(SELECT ID FROM inserted)
	--i update-ani retci se nalaze u tablici - inserted
	--ne postoji skrivena tablica - updated
END
GO
/****** Object:  DdlTrigger [SigurnosniTrigger]    Script Date: 01.12.2015. 10:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [SigurnosniTrigger]
	ON DATABASE
	FOR DROP_TABLE, ALTER_TABLE
AS
	PRINT 'Molim disablirajte ovaj trigger ako želite promijeniti ili pobrisati tablicu.';
	ROLLBACK;
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
DISABLE TRIGGER [SigurnosniTrigger] ON DATABASE
GO
/****** Object:  DdlTrigger [UpisUPovijestTablicu]    Script Date: 01.12.2015. 10:20:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [UpisUPovijestTablicu]
	ON DATABASE
	FOR DROP_TABLE
AS
BEGIN
	DECLARE @tekst_komande varchar(MAX)
	SET @tekst_komande = EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(MAX)')

	INSERT INTO Povijest
	VALUES(@tekst_komande, GETDATE());
END


GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
DISABLE TRIGGER [UpisUPovijestTablicu] ON DATABASE
GO
ENABLE TRIGGER [UpisUPovijestTablicu] ON DATABASE
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Predavanje"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Smjer"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 118
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BrojPredavanjaPoSmjeru'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BrojPredavanjaPoSmjeru'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Predavac"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 197
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PregledPredavaca'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PregledPredavaca'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Predavac"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Predavac_Predavanje"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 118
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Predavanje"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 135
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PregledPredavacaIPredavanja'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PregledPredavacaIPredavanja'
GO
