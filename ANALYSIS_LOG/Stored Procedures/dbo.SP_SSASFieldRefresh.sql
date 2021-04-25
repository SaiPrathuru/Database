SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE[dbo].[SP_SSASFieldRefresh]
(@InputCode INT)
AS
BEGIN
    IF @InputCode=1
	BEGIN
				MERGE M_BI_LOG_DW2_DATABASES t 
				USING M_BI_LOG_DW2_DATABASES_STAGING s
			ON (s.[DatabaseName] = t.[DatabaseName] AND s.[ServerId]=t.[ServerId] )



			WHEN NOT MATCHED BY TARGET 
				THEN 
					INSERT ([DatabaseName],ServerId,ConnectionString,ServerName,CubeType,CubeTypeDescription,[Last Date Recorded])
					 VALUES (s.[DatabaseName], s.ServerId,s.ConnectionString,s.ServerName,s.CubeType,s.CubeTypeDescription,GETDATE())
		 
			WHEN NOT MATCHED BY SOURCE 
				THEN 
					UPDATE  SET t.DeletedDate=  (GETDATE());

			DECLARE @DBName NVARCHAR(1024)
			DECLARE DB_cursor CURSOR FOR  	
				SELECT DatabaseName	FROM [ANALYSIS_LOG].[dbo].M_BI_LOG_DW2_DATABASES WHERE DeletedDate<>''

				OPEN DB_cursor    
				FETCH NEXT FROM DB_cursor  INTO @DBName
  				WHILE @@FETCH_STATUS = 0   

				BEGIN
						BEGIN
							UPDATE M_BI_LOG_DW2_DBCONNECTION SET ServerId=0 WHERE ConnectionString  LIKE '%'+@DBName+'%' AND ServerId<>0
						END
						FETCH NEXT FROM DB_cursor INTO   @DBName
				END   	
				CLOSE DB_cursor    
				DEALLOCATE DB_cursor 

	END		 
	IF @InputCode=2
	BEGIN

		MERGE M_BI_LOG_DW2_DBSCHEMA_TABLES t 
				USING M_BI_LOG_DW2_DBSCHEMA_TABLES_STAGING s
			ON (s.ServerId = t.ServerId AND s.[Database]=t.[Database] AND s.[Cube]=t.[Cube] )



			WHEN NOT MATCHED BY TARGET 
				THEN 
					INSERT (ServerId,[Database],[Cube],[Last Date Recorded])
					 VALUES ( s.ServerId,s.[Database],s.[Cube],GETDATE())
		 
			WHEN NOT MATCHED BY SOURCE 
				THEN 
					UPDATE  SET t.DeletedDate=  (GETDATE());
		END
	
	IF @InputCode=2
	BEGIN

		MERGE M_BI_LOG_DW2_MDSCHEMA_CUBES t 
				USING M_BI_LOG_DW2_MDSCHEMA_CUBES_STAGING s
			ON (s.ServerId = t.ServerId AND s.[Database]=t.[Database] AND s.[Cube]=t.[Cube] AND s.CubeDescription=t.CubeDescription /*AND s.LastSchemaUpdate=t.LastSchemaUpdate AND s.LastDataUpdate=t.LastDataUpdate*/)
			WHEN NOT MATCHED BY TARGET 
				THEN 
					INSERT (ServerId,[Database],[Cube],[Last Date Recorded],CubeDescription,LastSchemaUpdate,LastDataUpdate)
					 VALUES ( s.ServerId,s.[Database],s.[Cube],GETDATE(),s.CubeDescription,s.LastSchemaUpdate,s.LastDataUpdate)
		 
			WHEN NOT MATCHED BY SOURCE 
				THEN 
					UPDATE  SET t.DeletedDate=  (GETDATE());
		END
	IF @InputCode=2
	BEGIN

		MERGE M_BI_LOG_DW2_MDSCHEMA_DIMENSIONS t 
				USING M_BI_LOG_DW2_MDSCHEMA_DIMENSIONS_STAGING s
			ON (s.ServerId = t.ServerId AND s.[Database]=t.[Database] AND s.[Cube]=t.[Cube] AND s.FieldGroup=t.FieldGroup AND s.Visible=t.Visible )
			WHEN NOT MATCHED BY TARGET 
				THEN 
					INSERT (ServerId,[Database],[Cube],[Last Date Recorded],FieldGroup,Visible)
					 VALUES ( s.ServerId,s.[Database],s.[Cube],GETDATE(),s.FieldGroup,s.Visible)
		 
			WHEN NOT MATCHED BY SOURCE 
				THEN 
					UPDATE  SET t.DeletedDate=  (GETDATE());
		END

	IF @InputCode=2
	BEGIN

		MERGE M_BI_LOG_DW2_MDSCHEMA_MEASURES t 
				USING M_BI_LOG_DW2_MDSCHEMA_MEASURES_STAGING s
			ON (s.ServerId = t.ServerId AND s.[Database]=t.[Database] AND s.[Cube]=t.[Cube] AND s.FieldGroup=t.FieldGroup AND s.Visible=t.Visible AND s.FieldName=t.FieldName)
			WHEN NOT MATCHED BY TARGET 
				THEN 
					INSERT (ServerId,[Database],[Cube],[Last Date Recorded],FieldGroup,Visible,[FieldName],MeasureFormat,MeasureExpression)
					 VALUES ( s.ServerId,s.[Database],s.[Cube],GETDATE(),s.FieldGroup,s.Visible,s.[FieldName],s.MeasureFormat,s.MeasureExpression)
		 
			WHEN NOT MATCHED BY SOURCE 
				THEN 
					UPDATE  SET t.DeletedDate=  (GETDATE());
		END

	IF @InputCode=2
	BEGIN

		MERGE M_BI_LOG_DW2_MDSCHEMA_MEMBERS t 
				USING M_BI_LOG_DW2_MDSCHEMA_MEMBERS_STAGING s
			ON (s.ServerId = t.ServerId AND s.[Database]=t.[Database] AND s.[Cube]=t.[Cube] AND s.[FieldGroup]=t.[FieldGroup]  AND s.FieldName=t.FieldName)
			WHEN NOT MATCHED BY TARGET 
				THEN 
					INSERT (ServerId,[Database],[Cube],[Last Date Recorded],FieldGroup,[FieldName])
					 VALUES ( s.ServerId,s.[Database],s.[Cube],GETDATE(),s.FieldGroup,s.[FieldName])
		 
			WHEN NOT MATCHED BY SOURCE 
				THEN 
					UPDATE  SET t.DeletedDate=  (GETDATE());
		END


	IF @InputCode=2
	BEGIN
		DELETE FROM M_BI_LOG_DW2_CUBEFIELDNAMES
		INSERT INTO M_BI_LOG_DW2_CUBEFIELDNAMES SELECT [Database],Cube,FieldName,FieldGroup,Fieldtype,[Last Date Recorded],DeletedDate  FROM VUSR_T_SSASFIELD_DETAILS
	END
END


GO
