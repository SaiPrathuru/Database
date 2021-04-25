SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[VPRC_T_EMPLOYEE_HR_BASE]
AS
SELECT                      ISNULL(dbo.M_EC_LOG_DW2_EMPLOYEE.[Result Set], N'0. Not Selected') AS [Result Set], ISNULL(dbo.M_EC_LOG_DW2_EMPLOYEE.[Match Found], 0) AS [Match Found], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Employee ID], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Person ID], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[User ID], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.Username, dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[User Account], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Sequence Number], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.Hierarchy, 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Hierarchy Level], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[DS Number], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.Email, 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Email Address], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[User Full Name], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[User First Name], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[User Last Name], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Display Name], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[First Name], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Middle Name], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Last Name], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Display Name Kanji], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[First Name Kanji], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Middle Name Kanji], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Last Name Kanji], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Display Name Kana], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[First Name Kana], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Middle Name Kana], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Last Name Kana], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.Title, dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.Suffix, dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.Gender, 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Business Phone Country Code], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Business Phone Number], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Business Phone Extension], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Business Phone VOIP], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Mobile Phone Country Code], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Mobile Phone Number], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Mobile Phone Extension], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Mobile Phone VOIP], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Fax Country Code], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Fax Number], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Fax Extension], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Fax VOIP], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Cost Center], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Cost Center Name], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Job Cost Center], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Job Cost Center Code], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Job Cost Center Name], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Location Code], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.Location, dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Location Name], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Company Country], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Company Code], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.Company, dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Company Name], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Group Region], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Local Employee Number], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Local Job Grade], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Local Job Title], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Global Job Grade], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Global Job Title], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Unit Code], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Unit Name], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.Unit, 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Division Code], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Division Name], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.Division, 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Department Code], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Department Name], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.Department, dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Section Code], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Section Name], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.Section, 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Solid Line Manager User ID], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Manager Employee ID], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Manager User ID], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Manager Username], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Manager DS Number], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Manager Email], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Manager Full Name], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Manager First Name], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Manager Last Name], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Manager isPrimary], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Manager Status Code], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Direct Reports], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Total Team Size], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Function Name], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Function Head Employee ID], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Function Head DS Number], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Function Head Email], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Function Head Name], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Function Head Global Unit], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Function Head Global Division], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Login Type], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Status Code], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Assignment Type Code], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Assignment Type], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Employment Assignment Type], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.isPrimaryMerged, 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Employment Classification Code], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Employment Classification], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Employee Type Code], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Employee Type], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Employment Type Code], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Employment Type], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Employment Type Japanese], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Employment Details Notes], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Job Info Notes], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.Event, 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Event Reason Code], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Event Reason], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Hire Date], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Last Inactivation Date], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Termination Date], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Job Termination Date], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Created Date], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[User Last Modified Date], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Job Last Modified Date], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Employment Last Modified Date], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Biographic Last Modified Date], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Personal Last Modified Date], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[IF Formal Last Name], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[IF Formal First Name], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[IF Formal Middle Name], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[IF Formal Last Name Kanji], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[IF Formal First Name Kanji], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[IF Formal Last Name Kana], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[IF Formal First Name Kana], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.Timezone, 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[User Timezone], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Legal Entity ID], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Global Job Title Code], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Job Title], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Employee Status Code], dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Employee Status Option ID], 
                                      dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Leave of Absence Reason]
FROM                         dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT LEFT OUTER JOIN
                                      dbo.M_EC_LOG_DW2_EMPLOYEE ON dbo.M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[User ID] = dbo.M_EC_LOG_DW2_EMPLOYEE.[User ID]
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
         Begin Table = "M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT"
            Begin Extent = 
               Top = 33
               Left = 64
               Bottom = 278
               Right = 550
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M_EC_LOG_DW2_EMPLOYEE"
            Begin Extent = 
               Top = 24
               Left = 623
               Bottom = 342
               Right = 903
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
         Column = 6045
         Alias = 900
         Table = 2955
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
', 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_EMPLOYEE_HR_BASE', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_EMPLOYEE_HR_BASE', NULL, NULL
GO
