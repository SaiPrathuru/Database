CREATE TABLE [dbo].[TPRC_LOGM_EX_GLOBALJOBTITLE]
(
[Global Job Title] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[Global Job Title Group] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Global Job Title Group 2] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TPRC_LOGM_EX_GLOBALJOBTITLE] ADD CONSTRAINT [PK_lkpGlobalJobTitle] PRIMARY KEY CLUSTERED  ([Global Job Title]) ON [PRIMARY]
GO
