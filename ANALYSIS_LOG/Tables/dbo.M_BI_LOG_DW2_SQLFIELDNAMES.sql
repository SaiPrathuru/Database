CREATE TABLE [dbo].[M_BI_LOG_DW2_SQLFIELDNAMES]
(
[Database Name] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[Table Name] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[Field Name] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[Last Date Recorded] [datetime] NULL,
[Table Type] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[M_BI_LOG_DW2_SQLFIELDNAMES] ADD CONSTRAINT [PK_M_BI_LOG_DW2_SQLFIELDNAMES] PRIMARY KEY CLUSTERED  ([Database Name], [Table Name], [Field Name]) ON [PRIMARY]
GO
