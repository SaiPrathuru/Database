SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
Use the Organiztion unot of the function head
*/
CREATE VIEW [dbo].[VPRC_T_EMPLOYEE_SOURCE_OLD]
AS
SELECT                      [User ID] AS [Employee DS ID], [DS Number], [First Name], [Last Name], [First Name] + N' ' + [Last Name] AS Name, Email, [Manager User ID], [Manager DS ID], [Manager First Name], 
                                      [Manager Last Name], [Manager First Name] + N' ' + [Manager Last Name] AS [Manager Name], [Manager Email], Hierarchy, [Hierarchy Level], [Global Job Grade], [Global Job Title], [Local Job Grade], 
                                      [Local Job Title], [Employee Status], [Team Size], [Direct Reports], Location, Region, [Unit Short Name], [Business Unit Name] AS [Organization Unit FullName], SUBSTRING([Business Unit Name], 1, 
                                      LEN([Business Unit Name]) - CHARINDEX('(', REVERSE([Business Unit Name]))) AS [Organization Unit Name], LTRIM(RTRIM(REPLACE(REPLACE(SUBSTRING([Business Unit Name], LEN([Business Unit Name]) 
                                      - CHARINDEX('(', REVERSE([Business Unit Name])), LEN([Business Unit Name])), ')', ''), '(', ''))) AS [Organization Unit Code], [Division Name] AS [Organization Division FullName], 
                                      SUBSTRING([Division Name], 1, LEN([Division Name]) - CHARINDEX('(', REVERSE([Division Name]))) AS [Organization Division Name], LTRIM(RTRIM(REPLACE(REPLACE(SUBSTRING([Division Name], 
                                      LEN([Division Name]) - CHARINDEX('(', REVERSE([Division Name])), LEN([Division Name])), ')', ''), '(', ''))) AS [Organization Division Code], [Department Name] AS [Organization Department FullName], 
                                      SUBSTRING([Department Name], 1, LEN([Department Name]) - CHARINDEX('(', REVERSE([Department Name]))) AS [Organization Department Name], 
                                      LTRIM(RTRIM(REPLACE(REPLACE(SUBSTRING([Department Name], LEN([Department Name]) - CHARINDEX('(', REVERSE([Department Name])), LEN([Department Name])), ')', ''), '(', ''))) 
                                      AS [Organization Department Code], [Section Name] AS [Organization Section FullName], SUBSTRING([Section Name], 1, LEN([Section Name]) - CHARINDEX('(', REVERSE([Section Name]))) 
                                      AS [Organization Section Name], LTRIM(RTRIM(REPLACE(REPLACE(SUBSTRING([Section Name], LEN([Section Name]) - CHARINDEX('(', REVERSE([Section Name])), LEN([Section Name])), ')', ''), '(', ''))) 
                                      AS [Organization Section Code], [Function Name], [Function Head DS ID], [Function Head Name], [Function Head Unit], [Function Head Division], [Function Head Email], [Function Head Unit Short Name], 
                                      [Login Type]
FROM                         dbo.M_EC_LOG_DW2_EMPLOYEEINFO
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[33] 4[40] 2[15] 3) )"
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
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "M_EC_LOG_DW2_EMPLOYEEINFO"
            Begin Extent = 
               Top = 102
               Left = 38
               Bottom = 232
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 38
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
         Column = 12750
         Alias = 3870
         Table = 1875
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
', 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_EMPLOYEE_SOURCE_OLD', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_EMPLOYEE_SOURCE_OLD', NULL, NULL
GO
