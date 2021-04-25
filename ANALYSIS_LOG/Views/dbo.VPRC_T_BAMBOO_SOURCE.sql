SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[VPRC_T_BAMBOO_SOURCE]
AS
SELECT        dbo.T_BC_LOG_DW2_LOGDATA.USER_ID_DERIVED, dbo.T_BC_LOG_DW2_LOGDATA.REPORT_ID_DERIVED, dbo.M_BC_LOG_DW2_REPORTS.CREATEDBYID, dbo.M_BC_LOG_DW2_REPORTS.CREATEDDATE, 
                         dbo.M_BC_LOG_DW2_REPORTS.DESCRIPTION, dbo.M_BC_LOG_DW2_REPORTS.FOLDERNAME, dbo.M_BC_LOG_DW2_REPORTS.FORMAT, dbo.M_BC_LOG_DW2_REPORTS.ISDELETED, 
                         dbo.M_BC_LOG_DW2_REPORTS.LASTMODIFIEDBYID, dbo.M_BC_LOG_DW2_REPORTS.LASTMODIFIEDDATE, dbo.M_BC_LOG_DW2_REPORTS.NAME, dbo.T_BC_LOG_DW2_LOGDATA.NUMBER_COLUMNS, 
                         dbo.T_BC_LOG_DW2_LOGDATA.ROW_COUNT, dbo.T_BC_LOG_DW2_LOGDATA.SYSTEMID, dbo.T_BC_LOG_DW2_LOGDATA.TIMESTAMP_DERIVED, LOWER(dbo.M_BC_LOG_DW2_USERS.EMAIL) AS EMAIL, 
                         dbo.M_BC_LOG_DW2_USERS.USERNAME
FROM            dbo.T_BC_LOG_DW2_LOGDATA INNER JOIN
                         dbo.M_BC_LOG_DW2_USERS ON dbo.T_BC_LOG_DW2_LOGDATA.USER_ID_DERIVED = dbo.M_BC_LOG_DW2_USERS.ID LEFT OUTER JOIN
                         dbo.M_BC_LOG_DW2_REPORTS ON dbo.T_BC_LOG_DW2_LOGDATA.REPORT_ID_DERIVED = dbo.M_BC_LOG_DW2_REPORTS.ID
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[34] 4[30] 2[21] 3) )"
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
         Begin Table = "T_BC_LOG_DW2_LOGDATA"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 288
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M_BC_LOG_DW2_USERS"
            Begin Extent = 
               Top = 6
               Left = 326
               Bottom = 136
               Right = 496
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M_BC_LOG_DW2_REPORTS"
            Begin Extent = 
               Top = 6
               Left = 534
               Bottom = 136
               Right = 748
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
         Column = 6315
         Alias = 1650
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
', 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_BAMBOO_SOURCE', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_BAMBOO_SOURCE', NULL, NULL
GO
