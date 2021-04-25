CREATE TABLE [dbo].[T_BI_LOG_DW2_SQLLOG]
(
[FieldName] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[TransactionDate] [date] NULL,
[DatabaseName] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[RecordCount] [int] NULL,
[EmailId] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Application Name] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Login Type] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Table Name] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
