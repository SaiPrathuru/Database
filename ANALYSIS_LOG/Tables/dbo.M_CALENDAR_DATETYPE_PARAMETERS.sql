CREATE TABLE [dbo].[M_CALENDAR_DATETYPE_PARAMETERS]
(
[DateType] [nvarchar] (50) COLLATE Japanese_XJIS_100_BIN2 NULL,
[RangeNegative] [int] NULL,
[RangePositive] [int] NULL,
[DateTypeLookupKey] [nvarchar] (50) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DateTypeColumnName] [nvarchar] (50) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DateTypePrefixSingular] [nvarchar] (50) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DateTypePrefixPlural] [nvarchar] (50) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DateTypeOtherText] [nvarchar] (50) COLLATE Japanese_XJIS_100_BIN2 NULL,
[SuffixPast] [nvarchar] (50) COLLATE Japanese_XJIS_100_BIN2 NULL,
[SuffixCurrent] [nvarchar] (50) COLLATE Japanese_XJIS_100_BIN2 NULL,
[SuffixFuture] [nvarchar] (50) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
