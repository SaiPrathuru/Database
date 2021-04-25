SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[VPRC_T_RAINBOW_SOURCE]
AS
SELECT        '2' AS SYSTEMID, dbo.T_CQ_LOG_DW2_RAINBOWDISPLAYACCESS.ACCESSDATE, dbo.T_CQ_LOG_DW2_RAINBOWDISPLAYACCESS.FUNCTIONNAME, dbo.T_CQ_LOG_DW2_RAINBOWDISPLAYACCESS.USERID, 
                         dbo.M_CQ_LOG_DW2_RAINBOWSCREENMASTER.SCREENDIV, dbo.M_CQ_LOG_DW2_RAINBOWSCREENMASTER.SCREENNAME, dbo.T_CQ_LOG_DW2_RAINBOWSEARCHCONDITION.DATANAME, 
                         dbo.T_CQ_LOG_DW2_RAINBOWSEARCHCONDITION.FILENAME, dbo.T_CQ_LOG_DW2_RAINBOWSEARCHCONDITION.TEXTCONDITION, dbo.T_CQ_LOG_DW2_RAINBOWSEARCHCONDITION.TOTALROWCOUNT
FROM            dbo.T_CQ_LOG_DW2_RAINBOWDISPLAYACCESS LEFT OUTER JOIN
                         dbo.M_CQ_LOG_DW2_RAINBOWSCREENMASTER ON dbo.M_CQ_LOG_DW2_RAINBOWSCREENMASTER.SCREENID = dbo.T_CQ_LOG_DW2_RAINBOWDISPLAYACCESS.SCREENID LEFT OUTER JOIN
                         dbo.T_CQ_LOG_DW2_RAINBOWSEARCHCONDITION ON dbo.T_CQ_LOG_DW2_RAINBOWDISPLAYACCESS.SQLID = dbo.T_CQ_LOG_DW2_RAINBOWSEARCHCONDITION.SQLID
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[68] 4[3] 2[10] 3) )"
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
         Begin Table = "T_CQ_LOG_DW2_RAINBOWDISPLAYACCESS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M_CQ_LOG_DW2_RAINBOWSCREENMASTER"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 136
               Right = 444
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T_CQ_LOG_DW2_RAINBOWSEARCHCONDITION"
            Begin Extent = 
               Top = 6
               Left = 482
               Bottom = 136
               Right = 676
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
', 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_RAINBOW_SOURCE', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_RAINBOW_SOURCE', NULL, NULL
GO
