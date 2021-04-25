SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[VPRC_T_CUBES_MD_RENAMED]
AS
SELECT                      dbo.VPRC_T_CUBES_MD_SOURCE.SYSTEMID AS SystemKey, dbo.VPRC_T_CUBES_MD_SOURCE.ApplicationName AS [Application Name], dbo.VPRC_T_CUBES_MD_SOURCE.DatabaseName AS [Database Name],
                                       LOWER(CASE WHEN dbo.VPRC_T_EMPLOYEE_BASE.[Employee ID] IS NULL THEN
                                          (SELECT                      [User ID]
                                                FROM                         [ANALYSIS_LOG].[dbo].[M_EC_LOG_DW2_DEVELOPERINFO]
                                                WHERE                       [First Name] = 'Default') ELSE dbo.VPRC_T_CUBES_MD_SOURCE.NTUserName END) AS [Login ID], dbo.VPRC_T_CUBES_MD_SOURCE.TextData AS [Query Details], 
                                      dbo.VPRC_T_CUBES_MD_SOURCE.Duration, dbo.VPRC_T_CUBES_MD_SOURCE.ServerName AS [Server Name], CONVERT(DATE, dbo.VPRC_T_CUBES_MD_SOURCE.StartTime, 111) AS [Start Date], 
                                      CONVERT(TIME, dbo.VPRC_T_CUBES_MD_SOURCE.StartTime, 108) AS [Start Time], CONVERT(DATETIME, dbo.VPRC_T_CUBES_MD_SOURCE.StartTime, 121) AS [Start Timestamp]
FROM                         dbo.VPRC_T_CUBES_MD_SOURCE LEFT OUTER JOIN
                                      dbo.VPRC_T_EMPLOYEE_BASE ON dbo.VPRC_T_CUBES_MD_SOURCE.NTUserName = dbo.VPRC_T_EMPLOYEE_BASE.[Employee ID]
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
         Begin Table = "VPRC_T_CUBES_MD_SOURCE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VPRC_T_EMPLOYEE_BASE"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 136
               Right = 507
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
', 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_CUBES_MD_RENAMED', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_CUBES_MD_RENAMED', NULL, NULL
GO
