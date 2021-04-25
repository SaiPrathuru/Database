SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[VPRC_T_SQL_FIELDUSAGE_BASE]
AS
SELECT                      dbo.VPRC_T_SQL_FIELDUSAGE_RENAMED.[Database Name], dbo.VPRC_T_SQL_FIELDUSAGE_RENAMED.[Table Name], dbo.VPRC_T_SQL_FIELDUSAGE_RENAMED.[Field Name], 
                                      dbo.VPRC_T_SQL_FIELDUSAGE_RENAMED.[Transaction Date], dbo.VPRC_T_SQL_FIELDUSAGE_RENAMED.[Record Count], dbo.VPRC_T_SQL_FIELDUSAGE_RENAMED.[Application Name], 
                                      dbo.VPRC_T_SQL_FIELDUSAGE_RENAMED.[Table Type], dbo.M_EC_LOG_DW2_EMPLOYEE.[Employee ID], dbo.M_EC_LOG_DW2_EMPLOYEE.[Person ID], dbo.M_EC_LOG_DW2_EMPLOYEE.[User ID], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.Username, dbo.M_EC_LOG_DW2_EMPLOYEE.[User Account], dbo.M_EC_LOG_DW2_EMPLOYEE.[Sequence Number], dbo.M_EC_LOG_DW2_EMPLOYEE.Hierarchy, 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Hierarchy Level], dbo.M_EC_LOG_DW2_EMPLOYEE.[DS Number], dbo.M_EC_LOG_DW2_EMPLOYEE.[Personal Last Modified Date], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Biographic Last Modified Date], dbo.M_EC_LOG_DW2_EMPLOYEE.[Employment Last Modified Date], dbo.M_EC_LOG_DW2_EMPLOYEE.[Job Last Modified Date], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[User Last Modified Date], dbo.M_EC_LOG_DW2_EMPLOYEE.[Created Date], dbo.M_EC_LOG_DW2_EMPLOYEE.[Job Termination Date], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Termination Date], dbo.M_EC_LOG_DW2_EMPLOYEE.[Payroll End Date], dbo.M_EC_LOG_DW2_EMPLOYEE.[Last Date Worked], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Legal Retirement Date], dbo.M_EC_LOG_DW2_EMPLOYEE.[Last Inactivation Date], dbo.M_EC_LOG_DW2_EMPLOYEE.[Service Date], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Original Start Date], dbo.M_EC_LOG_DW2_EMPLOYEE.[Start Date], dbo.M_EC_LOG_DW2_EMPLOYEE.[Hire Date], dbo.M_EC_LOG_DW2_EMPLOYEE.[Birth Date], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Event Reason], dbo.M_EC_LOG_DW2_EMPLOYEE.[Event Reason Code], dbo.M_EC_LOG_DW2_EMPLOYEE.Event, dbo.M_EC_LOG_DW2_EMPLOYEE.[Job Info Notes], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Employment Details Notes], dbo.M_EC_LOG_DW2_EMPLOYEE.[Employment Type Japanese], dbo.M_EC_LOG_DW2_EMPLOYEE.[Employment Type], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Employment Type Code], dbo.M_EC_LOG_DW2_EMPLOYEE.[Employee Type], dbo.M_EC_LOG_DW2_EMPLOYEE.[Employee Type Code], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Employment Classification], dbo.M_EC_LOG_DW2_EMPLOYEE.[Employment Classification Code], dbo.M_EC_LOG_DW2_EMPLOYEE.isPrimaryMerged, 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Employment Assignment Type], dbo.M_EC_LOG_DW2_EMPLOYEE.[Assignment Type], dbo.M_EC_LOG_DW2_EMPLOYEE.[Assignment Type Code], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Status Code], dbo.M_EC_LOG_DW2_EMPLOYEE.[Login Type], dbo.M_EC_LOG_DW2_EMPLOYEE.[Function Head Global Unit], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Function Head Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[Function Head Global Division], dbo.M_EC_LOG_DW2_EMPLOYEE.[Function Head Email], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Function Head DS Number], dbo.M_EC_LOG_DW2_EMPLOYEE.[Function Head Employee ID], dbo.M_EC_LOG_DW2_EMPLOYEE.[Function Name], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Total Team Size], dbo.M_EC_LOG_DW2_EMPLOYEE.[Direct Reports], dbo.M_EC_LOG_DW2_EMPLOYEE.[Manager Status Code], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Manager isPrimary], dbo.M_EC_LOG_DW2_EMPLOYEE.[Manager First Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[Manager Last Name], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Manager Full Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[Manager Email], dbo.M_EC_LOG_DW2_EMPLOYEE.[Manager DS Number], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Manager Username], dbo.M_EC_LOG_DW2_EMPLOYEE.[Manager User ID], dbo.M_EC_LOG_DW2_EMPLOYEE.[Solid Line Manager User ID], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.Section, dbo.M_EC_LOG_DW2_EMPLOYEE.[Section Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[Section Code], dbo.M_EC_LOG_DW2_EMPLOYEE.Department, 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Department Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[Department Code], dbo.M_EC_LOG_DW2_EMPLOYEE.Division, dbo.M_EC_LOG_DW2_EMPLOYEE.[Division Name], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Division Code], dbo.M_EC_LOG_DW2_EMPLOYEE.Unit, dbo.M_EC_LOG_DW2_EMPLOYEE.[Unit Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[Unit Code], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Global Division Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[Global Division], dbo.M_EC_LOG_DW2_EMPLOYEE.[Global Division Code], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Global Unit Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[Global Unit], dbo.M_EC_LOG_DW2_EMPLOYEE.[Global Unit Code], dbo.M_EC_LOG_DW2_EMPLOYEE.[Global Job Title], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Global Job Grade], dbo.M_EC_LOG_DW2_EMPLOYEE.[Local Job Title], dbo.M_EC_LOG_DW2_EMPLOYEE.Title, dbo.M_EC_LOG_DW2_EMPLOYEE.Suffix, 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.Gender, dbo.M_EC_LOG_DW2_EMPLOYEE.[Business Phone Country Code], dbo.M_EC_LOG_DW2_EMPLOYEE.[Business Phone Number], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Business Phone Extension], dbo.M_EC_LOG_DW2_EMPLOYEE.[Business Phone VOIP], dbo.M_EC_LOG_DW2_EMPLOYEE.[Mobile Phone Country Code], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Mobile Phone Number], dbo.M_EC_LOG_DW2_EMPLOYEE.[Mobile Phone Extension], dbo.M_EC_LOG_DW2_EMPLOYEE.[Mobile Phone VOIP], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Fax Country Code], dbo.M_EC_LOG_DW2_EMPLOYEE.[Fax Number], dbo.M_EC_LOG_DW2_EMPLOYEE.[Fax Extension], dbo.M_EC_LOG_DW2_EMPLOYEE.[Fax VOIP], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Cost Center], dbo.M_EC_LOG_DW2_EMPLOYEE.[Cost Center Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[Job Cost Center], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Job Cost Center Code], dbo.M_EC_LOG_DW2_EMPLOYEE.[Job Cost Center Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[Location Code], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.Location, dbo.M_EC_LOG_DW2_EMPLOYEE.[Location Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[Company Country], dbo.M_EC_LOG_DW2_EMPLOYEE.[Company Code], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.Company, dbo.M_EC_LOG_DW2_EMPLOYEE.[Company Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[Group Region], dbo.M_EC_LOG_DW2_EMPLOYEE.[Local Employee Number], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Local Job Grade], dbo.M_EC_LOG_DW2_EMPLOYEE.Email, dbo.M_EC_LOG_DW2_EMPLOYEE.[Email Address], dbo.M_EC_LOG_DW2_EMPLOYEE.[User Full Name], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[User First Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[User Last Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[Display Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[Formal Name], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Birth Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[Preferred Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[First Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[Middle Name], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Last Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[Preferred Last Name], dbo.M_EC_LOG_DW2_EMPLOYEE.[Display Name Kanji], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Formal Name Kanji], dbo.M_EC_LOG_DW2_EMPLOYEE.[Birth Name Kanji], dbo.M_EC_LOG_DW2_EMPLOYEE.[First Name Kanji], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Middle Name Kanji], dbo.M_EC_LOG_DW2_EMPLOYEE.[Last Name Kanji], dbo.M_EC_LOG_DW2_EMPLOYEE.[Preferred Last Name Kanji], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Display Name Kana], dbo.M_EC_LOG_DW2_EMPLOYEE.[Formal Name Kana], dbo.M_EC_LOG_DW2_EMPLOYEE.[Birth Name Kana], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[First Name Kana], dbo.M_EC_LOG_DW2_EMPLOYEE.[Middle Name Kana], dbo.M_EC_LOG_DW2_EMPLOYEE.[Last Name Kana], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEE.[Preferred Last Name Kana], dbo.VPRC_T_SQL_FIELDUSAGE_RENAMED.[Last Date Recorded]
FROM                         dbo.VPRC_T_SQL_FIELDUSAGE_RENAMED LEFT OUTER JOIN
                                      dbo.M_EC_LOG_DW2_EMPLOYEE ON dbo.VPRC_T_SQL_FIELDUSAGE_RENAMED.Email = dbo.M_EC_LOG_DW2_EMPLOYEE.Email
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[21] 2[20] 3) )"
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
         Begin Table = "VPRC_T_SQL_FIELDUSAGE_RENAMED"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 198
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "M_EC_LOG_DW2_EMPLOYEE"
            Begin Extent = 
               Top = 6
               Left = 261
               Bottom = 335
               Right = 587
            End
            DisplayFlags = 280
            TopColumn = 23
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
         Column = 5850
         Alias = 900
         Table = 3615
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
', 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_SQL_FIELDUSAGE_BASE', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_SQL_FIELDUSAGE_BASE', NULL, NULL
GO
