CREATE TABLE [dbo].[T_BI_LOG_DW1_STREAMLOG]
(
[CreationDate] [datetime] NULL,
[UserIds] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Operations] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[AuditData] [nvarchar] (4000) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
