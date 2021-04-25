SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[VUSR_T_SQL_FIELDUSAGE_DETAILS]
AS
SELECT                      [Database Name], [Table Name], [Field Name], [Transaction Date], [Record Count], [Application Name], [Table Type], [Employee ID], [Person ID], [User ID], Username, [User Account], [Sequence Number], 
                                      Hierarchy, [Hierarchy Level], [DS Number], [Personal Last Modified Date], [Biographic Last Modified Date], [Employment Last Modified Date], [Job Last Modified Date], [User Last Modified Date], 
                                      [Created Date], [Job Termination Date], [Termination Date], [Payroll End Date], [Last Date Worked], [Legal Retirement Date], [Last Inactivation Date], [Service Date], [Original Start Date], [Start Date], 
                                      [Hire Date], [Birth Date], [Event Reason], [Event Reason Code], Event, [Job Info Notes], [Employment Details Notes], [Employment Type Japanese], [Employment Type], [Employment Type Code], 
                                      [Employee Type], [Employee Type Code], [Employment Classification], [Employment Classification Code], isPrimaryMerged, [Employment Assignment Type], [Assignment Type], [Assignment Type Code], 
                                      [Status Code], [Login Type], [Function Head Global Unit], [Function Head Name], [Function Head Global Division], [Function Head Email], [Function Head DS Number], [Function Name], [Total Team Size], 
                                      [Direct Reports], [Manager Status Code], [Manager isPrimary], [Manager First Name], [Manager Last Name], [Manager Full Name], [Manager Email], [Manager Username], [Manager User ID], 
                                      [Solid Line Manager User ID], Section, [Section Name], [Section Code], Department, [Department Name], [Department Code], Division, [Division Name], [Division Code], Unit, [Unit Name], [Unit Code], 
                                      [Global Division Name], [Global Division], [Global Division Code], [Global Unit Name], [Global Unit], [Global Unit Code], [Global Job Title], [Global Job Grade], [Local Job Title], Title, Suffix, Gender, 
                                      [Business Phone Country Code], [Business Phone Number], [Business Phone Extension], [Business Phone VOIP], [Mobile Phone Country Code], [Mobile Phone Number], [Mobile Phone Extension], 
                                      [Mobile Phone VOIP], [Fax Country Code], [Fax Number], [Fax Extension], [Fax VOIP], [Cost Center], [Cost Center Name], [Job Cost Center], [Job Cost Center Code], [Job Cost Center Name], 
                                      [Location Code], Location, [Location Name], [Company Country], [Company Code], Company, [Company Name], [Group Region], [Local Employee Number], [Local Job Grade], Email, [Email Address], 
                                      [User Full Name], [User First Name], [User Last Name], [Display Name], [Formal Name], [Birth Name], [Preferred Name], [First Name], [Middle Name], [Last Name], [Preferred Last Name], [Display Name Kanji], 
                                      [Formal Name Kanji], [Birth Name Kanji], [First Name Kanji], [Middle Name Kanji], [Last Name Kanji], [Preferred Last Name Kanji], [Display Name Kana], [Formal Name Kana], [Birth Name Kana], 
                                      [First Name Kana], [Middle Name Kana], [Last Name Kana], [Preferred Last Name Kana], [Last Date Recorded]
FROM                         dbo.VPRC_T_SQL_FIELDUSAGE_BASE
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
         Begin Table = "VPRC_T_SQL_FIELDUSAGE_BASE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 299
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
         Column = 3345
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
', 'SCHEMA', N'dbo', 'VIEW', N'VUSR_T_SQL_FIELDUSAGE_DETAILS', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VUSR_T_SQL_FIELDUSAGE_DETAILS', NULL, NULL
GO
