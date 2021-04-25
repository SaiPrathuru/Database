CREATE TABLE [dbo].[T_BI_LOG_DW2_SQLLOG_STAGING]
(
[Start Date] [date] NULL,
[Database Name] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Query Details] [ntext] COLLATE Japanese_XJIS_100_BIN2 NULL,
[Email] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Application Name] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Login Type] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
