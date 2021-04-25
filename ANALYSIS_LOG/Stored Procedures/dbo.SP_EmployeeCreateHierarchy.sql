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
CREATE PROCEDURE[dbo].[SP_EmployeeCreateHierarchy]
(@ECount int)
AS
BEGIN

UPDATE M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT SET  Hierarchy='',[Hierarchy Level]=0	
	/* Reset the hierarchy and hirerachy level
   UPDATE M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE SET  Hierarchy='',[Hierarchy Level]=0,[Manager Username]=NULL,[Manager DS Number]=NULL,[Manager Email]=NULL,
														[Manager Full Name]=NULL,[Manager First Name]=NULL,[Manager Last Name]=NULL,
														[Manager isPrimary]=NULL,[Manager Status Code]=NULL
*/
  
  
	/* Variable declaration section*/

	DECLARE @Manager_DS_ID				VARCHAR(1024)
	DECLARE @Manager_DS_ID1				VARCHAR(1024)
	DECLARE	@ChildId					VARCHAR(1024)
	DECLARE	@UserId						VARCHAR(1024)
	DECLARE	@ID							VARCHAR(1024)
	DECLARE	@IDD						VARCHAR(1024)
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
	DECLARE @Manager_User_ID			VARCHAR(1024)
	DECLARE @Employee_ID				VARCHAR(1024)

	
	/* The below cursor handles the employees data who are not managers to build the hirearchy*/

	DECLARE EMP_cursor CURSOR FOR  	
	SELECT 	B.[Employee ID] --, B.[Manager User ID], B.[Solid Line Manager User ID]
	       ,B.[Manager Employee ID]
	FROM	 [M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE] B
	WHERE	ISNULL(B.[Match Found],0)>=1
			
			

	OPEN EMP_cursor    
	FETCH NEXT FROM EMP_cursor  INTO 	@Employee_ID
	                                    --@Manager_User_ID,@SolidLineManagerUserID
										,@ManagerEmployeeID
  	WHILE @@FETCH_STATUS = 0   

	BEGIN
	   
			SET @ID=''
			SET @IDD=''
			SET @Counter=0
			SET @Parent=@ManagerEmployeeID
			SET @HierarchyLevel=2

			
			WHILE @Counter<=@ECount
			BEGIN
			 
			   SELECT	
				distinct  
				@ID= A.[Manager Employee ID] ---,@IDD=A.[Manager User ID]
				FROM	M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE A
				WHERE	A.[Employee ID]=@ManagerEmployeeID 
				
					IF @ID<>'' 
						BEGIN
							SET	@Parent=@ID+'|'+@Parent
							SET @HierarchyLevel= @HierarchyLevel+1														
						END
					ELSE
						BEGIN							
							
							UPDATE	M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE
							SET		Hierarchy=@Parent,[Hierarchy Level]=@HierarchyLevel 
							WHERE	[Employee ID]=@Employee_ID 
							BREAK;
						END

				SET @Counter=@Counter+1
				---SET @Manager_User_ID=@IDD
				SET @ManagerEmployeeID=@ID
				SET @ID=''
			END
				
			FETCH NEXT FROM EMP_cursor INTO  @Employee_ID
											--	,@Manager_User_ID, @SolidLineManagerUserID
											,@ManagerEmployeeID
	END   	
	CLOSE EMP_cursor    
	DEALLOCATE EMP_cursor 

	/* Update all the records with hirarchy addd employeeid to the end of hirarchy added on 06/03/2020*/
	UPDATE M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE
	SET 			
		[Hierarchy]=[Hierarchy]+'|'+[Employee ID]
	WHERE	 [Hierarchy] <>''


	/*Update the chairman data  to set the hierrachy to 1 */

	UPDATE M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE
	SET 
			[Hierarchy Level]=1,[Manager isPrimary]='true',[Manager Status Code]='t'
			, [Hierarchy]=(SELECT  [User ID] FROM M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT WHERE [Global Job Title] ='Chairman')
	WHERE	 [Global Job Title] ='Chairman'
	
	/*Update all the records where hierrachy  is null or blank to Undefined*/
	
	UPDATE	M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE
	SET		Hierarchy='Undefined' 
	WHERE	[Global Job Title]<>'Chairman'
	AND		(Hierarchy IS NULL OR Hierarchy='')
	

	--Upadte all the records set Login Type as "User"

	UPDATE M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE SET [Login Type]='User' WHERE [Login Type]IS NULL 
	
	UPDATE 	M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT SET  Hierarchy='',[Hierarchy Level]=0	

	UPDATE 	M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT  SET M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.Hierarchy=B.Hierarchy ,M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Hierarchy Level]=B.[Hierarchy Level]
	        ,M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT.[Login Type]=B.[Login Type]
	FROM    M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT A INNER JOIN
	        ---M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE B ON A.[User ID]=B.[User ID]
			M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE B ON A.[Employee ID]=B.[Employee ID]
	
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

--delete  from M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT where [Login Type]='Developer'


--select [Manager User ID],[Manager Employee ID], * from M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT where [Manager User ID]<>[Manager Employee ID]


GO
