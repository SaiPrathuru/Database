SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE     PROCEDURE [dbo].[SP_Update_EPR_EPR_DETAIL]
(@PRD_EPR_DETAIL_ID	INT,
@PRD_EPR_MASTER_ID	INT,
@PRD_CATALOG	NVARCHAR(1000),
@PRD_DESCRIPTION	NVARCHAR(1000),
@PRD_QUANTITY	FLOAT,
@PRD_UOM	NVARCHAR(100),
@PRD_PRICE	FLOAT,
@PRD_PRICE_UNIT_QUANTITY	FLOAT,
@PRD_PRICE_UNIT	NVARCHAR(100),
@PRD_PRICE_UNIT_CONVERT	FLOAT,
@PRD_COMMODITY	NVARCHAR(100),
@PRD_SPECIFICATION_NO	NVARCHAR(100),
@PRD_QUOTATION_NO	NVARCHAR(100),
@PRD_INSPECTION_CODE	NVARCHAR(100),
@PRD_ORDER_FACTORY_FREE_AREA	NVARCHAR(100),
@PRD_PLANT	NVARCHAR(100),
@PRD_STORAGE	NVARCHAR(100),
@PRD_CONSIGNEE	NVARCHAR(100),
@PRD_ARRIVAL_DATE	DATETIME,
@PRD_2ND_SUPPLIER	NVARCHAR(100),
@PRD_MATERIAL_CODE	NVARCHAR(100),
@PRD_ACC_ASSIGN_CATEGORY	NVARCHAR(100),
@PRD_ACC_CATEGORY	NVARCHAR(100),
@PRD_BILLTO	NVARCHAR(100),
@PRD_BILL_RECEIVER	NVARCHAR(100),
@PRD_ITEM_CATEGORY	NVARCHAR(100),
@PRD_GL_CODE	NVARCHAR(100),
@PRD_COST_CENTER	NVARCHAR(100),
@PRD_EXPENSE_ITEM	NVARCHAR(100),
@PRD_DEPT_CODE	NVARCHAR(100),
@PRD_INTERNAL_ORDER	NVARCHAR(100),
@PRD_PROJECT_WBS	NVARCHAR(100),
@PRD_DELIVERY_POINT	NVARCHAR(100),
@PRD_DIRECT_DELIVERY_POINT	NVARCHAR(100),
@PRD_DELIVER_TO	NVARCHAR(100),
@PRD_ASSET_NO	NVARCHAR(100),
@PRD_SUPPLIER_PART_ID	NVARCHAR(1000),
@UPDATEDATETIME	DATETIME,
@MODIFIED_DATE  DATETIME2(7),
@DW2_MODIFIEDDATE  DATETIME2(7),
@DELETE_FLAG NVARCHAR(3),
@DW				INT)
	  
AS

BEGIN

SET NOCOUNT ON;

	IF @DW=2 
		BEGIN
				UPDATE dbo.T_GPR_MM_DW2_EPR_EPR_DETAIL
				SET

				--@EPR_NUMBER
				PRD_CATALOG	=@PRD_CATALOG,
				PRD_DESCRIPTION	=@PRD_DESCRIPTION,
				PRD_QUANTITY	=@PRD_QUANTITY,
				PRD_UOM	=@PRD_UOM,
				PRD_PRICE	=@PRD_PRICE,
				PRD_PRICE_UNIT_QUANTITY	=@PRD_PRICE_UNIT_QUANTITY,
				PRD_PRICE_UNIT	=@PRD_PRICE_UNIT,
				PRD_PRICE_UNIT_CONVERT	=@PRD_PRICE_UNIT_CONVERT,
				PRD_COMMODITY	=@PRD_COMMODITY,
				PRD_SPECIFICATION_NO	=@PRD_SPECIFICATION_NO,
				PRD_QUOTATION_NO	=@PRD_QUOTATION_NO,
				PRD_INSPECTION_CODE	=@PRD_INSPECTION_CODE,
				PRD_ORDER_FACTORY_FREE_AREA	=@PRD_ORDER_FACTORY_FREE_AREA,
				PRD_PLANT	=@PRD_PLANT,
				PRD_STORAGE	=@PRD_STORAGE,
				PRD_CONSIGNEE	=@PRD_CONSIGNEE,
				PRD_ARRIVAL_DATE	=@PRD_ARRIVAL_DATE,
				PRD_2ND_SUPPLIER	=@PRD_2ND_SUPPLIER,
				PRD_MATERIAL_CODE	=@PRD_MATERIAL_CODE,
				PRD_ACC_ASSIGN_CATEGORY	=@PRD_ACC_ASSIGN_CATEGORY,
				PRD_ACC_CATEGORY	=@PRD_ACC_CATEGORY,
				PRD_BILLTO	=@PRD_BILLTO,
				PRD_BILL_RECEIVER	=@PRD_BILL_RECEIVER,
				PRD_ITEM_CATEGORY	=@PRD_ITEM_CATEGORY,
				PRD_GL_CODE	=@PRD_GL_CODE,
				PRD_COST_CENTER	=@PRD_COST_CENTER,
				PRD_EXPENSE_ITEM	=@PRD_EXPENSE_ITEM,
				PRD_DEPT_CODE	=@PRD_DEPT_CODE,
				PRD_INTERNAL_ORDER	=@PRD_INTERNAL_ORDER,
				PRD_PROJECT_WBS	=@PRD_PROJECT_WBS,
				PRD_DELIVERY_POINT	=@PRD_DELIVERY_POINT,
				PRD_DIRECT_DELIVERY_POINT	=@PRD_DIRECT_DELIVERY_POINT,
				PRD_DELIVER_TO	=@PRD_DELIVER_TO,
				PRD_ASSET_NO	=@PRD_ASSET_NO,
				PRD_SUPPLIER_PART_ID	=@PRD_SUPPLIER_PART_ID,
				UPDATEDATETIME	=@UPDATEDATETIME,
				MODIFIED_DATE =@MODIFIED_DATE,
				DELETE_FLAG=@DELETE_FLAG
				WHERE PRD_EPR_DETAIL_ID= @PRD_EPR_DETAIL_ID
		END

		IF @DW=3 
		BEGIN
				UPDATE dbo.T_GPR_MM_DW3_EPR_EPR_DETAIL
				SET

				--@EPR_NUMBER
				PRD_CATALOG	=@PRD_CATALOG,
				PRD_DESCRIPTION	=@PRD_DESCRIPTION,
				PRD_QUANTITY	=@PRD_QUANTITY,
				PRD_UOM	=@PRD_UOM,
				PRD_PRICE	=@PRD_PRICE,
				PRD_PRICE_UNIT_QUANTITY	=@PRD_PRICE_UNIT_QUANTITY,
				PRD_PRICE_UNIT	=@PRD_PRICE_UNIT,
				PRD_PRICE_UNIT_CONVERT	=@PRD_PRICE_UNIT_CONVERT,
				PRD_COMMODITY	=@PRD_COMMODITY,
				PRD_SPECIFICATION_NO	=@PRD_SPECIFICATION_NO,
				PRD_QUOTATION_NO	=@PRD_QUOTATION_NO,
				PRD_INSPECTION_CODE	=@PRD_INSPECTION_CODE,
				PRD_ORDER_FACTORY_FREE_AREA	=@PRD_ORDER_FACTORY_FREE_AREA,
				PRD_PLANT	=@PRD_PLANT,
				PRD_STORAGE	=@PRD_STORAGE,
				PRD_CONSIGNEE	=@PRD_CONSIGNEE,
				PRD_ARRIVAL_DATE	=@PRD_ARRIVAL_DATE,
				PRD_2ND_SUPPLIER	=@PRD_2ND_SUPPLIER,
				PRD_MATERIAL_CODE	=@PRD_MATERIAL_CODE,
				PRD_ACC_ASSIGN_CATEGORY	=@PRD_ACC_ASSIGN_CATEGORY,
				PRD_ACC_CATEGORY	=@PRD_ACC_CATEGORY,
				PRD_BILLTO	=@PRD_BILLTO,
				PRD_BILL_RECEIVER	=@PRD_BILL_RECEIVER,
				PRD_ITEM_CATEGORY	=@PRD_ITEM_CATEGORY,
				PRD_GL_CODE	=@PRD_GL_CODE,
				PRD_COST_CENTER	=@PRD_COST_CENTER,
				PRD_EXPENSE_ITEM	=@PRD_EXPENSE_ITEM,
				PRD_DEPT_CODE	=@PRD_DEPT_CODE,
				PRD_INTERNAL_ORDER	=@PRD_INTERNAL_ORDER,
				PRD_PROJECT_WBS	=@PRD_PROJECT_WBS,
				PRD_DELIVERY_POINT	=@PRD_DELIVERY_POINT,
				PRD_DIRECT_DELIVERY_POINT	=@PRD_DIRECT_DELIVERY_POINT,
				PRD_DELIVER_TO	=@PRD_DELIVER_TO,
				PRD_ASSET_NO	=@PRD_ASSET_NO,
				PRD_SUPPLIER_PART_ID	=@PRD_SUPPLIER_PART_ID,
				UPDATEDATETIME	=@UPDATEDATETIME,
				MODIFIED_DATE =@MODIFIED_DATE,
				DW2_UPDATE_TIME=@DW2_MODIFIEDDATE,
				DELETE_FLAG=@DELETE_FLAG
				WHERE PRD_EPR_DETAIL_ID= @PRD_EPR_DETAIL_ID
		END
END
GO
