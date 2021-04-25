SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE[dbo].[SP_SqlFieldRefresh]
--(@DNAME VARCHAR(1024))
AS
BEGIN
    DELETE FROM M_BI_LOG_DW2_SQLFIELDNAMES_STAGING
	
	DECLARE @DATABASENAME NVARCHAR(1024)
	DECLARE @SQL NVARCHAR(MAX);

	DECLARE DATABASE_cursor CURSOR FOR  	

		SELECT distinct name FROM sys.databases s
		INNER JOIN [ANALYSIS_LOG].[dbo].[VUSR_T_SQL_DETAILS] l ON s.name = l.[Database Name]
		WHERE l.[Start Date] > convert(varchar,DATEADD(day,-100 ,getdate()), 23)  --100 days of data
		
		and s.state_desc='ONLINE' AND s.database_id>4 AND (s.name NOT LIKE '%OLD%') AND name 
		NOT IN ('BI_MDS','DM_FICO','BI_DM_OLD_20190621','DM_LOGI_OLD_20190717','SSISDB','TEST')
		
	OPEN DATABASE_cursor    
	FETCH NEXT FROM DATABASE_cursor INTO @DATABASENAME
	
  	WHILE @@FETCH_STATUS = 0   
	BEGIN
	
	 SET @SQL='INSERT INTO M_BI_LOG_DW2_SQLFIELDNAMES_STAGING SELECT DISTINCT c.TABLE_CATALOG,c.TABLE_NAME,c.COLUMN_NAME,v.TABLE_TYPE FROM '+@DATABASENAME +'.INFORMATION_SCHEMA.COLUMNS c
	 INNER JOIN ' + @DATABASENAME + '.INFORMATION_SCHEMA.TABLES v ON c.TABLE_CATALOG = v.TABLE_CATALOG AND c.TABLE_NAME = v.TABLE_NAME'

	 ---SET @SQL+=' WHERE v.TABLE_TYPE = ''VIEW'' AND (v.TABLE_NAME LIKE ''VF_%'' OR v.TABLE_NAME LIKE ''VU_%'' OR v.TABLE_NAME LIKE ''VUSR_%'')'
	
	exec sp_executesql @SQL
	
	--print @SQL
	FETCH NEXT FROM DATABASE_cursor INTO @DATABASENAME
	END 
	CLOSE DATABASE_cursor    
	DEALLOCATE DATABASE_cursor 


	MERGE M_BI_LOG_DW2_SQLFIELDNAMES t 
    USING M_BI_LOG_DW2_SQLFIELDNAMES_STAGING s
ON (s.[Database Name] = t.[Database Name] AND s.[Table Name]=t.[Table Name] AND s.[Field Name]=t.[Field Name])
/* Sai 03/03/2020 commented this code to retain the history
WHEN MATCHED
    THEN UPDATE SET 
        t.[Last Date Recorded]= GETDATE()*/
WHEN NOT MATCHED BY TARGET 
    THEN INSERT ([Database Name],[Table Name],[Field Name],[Last Date Recorded],[Table Type])
         VALUES (s.[Database Name], s.[Table Name], s.[Field Name],GETDATE(),s.[Table Type]);

	/*INSERT INTO M_BI_LOG_DW2_SQLFIELDNAMES ([Database Name],[Table Name],[Field Name])
	(SELECT [Database Name],[Table Name],[Field Name]  FROM M_BI_LOG_DW2_SQLFIELDNAMES_STAGING
	EXCEPT
	SELECT  [Database Name],[Table Name],[Field Name] FROM M_BI_LOG_DW2_SQLFIELDNAMES
	)
	UPDATE M_BI_LOG_DW2_SQLFIELDNAMES SET [Last Date Recorded]=GETDATE() WHERE [Last Date Recorded] IS NULL
*/
END

GO
