USE [master]
GO
/****** Object:  Database [clinic2]    Script Date: 6/5/2020 2:07:57 AM ******/
CREATE DATABASE [clinic2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'clinic2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\clinic2.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'clinic2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\clinic2_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [clinic2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [clinic2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [clinic2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [clinic2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [clinic2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [clinic2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [clinic2] SET ARITHABORT OFF 
GO
ALTER DATABASE [clinic2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [clinic2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [clinic2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [clinic2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [clinic2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [clinic2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [clinic2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [clinic2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [clinic2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [clinic2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [clinic2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [clinic2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [clinic2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [clinic2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [clinic2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [clinic2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [clinic2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [clinic2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [clinic2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [clinic2] SET  MULTI_USER 
GO
ALTER DATABASE [clinic2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [clinic2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [clinic2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [clinic2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [clinic2]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 6/5/2020 2:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[Appointment_id] [int] IDENTITY(1,1) NOT NULL,
	[visit_id] [int] NULL,
	[patient_id] [int] NULL,
	[Appointmentdate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Appointment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[checkup]    Script Date: 6/5/2020 2:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[checkup](
	[checkup_id] [int] IDENTITY(1,1) NOT NULL,
	[medicinecode] [int] NULL,
	[checkupdate] [int] NULL,
	[patient_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[checkup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[medicine]    Script Date: 6/5/2020 2:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[medicine](
	[medicinecode] [int] IDENTITY(1,1) NOT NULL,
	[medicine_name] [varchar](50) NULL,
	[medicine_quantity] [int] NULL,
	[medicine_description] [varchar](50) NULL,
	[patient_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[medicinecode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[patient]    Script Date: 6/5/2020 2:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[patient](
	[patient_id] [int] IDENTITY(1,1) NOT NULL,
	[patient_name] [varchar](50) NULL,
	[patient_phonenumber] [int] NULL,
	[patient_gender] [varchar](50) NULL,
	[patient_Address] [varchar](50) NULL,
	[patient_dateoffirstvisit] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[payment]    Script Date: 6/5/2020 2:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[receipt_id] [int] IDENTITY(1,1) NOT NULL,
	[paymentdate] [int] NULL,
	[visit_id] [int] NULL,
	[patient_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[receipt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[visit]    Script Date: 6/5/2020 2:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[visit](
	[visit_id] [int] IDENTITY(1,1) NOT NULL,
	[Appointment_id] [int] NULL,
	[currentsymptoms] [varchar](50) NULL,
	[visitdate] [int] NULL,
	[patient_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[visit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[View_1]    Script Date: 6/5/2020 2:07:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.checkup.medicinecode, dbo.payment.paymentdate, dbo.visit.visitdate, dbo.medicine.medicine_quantity
FROM            dbo.medicine INNER JOIN
                         dbo.checkup ON dbo.medicine.medicinecode = dbo.checkup.medicinecode INNER JOIN
                         dbo.patient ON dbo.medicine.patient_id = dbo.patient.patient_id AND dbo.checkup.patient_id = dbo.patient.patient_id INNER JOIN
                         dbo.Appointment ON dbo.patient.patient_id = dbo.Appointment.patient_id INNER JOIN
                         dbo.payment ON dbo.patient.patient_id = dbo.payment.patient_id INNER JOIN
                         dbo.visit ON dbo.patient.patient_id = dbo.visit.patient_id AND dbo.patient.patient_id = dbo.visit.patient_id AND dbo.Appointment.visit_id = dbo.visit.visit_id AND dbo.Appointment.Appointment_id = dbo.visit.Appointment_id AND 
                         dbo.payment.visit_id = dbo.visit.visit_id

GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient] ([patient_id])
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([visit_id])
REFERENCES [dbo].[visit] ([visit_id])
GO
ALTER TABLE [dbo].[checkup]  WITH CHECK ADD FOREIGN KEY([medicinecode])
REFERENCES [dbo].[medicine] ([medicinecode])
GO
ALTER TABLE [dbo].[checkup]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient] ([patient_id])
GO
ALTER TABLE [dbo].[medicine]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient] ([patient_id])
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient] ([patient_id])
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD FOREIGN KEY([visit_id])
REFERENCES [dbo].[visit] ([visit_id])
GO
ALTER TABLE [dbo].[visit]  WITH CHECK ADD FOREIGN KEY([Appointment_id])
REFERENCES [dbo].[Appointment] ([Appointment_id])
GO
ALTER TABLE [dbo].[visit]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient] ([patient_id])
GO
ALTER TABLE [dbo].[visit]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient] ([patient_id])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[0] 3) )"
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
         Begin Table = "Appointment"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "checkup"
            Begin Extent = 
               Top = 6
               Left = 259
               Bottom = 136
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "medicine"
            Begin Extent = 
               Top = 6
               Left = 554
               Bottom = 136
               Right = 778
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "patient"
            Begin Extent = 
               Top = 6
               Left = 806
               Bottom = 136
               Right = 984
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "payment"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "visit"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 268
               Right = 429
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
       ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [clinic2] SET  READ_WRITE 
GO
