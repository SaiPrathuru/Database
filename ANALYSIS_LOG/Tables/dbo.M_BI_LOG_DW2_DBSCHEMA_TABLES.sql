CREATE TABLE [dbo].[M_BI_LOG_DW2_DBSCHEMA_TABLES]
(
[ServerId] [int] NULL,
[Database] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Cube] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Last Date Recorded] [date] NULL,
[DeletedDate] [date] NULL
) ON [PRIMARY]
GO
