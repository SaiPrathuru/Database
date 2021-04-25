SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[VPRC_T_CUBE_FIELDUSAGE_BASE]
AS
SELECT                      dbo.VPRC_T_CUBE_FIELDUSAGE_RENAMED.[Field Name], dbo.VPRC_T_CUBE_FIELDUSAGE_RENAMED.[Transaction Date], dbo.VPRC_T_CUBE_FIELDUSAGE_RENAMED.[Database Name], 
                                      dbo.VPRC_T_CUBE_FIELDUSAGE_RENAMED.[Application Name], dbo.VPRC_T_CUBE_FIELDUSAGE_RENAMED.Email, dbo.VPRC_T_CUBE_FIELDUSAGE_RENAMED.[Record Count], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Result Set], dbo.VPRC_T_EMPLOYEE_BASE.[Match Found], dbo.VPRC_T_EMPLOYEE_BASE.[Employee ID], dbo.VPRC_T_EMPLOYEE_BASE.[Person ID], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[User ID], dbo.VPRC_T_EMPLOYEE_BASE.Username, dbo.VPRC_T_EMPLOYEE_BASE.[User Account], dbo.VPRC_T_EMPLOYEE_BASE.[Sequence Number], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.Hierarchy, dbo.VPRC_T_EMPLOYEE_BASE.[Hierarchy Level], dbo.VPRC_T_EMPLOYEE_BASE.[DS Number], dbo.VPRC_T_EMPLOYEE_BASE.[Email Address], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[User Full Name], dbo.VPRC_T_EMPLOYEE_BASE.[User First Name], dbo.VPRC_T_EMPLOYEE_BASE.[User Last Name], dbo.VPRC_T_EMPLOYEE_BASE.[Display Name], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Formal Name], dbo.VPRC_T_EMPLOYEE_BASE.[Birth Name], dbo.VPRC_T_EMPLOYEE_BASE.[Preferred Name], dbo.VPRC_T_EMPLOYEE_BASE.[First Name], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Middle Name], dbo.VPRC_T_EMPLOYEE_BASE.[Last Name], dbo.VPRC_T_EMPLOYEE_BASE.[Preferred Last Name], dbo.VPRC_T_EMPLOYEE_BASE.[Display Name Kanji], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Formal Name Kanji], dbo.VPRC_T_EMPLOYEE_BASE.[Birth Name Kanji], dbo.VPRC_T_EMPLOYEE_BASE.[First Name Kanji], dbo.VPRC_T_EMPLOYEE_BASE.[Middle Name Kanji], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Last Name Kanji], dbo.VPRC_T_EMPLOYEE_BASE.[Preferred Last Name Kanji], dbo.VPRC_T_EMPLOYEE_BASE.[Display Name Kana], dbo.VPRC_T_EMPLOYEE_BASE.[Formal Name Kana],
                                       dbo.VPRC_T_EMPLOYEE_BASE.[Birth Name Kana], dbo.VPRC_T_EMPLOYEE_BASE.[First Name Kana], dbo.VPRC_T_EMPLOYEE_BASE.[Middle Name Kana], dbo.VPRC_T_EMPLOYEE_BASE.[Last Name Kana], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Preferred Last Name Kana], dbo.VPRC_T_EMPLOYEE_BASE.Title, dbo.VPRC_T_EMPLOYEE_BASE.Suffix, dbo.VPRC_T_EMPLOYEE_BASE.Gender, 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Business Phone Country Code], dbo.VPRC_T_EMPLOYEE_BASE.[Business Phone Number], dbo.VPRC_T_EMPLOYEE_BASE.[Business Phone Extension], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Business Phone VOIP], dbo.VPRC_T_EMPLOYEE_BASE.[Mobile Phone Country Code], dbo.VPRC_T_EMPLOYEE_BASE.[Mobile Phone Number], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Mobile Phone Extension], dbo.VPRC_T_EMPLOYEE_BASE.[Mobile Phone VOIP], dbo.VPRC_T_EMPLOYEE_BASE.[Fax Country Code], dbo.VPRC_T_EMPLOYEE_BASE.[Fax Number], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Fax Extension], dbo.VPRC_T_EMPLOYEE_BASE.[Fax VOIP], dbo.VPRC_T_EMPLOYEE_BASE.[Cost Center], dbo.VPRC_T_EMPLOYEE_BASE.[Cost Center Name], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Job Cost Center], dbo.VPRC_T_EMPLOYEE_BASE.[Job Cost Center Code], dbo.VPRC_T_EMPLOYEE_BASE.[Job Cost Center Name], dbo.VPRC_T_EMPLOYEE_BASE.[Location Code], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.Location, dbo.VPRC_T_EMPLOYEE_BASE.[Location Name], dbo.VPRC_T_EMPLOYEE_BASE.[Company Country], dbo.VPRC_T_EMPLOYEE_BASE.[Company Code], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.Company, dbo.VPRC_T_EMPLOYEE_BASE.[Company Name], dbo.VPRC_T_EMPLOYEE_BASE.[Group Region], dbo.VPRC_T_EMPLOYEE_BASE.[Local Employee Number], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Local Job Grade], dbo.VPRC_T_EMPLOYEE_BASE.[Local Job Title], dbo.VPRC_T_EMPLOYEE_BASE.[Global Job Grade], dbo.VPRC_T_EMPLOYEE_BASE.[Global Job Title], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Global Unit Code], dbo.VPRC_T_EMPLOYEE_BASE.[Global Unit], dbo.VPRC_T_EMPLOYEE_BASE.[Global Unit Name], dbo.VPRC_T_EMPLOYEE_BASE.[Global Division Code], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Global Division], dbo.VPRC_T_EMPLOYEE_BASE.[Global Division Name], dbo.VPRC_T_EMPLOYEE_BASE.[Unit Code], dbo.VPRC_T_EMPLOYEE_BASE.[Unit Name], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.Unit, dbo.VPRC_T_EMPLOYEE_BASE.[Division Code], dbo.VPRC_T_EMPLOYEE_BASE.[Division Name], dbo.VPRC_T_EMPLOYEE_BASE.Division, 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Department Code], dbo.VPRC_T_EMPLOYEE_BASE.[Department Name], dbo.VPRC_T_EMPLOYEE_BASE.Department, dbo.VPRC_T_EMPLOYEE_BASE.[Section Code], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Section Name], dbo.VPRC_T_EMPLOYEE_BASE.Section, dbo.VPRC_T_EMPLOYEE_BASE.[Solid Line Manager User ID], dbo.VPRC_T_EMPLOYEE_BASE.[Manager Employee ID], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Manager User ID], dbo.VPRC_T_EMPLOYEE_BASE.[Manager Username], dbo.VPRC_T_EMPLOYEE_BASE.[Manager DS Number], dbo.VPRC_T_EMPLOYEE_BASE.[Manager Email], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Manager Full Name], dbo.VPRC_T_EMPLOYEE_BASE.[Manager First Name], dbo.VPRC_T_EMPLOYEE_BASE.[Manager Last Name], dbo.VPRC_T_EMPLOYEE_BASE.[Manager isPrimary], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Manager Status Code], dbo.VPRC_T_EMPLOYEE_BASE.[Direct Reports], dbo.VPRC_T_EMPLOYEE_BASE.[Total Team Size], dbo.VPRC_T_EMPLOYEE_BASE.[Function Name], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Function Head Employee ID], dbo.VPRC_T_EMPLOYEE_BASE.[Function Head DS Number], dbo.VPRC_T_EMPLOYEE_BASE.[Function Head Email], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Function Head Name], dbo.VPRC_T_EMPLOYEE_BASE.[Function Head Global Unit], dbo.VPRC_T_EMPLOYEE_BASE.[Function Head Global Division], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Login Type], dbo.VPRC_T_EMPLOYEE_BASE.[Status Code], dbo.VPRC_T_EMPLOYEE_BASE.[Assignment Type Code], dbo.VPRC_T_EMPLOYEE_BASE.[Assignment Type], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Employment Assignment Type], dbo.VPRC_T_EMPLOYEE_BASE.isPrimaryMerged, dbo.VPRC_T_EMPLOYEE_BASE.[Employment Classification Code], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Employment Classification], dbo.VPRC_T_EMPLOYEE_BASE.[Employee Type Code], dbo.VPRC_T_EMPLOYEE_BASE.[Employee Type], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Employment Type Code], dbo.VPRC_T_EMPLOYEE_BASE.[Employment Type], dbo.VPRC_T_EMPLOYEE_BASE.[Employment Type Japanese], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Employment Details Notes], dbo.VPRC_T_EMPLOYEE_BASE.[Job Info Notes], dbo.VPRC_T_EMPLOYEE_BASE.Event, dbo.VPRC_T_EMPLOYEE_BASE.[Event Reason Code], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Event Reason], dbo.VPRC_T_EMPLOYEE_BASE.[Hire Date], dbo.VPRC_T_EMPLOYEE_BASE.[Last Inactivation Date], dbo.VPRC_T_EMPLOYEE_BASE.[Termination Date], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Job Termination Date], dbo.VPRC_T_EMPLOYEE_BASE.[Created Date], dbo.VPRC_T_EMPLOYEE_BASE.[User Last Modified Date], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Job Last Modified Date], dbo.VPRC_T_EMPLOYEE_BASE.[Employment Last Modified Date], dbo.VPRC_T_EMPLOYEE_BASE.[Biographic Last Modified Date], 
                                      dbo.VPRC_T_EMPLOYEE_BASE.[Personal Last Modified Date]
FROM                         dbo.VPRC_T_CUBE_FIELDUSAGE_RENAMED LEFT OUTER JOIN
                                      dbo.VPRC_T_EMPLOYEE_BASE ON dbo.VPRC_T_CUBE_FIELDUSAGE_RENAMED.Email = dbo.VPRC_T_EMPLOYEE_BASE.Email
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
         Begin Table = "VPRC_T_CUBE_FIELDUSAGE_RENAMED"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 205
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "VPRC_T_EMPLOYEE_BASE"
            Begin Extent = 
               Top = 6
               Left = 273
               Bottom = 136
               Right = 534
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
         Column = 6615
         Alias = 900
         Table = 3870
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
', 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_CUBE_FIELDUSAGE_BASE', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_CUBE_FIELDUSAGE_BASE', NULL, NULL
GO
