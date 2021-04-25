CREATE TABLE [dbo].[M_BI_LOG_DW2_MDSCHEMA_DIMENSIONS]
(
[ServerId] [int] NULL,
[Database] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Cube] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[FieldGroup] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Visible] [bit] NULL,
[Last Date Recorded] [date] NULL,
[DeletedDate] [date] NULL
) ON [PRIMARY]
GO
