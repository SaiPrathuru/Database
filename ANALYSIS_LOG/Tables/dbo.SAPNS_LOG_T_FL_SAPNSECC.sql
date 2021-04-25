CREATE TABLE [dbo].[SAPNS_LOG_T_FL_SAPNSECC]
(
[SYSTEMID] [int] NULL,
[INSTANCENAME] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[EVENTDATE] [datetime] NULL,
[EVENTTIME] [time] NULL,
[USERID] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[TERMINALNAME] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[TCODE] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PROGRAMID] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[AUDITLOGTXT] [nvarchar] (max) COLLATE Japanese_XJIS_100_BIN2 NULL,
[CLID] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[LONGTEXT] [nvarchar] (max) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PROCID] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[WPID] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DATA1] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DATA2] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DATAMESSAGE] [nvarchar] (max) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DATA3] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
