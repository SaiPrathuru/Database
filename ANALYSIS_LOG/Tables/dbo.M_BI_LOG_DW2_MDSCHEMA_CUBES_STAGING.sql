CREATE TABLE [dbo].[M_BI_LOG_DW2_MDSCHEMA_CUBES_STAGING]
(
[ServerId] [int] NULL,
[Database] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Cube] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[CubeDescription] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[LastSchemaUpdate] [date] NULL,
[LastDataUpdate] [date] NULL
) ON [PRIMARY]
GO
