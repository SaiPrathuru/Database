SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[VUSR_T_CUBES_TB_DETAILS]
AS
SELECT                      [Application Name], [Database Name], [Login ID], [Login Type], [Query Details], Duration, [Server Name], [Start Date], [Start Time], [Start Timestamp], [Result Set], [Match Found], [Employee ID], [Person ID], 
                                      [User ID], Username, [User Account], [Sequence Number], Hierarchy, [Hierarchy Level], [DS Number], Email, [Email Address], [User Full Name], [User First Name], [User Last Name], [Display Name], 
                                      [Formal Name], [Birth Name], [Preferred Name], [First Name], [Middle Name], [Last Name], [Preferred Last Name], [Display Name Kanji], [Formal Name Kanji], [Birth Name Kanji], [First Name Kanji], 
                                      [Middle Name Kanji], [Last Name Kanji], [Preferred Last Name Kanji], [Display Name Kana], [Formal Name Kana], [Birth Name Kana], [First Name Kana], [Middle Name Kana], [Last Name Kana], 
                                      [Preferred Last Name Kana], Title, Suffix, Gender, [Business Phone Country Code], [Business Phone Number], [Business Phone Extension], [Business Phone VOIP], [Mobile Phone Country Code], 
                                      [Mobile Phone Number], [Mobile Phone Extension], [Mobile Phone VOIP], [Fax Country Code], [Fax Number], [Fax Extension], [Fax VOIP], [Cost Center], [Cost Center Name], [Job Cost Center], 
                                      [Job Cost Center Code], [Job Cost Center Name], [Location Code], Location, [Location Name], [Company Country], [Company Code], Company, [Company Name], [Group Region], [Local Employee Number], 
                                      [Local Job Grade], [Local Job Title], [Global Job Grade], [Global Job Title], [Global Unit Code], [Global Unit], [Global Unit Name], [Global Division Code], [Global Division], [Global Division Name], [Unit Code], 
                                      [Unit Name], Unit, [Division Code], [Division Name], Division, [Department Code], [Department Name], Department, [Section Code], [Section Name], Section, [Solid Line Manager User ID], 
                                      [Manager Employee ID], [Manager User ID], [Manager Username], [Manager DS Number], [Manager Email], [Manager Full Name], [Manager First Name], [Manager Last Name], [Manager isPrimary], 
                                      [Manager Status Code], [Direct Reports], [Total Team Size], [Function Name], [Function Head Employee ID], [Function Head DS Number], [Function Head Email], [Function Head Name], 
                                      [Function Head Global Unit], [Function Head Global Division], [Status Code], [Assignment Type Code], [Assignment Type], [Employment Assignment Type], isPrimaryMerged, [Employment Classification Code], 
                                      [Employment Classification], [Employee Type Code], [Employee Type], [Employment Type Code], [Employment Type], [Employment Type Japanese], [Employment Details Notes], [Job Info Notes], Event, 
                                      [Event Reason Code], [Event Reason], [Hire Date], [Last Inactivation Date], [Termination Date], [Job Termination Date], [Created Date], [User Last Modified Date], [Job Last Modified Date], 
                                      [Employment Last Modified Date], [Biographic Last Modified Date], [Personal Last Modified Date], [System Group], [System Name], [System Tech Name], Notes
FROM                         dbo.VPRC_T_CUBES_TB_BASE
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[35] 2[5] 3) )"
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
         Begin Table = "VPRC_T_CUBES_TB_BASE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 287
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
', 'SCHEMA', N'dbo', 'VIEW', N'VUSR_T_CUBES_TB_DETAILS', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VUSR_T_CUBES_TB_DETAILS', NULL, NULL
GO
