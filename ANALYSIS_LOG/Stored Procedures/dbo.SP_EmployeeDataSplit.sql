SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		<Author,,Sai Prathuru>
-- Create date: <10/24/2019,,>
-- Description:	<This procedure is process the data splits,,>
-- Version  1.0
-- =============================================
CREATE PROCEDURE[dbo].[SP_EmployeeDataSplit]

AS
BEGIN

/* Variable declaration section*/
   
	DECLARE @Location					NVARCHAR(256)
	DECLARE @Location_Name				NVARCHAR(256)
	DECLARE @Location_Code				NVARCHAR(256)
	DECLARE	@Global_Unit				NVARCHAR(256)
	DECLARE @Global_Unit_Name			NVARCHAR(256)
	DECLARE	@Global_Unit_Code			NVARCHAR(256)
	DECLARE	@Global_Division			NVARCHAR(256)
	DECLARE	@Global_Division_Name		NVARCHAR(256)
	DECLARE	@Global_Division_Code		NVARCHAR(256)
	DECLARE	@Regional_Unit				NVARCHAR(256)
	DECLARE	@Regional_Unit_Name			NVARCHAR(256)
	DECLARE	@Regional_Unit_Code			NVARCHAR(256)
	DECLARE	@Regional_Unit_Short_Name   NVARCHAR(256)
	DECLARE	@Regional_Division			NVARCHAR(256)
	DECLARE	@Regional_Division_Name		NVARCHAR(256)
	DECLARE	@Regional_Division_Code		NVARCHAR(256)
	DECLARE	@Regional_Section_Code		NVARCHAR(256)
	DECLARE	@Regional_Section			NVARCHAR(256)
	DECLARE	@Regional_Section_Name		NVARCHAR(256)
	DECLARE	@Regional_Department_Code	NVARCHAR(256)
	DECLARE	@Regional_Department		NVARCHAR(256)
	DECLARE	@Regional_Department_Name	NVARCHAR(256)
	DECLARE	@First_Name					NVARCHAR(256)
	DECLARE	@Last_Name					NVARCHAR(256)
	DECLARE	@Full_Name					NVARCHAR(256)
	DECLARE	@Manager_First_Name			NVARCHAR(256)
	DECLARE	@Manager_Last_Name			NVARCHAR(256)
	DECLARE	@Manager_Full_Name			NVARCHAR(256)
	DECLARE @DS_Number					NVARCHAR(64)
	DECLARE @DS_ID_Number				NVARCHAR(64)
	DECLARE @Manager_DS_Number			NVARCHAR(64)
	DECLARE @Manager_DS_ID_Number		NVARCHAR(64)
	DECLARE	@ID							NVARCHAR(64)
	DECLARE @Manager_User_ID			NVARCHAR(64)
	DECLARE @Manager_Is_Primary			NVARCHAR(64)
	DECLARE @Manager_Status				NVARCHAR(64)
	DECLARE @Manager_Status_Code		NVARCHAR(64)	


	
	DECLARE EMPSplit_cursor CURSOR FOR  	
	SELECT 
			[User ID],[Location Name],[Global Unit Name],[Global Division Name],[Regional Unit Name],[Regional Division Name],[Regional Department Name],
			[Regional Section Name] ,[First Name],[Last Name],[Full Name],[Manager First Name],[Manager Last Name],[Manager Full Name],
			[DS Number],[DS ID Number],[Manager DS Number],[Manager DS ID Number],[Manager User ID]
	FROM	 [ANALYSIS_LOG].[dbo].M_EC_LOG_DW2_EMPLOYEEINFO_TEST 
	--WHERE [Employee Type] = 'Indirect' AND [Is Primary] = 'true'

	OPEN EMPSplit_cursor    
	FETCH NEXT FROM EMPSplit_cursor  INTO @ID,@Location_Name, @Global_Unit_Name,@Global_Division_Name,@Regional_Unit_Name,	
										   @Regional_Division_Name	,@Regional_Department_Name,@Regional_Section_Name,
										   @First_Name,@Last_Name,@Full_Name,@Manager_First_Name,@Manager_Last_Name,@Manager_Full_Name,
										   @DS_Number,@DS_ID_Number,@Manager_DS_Number,@Manager_DS_ID_Number,@Manager_User_ID
  	WHILE @@FETCH_STATUS = 0   

	BEGIN	   

			-- Get the manager Is primary and status values	
			SELECT @Manager_Is_Primary=[Is Primary],@Manager_Status=Status,@Manager_Status_Code= [Status Code] 
			FROM [ANALYSIS_LOG].[dbo].M_EC_LOG_DW2_EMPLOYEEINFO_TEST 
			WHERE [Manager User ID]=@Manager_User_ID

			--Start processing the data splits for LOCATION data
			IF CHARINDEX('(', REVERSE(@Location_Name))<1 
				BEGIN
					SET @Location='-'
					SET @Location_Code=TRIM(@Location_Name)
				END
			IF CHARINDEX('(', REVERSE(@Location_Name))>1 
				BEGIN
					SET @Location= TRIM(REPLACE(REPLACE(LTRIM(RTRIM(SUBSTRING(@Location_Name, 1, LEN(@Location_Name) - CHARINDEX('(', REVERSE(@Location_Name))) )),'(',' ('),'  (',' ('))
					SET @Location_Code=TRIM(LTRIM(RTRIM(REPLACE(SUBSTRING(@Location_Name,  LEN(@Location_Name) - CHARINDEX('(', REVERSE(@Location_Name))+2, LEN(@Location_Name) ),')',''))))
				END 
			--End processing the data splits for LOCATION data

			--Start processing the data splits for Global Unit data
			IF CHARINDEX('(', REVERSE(@Global_Unit_Name))<1 
				BEGIN
					SET @Global_Unit='-'			
				END
			ELSE
				BEGIN
					SET @Global_Unit=TRIM(SUBSTRING(@Global_Unit_Name, 1, LEN(@Global_Unit_Name) - CHARINDEX('(', REVERSE(@Global_Unit_Name))) )
				END 

			IF REPLACE(SUBSTRING(@Global_Unit_Name,  LEN(@Global_Unit_Name) - CHARINDEX('(', REVERSE(@Global_Unit_Name))+2, LEN(@Global_Unit_Name) ),')','')='' 
				BEGIN
					SET @Global_Unit_Code=TRIM(@Global_Unit_Name)
				END
			ELSE
				BEGIN
					SET @Global_Unit_Code=TRIM(REPLACE(SUBSTRING(@Global_Unit_Name,  LEN(@Global_Unit_Name) - CHARINDEX('(', REVERSE(@Global_Unit_Name))+2, LEN(@Global_Unit_Name) ),')',''))
				END
			--End processing the data splits for Global Unit data

			--Start processing the data splits for Global Division data
			IF REPLACE(REPLACE(SUBSTRING (SUBSTRING(@Global_Division_Name, 1, LEN(@Global_Division_Name) - CHARINDEX('(', REVERSE(@Global_Division_Name))) ,CHARINDEX('_', @Global_Division_Name)+1,LEN(SUBSTRING(@Global_Division_Name, 1, LEN(@Global_Division_Name) ) )),')',''),'(','')='' 
				BEGIN
					SET @Global_Division='-'
				END
			ELSE
				BEGIN
					SET @Global_Division=TRIM(REPLACE(REPLACE(SUBSTRING (SUBSTRING(@Global_Division_Name, 1, LEN(@Global_Division_Name) - CHARINDEX('(', REVERSE(@Global_Division_Name))) ,CHARINDEX('_', @Global_Division_Name)+1,LEN(SUBSTRING(@Global_Division_Name, 1, LEN(@Global_Division_Name) ) )),')',''),'(',''))
				END

			IF REPLACE(SUBSTRING(@Global_Division_Name,  LEN(@Global_Division_Name) - CHARINDEX('(', REVERSE(@Global_Division_Name))+2, LEN(@Global_Division_Name) ),')','')=''
				BEGIN
					SET @Global_Division_Code=TRIM(@Global_Division_Name)
				END 
			ELSE
				BEGIN
					SET @Global_Division_Code=TRIM(REPLACE(SUBSTRING(@Global_Division_Name,  LEN(@Global_Division_Name) - CHARINDEX('(', REVERSE(@Global_Division_Name))+2, LEN(@Global_Division_Name) ),')',''))
				END 
			--End processing the data splits for Global Division data
	
			--Start processing the data splits for  Regional Unit name data
			IF CHARINDEX('(', REVERSE(@Regional_Unit_Name))<1 
				BEGIN
					SET @Regional_Unit='-'
				END
			ELSE
				BEGIN
					SET @Regional_Unit=TRIM(SUBSTRING(@Regional_Unit_Name, 1, LEN(@Regional_Unit_Name) - CHARINDEX('(', REVERSE(@Regional_Unit_Name))))
				END
							   
			IF REPLACE(SUBSTRING(@Regional_Unit_Name,  LEN(@Regional_Unit_Name) - CHARINDEX('(', REVERSE(@Regional_Unit_Name))+2, LEN(@Regional_Unit_Name) ),')','')=''
				BEGIN
					SET @Regional_Unit_Short_Name=TRIM(SUBSTRING(@Regional_Unit_Name,1,CHARINDEX('_', @Regional_Unit_Name)-1))
					SET @Regional_Unit_Code=TRIM(SUBSTRING(@Regional_Unit_Name,CHARINDEX('_', @Regional_Unit_Name)+1,LEN(@Regional_Unit_Name)))
				END 
			ELSE
				BEGIN
					SET @Regional_Unit_Short_Name=TRIM(SUBSTRING(REPLACE(SUBSTRING(@Regional_Unit_Name,  LEN(@Regional_Unit_Name) - CHARINDEX('(', REVERSE(@Regional_Unit_Name))+2, LEN(@Regional_Unit_Name) ),')',''),1,
					CHARINDEX('_', REPLACE(SUBSTRING(@Regional_Unit_Name,  LEN(@Regional_Unit_Name) - CHARINDEX('(', REVERSE(@Regional_Unit_Name))+2, LEN(@Regional_Unit_Name) ),')',''))-1))
			
					SET @Regional_Unit_Code=TRIM(SUBSTRING(REPLACE(SUBSTRING(@Regional_Unit_Name,  LEN(@Regional_Unit_Name) - CHARINDEX('(', REVERSE(@Regional_Unit_Name))+2, LEN(@Regional_Unit_Name) ),')','')
											,CHARINDEX('_', REPLACE(SUBSTRING(@Regional_Unit_Name,  LEN(@Regional_Unit_Name) - CHARINDEX('(', REVERSE(@Regional_Unit_Name))+2, LEN(@Regional_Unit_Name) ),')',''))+1,
											LEN(REPLACE(SUBSTRING(@Regional_Unit_Name,  LEN(@Regional_Unit_Name) - CHARINDEX('(', REVERSE(@Regional_Unit_Name))+2, LEN(@Regional_Unit_Name) ),')',''))))
				END 
			-- End processing the data splits for  Regional Unit name data

			--Start processing the data splits for  Regional Division name data
			IF CHARINDEX('(', REVERSE(@Regional_Division_Name))<1 
				BEGIN
					SET @Regional_Division='-'
				END
			ELSE
				BEGIN
					SET @Regional_Division=TRIM(SUBSTRING(@Regional_Division_Name, 1, LEN(@Regional_Division_Name) - CHARINDEX('(', REVERSE(@Regional_Division_Name))))
				END
			   
			IF REPLACE(SUBSTRING(@Regional_Division_Name,  LEN(@Regional_Division_Name) - CHARINDEX('(', REVERSE(@Regional_Division_Name))+2, LEN(@Regional_Division_Name) ),')','')=''
				BEGIN
			
					SET @Regional_Division_Code=TRIM(@Regional_Division_Name)
				END 
			ELSE
				BEGIN			
					SET @Regional_Division_Code= TRIM(REPLACE(SUBSTRING(@Regional_Division_Name,  LEN(@Regional_Division_Name) - CHARINDEX('(', REVERSE(@Regional_Division_Name))+2, LEN(@Regional_Division_Name) ),')',''))
				END 
			--End processing the data splits for  Regional Division name data
	
			--Start processing the data splits for  Regional Department Data
			IF CHARINDEX('(', REVERSE(@Regional_Department_Name))<1 
				BEGIN
					SET @Regional_Department='-'
				END
			ELSE
				BEGIN
					SET @Regional_Department=TRIM(SUBSTRING(@Regional_Department_Name, 1, LEN(@Regional_Department_Name) - CHARINDEX('(', REVERSE(@Regional_Department_Name))))
				END
			   
			IF REPLACE(SUBSTRING(@Regional_Department_Name,  LEN(@Regional_Department_Name) - CHARINDEX('(', REVERSE(@Regional_Department_Name))+2, LEN(@Regional_Department_Name) ),')','')=''
				BEGIN
			
					SET @Regional_Department_Code=TRIM(@Regional_Department_Name)
				END 
			ELSE
				BEGIN			
					SET @Regional_Department_Code= TRIM(REPLACE(SUBSTRING(@Regional_Department_Name,  LEN(@Regional_Department_Name) - CHARINDEX('(', REVERSE(@Regional_Department_Name))+2, LEN(@Regional_Department_Name) ),')',''))
				END 
		-- End processing the data splits for  Regional Department Data
	
		--Start processing the data splits for  Regional Section Data
			IF CHARINDEX('(', REVERSE(@Regional_Section_Name))<1 
				BEGIN
					SET @Regional_Section='-'
				END
			ELSE
				BEGIN
					SET @Regional_Section=TRIM(SUBSTRING(@Regional_Section_Name, 1, LEN(@Regional_Section_Name) - CHARINDEX('(', REVERSE(@Regional_Section_Name))))
				END
			   
			IF REPLACE(SUBSTRING(@Regional_Section_Name,  LEN(@Regional_Section_Name) - CHARINDEX('(', REVERSE(@Regional_Section_Name))+2, LEN(@Regional_Section_Name) ),')','')=''
				BEGIN
			
					SET @Regional_Section_Code=TRIM(@Regional_Section_Name)
				END 
			ELSE
				BEGIN			
					SET @Regional_Section_Code= TRIM(REPLACE(SUBSTRING(@Regional_Section_Name,  LEN(@Regional_Section_Name) - CHARINDEX('(', REVERSE(@Regional_Section_Name))+2, LEN(@Regional_Section_Name) ),')',''))
				END 
		-- End processing the data splits for  Regional Section Data

		--  if Ds number is blank assign the DS_ID_Number as DS number
			IF @DS_Number='' OR @DS_Number=NULL
			BEGIN
				SET @DS_Number=@DS_ID_Number 
			END

		-- If Manager Ds Number is blank assign the Manager_DS_ID_Number as Manager DS Number	
			IF @Manager_DS_Number='' OR @Manager_DS_Number=NULL
			BEGIN
				SET @Manager_DS_Number=@Manager_DS_ID_Number
			END

		-- Update the employee record

			UPDATE [ANALYSIS_LOG].[dbo].M_EC_LOG_DW2_EMPLOYEEINFO_TEST 
			SET 
				 [Location]=@Location,[Location Code]=@Location_Code ,
				 [Global Unit]=@Global_Unit,[Global Unit Code]=@Global_Unit_Code,
				 [Global Division]=@Global_Division,[Global Division Code]=@Global_Division_Code,
				 [Regional Unit]=@Regional_Unit,[Regional Unit Short Name]=@Regional_Unit_Short_Name,[Regional Unit Code]=@Regional_Unit_Code,
				 [Regional Division]=@Regional_Division,[Regional Division Code] =@Regional_Division_Code,
				 [Regional Department]=@Regional_Department,[Regional Department Code]=@Regional_Department_Code,
				 [Regional Section]=@Regional_Section,[Regional Section Code]=@Regional_Section_Code,
				 [First Name]=[dbo].[FN_CapitalizeInitialLetter] (@First_Name),
				 [Last Name]=[dbo].[FN_CapitalizeInitialLetter](@Last_Name),
				 [Full Name]=[dbo].[FN_CapitalizeInitialLetter](@Full_Name),
				 [Manager First Name]=[dbo].[FN_CapitalizeInitialLetter](@Manager_First_Name),
				 [Manager Last Name]=[dbo].[FN_CapitalizeInitialLetter](@Manager_Last_Name),
				 [Manager Full Name]=[dbo].[FN_CapitalizeInitialLetter](@Manager_Full_Name),
				 [DS Number]=@DS_Number,[Manager DS Number]=@Manager_DS_Number,
				 [Manager Is Primary]=@Manager_Is_Primary,[Manager Status]=@Manager_Status,[Manager Status Code]=@Manager_Status_Code
			WHERE [User ID]=@ID

			-- Reset all the varaibale

			SET		@Location					=''
			SET		@Location_Code				=''
			SET 	@Global_Unit				=''
			SET 	@Global_Unit_Code			=''
			SET		@Global_Division			=''
			SET		@Global_Division_Code		=''
			SET		@Regional_Division			=''
			SET		@Regional_Division_Code		=''
			SET		@Regional_Unit				=''
			SET		@Regional_Unit_Short_Name	=''
			SET		@Regional_Unit_Code			=''
			SET		@Regional_Division			=''
			SET		@Regional_Division_Code		=''
			SET		@Regional_Department		=''
			SET		@Regional_Department_Code	=''
			SET		@Regional_Section			=''
			SET		@Regional_Section_Code		=''
			SET		@First_Name					=''
			SET		@Last_Name					=''
			SET		@Full_Name					=''
			SET		@Manager_First_Name			=''
			SET		@Manager_Last_Name			=''
			SET		@Manager_Full_Name			=''
			SET		@DS_Number					=''
			SET		@DS_ID_Number				=''
			SET		@Manager_DS_Number			=''
			SET		@Manager_DS_ID_Number		=''
			SET     @Manager_Status				=''
			SET		@Manager_Is_Primary			=''
			SET		@Manager_Status_Code		=''
	

		FETCH NEXT FROM EMPSplit_cursor INTO   @ID,@Location_Name,@Global_Unit_Name,@Global_Division_Name,@Regional_Unit_Name,@Regional_Division_Name,
												@Regional_Department_Name,@Regional_Section_Name,
												@First_Name,@Last_Name,@Full_Name,@Manager_First_Name,@Manager_Last_Name,@Manager_Full_Name,
												@DS_Number,@DS_ID_Number,@Manager_DS_Number,@Manager_DS_ID_Number,@Manager_User_ID
	END   	
	CLOSE EMPSplit_cursor    
	DEALLOCATE EMPSplit_cursor 


	
END


/*

These are test queries 

select distinct [Global Unit Name],

CASE WHEN CHARINDEX('(', REVERSE([Global Unit Name]))<1 THEN
'-'
ELSE
LTRIM(RTRIM(SUBSTRING([Global Unit Name], 1, LEN([Global Unit Name]) - CHARINDEX('(', REVERSE([Global Unit Name]))) ))
END AS [Organization Section Name],
CASE WHEN REPLACE(SUBSTRING([Global Unit Name],  LEN([Global Unit Name]) - CHARINDEX('(', REVERSE([Global Unit Name]))+2, LEN([Global Unit Name]) ),')','')='' THEN [Global Unit Name]
ELSE      REPLACE(SUBSTRING([Global Unit Name],  LEN([Global Unit Name]) - CHARINDEX('(', REVERSE([Global Unit Name]))+2, LEN([Global Unit Name]) ),')','')
END


FROM [ANALYSIS_LOG].[dbo].M_EC_LOG_DW2_EMPLOYEEINFO_TEST 
--WHERE [Employee Type] = 'Indirect' AND [Is Primary] = 'true'
ORDER BY 2


select distinct [Global Division Name],

CASE WHEN REPLACE(REPLACE(SUBSTRING (SUBSTRING([Global Division Name], 1, LEN([Global Division Name]) - CHARINDEX('(', REVERSE([Global Division Name]))) ,CHARINDEX('_', [Global Division Name])+1,LEN(SUBSTRING([Global Division Name], 1, LEN([Global Division Name]) ) )),')',''),'(','')='' THEN
'-'
ELSE
REPLACE(REPLACE(SUBSTRING (SUBSTRING([Global Division Name], 1, LEN([Global Division Name]) - CHARINDEX('(', REVERSE([Global Division Name]))) ,CHARINDEX('_', [Global Division Name])+1,LEN(SUBSTRING([Global Division Name], 1, LEN([Global Division Name]) ) )),')',''),'(','')
END AS [Organization Section Name],
CASE WHEN REPLACE(SUBSTRING([Global Division Name],  LEN([Global Division Name]) - CHARINDEX('(', REVERSE([Global Division Name]))+2, LEN([Global Division Name]) ),')','')='' THEN [Global Division Name]
ELSE  REPLACE(SUBSTRING([Global Division Name],  LEN([Global Division Name]) - CHARINDEX('(', REVERSE([Global Division Name]))+2, LEN([Global Division Name]) ),')','')
END


FROM [ANALYSIS_LOG].[dbo].M_EC_LOG_DW2_EMPLOYEEINFO_TEST 
--WHERE [Employee Type] = 'Indirect' AND [Is Primary] = 'true'
ORDER BY 2




select distinct [Regional Unit Name],

CASE WHEN CHARINDEX('(', REVERSE([Regional Unit Name]))<1 THEN
'-'
ELSE
LTRIM(RTRIM(SUBSTRING([Regional Unit Name], 1, LEN([Regional Unit Name]) - CHARINDEX('(', REVERSE([Regional Unit Name]))) ))
END AS [Organization Section Name],

CASE WHEN REPLACE(SUBSTRING([Regional Unit Name],  LEN([Regional Unit Name]) - CHARINDEX('(', REVERSE([Regional Unit Name]))+2, LEN([Regional Unit Name]) ),')','')='' THEN [Regional Unit Name]
ELSE      REPLACE(SUBSTRING([Regional Unit Name],  LEN([Regional Unit Name]) - CHARINDEX('(', REVERSE([Regional Unit Name]))+2, LEN([Regional Unit Name]) ),')','')
END


FROM [ANALYSIS_LOG].[dbo].M_EC_LOG_DW2_EMPLOYEEINFO_TEST 
--WHERE [Employee Type] = 'Indirect' AND [Is Primary] = 'true'
ORDER BY 2

select distinct [Regional Division Name],

CASE WHEN CHARINDEX('(', REVERSE([Regional Division Name]))<1 THEN
'-'
ELSE
LTRIM(RTRIM(SUBSTRING([Regional Division Name], 1, LEN([Regional Division Name]) - CHARINDEX('(', REVERSE([Regional Division Name]))) ))
END AS [Organization Section Name],

CASE WHEN REPLACE(SUBSTRING([Regional Division Name],  LEN([Regional Division Name]) - CHARINDEX('(', REVERSE([Regional Division Name]))+2, LEN([Regional Division Name]) ),')','')='' THEN [Regional Division Name]
ELSE      REPLACE(SUBSTRING([Regional Division Name],  LEN([Regional Division Name]) - CHARINDEX('(', REVERSE([Regional Division Name]))+2, LEN([Regional Division Name]) ),')','')
END


FROM [ANALYSIS_LOG].[dbo].M_EC_LOG_DW2_EMPLOYEEINFO_TEST 
--WHERE [Employee Type] = 'Indirect' AND [Is Primary] = 'true'
ORDER BY 2

select distinct [Regional Department Name],

CASE WHEN CHARINDEX('(', REVERSE([Regional Department Name] ))<1 THEN
'-'
ELSE
LTRIM(RTRIM(SUBSTRING([Regional Department Name], 1, LEN([Regional Department Name]) - CHARINDEX('(', REVERSE([Regional Department Name]))) ))
END AS [Organization Section Name],

CASE WHEN REPLACE(SUBSTRING([Regional Department Name],  LEN([Regional Department Name]) - CHARINDEX('(', REVERSE([Regional Department Name]))+2, LEN([Regional Department Name]) ),')','')='' THEN [Regional Department Name]
ELSE      REPLACE(SUBSTRING([Regional Department Name],  LEN([Regional Department Name]) - CHARINDEX('(', REVERSE([Regional Department Name]))+2, LEN([Regional Department Name]) ),')','')
END


FROM [ANALYSIS_LOG].[dbo].M_EC_LOG_DW2_EMPLOYEEINFO_TEST 
--WHERE [Employee Type] = 'Indirect' AND [Is Primary] = 'true'
ORDER BY 2



select distinct [Regional Section Name],

CASE WHEN CHARINDEX('(', REVERSE([Regional Section Name] ))<1 THEN
'-'
ELSE
LTRIM(RTRIM(SUBSTRING([Regional Section Name], 1, LEN([Regional Section Name]) - CHARINDEX('(', REVERSE([Regional Section Name]))) ))
END AS [Regional Section Name],

CASE WHEN REPLACE(SUBSTRING([Regional Section Name],  LEN([Regional Section Name]) - CHARINDEX('(', REVERSE([Regional Section Name]))+2, LEN([Regional Section Name]) ),')','')='' THEN [Regional Section Name]
ELSE      REPLACE(SUBSTRING([Regional Section Name],  LEN([Regional Section Name]) - CHARINDEX('(', REVERSE([Regional Section Name]))+2, LEN([Regional Section Name]) ),')','')
END


FROM [ANALYSIS_LOG].[dbo].M_EC_LOG_DW2_EMPLOYEEINFO_TEST 
--WHERE [Employee Type] = 'Indirect' AND [Is Primary] = 'true'
ORDER BY 2

*/
--EXEC [SP_EmpluyeeDataSplit]
-- EXEC SP_EmployeeHierarchyTest 10


GO
