CREATE TABLE [dbo].[T_GPR_MM_DW1_CFG_CURRENCY_MASTER]
(
[CFG_CURRENCY_MASTER_ID] [int] NULL,
[CURRENCY_NAME] [nvarchar] (20) COLLATE Japanese_XJIS_100_BIN2 NULL,
[CURRENCY_DESCRIPTION] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[ACTIVE] [char] (3) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
