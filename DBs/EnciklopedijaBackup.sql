USE [Enciklopedija]
GO
/****** Object:  Table [dbo].[Zanimljivost]    Script Date: 08.12.2015. 23:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zanimljivost](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naslov] [nvarchar](50) NOT NULL,
	[Opis] [nvarchar](max) NULL,
	[Url] [nvarchar](250) NULL,
	[VideoUrl] [nvarchar](250) NULL,
	[VideoStart] [int] NULL,
	[VideoEnd] [int] NULL,
	[ZanrID] [int] NULL,
 CONSTRAINT [PK_Zanimljivost] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Zanr]    Script Date: 08.12.2015. 23:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zanr](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
	[Opis] [nvarchar](250) NULL,
 CONSTRAINT [PK_Zanr] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Zanimljivost] ON 

GO
INSERT [dbo].[Zanimljivost] ([ID], [Naslov], [Opis], [Url], [VideoUrl], [VideoStart], [VideoEnd], [ZanrID]) VALUES (1, N'Ponašanje vode u polju zvuka', N'Video pokazuje ponašanje kapljice vode u zvučnom polju', NULL, N'https://www.youtube.com/embed/MKMf7PCkoZQ', 0, 59, 1)
GO
INSERT [dbo].[Zanimljivost] ([ID], [Naslov], [Opis], [Url], [VideoUrl], [VideoStart], [VideoEnd], [ZanrID]) VALUES (2, N'Buster Keaton - The Art of Gag', N'Kratki filmić o genijalnom Busteru Keatonu', NULL, N'https://www.youtube.com/embed/UWEjxkkB8Xs', 0, 514, 6)
GO
INSERT [dbo].[Zanimljivost] ([ID], [Naslov], [Opis], [Url], [VideoUrl], [VideoStart], [VideoEnd], [ZanrID]) VALUES (3, N'Simfonija znanosti', N'Zanimljiva prezentacija moderne fizikalne znanosti', NULL, N'https://www.youtube.com/embed/DZGINaRUEkU', 0, 208, 1)
GO
INSERT [dbo].[Zanimljivost] ([ID], [Naslov], [Opis], [Url], [VideoUrl], [VideoStart], [VideoEnd], [ZanrID]) VALUES (4, N'Oblici dobiveni zvukom', N'Eksperiment kojim se istražuju oblici dobiveni zvukom na metalnoj ploči', NULL, N'https://www.youtube.com/embed/wvJAgrUBF4w', 0, 218, 1)
GO
INSERT [dbo].[Zanimljivost] ([ID], [Naslov], [Opis], [Url], [VideoUrl], [VideoStart], [VideoEnd], [ZanrID]) VALUES (5, N'Top lista nadrealista - vijesti', N'Top lista nadrealista - vijesti o rođenju Monike Seleš', NULL, N'https://www.youtube.com/embed/c1KxailJECM', 0, 38, 7)
GO
INSERT [dbo].[Zanimljivost] ([ID], [Naslov], [Opis], [Url], [VideoUrl], [VideoStart], [VideoEnd], [ZanrID]) VALUES (6, N'Živimo u svijetu od 11 dimenzija', N'Opis najnovijih teoretskih saznanja na polju fizike, točnije vezano na tzv. string teoriju', NULL, N'https://www.youtube.com/embed/YtdE662eY_M', 0, 1146, 1)
GO
INSERT [dbo].[Zanimljivost] ([ID], [Naslov], [Opis], [Url], [VideoUrl], [VideoStart], [VideoEnd], [ZanrID]) VALUES (7, N'Jetman', N'Kako će izgledati letovi budućnosti', NULL, N'https://www.youtube.com/embed/dFCQJ5sYGtI', 0, 245, 11)
GO
INSERT [dbo].[Zanimljivost] ([ID], [Naslov], [Opis], [Url], [VideoUrl], [VideoStart], [VideoEnd], [ZanrID]) VALUES (8, N'Prvi aerodrom napajan solarnom energijom', N'Film o zanimljivom projektu koji omogućuje jednom aerodromu da funkcionira napajan od energije dobivene solarnim kolektorima.', NULL, N'https://www.youtube.com/embed/3FUpo_i0Bbo', 0, 150, 1)
GO
INSERT [dbo].[Zanimljivost] ([ID], [Naslov], [Opis], [Url], [VideoUrl], [VideoStart], [VideoEnd], [ZanrID]) VALUES (9, N'Plutajući grad', N'Opis projekta koji namjerava sagraditi grad na vodi.', NULL, N'https://www.youtube.com/embed/cVDcswq8t_w', 0, 75, 1)
GO
INSERT [dbo].[Zanimljivost] ([ID], [Naslov], [Opis], [Url], [VideoUrl], [VideoStart], [VideoEnd], [ZanrID]) VALUES (10, N'Billie Jean Remix', N'Billie Jean otpjevan uz pomoć pivskih flaša', NULL, N'https://www.youtube.com/embed/hmSX8eX34Hs', 0, 113, 5)
GO
INSERT [dbo].[Zanimljivost] ([ID], [Naslov], [Opis], [Url], [VideoUrl], [VideoStart], [VideoEnd], [ZanrID]) VALUES (11, N'Što indijanci misle o Kolumbu', N'Pitali su američke indijance što misle o Kolumbu. Pogledajte odgovore.', NULL, N'https://www.youtube.com/embed/fYTXRDtYzYc', 0, 169, 10)
GO
INSERT [dbo].[Zanimljivost] ([ID], [Naslov], [Opis], [Url], [VideoUrl], [VideoStart], [VideoEnd], [ZanrID]) VALUES (12, N'Poduka o kompleksnim brojevima', N'Snimka sa predavanja o kompleksnim brojevima', NULL, N'https://www.youtube.com/embed/8-RYxG4smgs', 0, 172, 1)
GO
INSERT [dbo].[Zanimljivost] ([ID], [Naslov], [Opis], [Url], [VideoUrl], [VideoStart], [VideoEnd], [ZanrID]) VALUES (15, N'Borba predavača', N'Kako privući pažnju studenata na satu', NULL, N'https://www.youtube.com/embed/P2SsIYEbCio', 0, 131, 7)
GO
SET IDENTITY_INSERT [dbo].[Zanimljivost] OFF
GO
SET IDENTITY_INSERT [dbo].[Zanr] ON 

GO
INSERT [dbo].[Zanr] ([ID], [Naziv], [Opis]) VALUES (1, N'Znanost', N'Znanstvene teme')
GO
INSERT [dbo].[Zanr] ([ID], [Naziv], [Opis]) VALUES (4, N'Umjetnost', N'Teme iz umjetnosti')
GO
INSERT [dbo].[Zanr] ([ID], [Naziv], [Opis]) VALUES (5, N'Glazba', N'Glazbene teme')
GO
INSERT [dbo].[Zanr] ([ID], [Naziv], [Opis]) VALUES (6, N'Film', N'Filmska tematika')
GO
INSERT [dbo].[Zanr] ([ID], [Naziv], [Opis]) VALUES (7, N'Zabava', N'Zabavne teme')
GO
INSERT [dbo].[Zanr] ([ID], [Naziv], [Opis]) VALUES (8, N'Sport', N'Teme iz sporta')
GO
INSERT [dbo].[Zanr] ([ID], [Naziv], [Opis]) VALUES (9, N'Razno', N'Razne tematike koje ne spadaju u druga polja.')
GO
INSERT [dbo].[Zanr] ([ID], [Naziv], [Opis]) VALUES (10, N'Ljudi', N'O ljudima i njihovim odnosima')
GO
INSERT [dbo].[Zanr] ([ID], [Naziv], [Opis]) VALUES (11, N'Tehnologija', N'Teme koje pokazuju upotrebu moderne tehnologije u društvu.')
GO
INSERT [dbo].[Zanr] ([ID], [Naziv], [Opis]) VALUES (12, N'Priroda', N'Teme vezane na prirodu, floru i faunu, klimu i slično.')
GO
INSERT [dbo].[Zanr] ([ID], [Naziv], [Opis]) VALUES (13, N'Duhovnost', N'Teme vezane na duhovnost')
GO
SET IDENTITY_INSERT [dbo].[Zanr] OFF
GO
ALTER TABLE [dbo].[Zanimljivost]  WITH CHECK ADD  CONSTRAINT [FK_Zanimljivost_Zanr] FOREIGN KEY([ZanrID])
REFERENCES [dbo].[Zanr] ([ID])
GO
ALTER TABLE [dbo].[Zanimljivost] CHECK CONSTRAINT [FK_Zanimljivost_Zanr]
GO
