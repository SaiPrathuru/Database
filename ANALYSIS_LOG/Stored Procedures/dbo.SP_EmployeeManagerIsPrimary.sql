SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_EmployeeManagerIsPrimary] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
	
	/* Begin Declare Variables */
	DECLARE @Manager_Status_Code		NVARCHAR(1024) = null
	DECLARE @Manager_isPrimary			NVARCHAR(1024) = null
	DECLARE @Manager_User_ID			NVARCHAR(1024) = null
	DECLARE @User_ID					NVARCHAR(1024) = null
	DECLARE @Manager_Employee_ID		NVARCHAR(1024) = null
	DECLARE	@Employee_ID				NVARCHAR(1024) = null
	/* End Declare Variables */

	UPDATE M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT SET  [Manager isPrimary]=NULL,[Manager Status Code]=NULL


	DECLARE EMP_IsPrimary CURSOR FOR  		
	
	SELECT  [Manager User ID],
			[User ID]  ,
			[Manager Employee ID]
	FROM    M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT
	--WHERE   [Manager User ID]=''  --M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE


	OPEN EMP_IsPrimary   
	FETCH NEXT FROM EMP_IsPrimary
	INTO 
		@Manager_User_ID
		,@User_ID
		,@Manager_Employee_ID
		
  	WHILE @@FETCH_STATUS = 0   
	BEGIN
	
			BEGIN						
				
				SET @Manager_isPrimary	=NULL
				SET @Manager_Status_Code=NULL
				SET @Employee_ID=''
				

				SELECT  @Manager_isPrimary= isPrimaryMerged, 
						@Manager_Status_Code=[Status Code],
						@Employee_ID     =[Employee ID]
						--GET EMPLOYEE ID AND ASSIGN TO MANAGER EMPLOYEE ID IN UPDATE STATEMENT 
				FROM M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT
				WHERE [User ID]=	@Manager_User_ID			
				
				IF @Manager_Employee_ID<>''
					BEGIN
						UPDATE M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT SET [Manager isPrimary]=@Manager_isPrimary,[Manager Status Code]=@Manager_Status_Code
						WHERE [User ID]=@User_ID
					END
				ELSE
					BEGIN
					        --PRINT 'WE ARE IN ELSE PART'
							UPDATE M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT SET [Manager isPrimary]=@Manager_isPrimary,[Manager Status Code]=@Manager_Status_Code,[Manager Employee ID]=@Employee_ID
							WHERE [User ID]=@User_ID
					END
				
				
			END						
			
			FETCH NEXT FROM EMP_IsPrimary
			INTO 
					@Manager_User_ID
					,@User_ID
					,@Manager_Employee_ID
		
	END   	
	CLOSE EMP_IsPrimary
	DEALLOCATE EMP_IsPrimary



END

--EXECUTE [SP_EmployeeManagerIsPrimary]
--SELECT [Manager Status Code],[Manager Is Primary] FROM M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE WHERE [Manager Is Primary] IS NOT NULL
GO
