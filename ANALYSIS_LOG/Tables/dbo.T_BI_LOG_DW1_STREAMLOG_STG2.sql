CREATE TABLE [dbo].[T_BI_LOG_DW1_STREAMLOG_STG2]
(
[CreationDate] [datetime] NULL,
[UserIds] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Opearations] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ResourceUrl] [nvarchar] (1024) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ResourceTitle] [nvarchar] (1024) COLLATE Japanese_XJIS_100_BIN2 NULL,
[EntityPath] [nvarchar] (1024) COLLATE Japanese_XJIS_100_BIN2 NULL,
[OperationDetails] [nvarchar] (1024) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ClientApplicationId] [nvarchar] (1024) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ObjectId] [nvarchar] (1024) COLLATE Japanese_XJIS_100_BIN2 NULL,
[UserId] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ClientIP] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Id] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[RecordType] [int] NULL,
[CreationTime] [datetime] NULL,
[Operation] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[OrganizationId] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[UserType] [int] NULL,
[UserKey] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Workload] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ResultStatus] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Version] [int] NULL
) ON [PRIMARY]
GO
