SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


 CREATE VIEW [dbo].[VPRC_T_SAP_SOURCE]
  as 
  SELECT USERID, AUDITLOGTXT, EVENTDATE,EVENTTIME, PROGRAMID, TCODE, EmailId, DSnumber, SYSTEMID,Bytes,[File Name],[Program]
      ,[TransactionDecs] FROM [ANALYSIS_LOG].[dbo].[VPRC_T_SAPERP_SOURCE]
  UNION ALL
  SELECT USERID, AUDITLOGTXT, EVENTDATE,EVENTTIME, PROGRAMID, TCODE, EmailId, DSnumber, SYSTEMID,Bytes,[File Name],[Program]
      ,[TransactionDecs] FROM [ANALYSIS_LOG].[dbo].VPRC_T_SAPNSECC_SOURCE

  
GO
