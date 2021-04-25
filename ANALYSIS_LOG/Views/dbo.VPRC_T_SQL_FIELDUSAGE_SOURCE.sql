SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[VPRC_T_SQL_FIELDUSAGE_SOURCE]
AS
SELECT                      dbo.T_BI_LOG_DW2_SQLLOG.TransactionDate, dbo.T_BI_LOG_DW2_SQLLOG.RecordCount, dbo.T_BI_LOG_DW2_SQLLOG.EmailId, dbo.T_BI_LOG_DW2_SQLLOG.[Application Name], 
                                      dbo.T_BI_LOG_DW2_SQLLOG.[Login Type], dbo.M_BI_LOG_DW2_SQLFIELDNAMES.[Table Type], dbo.T_BI_LOG_DW2_SQLLOG.DatabaseName AS [Database Name], dbo.T_BI_LOG_DW2_SQLLOG.[Table Name], 
                                      dbo.T_BI_LOG_DW2_SQLLOG.FieldName AS [Field Name], dbo.M_BI_LOG_DW2_SQLFIELDNAMES.[Last Date Recorded]
FROM                         dbo.T_BI_LOG_DW2_SQLLOG LEFT OUTER JOIN
                                      dbo.M_BI_LOG_DW2_SQLFIELDNAMES ON dbo.T_BI_LOG_DW2_SQLLOG.[Table Name] = dbo.M_BI_LOG_DW2_SQLFIELDNAMES.[Table Name] AND 
                                      dbo.T_BI_LOG_DW2_SQLLOG.DatabaseName = dbo.M_BI_LOG_DW2_SQLFIELDNAMES.[Database Name] AND dbo.T_BI_LOG_DW2_SQLLOG.FieldName = dbo.M_BI_LOG_DW2_SQLFIELDNAMES.[Field Name]
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
         Begin Table = "T_BI_LOG_DW2_SQLLOG"
            Begin Extent = 
               Top = 43
               Left = 61
               Bottom = 262
               Right = 296
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M_BI_LOG_DW2_SQLFIELDNAMES"
            Begin Extent = 
               Top = 54
               Left = 604
               Bottom = 282
               Right = 868
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
         Column = 3405
         Alias = 3600
         Table = 3825
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
', 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_SQL_FIELDUSAGE_SOURCE', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_SQL_FIELDUSAGE_SOURCE', NULL, NULL
GO
