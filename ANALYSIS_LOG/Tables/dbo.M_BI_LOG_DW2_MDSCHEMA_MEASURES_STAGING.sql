CREATE TABLE [dbo].[M_BI_LOG_DW2_MDSCHEMA_MEASURES_STAGING]
(
[ServerId] [int] NULL,
[Database] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Cube] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[FieldGroup] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[FieldName] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Visible] [bit] NULL,
[MeasureExpression] [nvarchar] (2048) COLLATE Japanese_XJIS_100_BIN2 NULL,
[MeasureFormat] [nvarchar] (2048) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
