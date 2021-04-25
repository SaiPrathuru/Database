SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*LEFT OUTER JOIN
                             (SELECT        SYSTEMID, ID, CODE, DESCRIPTION, CODE_TYPE
                               FROM            dbo.viewSystemCodeInfoSource
                               WHERE        (CODE_TYPE = 'P_CODE')) AS tblPcode ON tblPcode.SYSTEMID = dbo.viewSAPAuditLogSource.SYSTEMID AND tblPcode.CODE = dbo.viewSAPAuditLogSource.TCODE LEFT OUTER JOIN
                             (SELECT        SYSTEMID, ID, CODE, DESCRIPTION, CODE_TYPE
                               FROM            dbo.viewSystemCodeInfoSource AS viewSystemCodeInfoSource_1
                               WHERE        (CODE_TYPE = 'T_CODE')) AS tblTcode ON tblTcode.SYSTEMID = dbo.viewSAPAuditLogSource.SYSTEMID AND tblTcode.CODE = dbo.viewSAPAuditLogSource.TCODE*/
CREATE VIEW [dbo].[VPRC_T_SAPNSECC_SOURCE]
AS
SELECT        dbo.SAPNS_LOG_T_FL_SAPNSECC.USERID, dbo.SAPNS_LOG_T_FL_SAPNSECC.AUDITLOGTXT, dbo.SAPNS_LOG_T_FL_SAPNSECC.EVENTDATE, dbo.SAPNS_LOG_T_FL_SAPNSECC.EVENTTIME, 
                         dbo.SAPNS_LOG_T_FL_SAPNSECC.PROGRAMID, dbo.SAPNS_LOG_T_FL_SAPNSECC.TCODE, dbo.SAP_LOG_M_FL_SAPUSERDATA.EmailId, dbo.SAP_LOG_M_FL_SAPUSERDATA.DSnumber, 
                         dbo.SAPNS_LOG_T_FL_SAPNSECC.SYSTEMID, SUBSTRING(dbo.SAPNS_LOG_T_FL_SAPNSECC.AUDITLOGTXT, 9, CHARINDEX('Bytes', dbo.SAPNS_LOG_T_FL_SAPNSECC.AUDITLOGTXT, 1) - 10) AS Bytes, 
                         REPLACE(RIGHT(dbo.SAPNS_LOG_T_FL_SAPNSECC.AUDITLOGTXT, CHARINDEX('\', REVERSE(dbo.SAPNS_LOG_T_FL_SAPNSECC.AUDITLOGTXT))), '\', '') AS [File Name], 
                         dbo.TPRC_LOGM_EX_SAPNSPCODE.DESCRIPTION AS Program, dbo.TPRC_LOGM_EX_SAPNSTCODE.DESCRIPTION AS TransactionDecs
FROM            dbo.SAPNS_LOG_T_FL_SAPNSECC LEFT OUTER JOIN
                         dbo.SAP_LOG_M_FL_SAPUSERDATA ON UPPER(dbo.SAP_LOG_M_FL_SAPUSERDATA.UserName) = UPPER(dbo.SAPNS_LOG_T_FL_SAPNSECC.USERID) LEFT OUTER JOIN
                         dbo.TPRC_LOGM_EX_SAPNSPCODE ON dbo.SAPNS_LOG_T_FL_SAPNSECC.PROGRAMID = dbo.TPRC_LOGM_EX_SAPNSPCODE.CODE LEFT OUTER JOIN
                         dbo.TPRC_LOGM_EX_SAPNSTCODE ON dbo.SAPNS_LOG_T_FL_SAPNSECC.TCODE = dbo.TPRC_LOGM_EX_SAPNSTCODE.CODE
WHERE        (dbo.SAPNS_LOG_T_FL_SAPNSECC.AUDITLOGTXT LIKE '%Download%')
GO
EXEC sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[25] 3[25] 2) )"
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
         Begin Table = "SAPNS_LOG_T_FL_SAPNSECC"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SAP_LOG_M_FL_SAPUSERDATA"
            Begin Extent = 
               Top = 6
               Left = 256
               Bottom = 136
               Right = 426
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TPRC_LOGM_EX_SAPNSPCODE"
            Begin Extent = 
               Top = 6
               Left = 464
               Bottom = 119
               Right = 634
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TPRC_LOGM_EX_SAPNSTCODE"
            Begin Extent = 
               Top = 6
               Left = 672
               Bottom = 119
               Right = 842
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
         Column = 2565
         Alias = 2145
         Table = 1170
         Output = 795
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
', 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_SAPNSECC_SOURCE', NULL, NULL
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'MS_DiagramPaneCount', @xp, 'SCHEMA', N'dbo', 'VIEW', N'VPRC_T_SAPNSECC_SOURCE', NULL, NULL
GO
