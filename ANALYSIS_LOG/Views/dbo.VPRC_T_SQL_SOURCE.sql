SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[VPRC_T_SQL_SOURCE]
AS
SELECT                      CASE WHEN [NTUserName] IS NULL THEN [LoginName] ELSE [NTUserName] END AS NTUserName, 
                                      CASE WHEN ApplicationName LIKE 'SQL Server Profiler - %' THEN 'SQL Server Profiler' WHEN ApplicationName LIKE 'SQLPS %' THEN 'SQL PowerShell' WHEN ApplicationName LIKE 'Tableau Protocol Server %'
                                       THEN 'Tableau Protocol Server' WHEN ApplicationName LIKE 'Tableau %' THEN 'Tableau' WHEN ApplicationName LIKE 'Microsoft SQL Server Management Studio - %' THEN 'Microsoft SQL Server Management Studio'
                                       WHEN ApplicationName LIKE 'Microsoft Office%' THEN 'Microsoft Office' WHEN ApplicationName LIKE '%Visual Studio%' THEN 'Microsoft® Visual Studio' WHEN ApplicationName LIKE 'SQLAgent - TSQL JobStep%'
                                       THEN 'SQLAgent - Job' WHEN ApplicationName IS NULL OR
                                      ApplicationName = ' ' THEN 'Microsoft Office' ELSE ApplicationName END AS ApplicationName, Duration, StartTime, TextData, DatabaseName, SYSTEMID
FROM                         dbo.T_BI_LOG_DW2_RDBUSERTRACELOG
WHERE                       (DatabaseName IS NOT NULL)
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[38] 4[24] 2[20] 3) )"
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
         Begin Table = "T_BI_LOG_DW2_RDBUSERTRACELOG"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 317
               Right = 312
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
         Column = 9255
         Alias = 2535
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 90195
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_SQL_SOURCE', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_SQL_SOURCE', NULL, NULL
GO
