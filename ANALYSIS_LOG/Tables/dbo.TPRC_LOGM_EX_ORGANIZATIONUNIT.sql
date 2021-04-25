CREATE TABLE [dbo].[TPRC_LOGM_EX_ORGANIZATIONUNIT]
(
[Organization Unit Code] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[Organization Unit Name] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Organization Unit] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TPRC_LOGM_EX_ORGANIZATIONUNIT] ADD CONSTRAINT [PK_lkpOrganizationUnit] PRIMARY KEY CLUSTERED  ([Organization Unit Code]) ON [PRIMARY]
GO
