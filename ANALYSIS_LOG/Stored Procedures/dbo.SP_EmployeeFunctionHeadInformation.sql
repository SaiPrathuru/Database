SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_EmployeeFunctionHeadInformation] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	/*
	End users will ultimately maintain the Function Head List.
	As such, we can trust that the Email address provided in the "Function Head" field is accurate.
	Conversely, it is naive to expect an End User to correctly derive a DS Number given how these can change.
	We select all Function Names and join by email, selecting both the User ID and the DS Number for later use.
	
	--Notes 20191119
	We should change (and add) the column name for Function Head DS ID.
	[Function Head User ID]
	[Function Head DS Number]
	
	
	Todo:
	1) Need to start by clearing previous Function Head data
	2) Need to create columns listed above
	3) Need to split out Function Head Procedure into own procedure
	*/
	
	/* Begin Declare Variables */
	DECLARE @FunctionName					NVARCHAR(1024) = null
	DECLARE @FunctionHeadDSNumber			NVARCHAR(1024) = null
	DECLARE @FunctionHeadUserID				NVARCHAR(1024) = null
	DECLARE @UserFullName					NVARCHAR(1024) = null
	DECLARE @Email_Address					NVARCHAR(1024) = null
	DECLARE @Global_Unit					NVARCHAR(1024) = null
	DECLARE @Global_Division				NVARCHAR(1024) = null
	--DECLARE @User_ID						NVARCHAR(1024) = null
	DECLARE @Employee_ID					NVARCHAR(1024) = null
	/* End Declare Variables */


	/* Begin Clear Function Head Values */
	UPDATE [ANALYSIS_LOG].[dbo].[M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE]
	SET
					
					[Function Head Employee ID]				= @Employee_ID ---@User_ID
					,[Function Head DS Number] 			= @FunctionHeadDSNumber
					,[Function Name] 					= @FunctionName
					,[Function Head Name]				= @UserFullName
					,[Function Head Global Unit]		= @Global_Unit
					,[Function Head Global Division]	= @Global_Division
					,[Function Head Email]				= @Email_Address
	/* End Clear Function Head Values */
	
	/* Begin Update of Function Head Values */
	DECLARE EMP_FunctionHead CURSOR FOR  		
	
	SELECT
		B.[DS Number]
		,A.[Function Name]
		,B.[User Full Name]
		--,B.[Global Unit] Sai 08/20/20
		--,B.[Global Division] Sai 08/20/20
		,B.[Email]  -- Sai changed on 03/10/2020 from [Email Address] to [Email]
		--,B.[User ID] Sai 01/16/2020 changed it to Employee ID as we are using Employee Id in Hierarchy
		,B.[Employee ID]
	FROM 
		[ANALYSIS_LOG].[dbo].[TPRC_LOGM_EX_FUNCTIONS] A,
		--[ANALYSIS_LOG].[dbo].[M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT] B 
		--Sai changed on 03/10/20 the join to Source table to get unique records. It appears out of order logically but since it happens before truncate it should be fine
		-- We may have to revisit this if we found that  more records are out of sync

		[ANALYSIS_LOG].[dbo].M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE B
	WHERE
	    --Sai changed on 03/10/20 the join from 	B.[Email Address] = A.[Function Head]  to 	B.[Employee ID]= A.[Function Head Employee ID]
		B.[Employee ID]= A.[Function Head Employee ID] 
		--Sai added the AND clause on 03/10/20 to remove the Undefined records
		AND B.Hierarchy<>'Undefined' 
		AND B.[Match Found]=1
		
		-- Added just in case the function head list might have a blank.
		AND A.[Function Head] IS NOT NULL AND A.[Function Head] <> ''
	ORDER BY
		/*
		Sorting by Function order is important because by starting at the top level,
		data will be further overwritten when a lower level Function Head is defined.
		This allows for more granularity to be defined when necessary.
		*/
		A.[Function Order] ASC


	OPEN EMP_FunctionHead    
	FETCH NEXT FROM EMP_FunctionHead  
	INTO 
		@FunctionHeadDSNumber
		,@FunctionName
		,@UserFullName
		--,@Global_Unit Sai 08/20/2020
		--,@Global_Division Sai 08/20/2020
		,@Email_Address
		,@Employee_ID --@User_ID
		
  	WHILE @@FETCH_STATUS = 0   
	BEGIN
	
			BEGIN						
				UPDATE	[ANALYSIS_LOG].[dbo].[M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT]
					SET 
--					
					[Function Head Employee ID]				= @Employee_ID ---@User_ID
					,[Function Head DS Number] 			= @FunctionHeadDSNumber
					,[Function Name] 					= @FunctionName
					,[Function Head Name]				= @UserFullName
					,[Function Head Global Unit]		= @Global_Unit
					,[Function Head Global Division]	= @Global_Division
					,[Function Head Email]				= @Email_Address
				WHERE
					/*
					Hiearchy is build using User IDs, so we need to search using User_ID
					*/
					[Hierarchy] LIKE '%' + @Employee_ID + '%'
			END						
			
			FETCH NEXT FROM EMP_FunctionHead  
			INTO 
				@FunctionHeadDSNumber
				,@FunctionName
				,@UserFullName
				--,@Global_Unit Sai 08/20/2020
				--,@Global_Division Sai 08/20/2020
				,@Email_Address
				,@Employee_ID  --@User_ID
	END   	
	CLOSE EMP_FunctionHead    
	DEALLOCATE EMP_FunctionHead



END
GO
