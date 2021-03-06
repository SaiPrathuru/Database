CREATE TABLE [dbo].[T_GPR_MM_DW2_R14_R14_CC_REQUEST_TO]
(
[R14_R14_MASTER_ID] [int] NOT NULL,
[R14_CC_REQUEST_TO] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[CREATED_DATE] [datetime2] NULL,
[MODIFIED_DATE] [datetime2] NULL,
[INSERTDATETIME] [datetime] NULL,
[UPDATEDATETIME] [datetime] NULL,
[DELETE_FLAG] [nvarchar] (3) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[T_GPR_MM_DW2_R14_R14_CC_REQUEST_TO] ADD CONSTRAINT [PK_T_GPR_MM_DW2_R14_R14_CC_REQUEST_TO] PRIMARY KEY CLUSTERED  ([R14_R14_MASTER_ID], [R14_CC_REQUEST_TO]) ON [PRIMARY]
GO
