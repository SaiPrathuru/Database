SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[TestbyHelen_Dimension_Webfront]
AS
SELECT distinct
      ISNUll([USR_ID],'')+ISNULL([REPORTGRP_CODE],'')+ISNULL([REPORT_NAME],'') as ID_Webfront,
       [USR_ID]
      ,[REPORTGRP_CODE]
      ,[REPORT_NAME]
FROM [ANALYSIS_LOG].[dbo].[VPRC_T_WEBFRONT_SOURCE]
where [USR_ID] is not null
AND USR_ID <> ''
GO
