CREATE TABLE [dbo].[T_BI_LOG_DW2_RDBUSERTRACELOG]
(
[RowNumber] [int] NOT NULL,
[EventClass] [int] NULL,
[BinaryData] [image] NULL,
[NTUserName] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ClientProcessID] [int] NULL,
[ApplicationName] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[LoginName] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[SPID] [int] NULL,
[Duration] [bigint] NULL,
[StartTime] [datetime] NULL,
[EndTime] [datetime] NULL,
[Reads] [bigint] NULL,
[Writes] [bigint] NULL,
[CPU] [int] NULL,
[TextData] [ntext] COLLATE Japanese_XJIS_100_BIN2 NULL,
[DatabaseID] [int] NULL,
[DatabaseName] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NULL,
[SYSTEMID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[T_BI_LOG_DW2_RDBUSERTRACELOG] ADD CONSTRAINT [PK__tblRDBUs__AAAC09D8357B9B7B] PRIMARY KEY CLUSTERED  ([RowNumber]) ON [PRIMARY]
GO
