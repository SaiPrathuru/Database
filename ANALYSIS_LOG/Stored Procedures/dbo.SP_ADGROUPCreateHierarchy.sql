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
CREATE PROCEDURE[dbo].[SP_ADGROUPCreateHierarchy]
(@ECount int)
AS
BEGIN

/*Delete the invalid records uploaded during the SSIS insert*/
DELETE FROM M_BC_LOG_DW2_ADGROUPLIST WHERE GroupName like 'Databa%'


/* Reset the hierarchy */
  UPDATE M_BC_LOG_DW2_ADGROUPMEMBERLIST SET  GroupHierarchy=''

  
/* Variable declaration section*/

	DECLARE	@GROUPNAME							VARCHAR(1024)
	
	DECLARE	@Counter				INT
	DECLARE	@Parent					VARCHAR(1024)
	
	DECLARE	@Email					VARCHAR(1024)
	
	DECLARE @DSNUMBER				VARCHAR(1024)
	DECLARE @GROUPID				VARCHAR(1024)
	DECLARE @PARENTGROUPID				VARCHAR(1024)
	DECLARE @MEMBEROF				VARCHAR(1024)
	
	/* The below cursor handles the AD group data to build the hirearchy*/



	DECLARE ADGROUPMEMBERLIST_cursor CURSOR FOR  	
	
	SELECT 	GroupName 
	       ,[DS Number]
		   ,Email
	FROM	 M_BC_LOG_DW2_ADGROUPMEMBERLIST 
	
	
	OPEN ADGROUPMEMBERLIST_cursor    
	FETCH NEXT FROM ADGROUPMEMBERLIST_cursor  INTO 	 @GROUPNAME
	                                    
										,@DSNUMBER
										,@Email
  	WHILE @@FETCH_STATUS = 0   

	BEGIN
	   
			SET @GROUPID=''
			
			SET @Counter=0
			SET @Parent=@GROUPNAME
			SET @PARENTGROUPID=@GROUPNAME
			SET @MEMBEROF=''
			
			--PRINT @GROUPNAME
			--PRINT @DSNUMBER
			--PRINT @Email
			
			WHILE @Counter<=@ECount
			BEGIN
			 
			  SELECT	
				distinct  
					@GROUPID= GroupName
					,@MEMBEROF=MemberOf
				FROM	M_BC_LOG_DW2_ADGROUPLIST
				WHERE	GroupName=@GROUPNAME 
				AND     GroupName<>MemberOf
				
				--PRINT @MEMBEROF
				--PRINT @Parent

					IF @MEMBEROF<>'' 
						BEGIN
							SET	@Parent=@MEMBEROF+'|'+@Parent
						END
					ELSE
						BEGIN
						  -- print 'hire'+@Parent
							UPDATE	M_BC_LOG_DW2_ADGROUPMEMBERLIST
							SET		GroupHierarchy=@Parent
							WHERE	GroupName=@PARENTGROUPID 
							AND     [DS Number]=@DSNUMBER
							AND		Email=@Email
							BREAK;
						END

						
				SET @Counter=@Counter+1
				
				SET  @GROUPNAME=@MEMBEROF
				SET  @MEMBEROF=''
				
			END
				
			FETCH NEXT FROM ADGROUPMEMBERLIST_cursor  INTO 	 @GROUPNAME
	                                	,@DSNUMBER
										,@Email
	END   	
	CLOSE ADGROUPMEMBERLIST_cursor    
	DEALLOCATE ADGROUPMEMBERLIST_cursor 
	
END

--EXEC [SP_ADGROUPCreateHierarchy] 10

--SELECT * FROM M_BC_LOG_DW2_ADGROUPMEMBERLIST WHERE UPPER(Email) LIKE 'JONATHAN.N%'


GO
