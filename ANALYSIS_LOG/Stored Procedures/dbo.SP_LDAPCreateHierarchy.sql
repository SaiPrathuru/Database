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
CREATE PROCEDURE[dbo].[SP_LDAPCreateHierarchy]
(@ECount int)
AS
BEGIN

UPDATE M_EC_LOG_DW2_LDAP SET  Hierarchy=''
	/* Reset the hierarchy and hirerachy level
   UPDATE M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE SET  Hierarchy='',[Hierarchy Level]=0,[Manager Username]=NULL,[Manager DS Number]=NULL,[Manager Email]=NULL,
														[Manager Full Name]=NULL,[Manager First Name]=NULL,[Manager Last Name]=NULL,
														[Manager isPrimary]=NULL,[Manager Status Code]=NULL
*/
  
  
	/* Variable declaration section*/

	DECLARE	@ID							VARCHAR(1024)
	
	DECLARE	@Counter					INT
	DECLARE	@Parent						VARCHAR(1024)
	
	DECLARE	@Manager_Email				VARCHAR(1024)
	DECLARE	@EMP_Email				VARCHAR(1024)
	DECLARE	@ManagerEmployeeID			VARCHAR(1024)
	DECLARE @Manager_User_ID			VARCHAR(1024)
	DECLARE @UID					VARCHAR(1024)

	
	/* The below cursor handles the employees data who are not managers to build the hirearchy*/



	DECLARE LDAP_cursor CURSOR FOR  	
	
	SELECT 	UID 
	       ,ManagerUID
		   ,Email
	FROM	 M_EC_LOG_DW2_LDAP 
	
	OPEN LDAP_cursor    
	FETCH NEXT FROM LDAP_cursor  INTO 	 @UID
	                                    --@Manager_User_ID,@SolidLineManagerUserID
										,@ManagerEmployeeID
										,@EMP_Email
  	WHILE @@FETCH_STATUS = 0   

	BEGIN
	   
			SET @ID=''
			
			SET @Counter=0
			SET @Parent=@EMP_Email
			

			
			WHILE @Counter<=@ECount
			BEGIN
			 
			  SELECT	
				distinct  
					@ID= ManagerUID
					,@Manager_Email=Email
				FROM	M_EC_LOG_DW2_LDAP
				WHERE	UID=@ManagerEmployeeID 
				
					IF @ID<>''  --@Manager_Email<>'' -- OR
						BEGIN
							SET	@Parent=@Manager_Email+'|'+@Parent
							SET @Manager_Email=''
																				
						END
					ELSE
						BEGIN							
							IF @Manager_Email<>''
								BEGIN
									UPDATE	M_EC_LOG_DW2_LDAP
									SET		Hierarchy=@Manager_Email+'|'+@Parent
									WHERE	UID=@UID 
									SET @Manager_Email=''
									BREAK;
								END
							ELSE
								BEGIN
									UPDATE	M_EC_LOG_DW2_LDAP
									SET		Hierarchy=@Parent
									WHERE	UID=@UID 
									BREAK;
								END

						END

				SET @Counter=@Counter+1
				---SET @Manager_User_ID=@IDD
				SET @ManagerEmployeeID=@ID
				SET @ID=''
				SET @Manager_Email=''
				
				
				
			END
				
			FETCH NEXT FROM LDAP_cursor INTO  @UID
											--	,@Manager_User_ID, @SolidLineManagerUserID
											,@ManagerEmployeeID
											,@EMP_Email
	END   	
	CLOSE LDAP_cursor    
	DEALLOCATE LDAP_cursor 

	


		UPDATE M_EC_LOG_DW2_LDAP 
		SET M_EC_LOG_DW2_LDAP.ManagerEmail = B.Email 
		FROM M_EC_LOG_DW2_LDAP 
		INNER JOIN M_EC_LOG_DW2_LDAP B ON M_EC_LOG_DW2_LDAP.ManagerUID = B.UID 

		UPDATE M_EC_LOG_DW2_LDAP SET 
									M_EC_LOG_DW2_LDAP.Unit=A.Unit,M_EC_LOG_DW2_LDAP.
									[Unit Code]=A.[Unit Code] ,
									M_EC_LOG_DW2_LDAP.[Unit Name]= A.[Unit Name],
									M_EC_LOG_DW2_LDAP.Division=A.Division,
									M_EC_LOG_DW2_LDAP.[Division Name]=A.[Division Name],
									M_EC_LOG_DW2_LDAP.[Division Code]=A.[Division Code]
		FROM M_EC_LOG_DW2_LDAP 
		INNER JOIN M_EC_LOG_DW2_EMPLOYEE A ON M_EC_LOG_DW2_LDAP.UID=A.[DS Number]

	/* Update all the records with hirarchy addd employeeid to the end of hirarchy added on 06/03/2020*/
	--UPDATE M_EC_LOG_DW2_LDAP
	--SET 			
	--	[Hierarchy]=[Hierarchy]+'|'+UID
	--WHERE	 [Hierarchy] <>''



	/*Update all the records where hierrachy  is null or blank to Undefined*/
	
	UPDATE	M_EC_LOG_DW2_LDAP
	SET		Hierarchy='Undefined' 
	WHERE		(Hierarchy IS NULL OR Hierarchy='')
	

	
END

--EXEC [SP_LDAPCreateHierarchy] 10

/*select Email,* from M_EC_LOG_DW2_LDAP where SN='Prathuru'

select Email,* from M_EC_LOG_DW2_LDAP where Givenname like 'Sailesh%'
select Email,* from M_EC_LOG_DW2_LDAP where ManagerEmail<>''

update M_EC_LOG_DW2_LDAP set ManagerEmail='' 

select * from M_EC_LOG_DW2_EMPLOYEE where [DS Number]='a5117316'
select Email,* from M_EC_LOG_DW2_LDAP where Givenname like 'Sailesh%'
*/
GO
