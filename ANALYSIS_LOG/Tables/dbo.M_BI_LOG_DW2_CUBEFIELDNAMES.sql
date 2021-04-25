CREATE TABLE [dbo].[M_BI_LOG_DW2_CUBEFIELDNAMES]
(
[Database Name] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Cube] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Field Name] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Field Group] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Field Type] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Last Date Recorded] [date] NULL,
[DeletedDate] [date] NULL
) ON [PRIMARY]
GO
