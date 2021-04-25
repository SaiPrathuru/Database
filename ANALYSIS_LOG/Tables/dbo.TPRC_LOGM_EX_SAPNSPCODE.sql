CREATE TABLE [dbo].[TPRC_LOGM_EX_SAPNSPCODE]
(
[ID] [int] NOT NULL,
[CODE] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[DESCRIPTION] [nvarchar] (max) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TPRC_LOGM_EX_SAPNSPCODE] ADD CONSTRAINT [PK_lkpNSSAPECCPCODE] PRIMARY KEY CLUSTERED  ([CODE]) ON [PRIMARY]
GO