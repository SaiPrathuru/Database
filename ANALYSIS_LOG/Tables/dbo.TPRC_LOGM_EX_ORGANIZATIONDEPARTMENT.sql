CREATE TABLE [dbo].[TPRC_LOGM_EX_ORGANIZATIONDEPARTMENT]
(
[Organization Department Code] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[Organization Department Name] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Organization Department] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TPRC_LOGM_EX_ORGANIZATIONDEPARTMENT] ADD CONSTRAINT [PK_lkpOrganizationDepartment] PRIMARY KEY CLUSTERED  ([Organization Department Code]) ON [PRIMARY]
GO
