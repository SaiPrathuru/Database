CREATE TABLE [dbo].[TPRC_LOGM_EX_SYSTEMS]
(
[SystemKey] [int] NOT NULL,
[System Group] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[System Name] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[System Tech Name] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Notes] [nvarchar] (max) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TPRC_LOGM_EX_SYSTEMS] ADD CONSTRAINT [PK__lkpSyste__AD2CB5E28F205868] PRIMARY KEY CLUSTERED  ([SystemKey]) ON [PRIMARY]
GO
