SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

















CREATE VIEW [dbo].[VPRC_T_EMPLOYEEEMAIL_RENAMED]
AS

With CTE
As
(
  SELECT        Row_Number() OVER (Partition BY Email
ORDER BY Email, [Employee DS ID] ASC) AS Row_Num, *
FROM            VPRC_T_EMPLOYEE_RENAMED)
    SELECT       [Employee DS ID]
      ,[First Name]
      ,[Last Name]
      ,[Name]
      ,[Email]
	  ,[Manager User ID]
      ,[Manager DS ID]
      ,[Manager First Name]
      ,[Manager Last Name]
      ,[Manager Name]
      ,[Manager Email]
      ,[Hierarchy]
      ,[Hierarchy Level]
      ,[Global Job Grade]
      ,[Global Job Title]
      ,[Local Job Grade]
      ,[Local Job Title]
      ,[Employee Status]
      ,[Team Size]
      ,[Direct Reports]
      ,[Group Region]
      ,[Unit Short Name]
      ,[Organization Unit FullName]
      ,[Organization Unit Name]
      ,[Organization Unit Code]
      ,[Organization Division FullName]
      ,[Organization Division Name]
      ,[Organization Division Code]
      ,[Organization Department FullName]
      ,[Organization Department Name]
      ,[Organization Department Code]
      ,[Organization Section FullName]
      ,[Organization Section Name]
      ,[Organization Section Code]
      ,[Function Name]
      ,[Function Head DS ID]
      ,[Function Head Name]
      ,[Function Head Unit]
	  ,[Function Head Unit Short Name]
      ,[Function Head Division]
      ,[Function Head Email]
      ,[Location]
      ,[DS Number]
	,[Login Type]
 FROM            CTE
     WHERE        Row_Num = 1











GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
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
', 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_EMPLOYEEEMAIL_RENAMED', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_EMPLOYEEEMAIL_RENAMED', NULL, NULL
GO
