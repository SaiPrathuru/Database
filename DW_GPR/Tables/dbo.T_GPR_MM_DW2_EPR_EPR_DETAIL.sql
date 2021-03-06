CREATE TABLE [dbo].[T_GPR_MM_DW2_EPR_EPR_DETAIL]
(
[PRD_EPR_DETAIL_ID] [int] NOT NULL,
[PRD_EPR_MASTER_ID] [int] NULL,
[PRD_CATALOG] [nvarchar] (1000) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_DESCRIPTION] [nvarchar] (1000) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_QUANTITY] [float] NULL,
[PRD_UOM] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_PRICE] [money] NULL,
[PRD_PRICE_UNIT_QUANTITY] [float] NULL,
[PRD_PRICE_UNIT] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_PRICE_UNIT_CONVERT] [float] NULL,
[PRD_COMMODITY] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_SPECIFICATION_NO] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_QUOTATION_NO] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_INSPECTION_CODE] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_ORDER_FACTORY_FREE_AREA] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_PLANT] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_STORAGE] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_CONSIGNEE] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_ARRIVAL_DATE] [datetime2] NULL,
[PRD_2ND_SUPPLIER] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_MATERIAL_CODE] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_ACC_ASSIGN_CATEGORY] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_ACC_CATEGORY] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_BILLTO] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_BILL_RECEIVER] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_ITEM_CATEGORY] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_GL_CODE] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_COST_CENTER] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_EXPENSE_ITEM] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_DEPT_CODE] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_INTERNAL_ORDER] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_PROJECT_WBS] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_DELIVERY_POINT] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_DIRECT_DELIVERY_POINT] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_DELIVER_TO] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_ASSET_NO] [nvarchar] (100) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRD_SUPPLIER_PART_ID] [nvarchar] (1000) COLLATE Japanese_XJIS_100_BIN2 NULL,
[CREATED_DATE] [datetime2] NULL,
[MODIFIED_DATE] [datetime2] NULL,
[INSERTDATETIME] [datetime] NULL,
[UPDATEDATETIME] [datetime] NULL,
[DELETE_FLAG] [nvarchar] (3) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[T_GPR_MM_DW2_EPR_EPR_DETAIL] ADD CONSTRAINT [PK_T_GPR_MM_DW2_EPR_EPR_DETAIL] PRIMARY KEY CLUSTERED  ([PRD_EPR_DETAIL_ID]) ON [PRIMARY]
GO
