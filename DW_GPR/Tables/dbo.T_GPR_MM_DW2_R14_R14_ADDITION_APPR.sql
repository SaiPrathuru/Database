CREATE TABLE [dbo].[T_GPR_MM_DW2_R14_R14_ADDITION_APPR]
(
[R14_R14_MASTER_ID] [int] NOT NULL,
[R14_ADDITION_APPR] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[CREATED_DATE] [datetime2] NULL,
[MODIFIED_DATE] [datetime2] NULL,
[INSERTDATETIME] [datetime] NULL,
[UPDATEDATETIME] [datetime] NULL,
[DELETE_FLAG] [nvarchar] (3) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[T_GPR_MM_DW2_R14_R14_ADDITION_APPR] ADD CONSTRAINT [PK_T_GPR_MM_DW2_R14_R14_ADDITION_APPR] PRIMARY KEY CLUSTERED  ([R14_R14_MASTER_ID], [R14_ADDITION_APPR]) ON [PRIMARY]
GO
