USE [Trgovina]
GO
/****** Object:  StoredProcedure [dbo].[BrisanjeKupcaIPripadajucihStavaka]    Script Date: 09.02.2016. 14:59:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BrisanjeKupcaIPripadajucihStavaka]
	@KupacID int
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN KupacTran
			DELETE FROM Stavka 
				WHERE RacunID 
					IN (SELECT ID FROM Racun WHERE KupacID = @KupacID) -- IN(5,13,14)
			DELETE FROM Racun WHERE KupacID = @KupacID
			DELETE FROM Kupac WHERE ID = @KupacID
		COMMIT TRAN KupacTran
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN KupacTran
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[BrisanjeRacunaIPripadajucihStavaka]    Script Date: 09.02.2016. 14:59:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BrisanjeRacunaIPripadajucihStavaka]
	@RacunID int
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN RacunTran
			DELETE FROM Stavka WHERE RacunID = @RacunID
			DELETE FROM Racun WHERE ID = @RacunID
		COMMIT TRAN RacunTran
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN RacunTran
	END CATCH
	--RAISERROR ('Fatal error', 16, 1);
	--RETURN;
END

GO
/****** Object:  StoredProcedure [dbo].[spRacuniKupaca]    Script Date: 09.02.2016. 14:59:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRacuniKupaca] 
AS
BEGIN
	SELECT ime + ' ' + prezime AS Kupac, count(Racun.ID) AS "Ukupan broj računa" 
	FROM Kupac
		JOIN Racun
		ON Kupac.ID = RAcun.kupacID
	GROUP BY Kupac.ID, Kupac.Ime, Kupac.Prezime
	ORDER BY "Ukupan broj računa" DESC
END


GO
/****** Object:  Table [dbo].[Dobavljac]    Script Date: 09.02.2016. 14:59:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dobavljac](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](250) NOT NULL,
	[Adresa] [varchar](250) NULL,
	[Grad] [varchar](250) NULL,
 CONSTRAINT [PK_Dobavljac] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kupac]    Script Date: 09.02.2016. 14:59:04 ******/
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
/****** Object:  Table [dbo].[Proizvod]    Script Date: 09.02.2016. 14:59:04 ******/
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
	[DobavljacID] [int] NULL,
	[Stanje] [int] NULL,
 CONSTRAINT [PK_Proizvod] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Racun]    Script Date: 09.02.2016. 14:59:04 ******/
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
/****** Object:  Table [dbo].[Stavka]    Script Date: 09.02.2016. 14:59:04 ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnNeplaceniRacuni]    Script Date: 09.02.2016. 14:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnNeplaceniRacuni] 
(	
	-- Add the parameters for the function here
	@datumOD datetime, 
	@datumDO datetime
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT Broj AS "Broj računa", DatumIzdavanja AS "Datum Izdavanja"
	FROM Racun
	WHERE DatumIzdavanja BETWEEN @datumOD AND @datumDO
		AND placen=0
)


GO
/****** Object:  View [dbo].[vPopisProizvoda]    Script Date: 09.02.2016. 14:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPopisProizvoda]
AS
SELECT        ID, Naziv, Sifra, Cijena
FROM            dbo.Proizvod
WHERE        (Cijena BETWEEN 1000 AND 2000)


GO
SET IDENTITY_INSERT [dbo].[Dobavljac] ON 

GO
INSERT [dbo].[Dobavljac] ([ID], [Naziv], [Adresa], [Grad]) VALUES (1, N'Vedi obrt', N'Jasinje 8', N'Rijeka')
GO
INSERT [dbo].[Dobavljac] ([ID], [Naziv], [Adresa], [Grad]) VALUES (2, N'Tkanina d.o.o.', N'Ilica  55', N'Zagreb')
GO
SET IDENTITY_INSERT [dbo].[Dobavljac] OFF
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
INSERT [dbo].[Proizvod] ([ID], [Naziv], [Sifra], [Cijena], [DobavljacID], [Stanje]) VALUES (2, N'Cipele L', 12, 1.0000, 1, 7)
GO
INSERT [dbo].[Proizvod] ([ID], [Naziv], [Sifra], [Cijena], [DobavljacID], [Stanje]) VALUES (3, N'Cipele Plave XL', 13, 1020.0000, 1, 2)
GO
INSERT [dbo].[Proizvod] ([ID], [Naziv], [Sifra], [Cijena], [DobavljacID], [Stanje]) VALUES (4, N'Jakna M', 14, 1000.0000, 2, 3)
GO
INSERT [dbo].[Proizvod] ([ID], [Naziv], [Sifra], [Cijena], [DobavljacID], [Stanje]) VALUES (5, N'Šal', 15, 1450.0000, 2, 4)
GO
INSERT [dbo].[Proizvod] ([ID], [Naziv], [Sifra], [Cijena], [DobavljacID], [Stanje]) VALUES (6, N'Ormar', 16, 2000.0000, NULL, 5)
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
ALTER TABLE [dbo].[Proizvod] ADD  CONSTRAINT [DF_Proizvod_Stanje]  DEFAULT ((0)) FOR [Stanje]
GO
ALTER TABLE [dbo].[Proizvod]  WITH CHECK ADD  CONSTRAINT [FK_Proizvod_Dobavljac] FOREIGN KEY([DobavljacID])
REFERENCES [dbo].[Dobavljac] ([ID])
GO
ALTER TABLE [dbo].[Proizvod] CHECK CONSTRAINT [FK_Proizvod_Dobavljac]
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
         Begin Table = "Proizvod"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPopisProizvoda'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vPopisProizvoda'
GO
