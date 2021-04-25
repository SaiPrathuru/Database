SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
-- Author:		<Author,,Sai Prathuru>
-- Create date: <Create Date,10/24/2019,>
-- Description:	<Description,This procedure is for processing the employee data and building the hierrarchy>
-- Version 1.0
-- =============================================
CREATE PROCEDURE[dbo].[SP_EmployeeCreateHierarchyOld]
(@ECount int)
AS
BEGIN

UPDATE M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE SET  Hierarchy='',[Hierarchy Level]=0	
	/* Reset the hierarchy and hirerachy level
   UPDATE M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE SET  Hierarchy='',[Hierarchy Level]=0,[Manager Username]=NULL,[Manager DS Number]=NULL,[Manager Email]=NULL,
														[Manager Full Name]=NULL,[Manager First Name]=NULL,[Manager Last Name]=NULL,
														[Manager isPrimary]=NULL,[Manager Status Code]=NULL
*/
  
  
	/* Variable declaration section*/

	DECLARE @Manager_DS_ID				VARCHAR(1024)
	DECLARE @Manager_DS_ID1				VARCHAR(1024)
	DECLARE	@ChildId					VARCHAR(1024)
	DECLARE	@ID							VARCHAR(max)
	DECLARE	@Counter					INT
	DECLARE	@Parent						VARCHAR(1024)
	DECLARE	@HierarchyLevel				INT

	DECLARE	@Manager_Username			VARCHAR(1024)
	DECLARE	@Manager_DS_Number			VARCHAR(1024)
	DECLARE	@Manager_Email				VARCHAR(1024)
	DECLARE	@Manager_Full_Name			VARCHAR(1024)
	DECLARE	@Manager_First_Name			VARCHAR(1024)
	DECLARE	@Manager_Last_Name			VARCHAR(1024)
	DECLARE	@Manager_isPrimary			VARCHAR(1024)
	DECLARE	@Manager_Status_Code		VARCHAR(1024)
	DECLARE	@SolidLineManagerUserID		VARCHAR(1024)
	DECLARE	@ManagerEmployeeID			VARCHAR(1024)
	
	/* The below cursor handles the employees data who are not managers to build the hirearchy*/

	DECLARE EMP_cursor CURSOR FOR  	
	SELECT 	[User ID], /*[Manager User ID]*/ [Manager Employee ID], [Solid Line Manager User ID]
	FROM	[ANALYSIS_LOG].[dbo].M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE 
	WHERE	
			([Manager User ID]<>'')

	OPEN EMP_cursor    
	FETCH NEXT FROM EMP_cursor  INTO 	@ChildId,@ManagerEmployeeID,@SolidLineManagerUserID
  	WHILE @@FETCH_STATUS = 0   

	BEGIN
	   
			SET @ID=''
			SET @Counter=0
			--SET @Parent=@Manager_DS_ID
			SET @Parent=@ManagerEmployeeID
			SET @HierarchyLevel=2

			/*Sai Commented 11/13/2019 SET	@Manager_Username=NULL
			SET @Manager_DS_Number=NULL
			SET @Manager_Email=NULL
			SET	@Manager_Full_Name=NULL
			SET @Manager_First_Name=NULL
			SET @Manager_Last_Name=NULL
			SET @Manager_isPrimary=NULL
			SET @Manager_Status_Code=NULL
			SET @SolidLineManagerUserID=NULL

							SELECT @Manager_Username=[Manager Username],@Manager_DS_Number= [Manager DS Number],@Manager_Email=[Manager Email],
									@Manager_Full_Name=[Manager Full Name],@Manager_First_Name=[Manager First Name],@Manager_Last_Name=[Manager Last Name],
									@Manager_isPrimary=[Manager isPrimary],@Manager_Status_Code=[Manager Status Code] 
							FROM
									M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE  
							WHERE	[User ID]=@SolidLineManagerUserID
			*/

			WHILE @Counter<=@ECount
			BEGIN
				SELECT	/*@ID=[Manager User ID] */ @ID=[Manager Employee ID] 
				FROM	M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE 
				--WHERE	[User ID]=@Manager_DS_ID
				WHERE	[Employee ID]=@ManagerEmployeeID					
					IF @ID<>'' 
						BEGIN
							SET	@Parent=@ID+'|'+@Parent
							SET @HierarchyLevel= @HierarchyLevel+1														
						END
					ELSE
						BEGIN							
							
							UPDATE	M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE 
							SET		Hierarchy=@Parent,[Hierarchy Level]=@HierarchyLevel 
							      /* ,[Manager Username]=@Manager_Username,
									[Manager DS Number]=@Manager_DS_Number,[Manager Email]=@Manager_Email,[Manager Full Name]=@Manager_Full_Name,
									[Manager First Name]=@Manager_First_Name,[Manager Last Name]=@Manager_Last_Name,[Manager isPrimary]=@Manager_isPrimary,
									[Manager Status Code]=@Manager_Status_Code
									*/
							WHERE	[User ID]=@ChildId 
							/*SET	@Manager_Username=NULL
							SET @Manager_DS_Number=NULL
							SET @Manager_Email=NULL
							SET	@Manager_Full_Name=NULL
							SET @Manager_First_Name=NULL
							SET @Manager_Last_Name=NULL
							SET @Manager_isPrimary=NULL
							SET @Manager_Status_Code=NULL
							SET @SolidLineManagerUserID=NULL*/
							BREAK;
						END

				SET @Counter=@Counter+1
				--SET @Manager_DS_ID=@ID
				SET @ManagerEmployeeID=@ID
				SET @ID=''
			END
				
			FETCH NEXT FROM EMP_cursor INTO  @ChildId,/*@Manager_DS_ID*/ @ManagerEmployeeID, @SolidLineManagerUserID
	END   	
	CLOSE EMP_cursor    
	DEALLOCATE EMP_cursor 

	/*Update the chairman data  to set the hierrachy to 1 */

	UPDATE M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE 
	SET 
			[Hierarchy Level]=1
			, [Hierarchy]=(SELECT [User ID] FROM M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE WHERE [Global Job Title] ='Chairman')
	WHERE	 [Global Job Title] ='Chairman'
	
	/*Update all the records where hierrachy  is null or blank to Undefined*/
	
	UPDATE	M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE 
	SET		Hierarchy='Undefined' 
	WHERE	[Global Job Title]<>'Chairman'
	AND		(Hierarchy IS NULL OR Hierarchy='')
	

	-- This section of code is for inserting the developer accounts
	-- Because we use Truncate, there is no need to delete existing developer accounts first.
	INSERT 
	INTO	 M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE
			(
			 [Result Set],[Match Found],  [User ID],[Employee ID],[Username],[User Full Name] ,[First Name],[Last Name]
			  ,[Email]    ,[Email Address]  ,[DS Number]     
			  ,[Global Job Grade]      ,[Global Job Title]      ,[Local Job Grade]      ,[Local Job Title]
			  ,[Location Name]      ,[Group Region]      ,[Global Unit Name]      ,[Global Division Name]
			  ,[Unit Name]      /*,[Unit Name Abbreviation]*/      ,[Division Name]      ,[Department Name]
			  ,[Section Name]      ,[Manager User ID]      ,[Manager Username]     ,[Manager Full Name]
			  ,[Manager First Name]      ,[Manager Last Name]      ,[Manager Email]      ,[Manager DS Number]
			  /*,[Manager DS Number ]  */    ,[Direct Reports]      ,[Total Team Size]      --,[Status]
			  ,[Status Code]      ,[isPrimaryMerged]      ,[Employee Type]      ,[Employment Type]
			  ,[Employment Type Japanese]      ,[Assignment Type]      ,[Last Inactivation Date]      ,[Termination Date]
			  ,[User Last Modified Date]      ,[Created Date]      ,[Hierarchy Level]      ,[Global Unit]
			  ,[Global Unit Code]      ,[Global Division]      ,[Global Division Code]
			  ,[Hierarchy]      ,[Function Head User ID]       ,[Function Name]      ,[Function Head Name]
			  ,[Function Head Global Unit]      ,[Function Head Global Division]      ,[Function Head Email]       
			  ,[Login Type]      ,[Location]       ,[Location Code]      ,[Unit]
			  ,[Unit Code]       /*,[Unit Short Name]     */ ,[Division]       ,[Division Code]
			  ,[Department]       ,[Department Code]      ,[Section]       ,[Section Code]
			)
	SELECT 
			'10. Developer',	'1'	,[User ID],[User ID],[Username],[Full Name],[First Name],[Last Name]
			  ,[Email]    ,[User ID]+'@renesas.com'  ,[DS Number]     
			  ,[Global Job Grade]      ,[Global Job Title]      ,[Local Job Grade]      ,[Local Job Title]
			  ,[Location Name]      ,[Group Region]      ,[Global Unit Name]      ,[Global Division Name]
			  ,[Regional Unit Name]     /* ,[Regional Unit Name Abbreviation]  */    ,[Regional Division Name]      ,[Regional Department Name]
			  ,[Regional Section Name]      ,[Manager User ID]      ,[Manager Username]      ,[Manager Full Name]
			  ,[Manager First Name]      ,[Manager Last Name]      ,[Manager Email]      ,[Manager DS Number]
			 /* ,[Manager DS ID Number] */     ,[Direct Reports]      ,[TotalTeamSize]     -- ,[Status]
			  ,[Status Code]      ,[Is Primary]      ,[Employee Type]      ,[Employment Type]
			  ,[Employment Type Japanese]      ,[Assignment Type]      ,[Last Inactivation Date]      ,[Termination Date]
			  ,[Last Modified Date]      ,[Created Date]      ,[Hierarchy Level]      ,[Global Unit]
			  ,[Global Unit Code]      ,[Global Division]      ,[Global Division Code]
			  ,[Hierarchy]      ,[Function Head User ID]       ,[Function Name]      ,[Function Head Name]
			  ,[Function Head Global Unit]      ,[Function Head Global Division]      ,[Function Head Email]       
			  ,[Login Type]      ,[Location]       ,[Location Code]      ,[Regional Unit]
			  ,[Regional Unit Code]       /*,[Regional Unit Short Name]  */    ,[Regional Division]       ,[Regional Division Code]
			  ,[Regional Department]       ,[Regional Department Code]      ,[Regional Section]       ,[Regional Section Code]
	FROM		M_EC_LOG_DW2_DEVELOPERINFO
	WHERE		[User ID] NOT  IN  
	(SELECT		DISTINCT [User ID] 
		FROM		M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE)
	
	--Upadte all the records set Login Type as "User"

	UPDATE M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE SET [Login Type]='User' WHERE [Login Type]IS NULL 

	
END

/*
Test Scripts

select Hierarchy, * from M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE where  Email='sai.prathuru@renesas.com'


select Hierarchy, * from M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE where [User ID]='a0500319'
select Hierarchy, * from M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE where [User ID]='a5083715'
select Hierarchy, * from M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE where [User ID]='50005150'
select Hierarchy, * from M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE where [User ID]='a5031004'
select Hierarchy, * from M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE where [User ID]='a5049603'
*/
--exec [SP_EmployeeCreateHierarchy] 12
GO
