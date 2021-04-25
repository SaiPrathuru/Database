CREATE TABLE [dbo].[hris_ml1]
(
[Employee ID] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[User ID] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Status Code] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Assignment Type] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[isPrimary] [bit] NULL,
[isPrimary Global Assignment] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Employee Type] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[isPrimaryMerged] [bit] NULL
) ON [PRIMARY]
GO
