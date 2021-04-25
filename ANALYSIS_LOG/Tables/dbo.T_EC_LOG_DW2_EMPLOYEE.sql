CREATE TABLE [dbo].[T_EC_LOG_DW2_EMPLOYEE]
(
[EventId] [bigint] NOT NULL IDENTITY(1, 1),
[FileCreatedDate] [datetime] NULL,
[FileModifiedDate] [datetime] NULL,
[TaskName] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[StartTimeStamp] [datetime] NULL,
[EndTimeStamp] [datetime] NULL,
[RecordCount] [int] NULL,
[Duration] [int] NULL,
[Status] [nvarchar] (16) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ErrorMessage] [nvarchar] (1024) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
