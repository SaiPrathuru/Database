SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE[dbo].[SP_CubeFieldRefresh_DonotUse]
--(@DNAME VARCHAR(1024))
AS
BEGIN
    DELETE FROM M_BI_LOG_DW2_CUBEFIELDNAMES_STAGING
	
	DECLARE @DATABASENAME NVARCHAR(1024)
	DECLARE @SQL NVARCHAR(MAX);

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
