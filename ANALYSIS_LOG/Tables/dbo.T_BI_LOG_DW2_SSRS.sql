CREATE TABLE [dbo].[T_BI_LOG_DW2_SSRS]
(
[UserInfo] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DS ID] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[URL] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Type] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Action] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Runtime] [datetime] NULL,
[Details] [nvarchar] (max) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Title] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[IPAddress] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[HostName] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[EMail] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[SYSTEMID] [int] NULL
) ON [PRIMARY]
GO
