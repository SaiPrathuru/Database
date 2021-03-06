CREATE TABLE [dbo].[EMPLOYEE]
(
[User ID] [varchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Username] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Full Name] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[First Name] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Last Name] [varchar] (50) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Email] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DS Number] [varchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DS ID Number] [varchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Global Job Grade] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Global Job Title] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Local Job Grade] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Local Job Title] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Location] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Group Region] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Global Unit] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Global Division] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Unit Name (Regional)] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Unit Short Name (Regional)] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Division Name (Regional)] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Department Name (Regional)] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Section Name (Regional)] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager User ID] [varchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager User Name] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager Full Name] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager First Name] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager Last Name] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager Email] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager DS Number ] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager DS ID Number] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Direct Reports] [real] NULL,
[TotalTeamSize] [real] NULL,
[Status] [varchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Status Code] [varchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Is Primary] [varchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Employee Type] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Employment Type] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Employment Type (Japanese)] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Assignment Type] [varchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Last Inactivation Date] [varchar] (50) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Termination Date] [varchar] (50) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Last Modified Date] [varchar] (50) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Created Date] [varchar] (50) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DS ID] [varchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager DS ID] [varchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
