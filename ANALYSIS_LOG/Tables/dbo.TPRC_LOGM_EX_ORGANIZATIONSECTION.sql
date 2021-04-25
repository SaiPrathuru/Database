CREATE TABLE [dbo].[TPRC_LOGM_EX_ORGANIZATIONSECTION]
(
[Organization Section Code] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[Organization Section Name] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Organization Section] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TPRC_LOGM_EX_ORGANIZATIONSECTION] ADD CONSTRAINT [PK_lkpOrganizationSection] PRIMARY KEY CLUSTERED  ([Organization Section Code]) ON [PRIMARY]
GO
