CREATE TABLE [dbo].[M_BI_LOG_DW2_DATABASES_STAGING]
(
[ServerId] [int] NULL,
[ServerName] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[CubeType] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[CubeTypeDescription] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DatabaseName] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ConnectionString] [nvarchar] (2048) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
