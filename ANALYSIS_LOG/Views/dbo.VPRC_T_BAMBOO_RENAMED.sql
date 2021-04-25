SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[VPRC_T_BAMBOO_RENAMED]
AS
SELECT                      dbo.VPRC_T_BAMBOO_SOURCE.USER_ID_DERIVED AS [User ID], LOWER(dbo.VPRC_T_BAMBOO_SOURCE.USERNAME) AS [Login ID], LOWER(CASE WHEN dbo.VPRC_T_EMPLOYEE_BASE.[Employee ID] IS NULL 
                                      THEN
                                          (SELECT                      [User ID]
                                                FROM                         [ANALYSIS_LOG].[dbo].[M_EC_LOG_DW2_DEVELOPERINFO]
                                                WHERE                       [First Name] = 'Default') ELSE dbo.VPRC_T_EMPLOYEE_BASE.[Employee ID] END) AS [Employee ID], dbo.VPRC_T_BAMBOO_SOURCE.REPORT_ID_DERIVED AS [Report ID], 
                                      dbo.VPRC_T_BAMBOO_SOURCE.CREATEDBYID AS [Report Created By ID], dbo.VPRC_T_BAMBOO_SOURCE.CREATEDDATE AS [Report Created Date], 
                                      dbo.VPRC_T_BAMBOO_SOURCE.DESCRIPTION AS [Report Description], dbo.VPRC_T_BAMBOO_SOURCE.EMAIL AS [Email Address], dbo.VPRC_T_BAMBOO_SOURCE.FOLDERNAME AS [Report Category], 
                                      dbo.VPRC_T_BAMBOO_SOURCE.FORMAT AS [Report Format Type], dbo.VPRC_T_BAMBOO_SOURCE.ISDELETED AS [Report Deleted], 
                                      dbo.VPRC_T_BAMBOO_SOURCE.LASTMODIFIEDBYID AS [Last Modified By ID], dbo.VPRC_T_BAMBOO_SOURCE.LASTMODIFIEDDATE AS [Last Modified Date], 
                                      dbo.VPRC_T_BAMBOO_SOURCE.NAME AS [Report Name], dbo.VPRC_T_BAMBOO_SOURCE.NUMBER_COLUMNS AS [Column Count], dbo.VPRC_T_BAMBOO_SOURCE.ROW_COUNT AS [Row Count], 
                                      dbo.VPRC_T_BAMBOO_SOURCE.SYSTEMID AS SystemKey, CONVERT(DATE, dbo.VPRC_T_BAMBOO_SOURCE.TIMESTAMP_DERIVED, 111) AS [Start Date], CONVERT(TIME, 
                                      dbo.VPRC_T_BAMBOO_SOURCE.TIMESTAMP_DERIVED, 108) AS [Start Time], CONVERT(DATETIME, dbo.VPRC_T_BAMBOO_SOURCE.TIMESTAMP_DERIVED, 121) AS [Start Timestamp]
FROM                         dbo.VPRC_T_BAMBOO_SOURCE LEFT OUTER JOIN
                                      dbo.VPRC_T_EMPLOYEE_BASE ON dbo.VPRC_T_BAMBOO_SOURCE.EMAIL = dbo.VPRC_T_EMPLOYEE_BASE.Email
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
         Begin Table = "VPRC_T_BAMBOO_SOURCE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VPRC_T_EMPLOYEE_BASE"
            Begin Extent = 
               Top = 6
               Left = 281
               Bottom = 136
               Right = 530
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
         Column = 20865
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
', 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_BAMBOO_RENAMED', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_BAMBOO_RENAMED', NULL, NULL
GO
