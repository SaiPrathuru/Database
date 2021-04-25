SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE[dbo].[SP_SqlDataRefresh_old]
--(@DNAME VARCHAR(1024))
AS
BEGIN
      
	DECLARE @FIELDNAME VARCHAR(1024)
	DECLARE @DBNAME VARCHAR(1024)
	DECLARE @TBNAME VARCHAR(1024)
	DECLARE @LASTREFRESHDATA DATETIME

	
	--SET @DBNAME=@DNAME
	SELECT @LASTREFRESHDATA=[LastRunDateTime]+1 FROM [ANALYSIS_LOG].[dbo].[M_BI_LOG_DW2_EXECUTION] WHERE [PackageName]='SP_SQLDataRefresh'
	DECLARE SQL_FIELD_cursor CURSOR FOR  	
	select DISTINCT [Database Name],[Table Name],[Field Name] from [ANALYSIS_LOG].[dbo].M_BI_LOG_DW2_SQLFIELDNAMES where [Table Name] LIKE 'VU_%'  or  [Table Name] LIKE 'VF_%'  or [Table Name] like 'VUSR_%'
			

	OPEN SQL_FIELD_cursor    
	FETCH NEXT FROM SQL_FIELD_cursor  INTO @DBNAME,@TBNAME, @FIELDNAME
  	WHILE @@FETCH_STATUS = 0   
	BEGIN
	   INSERT INTO T_BI_LOG_DW2_SQLLOG 
		SELECT @FIELDNAME AS FILEDNAME, [Start Date],[Database Name],count(*),Email,[Application Name],[Login Type],@TBNAME FROM VUSR_T_SQL_DETAILS
		WHERE ([Start Date] >=      convert(varchar,@LASTREFRESHDATA, 23) and [Start Date] <  convert(varchar,DATEADD(day,-1 ,getdate()), 23))
		--WHERE ([Start Date] >=    convert(varchar,DATEADD(day,-106 ,getdate()), 23) and [Start Date] <= convert(varchar,DATEADD(day,-1 ,getdate()), 23))
	    AND (([Query Details] like '%.[[]' + @FIELDNAME + ']%' OR [Query Details] like '%["]' + @FIELDNAME + '"%' OR [Query Details] like '%.' + @FIELDNAME + '%' 
		OR ([Query Details] like  '%,'+ @FIELDNAME+'%' ) OR   ([Query Details] like  '%'+@FIELDNAME+',%' )   )  AND [Query Details] like '%' + @TBNAME + '%')
  		AND [Database Name]=@DBNAME
		

		GROUP BY [Start Date],Email,[Database Name],[Application Name],[Login Type]
		--PRINT @FIELDNAME
	FETCH NEXT FROM SQL_FIELD_cursor INTO    @DBNAME,@TBNAME, @FIELDNAME
	END
	CLOSE SQL_FIELD_cursor    
	DEALLOCATE SQL_FIELD_cursor 

	SET @FIELDNAME='*'
	SET @DBNAME =''
	SET @TBNAME =''

	

	DECLARE SQL_FIELD_cursor1 CURSOR FOR  	
	select DISTINCT [Database Name],[Table Name] from [ANALYSIS_LOG].[dbo].M_BI_LOG_DW2_SQLFIELDNAMES where [Table Name] LIKE 'VU_%'  or  [Table Name] LIKE 'VF_%'  or [Table Name] like 'VUSR_%'
			

	OPEN SQL_FIELD_cursor1    
	FETCH NEXT FROM SQL_FIELD_cursor1  INTO @DBNAME,@TBNAME
  	WHILE @@FETCH_STATUS = 0   
	BEGIN
	   INSERT INTO T_BI_LOG_DW2_SQLLOG 
		SELECT @FIELDNAME AS FILEDNAME, [Start Date],[Database Name],count(*),Email,[Application Name],[Login Type],@TBNAME FROM VUSR_T_SQL_DETAILS
		WHERE ([Start Date] >=      convert(varchar,@LASTREFRESHDATA, 23) and [Start Date] <  convert(varchar,getdate(), 23))
		--convert(varchar,DATEADD(day,-1 ,getdate()), 23))
	    AND ([Query Details] like '%' + @FIELDNAME + '%') AND [Query Details] like '%' + @TBNAME + '%'
	    
  		AND [Database Name]=@DBNAME	

		GROUP BY [Start Date],Email,[Database Name],[Application Name],[Login Type]
		--PRINT @FIELDNAME
	FETCH NEXT FROM SQL_FIELD_cursor1 INTO    @DBNAME,@TBNAME
	END
	CLOSE SQL_FIELD_cursor1    
	DEALLOCATE SQL_FIELD_cursor1 

	--SELECT @LASTREFRESHDATA=max([StartTime])    FROM [ANALYSIS_LOG].[dbo].[T_BI_LOG_DW2_RDBUSERTRACELOG]
	
	SELECT @LASTREFRESHDATA =max(TransactionDate) FROM [ANALYSIS_LOG].[dbo].[T_BI_LOG_DW2_SQLLOG]

	UPDATE  [ANALYSIS_LOG].[dbo].[M_BI_LOG_DW2_EXECUTION] SET  [LastRunDateTime] =@LASTREFRESHDATA WHERE [PackageName]='SP_SQLDataRefresh'

END





--print convert(varchar,DATEADD(day,-37 ,getdate()), 23)


--print convert(varchar,DATEADD(day,-251 ,getdate()), 23)
--exec [SP_SQLDataRefresh]
GO
