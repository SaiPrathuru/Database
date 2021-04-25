CREATE TABLE [dbo].[M_BC_LOG_DW2_ADGROUPMEMBERLIST]
(
[GroupName] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[DS Number] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[Email] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[GroupHierarchy] [nvarchar] (1024) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[M_BC_LOG_DW2_ADGROUPMEMBERLIST] ADD CONSTRAINT [PK_M_BC_LOG_DW2_ADGROUPMEMBERLIST] PRIMARY KEY CLUSTERED  ([GroupName], [DS Number], [Email]) ON [PRIMARY]
GO