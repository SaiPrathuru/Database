SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_Update_EPR_EPR_MASTER]
(@EPR_EPR_MASTER_ID int,
@EPR_NUMBER    nvarchar(20),
@EPR_STATUS nvarchar(100) ,
@COMPANY_CODE nvarchar(20),
@EPR_INITIATOR nvarchar(100)
      ,@EPR_INITIATE_DATE datetime2(7)
      ,@EPR_REQUESTOR nvarchar(100)
      ,@EPR_TITLE nvarchar(100)
      ,@CURRENCY_NAME nvarchar(20)
      ,@CURRENCY_RATE MONEY
      ,@EPR_CATEGORY nvarchar(100)
      ,@EPR_DOCUMENT_TYPE nvarchar(100)
      ,@EPR_NOTES nvarchar(4000)
      ,@IS_R14 nvarchar(3)
      ,@R14_NUMBER nvarchar(20)
      ,@IS_LEGAL nvarchar(3)
      ,@ONIT_NUMBER nvarchar(100)
      ,@SUPPLIER_CODE nvarchar(100)
      ,@EPR_PO_SUPPLIER_REMARK nvarchar(100)
      ,@EPR_PURCHASING_GROUP nvarchar(100)
      ,@SUPPLIER_NAME nvarchar(100)
      ,@EPR_APPLICATION_PRIORITY nvarchar(100)
      ,@EPR_APPLICATION_ITEM_SUMMARY nvarchar(100)
      ,@EPR_BUDGET_AMOUNT money
      ,@EPR_CONTRACT_TERM_START_DATE datetime2(7)
      ,@EPR_CONTRACT_TERM_EXPIRE_DATE datetime2(7)
      ,@EPR_RISK_AND_COPING_STRATEGY nvarchar(100)
      ,@SAP_SUPPLIER_LOCATION_ID nvarchar(100)
      ,@IS_CATALOG nvarchar(3)
      ,@EPR_RELATED_PR nvarchar(100)
      ,@UPDATEDATETIME datetime
	  ,@MODIFIED_DATE  datetime2(7)
	  ,@DW			INT)
	  
AS

BEGIN

SET NOCOUNT ON;
	
	IF @DW=2
		BEGIN
				UPDATE dbo.T_GPR_MM_DW2_EPR_EPR_MASTER
				SET

				--@EPR_NUMBER
				  EPR_STATUS=    @EPR_STATUS,
				  COMPANY_CODE=    @COMPANY_CODE,
				  EPR_INITIATOR=    @EPR_INITIATOR,
				  EPR_INITIATE_DATE=   @EPR_INITIATE_DATE,
				  EPR_REQUESTOR=    @EPR_REQUESTOR,
				   EPR_TITLE=   @EPR_TITLE,
					CURRENCY_NAME=  @CURRENCY_NAME,
					CURRENCY_RATE=  @CURRENCY_RATE,
					EPR_CATEGORY=  @EPR_CATEGORY,
				   EPR_DOCUMENT_TYPE=   @EPR_DOCUMENT_TYPE,
				   EPR_NOTES=   @EPR_NOTES,
				   IS_R14=   @IS_R14,
				   R14_NUMBER=   @R14_NUMBER,
				   IS_LEGAL=   @IS_LEGAL,
				   ONIT_NUMBER =  @ONIT_NUMBER,
				   SUPPLIER_CODE=   @SUPPLIER_CODE,
				   EPR_PO_SUPPLIER_REMARK=   @EPR_PO_SUPPLIER_REMARK,
				   EPR_PURCHASING_GROUP=   @EPR_PURCHASING_GROUP,
				   SUPPLIER_NAME=   @SUPPLIER_NAME,
				   EPR_APPLICATION_PRIORITY=   @EPR_APPLICATION_PRIORITY,
				   EPR_APPLICATION_ITEM_SUMMARY=   @EPR_APPLICATION_ITEM_SUMMARY,
				   EPR_BUDGET_AMOUNT=   @EPR_BUDGET_AMOUNT,
				   EPR_CONTRACT_TERM_START_DATE=   @EPR_CONTRACT_TERM_START_DATE,
				   EPR_CONTRACT_TERM_EXPIRE_DATE=   @EPR_CONTRACT_TERM_EXPIRE_DATE,
				  EPR_RISK_AND_COPING_STRATEGY  =  @EPR_RISK_AND_COPING_STRATEGY,
				  SAP_SUPPLIER_LOCATION_ID=    @SAP_SUPPLIER_LOCATION_ID,
				  IS_CATALOG=   @IS_CATALOG,
				   EPR_RELATED_PR=   @EPR_RELATED_PR,
				   MODIFIED_DATE=@MODIFIED_DATE,
				   UPDATEDATETIME=@UPDATEDATETIME
				WHERE EPR_EPR_MASTER_ID = @EPR_EPR_MASTER_ID
			END


	IF @DW=3
		BEGIN
				UPDATE dbo.T_GPR_MM_DW3_EPR_EPR_MASTER
				SET

				--@EPR_NUMBER
				  EPR_STATUS=    @EPR_STATUS,
				  COMPANY_CODE=    @COMPANY_CODE,
				  EPR_INITIATOR=    @EPR_INITIATOR,
				  EPR_INITIATE_DATE=   @EPR_INITIATE_DATE,
				  EPR_REQUESTOR=    @EPR_REQUESTOR,
				   EPR_TITLE=   @EPR_TITLE,
					CURRENCY_NAME=  @CURRENCY_NAME,
					CURRENCY_RATE=  @CURRENCY_RATE,
					EPR_CATEGORY=  @EPR_CATEGORY,
				   EPR_DOCUMENT_TYPE=   @EPR_DOCUMENT_TYPE,
				   EPR_NOTES=   @EPR_NOTES,
				   IS_R14=   @IS_R14,
				   R14_NUMBER=   @R14_NUMBER,
				   IS_LEGAL=   @IS_LEGAL,
				   ONIT_NUMBER =  @ONIT_NUMBER,
				   SUPPLIER_CODE=   @SUPPLIER_CODE,
				   EPR_PO_SUPPLIER_REMARK=   @EPR_PO_SUPPLIER_REMARK,
				   EPR_PURCHASING_GROUP=   @EPR_PURCHASING_GROUP,
				   SUPPLIER_NAME=   @SUPPLIER_NAME,
				   EPR_APPLICATION_PRIORITY=   @EPR_APPLICATION_PRIORITY,
				   EPR_APPLICATION_ITEM_SUMMARY=   @EPR_APPLICATION_ITEM_SUMMARY,
				   EPR_BUDGET_AMOUNT=   @EPR_BUDGET_AMOUNT,
				   EPR_CONTRACT_TERM_START_DATE=   @EPR_CONTRACT_TERM_START_DATE,
				   EPR_CONTRACT_TERM_EXPIRE_DATE=   @EPR_CONTRACT_TERM_EXPIRE_DATE,
				  EPR_RISK_AND_COPING_STRATEGY  =  @EPR_RISK_AND_COPING_STRATEGY,
				  SAP_SUPPLIER_LOCATION_ID=    @SAP_SUPPLIER_LOCATION_ID,
				  IS_CATALOG=   @IS_CATALOG,
				   EPR_RELATED_PR=   @EPR_RELATED_PR,
				   MODIFIED_DATE=@MODIFIED_DATE,
				   UPDATEDATETIME=@UPDATEDATETIME
				WHERE EPR_EPR_MASTER_ID = @EPR_EPR_MASTER_ID
			END


END
GO
