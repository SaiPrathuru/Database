SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[VPRC_T_SAP_RENAMED]
AS
SELECT                      LOWER(CASE WHEN dbo.VPRC_T_EMPLOYEE_BASE.[Employee ID] IS NULL THEN
                                          (SELECT                      [User ID]
                                                FROM                         [ANALYSIS_LOG].[dbo].[M_EC_LOG_DW2_DEVELOPERINFO]
                                                WHERE                       [First Name] = 'Default') ELSE dbo.VPRC_T_SAP_SOURCE.DSnumber END) AS [Login ID], LOWER(dbo.VPRC_T_SAP_SOURCE.USERID) AS USERID, 
                                      dbo.VPRC_T_SAP_SOURCE.AUDITLOGTXT AS [Audit Log Text], CONVERT(DATE, dbo.VPRC_T_SAP_SOURCE.EVENTDATE, 111) AS [Start Date], CONVERT(TIME, dbo.VPRC_T_SAP_SOURCE.EVENTTIME, 108) 
                                      AS [Start Time], CONVERT(DATETIME, CONVERT(varchar, dbo.VPRC_T_SAP_SOURCE.EVENTDATE, 111) + ' ' + CONVERT(varchar, dbo.VPRC_T_SAP_SOURCE.EVENTTIME, 108), 121) AS [Start Timestamp], 
                                      dbo.VPRC_T_SAP_SOURCE.[File Name], dbo.VPRC_T_SAP_SOURCE.Bytes, dbo.VPRC_T_SAP_SOURCE.SYSTEMID AS SystemKey, LOWER(dbo.VPRC_T_SAP_SOURCE.EmailId) AS [Email Address], 
                                      dbo.VPRC_T_SAP_SOURCE.TCODE AS [Transaction Code], dbo.VPRC_T_SAP_SOURCE.PROGRAMID AS [Program ID], dbo.VPRC_T_SAP_SOURCE.Program, 
                                      dbo.VPRC_T_SAP_SOURCE.TransactionDecs AS [Transaction]
FROM                         dbo.VPRC_T_SAP_SOURCE LEFT OUTER JOIN
                                      dbo.VPRC_T_EMPLOYEE_BASE ON LOWER(dbo.VPRC_T_SAP_SOURCE.DSnumber) = dbo.VPRC_T_EMPLOYEE_BASE.[Employee ID]
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[35] 2[24] 3) )"
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
         Begin Table = "VPRC_T_SAP_SOURCE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 272
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "VPRC_T_EMPLOYEE_BASE"
            Begin Extent = 
               Top = 6
               Left = 263
               Bottom = 136
               Right = 540
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
         Column = 7125
         Alias = 2535
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
', 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_SAP_RENAMED', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_SAP_RENAMED', NULL, NULL
GO
