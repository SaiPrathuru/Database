CREATE TABLE [dbo].[M_EC_LOG_DW2_EMPLOYEEINFO]
(
[User ID] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[First Name] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Last Name] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Email] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager User ID] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager First Name] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager Last Name] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager Email] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Location] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Business Unit Name] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Division Name] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Department Name] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Section Name] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Unit Short Name] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Region] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DLM1 First Name] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DLM1 Last Name] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DLM1 Email] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DLM2 First Name] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DLM2 Last Name] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DLM2 Email] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager DS ID] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Hierarchy Level] [int] NULL,
[Function Name] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Team Size] [int] NULL,
[Direct Reports] [int] NULL,
[DS Number] [nvarchar] (16) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Global Job Grade] [nvarchar] (16) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Global Job Title] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Local Job Grade] [nvarchar] (16) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Local Job Title] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Employee Status] [nvarchar] (16) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DLM1 DS Number] [nvarchar] (16) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DLM2 DS Number] [nvarchar] (16) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Hierarchy] [nvarchar] (1024) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Function Head DS ID] [nvarchar] (16) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Function Head Name] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Function Head Unit] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Function Head Division] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Function Head Email] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Function Head Unit Short Name] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Login Type] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO