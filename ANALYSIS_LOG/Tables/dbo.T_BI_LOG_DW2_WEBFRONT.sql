CREATE TABLE [dbo].[T_BI_LOG_DW2_WEBFRONT]
(
[REPORTGRP_DESC] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[REPORTGRP_CODE] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[REPORT_CODE] [nvarchar] (32) COLLATE Japanese_XJIS_100_BIN2 NULL,
[REPORT_NAME] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[USR_ID] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PROC_DATE] [datetime] NULL,
[COMMANDSTRING] [nvarchar] (max) COLLATE Japanese_XJIS_100_BIN2 NULL,
[REPORT_FORMAT] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DATA_GET_TIME] [int] NULL,
[RPT_RENDER_TIME] [int] NULL,
[SYSTEMID] [int] NULL
) ON [PRIMARY]
GO
