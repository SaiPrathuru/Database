CREATE TABLE [dbo].[T_PB_LOG_DW2_USAGEMETRICS]
(
[Date] [date] NOT NULL,
[DistributionMethod] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[Platform] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[ReportGuid] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[DisplayName] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[ReportPage] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[UserName] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[GivenName] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[FamilyName] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[UserGuid] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Total] [int] NULL,
[ViewersRank] [int] NULL,
[ViewsRank] [int] NULL,
[ViewsCount] [int] NULL,
[ViewersCount] [int] NULL,
[SYSTEMID] [int] NULL,
[FileName] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
