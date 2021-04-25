SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[VPRC_T_SAPERP_SOURCE]
AS
SELECT        UPPER(dbo.SAP_LOG_T_FL_SAPERP.USERID) AS USERID, dbo.SAP_LOG_T_FL_SAPERP.AUDITLOGTXT, dbo.SAP_LOG_T_FL_SAPERP.EVENTDATE, dbo.SAP_LOG_T_FL_SAPERP.EVENTTIME, 
                         dbo.SAP_LOG_T_FL_SAPERP.PROGRAMID, dbo.SAP_LOG_T_FL_SAPERP.TCODE, dbo.SAP_LOG_T_FL_SAPERP.SYSTEMID, SUBSTRING(dbo.SAP_LOG_T_FL_SAPERP.AUDITLOGTXT, 9, CHARINDEX('Bytes', 
                         dbo.SAP_LOG_T_FL_SAPERP.AUDITLOGTXT, 1) - 10) AS Bytes, REPLACE(RIGHT(dbo.SAP_LOG_T_FL_SAPERP.AUDITLOGTXT, CHARINDEX('\', REVERSE(dbo.SAP_LOG_T_FL_SAPERP.AUDITLOGTXT))), '\', '') AS [File Name], 
                         dbo.TPRC_LOGM_EX_SAPPCODE.DESCRIPTION AS Program, dbo.TPRC_LOGM_EX_SAPTCODE.DESCRIPTION AS TransactionDecs, dbo.SAP_LOG_T_FL_SAPERP.USERID AS DSnumber, '' AS EmailId
FROM            dbo.SAP_LOG_T_FL_SAPERP LEFT OUTER JOIN
                         dbo.TPRC_LOGM_EX_SAPPCODE ON dbo.SAP_LOG_T_FL_SAPERP.PROGRAMID = dbo.TPRC_LOGM_EX_SAPPCODE.CODE LEFT OUTER JOIN
                         dbo.TPRC_LOGM_EX_SAPTCODE ON dbo.SAP_LOG_T_FL_SAPERP.TCODE = dbo.TPRC_LOGM_EX_SAPTCODE.CODE
WHERE        (dbo.SAP_LOG_T_FL_SAPERP.AUDITLOGTXT LIKE '%Download%')
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[56] 4[5] 2[20] 3) )"
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
         Begin Table = "SAP_LOG_T_FL_SAPERP"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TPRC_LOGM_EX_SAPPCODE"
            Begin Extent = 
               Top = 6
               Left = 256
               Bottom = 119
               Right = 426
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TPRC_LOGM_EX_SAPTCODE"
            Begin Extent = 
               Top = 6
               Left = 464
               Bottom = 119
               Right = 634
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
', 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_SAPERP_SOURCE', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_SAPERP_SOURCE', NULL, NULL
GO
