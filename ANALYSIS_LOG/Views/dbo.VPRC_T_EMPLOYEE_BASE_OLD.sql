SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[VPRC_T_EMPLOYEE_BASE_OLD]
AS
SELECT                      dbo.VPRC_T_EMPLOYEE_RENAMED.[Employee DS ID], dbo.VPRC_T_EMPLOYEE_RENAMED.[DS Number], dbo.VPRC_T_EMPLOYEE_RENAMED.[First Name], dbo.VPRC_T_EMPLOYEE_RENAMED.[Last Name], 
                                      dbo.VPRC_T_EMPLOYEE_RENAMED.Name, dbo.VPRC_T_EMPLOYEE_RENAMED.Email, dbo.VPRC_T_EMPLOYEE_RENAMED.[Login Type], dbo.VPRC_T_EMPLOYEE_RENAMED.[Manager User ID], 
                                      dbo.VPRC_T_EMPLOYEE_RENAMED.[Manager DS ID], dbo.VPRC_T_EMPLOYEE_RENAMED.[Manager First Name], dbo.VPRC_T_EMPLOYEE_RENAMED.[Manager Last Name], 
                                      dbo.VPRC_T_EMPLOYEE_RENAMED.[Manager Name], dbo.VPRC_T_EMPLOYEE_RENAMED.[Manager Email], dbo.VPRC_T_EMPLOYEE_RENAMED.[Function Name], 
                                      dbo.VPRC_T_EMPLOYEE_RENAMED.[Function Head DS ID], dbo.VPRC_T_EMPLOYEE_RENAMED.[Function Head Name], dbo.VPRC_T_EMPLOYEE_RENAMED.[Function Head Unit Short Name], 
                                      dbo.VPRC_T_EMPLOYEE_RENAMED.[Function Head Email], dbo.VPRC_T_EMPLOYEE_RENAMED.[Function Head Unit], dbo.VPRC_T_EMPLOYEE_RENAMED.[Function Head Division], 
                                      dbo.VPRC_T_EMPLOYEE_RENAMED.Hierarchy, dbo.VPRC_T_EMPLOYEE_RENAMED.[Hierarchy Level], dbo.VPRC_T_EMPLOYEE_RENAMED.[Global Job Grade], 
                                      dbo.TPRC_LOGM_EX_GLOBALJOBGRADE.[Global Job Grade Group], dbo.VPRC_T_EMPLOYEE_RENAMED.[Global Job Title], dbo.TPRC_LOGM_EX_GLOBALJOBTITLE.[Global Job Title Group], 
                                      dbo.TPRC_LOGM_EX_GLOBALJOBTITLE.[Global Job Title Group 2], dbo.VPRC_T_EMPLOYEE_RENAMED.[Local Job Grade], dbo.VPRC_T_EMPLOYEE_RENAMED.[Local Job Title], 
                                      dbo.TPRC_LOGM_EX_LOCALJOBTITLE.[Local Job Title Group], dbo.TPRC_LOGM_EX_LOCALJOBTITLE.[Local Job Title Group 2], dbo.VPRC_T_EMPLOYEE_RENAMED.[Employee Status], 
                                      dbo.VPRC_T_EMPLOYEE_RENAMED.[Team Size], dbo.VPRC_T_EMPLOYEE_RENAMED.[Direct Reports], dbo.VPRC_T_EMPLOYEE_RENAMED.[Group Region], dbo.VPRC_T_EMPLOYEE_RENAMED.[Unit Short Name], 
                                      dbo.TPRC_LOGM_EX_ORGANIZATIONUNIT.[Organization Unit], dbo.TPRC_LOGM_EX_ORGANIZATIONUNIT.[Organization Unit Name], dbo.VPRC_T_EMPLOYEE_RENAMED.[Organization Unit Code], 
                                      dbo.VPRC_T_EMPLOYEE_RENAMED.[Organization Unit FullName], dbo.TPRC_LOGM_EX_ORGANIZATIONDIVISION.[Organization Division], 
                                      dbo.TPRC_LOGM_EX_ORGANIZATIONDIVISION.[Organization Division Name], dbo.VPRC_T_EMPLOYEE_RENAMED.[Organization Division Code], dbo.VPRC_T_EMPLOYEE_RENAMED.[Organization Division FullName], 
                                      dbo.TPRC_LOGM_EX_ORGANIZATIONDEPARTMENT.[Organization Department], dbo.TPRC_LOGM_EX_ORGANIZATIONDEPARTMENT.[Organization Department Name], 
                                      dbo.VPRC_T_EMPLOYEE_RENAMED.[Organization Department Code], dbo.VPRC_T_EMPLOYEE_RENAMED.[Organization Department FullName], dbo.TPRC_LOGM_EX_ORGANIZATIONSECTION.[Organization Section], 
                                      dbo.TPRC_LOGM_EX_ORGANIZATIONSECTION.[Organization Section Name], dbo.VPRC_T_EMPLOYEE_RENAMED.[Organization Section Code], dbo.VPRC_T_EMPLOYEE_RENAMED.[Organization Section FullName], 
                                      dbo.VPRC_T_EMPLOYEE_RENAMED.Location
FROM                         dbo.VPRC_T_EMPLOYEE_RENAMED LEFT OUTER JOIN
                                      dbo.TPRC_LOGM_EX_LOCALJOBTITLE ON dbo.VPRC_T_EMPLOYEE_RENAMED.[Local Job Title] = dbo.TPRC_LOGM_EX_LOCALJOBTITLE.[Local Job Title] LEFT OUTER JOIN
                                      dbo.TPRC_LOGM_EX_GLOBALJOBTITLE ON dbo.VPRC_T_EMPLOYEE_RENAMED.[Global Job Title] = dbo.TPRC_LOGM_EX_GLOBALJOBTITLE.[Global Job Title] LEFT OUTER JOIN
                                      dbo.TPRC_LOGM_EX_GLOBALJOBGRADE ON dbo.VPRC_T_EMPLOYEE_RENAMED.[Global Job Grade] = dbo.TPRC_LOGM_EX_GLOBALJOBGRADE.[Global Job Grade] LEFT OUTER JOIN
                                      dbo.TPRC_LOGM_EX_ORGANIZATIONDEPARTMENT ON 
                                      dbo.VPRC_T_EMPLOYEE_RENAMED.[Organization Department Code] = dbo.TPRC_LOGM_EX_ORGANIZATIONDEPARTMENT.[Organization Department Code] LEFT OUTER JOIN
                                      dbo.TPRC_LOGM_EX_ORGANIZATIONDIVISION ON dbo.VPRC_T_EMPLOYEE_RENAMED.[Organization Division Code] = dbo.TPRC_LOGM_EX_ORGANIZATIONDIVISION.[Organization Division Code] LEFT OUTER JOIN
                                      dbo.TPRC_LOGM_EX_ORGANIZATIONSECTION ON dbo.VPRC_T_EMPLOYEE_RENAMED.[Organization Section Code] = dbo.TPRC_LOGM_EX_ORGANIZATIONSECTION.[Organization Section Code] LEFT OUTER JOIN
                                      dbo.TPRC_LOGM_EX_ORGANIZATIONUNIT ON dbo.VPRC_T_EMPLOYEE_RENAMED.[Organization Unit Code] = dbo.TPRC_LOGM_EX_ORGANIZATIONUNIT.[Organization Unit Code]
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[25] 2[27] 3) )"
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
         Begin Table = "VPRC_T_EMPLOYEE_RENAMED"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 308
               Right = 559
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "TPRC_LOGM_EX_LOCALJOBTITLE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TPRC_LOGM_EX_GLOBALJOBTITLE"
            Begin Extent = 
               Top = 6
               Left = 737
               Bottom = 119
               Right = 952
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TPRC_LOGM_EX_GLOBALJOBGRADE"
            Begin Extent = 
               Top = 6
               Left = 990
               Bottom = 102
               Right = 1204
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TPRC_LOGM_EX_ORGANIZATIONDEPARTMENT"
            Begin Extent = 
               Top = 102
               Left = 990
               Bottom = 215
               Right = 1248
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TPRC_LOGM_EX_ORGANIZATIONDIVISION"
            Begin Extent = 
               Top = 154
               Left = 26
               Bottom = 267
               Right = 263
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TPRC_LOGM_EX_ORGANIZATIONSECTION"
            Begin Extent = 
     ', 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_EMPLOYEE_BASE_OLD', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_DiagramPane2', N'          Top = 120
               Left = 737
               Bottom = 233
               Right = 971
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TPRC_LOGM_EX_ORGANIZATIONUNIT"
            Begin Extent = 
               Top = 216
               Left = 1009
               Bottom = 329
               Right = 1226
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
         Column = 3990
         Alias = 900
         Table = 3945
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
', 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_EMPLOYEE_BASE_OLD', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=2
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_EMPLOYEE_BASE_OLD', NULL, NULL
GO
