SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE[dbo].[SP_CubeDataRefresh]
--(@DNAME VARCHAR(1024))
AS
BEGIN
  
	DECLARE @FIELDNAME VARCHAR(1024)
	DECLARE @DBNAME VARCHAR(1024)
	DECLARE @Cube  VARCHAR(1024)
	DECLARE @LASTREFRESHDATA DATETIME

	
	DELETE FROM T_BI_LOG_DW2_CUBESLOG_STAGING
	SELECT @LASTREFRESHDATA=[LastRunDateTime] FROM [ANALYSIS_LOG].[dbo].[M_BI_LOG_DW2_EXECUTION] WHERE [PackageName]='SP_CubeDataRefresh'

	INSERT INTO T_BI_LOG_DW2_CUBESLOG_STAGING   SELECT [Start Date],[Database Name],[Query Details],Email,[Application Name],[Login Type],0    FROM VUSR_T_CUBES_DETAILS
	WHERE ([Start Timestamp] >   @LASTREFRESHDATA)  --and [Start Date] <  convert(varchar,getdate(), 23))
	
	DECLARE FIELD_cursor CURSOR FOR  	
	SELECT DISTINCT [Field Name],[Database Name] ,Cube	
			FROM [ANALYSIS_LOG].[dbo].[M_BI_LOG_DW2_CUBEFIELDNAMES]

	OPEN FIELD_cursor    
	FETCH NEXT FROM FIELD_cursor  INTO @FIELDNAME,@DBNAME,@Cube
  	WHILE @@FETCH_STATUS = 0   
	BEGIN

		
	    INSERT INTO T_BI_LOG_DW2_CUBESLOG_NEW 
		SELECT [Database Name],@Cube AS Cube,@FIELDNAME AS FILEDNAME, [Start Date],count(*),Email,[Application Name],[Login Type] FROM T_BI_LOG_DW2_CUBESLOG_STAGING ---VUSR_T_CUBES_DETAILS
		WHERE  [Query Details] like '%.[[]' + @FIELDNAME + ']%' 
  		AND [Database Name]=@DBNAME
		AND [Query Details] LIKE '%[[]' ++ @Cube + ']%' 
		GROUP BY [Start Date],Email,[Database Name],[Application Name],[Login Type]
		
		IF  @@ROWCOUNT=0
			BEGIN
				INSERT INTO T_BI_LOG_DW2_CUBESLOG_NEW 
				SELECT [Database Name],'N/A' AS Cube,@FIELDNAME AS FILEDNAME, [Start Date],count(*),Email,[Application Name],[Login Type] FROM T_BI_LOG_DW2_CUBESLOG_STAGING ---VUSR_T_CUBES_DETAILS
				WHERE  [Query Details] like '%.[[]' + @FIELDNAME + ']%' 
  				AND [Database Name]=@DBNAME
				--AND [Query Details] LIKE '%' + @Cube + '%'
				GROUP BY [Start Date],Email,[Database Name],[Application Name],[Login Type]

				
			END
		--ELSE
		--	BEGIN
		--		UPDATE T_BI_LOG_DW2_CUBESLOG_STAGING SET IsFound=1
		--		WHERE  [Query Details] like '%.[[]' + @FIELDNAME + ']%' 
  --				AND [Database Name]=@DBNAME
		--		AND [Query Details] LIKE '%[[]' ++ @Cube + ']%' 
		--	END


	FETCH NEXT FROM FIELD_cursor INTO   @FIELDNAME,@DBNAME,@Cube
	END
	CLOSE FIELD_cursor    
	DEALLOCATE FIELD_cursor 

	SELECT @LASTREFRESHDATA =MAX([Start Timestamp]) FROM [ANALYSIS_LOG].[dbo].VUSR_T_CUBES_DETAILS --WHERE [PackageName]='RDBUserTraceLog'
	UPDATE  [ANALYSIS_LOG].[dbo].[M_BI_LOG_DW2_EXECUTION] SET  [LastRunDateTime] =@LASTREFRESHDATA WHERE [PackageName]='SP_CubeDataRefresh'


	
END


--print convert(varchar,DATEADD(day,-4 ,getdate()), 23)

--print convert(varchar,DATEADD(day,-1 ,getdate()), 23)

--delete from T_BI_LOG_DW2_CUBESLOG_NEW

--exec [SP_CubeDataRefresh]
GO
