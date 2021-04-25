CREATE TABLE [dbo].[hris_ml]
(
[Employee ID] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[User ID] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Status Code] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Assignment Type] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[isPrimary] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[isPrimary Global Assignment] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Employee Type] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[isPrimaryMerged] [nvarchar] (8) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
