CREATE TABLE [dbo].[TPRC_LOGM_EX_GLOBALJOBGRADE]
(
[Global Job Grade] [nvarchar] (16) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[Global Job Grade Group] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TPRC_LOGM_EX_GLOBALJOBGRADE] ADD CONSTRAINT [PK_lkpJobGroupCodes] PRIMARY KEY CLUSTERED  ([Global Job Grade]) ON [PRIMARY]
GO
