CREATE TABLE [dbo].[M_BC_LOG_DW2_ADGROUPLIST]
(
[GroupName] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[MemberOf] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[Count] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[M_BC_LOG_DW2_ADGROUPLIST] ADD CONSTRAINT [PK_M_BC_LOG_DW2_ADGROUPLIST] PRIMARY KEY CLUSTERED  ([GroupName], [MemberOf]) ON [PRIMARY]
GO
