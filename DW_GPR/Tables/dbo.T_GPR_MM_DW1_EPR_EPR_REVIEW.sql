CREATE TABLE [dbo].[T_GPR_MM_DW1_EPR_EPR_REVIEW]
(
[EPR_EPR_REVIEW_ID] [int] NULL,
[EPR_EPR_MASTER_ID] [int] NULL,
[EPR_CLOSURE_TYPE] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[EPR_CLOSURE_REMARK] [nvarchar] (1000) COLLATE Japanese_XJIS_100_BIN2 NULL,
[EPR_REVIEW_TYPE] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[EPR_CLOSURE_BY] [nvarchar] (20) COLLATE Japanese_XJIS_100_BIN2 NULL,
[EPR_CLOSURE_DATE] [datetime2] NULL,
[CREATED_DATE] [datetime2] NULL,
[MODIFIED_DATE] [datetime2] NULL,
[EPR_EPR_REVIEW_DELEGATEE] [nvarchar] (20) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
