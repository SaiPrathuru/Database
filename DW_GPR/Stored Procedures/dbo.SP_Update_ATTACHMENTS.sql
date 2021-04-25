SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_Update_ATTACHMENTS]
(@ATTACHMENTS_ID INT,      
@ATTACHMENT_DOCUMENT_TYPE NVARCHAR(512),
@ATTACHMENT_DOCUMENT_ID INT,
@ATTACHMENT_ACTUAL_FILE_NAME NVARCHAR(512),
@ATTACHMENT_SYSTEM_FILE_NAME NVARCHAR(512),
@ATTACHMENT_FOLDER_PATH NVARCHAR(512),
@ATTACHMENT_TYPE NVARCHAR(512),
@CREATED_DATE DATETIME2(7),
@MODIFIED_DATE DATETIME2(7),
@UPDATEDATETIME DATETIME2(7),
@DDW2_UPDATE_TIME DATETIME,
@DELETE_FLAG NVARCHAR(3),
@DW				INT
)
	  
AS

BEGIN

SET NOCOUNT ON;
	
	IF @DW=2 
		BEGIN
				UPDATE dbo.T_GPR_MM_DW2_ATTACHMENTS
				SET
					   [ATTACHMENT_DOCUMENT_TYPE]=@ATTACHMENT_DOCUMENT_TYPE
					  ,[ATTACHMENT_ACTUAL_FILE_NAME]=@ATTACHMENT_ACTUAL_FILE_NAME
					  ,[ATTACHMENT_SYSTEM_FILE_NAME]=@ATTACHMENT_SYSTEM_FILE_NAME
					  ,[ATTACHMENT_FOLDER_PATH]=@ATTACHMENT_FOLDER_PATH
					  ,[ATTACHMENT_TYPE]=@ATTACHMENT_TYPE
					  ,[CREATED_DATE]=@CREATED_DATE
					  ,[MODIFIED_DATE]=@MODIFIED_DATE
					  ,[UPDATEDATETIME]=@UPDATEDATETIME
					  ,DELETE_FLAG=@DELETE_FLAG
				WHERE [ATTACHMENTS_ID] = @ATTACHMENTS_ID  AND ATTACHMENT_DOCUMENT_ID=@ATTACHMENT_DOCUMENT_ID
		END


	IF @DW=3 
		BEGIN
				UPDATE dbo.T_GPR_MM_DW3_ATTACHMENTS
				SET
					   [ATTACHMENT_DOCUMENT_TYPE]=@ATTACHMENT_DOCUMENT_TYPE
					  ,[ATTACHMENT_ACTUAL_FILE_NAME]=@ATTACHMENT_ACTUAL_FILE_NAME
					  ,[ATTACHMENT_SYSTEM_FILE_NAME]=@ATTACHMENT_SYSTEM_FILE_NAME
					  ,[ATTACHMENT_FOLDER_PATH]=@ATTACHMENT_FOLDER_PATH
					  ,[ATTACHMENT_TYPE]=@ATTACHMENT_TYPE
					  ,[CREATED_DATE]=@CREATED_DATE
					  ,[MODIFIED_DATE]=@MODIFIED_DATE
					  ,[UPDATEDATETIME]=@UPDATEDATETIME
					  ,DELETE_FLAG=@DELETE_FLAG
					  ,DW2_UPDATE_TIME=@DDW2_UPDATE_TIME
				WHERE [ATTACHMENTS_ID] = @ATTACHMENTS_ID  AND ATTACHMENT_DOCUMENT_ID=@ATTACHMENT_DOCUMENT_ID
		END
END
GO