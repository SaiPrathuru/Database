CREATE TABLE [dbo].[SSIS Configurations]
(
[ConfigurationFilter] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[ConfiguredValue] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PackagePath] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[ConfiguredValueType] [nvarchar] (20) COLLATE Japanese_XJIS_100_BIN2 NOT NULL
) ON [PRIMARY]
GO
