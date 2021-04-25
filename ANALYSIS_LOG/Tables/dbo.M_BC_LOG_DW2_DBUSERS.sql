CREATE TABLE [dbo].[M_BC_LOG_DW2_DBUSERS]
(
[ServerName] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DatabaseName] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[UserType] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DatabaseUserName] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[LoginName] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Role] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PermissionType] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PermissionState] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ObjectType] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Schema] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ObjectName] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ColumnName] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
