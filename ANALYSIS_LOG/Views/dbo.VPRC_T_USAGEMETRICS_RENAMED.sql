SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[VPRC_T_USAGEMETRICS_RENAMED]
AS
SELECT                      dbo.VPRC_T_USAGEMETRICS_SOURCE.SYSTEMID AS SystemKey, dbo.VPRC_T_USAGEMETRICS_SOURCE.DistributionMethod AS [Distribution Method], dbo.VPRC_T_USAGEMETRICS_SOURCE.Platform, 
                                      dbo.VPRC_T_USAGEMETRICS_SOURCE.ReportGuid AS [Report GUID], dbo.VPRC_T_USAGEMETRICS_SOURCE.DisplayName AS Report, dbo.VPRC_T_USAGEMETRICS_SOURCE.ReportPage AS [Report Page], 
                                      LOWER(dbo.VPRC_T_USAGEMETRICS_SOURCE.UserName) AS [Login ID], dbo.VPRC_T_USAGEMETRICS_SOURCE.Total AS [Total Reports in Organization], 
                                      dbo.VPRC_T_USAGEMETRICS_SOURCE.ViewersRank AS [Viewers Rank], dbo.VPRC_T_USAGEMETRICS_SOURCE.ViewsRank AS [Views Rank], dbo.VPRC_T_USAGEMETRICS_SOURCE.ViewsCount AS Views, 
                                      dbo.VPRC_T_USAGEMETRICS_SOURCE.ViewersCount AS Viewers, CONVERT(DATE, dbo.VPRC_T_USAGEMETRICS_SOURCE.[Run Date], 111) AS [Start Date], CONVERT(TIME, '00:00:00', 108) AS [Start Time], 
                                      CONVERT(DATETIME, dbo.VPRC_T_USAGEMETRICS_SOURCE.[Run Date], 121) AS [Start Timestamp], LOWER(CASE WHEN dbo.VPRC_T_EMPLOYEE_BASE.[Employee ID] IS NULL THEN
                                          (SELECT                      [User ID]
                                                FROM                         [ANALYSIS_LOG].[dbo].[M_EC_LOG_DW2_DEVELOPERINFO]
                                                WHERE                       [First Name] = 'Default') ELSE dbo.VPRC_T_EMPLOYEE_BASE.[Employee ID] END) AS [Employee ID]
FROM                         dbo.VPRC_T_USAGEMETRICS_SOURCE LEFT OUTER JOIN
                                      dbo.VPRC_T_EMPLOYEE_BASE ON LOWER(dbo.VPRC_T_USAGEMETRICS_SOURCE.UserName) = LOWER(dbo.VPRC_T_EMPLOYEE_BASE.Email) AND dbo.VPRC_T_USAGEMETRICS_SOURCE.UserName <> ''
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
         Begin Table = "VPRC_T_USAGEMETRICS_SOURCE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 231
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VPRC_T_EMPLOYEE_BASE"
            Begin Extent = 
               Top = 6
               Left = 269
               Bottom = 136
               Right = 518
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
         Alias = 2010
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
', 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_USAGEMETRICS_RENAMED', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_USAGEMETRICS_RENAMED', NULL, NULL
GO
