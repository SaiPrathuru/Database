CREATE TABLE [dbo].[T_UAL_LOG_DW2_UNIFIEDAUDIT]
(
[Id] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[CreationTime] [datetime] NOT NULL,
[CreationTimeUTC] [datetime] NULL,
[RecordType] [int] NULL,
[Operation] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[OrganizationId] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[UserType] [int] NULL,
[UserKey] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Workload] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[UserId] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ClientIP] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[UserAgent] [nvarchar] (max) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Activity] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ItemName] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[WorkSpaceName] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DashboardName] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DatasetName] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ReportName] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[WorkspaceId] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ObjectId] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DashboardId] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DatasetId] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ReportId] [nvarchar] (512) COLLATE Japanese_XJIS_100_BIN2 NULL,
[OrgAppPermission] [nvarchar] (max) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Datasets] [nvarchar] (max) COLLATE Japanese_XJIS_100_BIN2 NULL,
[SYSTEMID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[T_UAL_LOG_DW2_UNIFIEDAUDIT] ADD CONSTRAINT [PK_tblUnifiedAuditLog] PRIMARY KEY CLUSTERED  ([Id], [CreationTime]) ON [PRIMARY]
GO
