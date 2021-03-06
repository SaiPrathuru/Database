CREATE TABLE [dbo].[M_BC_LOG_DW2_REPORTS]
(
[ID] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[OWNERID] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[FOLDERNAME] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[CREATEDDATE] [datetime] NULL,
[CREATEDBYID] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[LASTMODIFIEDDATE] [datetime] NULL,
[LASTMODIFIEDBYID] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ISDELETED] [bit] NULL,
[NAME] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DESCRIPTION] [nvarchar] (max) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DEVELOPERNAME] [nvarchar] (2048) COLLATE Japanese_XJIS_100_BIN2 NULL,
[NAMESPACEPREFIX] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[LASTRUNDATE] [datetime] NULL,
[SYSTEMMODSTAMP] [datetime] NULL,
[FORMAT] [nvarchar] (255) COLLATE Japanese_XJIS_100_BIN2 NULL,
[LASTVIEWEDDATE] [datetime] NULL,
[LASTREFERENCEDDATE] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[M_BC_LOG_DW2_REPORTS] ADD CONSTRAINT [PK_tblBabooReportInfo] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
