CREATE TABLE [dbo].[TPRC_LOGM_EX_ORGANIZATIONDIVISION]
(
[Organization Division Code] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[Organization Division Name] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Organization Division] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TPRC_LOGM_EX_ORGANIZATIONDIVISION] ADD CONSTRAINT [PK_lkpOrganizationDivision] PRIMARY KEY CLUSTERED  ([Organization Division Code]) ON [PRIMARY]
GO
