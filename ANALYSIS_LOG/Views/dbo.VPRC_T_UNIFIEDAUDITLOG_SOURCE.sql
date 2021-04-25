SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[VPRC_T_UNIFIEDAUDITLOG_SOURCE]
AS
SELECT        dbo.T_UAL_LOG_DW2_UNIFIEDAUDIT.CreationTime, dbo.T_UAL_LOG_DW2_UNIFIEDAUDIT.UserId, dbo.T_UAL_LOG_DW2_UNIFIEDAUDIT.Activity, dbo.T_UAL_LOG_DW2_UNIFIEDAUDIT.ItemName, 
                         dbo.T_UAL_LOG_DW2_UNIFIEDAUDIT.DashboardName, dbo.T_UAL_LOG_DW2_UNIFIEDAUDIT.DatasetName, dbo.T_UAL_LOG_DW2_UNIFIEDAUDIT.ReportName, dbo.T_UAL_LOG_DW2_UNIFIEDAUDIT.DashboardId, 
                         dbo.T_UAL_LOG_DW2_UNIFIEDAUDIT.DatasetId, dbo.T_UAL_LOG_DW2_UNIFIEDAUDIT.ReportId, dbo.T_UAL_LOG_DW2_UNIFIEDAUDIT.WorkSpaceName, dbo.T_UAL_LOG_DW2_UNIFIEDAUDIT.WorkspaceId, 
                         dbo.T_UAL_LOG_DW2_UNIFIEDAUDIT.UserAgent, dbo.T_UAL_LOG_DW2_UNIFIEDAUDIT.OrgAppPermission, ISNULL(dbo.T_UAL_LOG_DW2_UNIFIEDAUDIT.SYSTEMID, 10) AS SYSTEMID, 
                         dbo.TPRC_LOGM_EX_USERTYPES.[User Type]
FROM            dbo.T_UAL_LOG_DW2_UNIFIEDAUDIT LEFT OUTER JOIN
                         dbo.TPRC_LOGM_EX_USERTYPES ON dbo.T_UAL_LOG_DW2_UNIFIEDAUDIT.UserType = dbo.TPRC_LOGM_EX_USERTYPES.Id
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[45] 4[3] 2[34] 3) )"
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
         Begin Table = "T_UAL_LOG_DW2_UNIFIEDAUDIT"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TPRC_LOGM_EX_USERTYPES"
            Begin Extent = 
               Top = 6
               Left = 265
               Bottom = 244
               Right = 496
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
', 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_UNIFIEDAUDITLOG_SOURCE', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_UNIFIEDAUDITLOG_SOURCE', NULL, NULL
GO
