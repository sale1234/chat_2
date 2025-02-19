USE [master]
GO
/****** Object:  Database [Chat]    Script Date: 24-Sep-23 20:42:32 ******/
CREATE DATABASE [Chat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Chat', FILENAME = N'C:\Users\Filip\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\Chat.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Chat_log', FILENAME = N'C:\Users\Filip\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\Chat.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Chat] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Chat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Chat] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [Chat] SET ANSI_NULLS ON 
GO
ALTER DATABASE [Chat] SET ANSI_PADDING ON 
GO
ALTER DATABASE [Chat] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [Chat] SET ARITHABORT ON 
GO
ALTER DATABASE [Chat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Chat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Chat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Chat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Chat] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [Chat] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [Chat] SET NUMERIC_ROUNDABORT OFF 

CREATE TABLE [dbo].[Administrator](
	[adminId] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[sifra] [varchar](50) NOT NULL,
	[ime] [varchar](50) NOT NULL,
	[prezime] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Administrator] PRIMARY KEY CLUSTERED 
(
	[adminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Korisnik]    Script Date: 24-Sep-23 20:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnik](
	[korisnickoIme] [varchar](50) NOT NULL,
	[korisnickaSifra] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Korisnik] PRIMARY KEY CLUSTERED 
(
	[korisnickoIme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poruka]    Script Date: 24-Sep-23 20:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poruka](
	[porukaId] [int] IDENTITY(1,1) NOT NULL,
	[tekst] [varchar](200) NOT NULL,
	[posiljalac] [varchar](50) NOT NULL,
	[primalac] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Poruka] PRIMARY KEY CLUSTERED 
(
	[porukaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administrator] ON 

INSERT [dbo].[Administrator] ([adminId], [email], [sifra], [ime], [prezime]) VALUES (1, N'fico@gmail.com', N'fico', N'Filip', N'Jovanovic')
SET IDENTITY_INSERT [dbo].[Administrator] OFF
GO
INSERT [dbo].[Korisnik] ([korisnickoIme], [korisnickaSifra]) VALUES (N'Devla', N'devla1')
INSERT [dbo].[Korisnik] ([korisnickoIme], [korisnickaSifra]) VALUES (N'Djedara', N'djedara1')
INSERT [dbo].[Korisnik] ([korisnickoIme], [korisnickaSifra]) VALUES (N'Filip', N'fico1')
INSERT [dbo].[Korisnik] ([korisnickoIme], [korisnickaSifra]) VALUES (N'Sale', N'sale1')
GO
SET IDENTITY_INSERT [dbo].[Poruka] ON 

INSERT [dbo].[Poruka] ([porukaId], [tekst], [posiljalac], [primalac]) VALUES (1, N'sve vas volim', N'Filip', N'Filip')
INSERT [dbo].[Poruka] ([porukaId], [tekst], [posiljalac], [primalac]) VALUES (2, N'ja mnogo volim da jedem komplet lepinju sa jogurtom kod koleta', N'Devla', N'Filip')
INSERT [dbo].[Poruka] ([porukaId], [tekst], [posiljalac], [primalac]) VALUES (3, N'ja mnogo volim da jedem komplet lepinju sa jogurtom kod koleta', N'Devla', N'Devla')
INSERT [dbo].[Poruka] ([porukaId], [tekst], [posiljalac], [primalac]) VALUES (4, N'Ti si govedo Vranjansko', N'Filip', N'Devla')
INSERT [dbo].[Poruka] ([porukaId], [tekst], [posiljalac], [primalac]) VALUES (5, N'Siso grobarska', N'Devla', N'Filip')
INSERT [dbo].[Poruka] ([porukaId], [tekst], [posiljalac], [primalac]) VALUES (6, N'ajde djedaro', N'Djedara', N'Filip')
INSERT [dbo].[Poruka] ([porukaId], [tekst], [posiljalac], [primalac]) VALUES (7, N'idemo Cacak', N'Sale', N'Filip')
INSERT [dbo].[Poruka] ([porukaId], [tekst], [posiljalac], [primalac]) VALUES (8, N'idemo Cacak', N'Sale', N'Devla')
INSERT [dbo].[Poruka] ([porukaId], [tekst], [posiljalac], [primalac]) VALUES (9, N'idemo Cacak', N'Sale', N'Djedara')
INSERT [dbo].[Poruka] ([porukaId], [tekst], [posiljalac], [primalac]) VALUES (10, N'idemo Cacak', N'Sale', N'Sale')
INSERT [dbo].[Poruka] ([porukaId], [tekst], [posiljalac], [primalac]) VALUES (11, N'Cacani smrde', N'Filip', N'Filip')
INSERT [dbo].[Poruka] ([porukaId], [tekst], [posiljalac], [primalac]) VALUES (12, N'Cacani smrde', N'Filip', N'Devla')
INSERT [dbo].[Poruka] ([porukaId], [tekst], [posiljalac], [primalac]) VALUES (13, N'Cacani smrde', N'Filip', N'Djedara')
INSERT [dbo].[Poruka] ([porukaId], [tekst], [posiljalac], [primalac]) VALUES (14, N'Cacani smrde', N'Filip', N'Sale')
SET IDENTITY_INSERT [dbo].[Poruka] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Korisnik]    Script Date: 24-Sep-23 20:42:32 ******/
ALTER TABLE [dbo].[Korisnik] ADD  CONSTRAINT [UK_Korisnik] UNIQUE NONCLUSTERED 
(
	[korisnickoIme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Poruka]  WITH CHECK ADD  CONSTRAINT [FK_Poruka_Korisnik] FOREIGN KEY([posiljalac])
REFERENCES [dbo].[Korisnik] ([korisnickoIme])
GO
ALTER TABLE [dbo].[Poruka] CHECK CONSTRAINT [FK_Poruka_Korisnik]
GO
ALTER TABLE [dbo].[Poruka]  WITH CHECK ADD  CONSTRAINT [FK_Poruka_Korisnik1] FOREIGN KEY([primalac])
REFERENCES [dbo].[Korisnik] ([korisnickoIme])
GO
ALTER TABLE [dbo].[Poruka] CHECK CONSTRAINT [FK_Poruka_Korisnik1]
GO
USE [master]
GO
ALTER DATABASE [Chat] SET  READ_WRITE 
GO
