CREATE TABLE [dbo].[SAP_LOG_M_FL_SAPUSERDATA]
(
[UserName] [nvarchar] (16) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[FirstName] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[LastName] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[DSnumber] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[EmailId] [nvarchar] (128) COLLATE Japanese_XJIS_100_BIN2 NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SAP_LOG_M_FL_SAPUSERDATA] ADD CONSTRAINT [PK_tblSAPUserData] PRIMARY KEY CLUSTERED  ([UserName], [FirstName], [LastName], [DSnumber], [EmailId]) ON [PRIMARY]
GO
