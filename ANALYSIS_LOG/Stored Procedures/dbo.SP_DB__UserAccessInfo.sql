SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_DB__UserAccessInfo]
	
AS
BEGIN

DELETE FROM [ANALYSIS_LOG].[dbo].[M_BC_LOG_DW2_DBUSERS]

DECLARE  @dbs table (dbname sysname)
DECLARE  @qry nvarchar(max)
DECLARE  @Next sysname

INSERT  INTO @dbs

SELECT name FROM  sys.databases WHERE state_desc='ONLINE'  ORDER BY name

SELECT  TOP 1 @Next = dbname from @dbs
WHILE (@@rowcount<>0)
BEGIN
EXEC('use [' + @Next + ']

INSERT INTO [ANALYSIS_LOG].[dbo].[M_BC_LOG_DW2_DBUSERS]
		SELECT
				@@servername ServerName
				, db_name() DatabaseName,
				[UserType] = CASE princ.[type]
								 WHEN '+'''S'''+' THEN '+'''SQL User'''+'
								 WHEN '+'''U'''+' THEN '+'''Windows User'''+'
								 WHEN '+'''G'''+' THEN '+'''Windows Group'''+
							 'END,
				[DatabaseUserName] = princ.[name],
				[LoginName]        = ulogin.[name],
				[Role]             = NULL,
				[PermissionType]   = perm.[permission_name],
				[PermissionState]  = perm.[state_desc],
				[ObjectType] = CASE perm.[class]
								   WHEN 1 THEN obj.[type_desc]        -- Schema-contained objects
								   ELSE perm.[class_desc]             -- Higher-level objects
							   END,
				[Schema] = objschem.[name],
				[ObjectName] = CASE perm.[class]
								   WHEN 3 THEN permschem.[name]       -- Schemas
								   WHEN 4 THEN imp.[name]             -- Impersonations
								   ELSE OBJECT_NAME(perm.[major_id])  -- General objects
							   END,
				[ColumnName] = col.[name]
			FROM
				sys.database_principals            AS princ
				LEFT JOIN sys.server_principals    AS ulogin    ON ulogin.[sid] = princ.[sid]
				LEFT JOIN sys.database_permissions AS perm      ON perm.[grantee_principal_id] = princ.[principal_id]
				LEFT JOIN sys.schemas              AS permschem ON permschem.[schema_id] = perm.[major_id]
				LEFT JOIN sys.objects              AS obj       ON obj.[object_id] = perm.[major_id]
				LEFT JOIN sys.schemas              AS objschem  ON objschem.[schema_id] = obj.[schema_id]
				LEFT JOIN sys.columns              AS col       ON col.[object_id] = perm.[major_id]
																   AND col.[column_id] = perm.[minor_id]
				LEFT JOIN sys.database_principals  AS imp       ON imp.[principal_id] = perm.[major_id]
			WHERE
				princ.[type] IN ('+'''S'''+','+'''U'''+','+'''G'''+')
				AND princ.[name] NOT IN ('+'''sys'''+', '+'''INFORMATION_SCHEMA'''+')
		UNION
			SELECT
				@@servername ServerName
				, db_name() DatabaseName,
				[UserType] = CASE membprinc.[type]
								 WHEN '+'''S'''+' THEN '+'''SQL User'''+'
								 WHEN '+'''U'''+' THEN '+'''Windows User'''+'
								 WHEN '+'''G'''+' THEN '+'''Windows Group'''+'
							 END,
				[DatabaseUserName] = membprinc.[name],
				[LoginName]        = ulogin.[name],
				[Role]             = roleprinc.[name],
				[PermissionType]   = perm.[permission_name],
				[PermissionState]  = perm.[state_desc],
				[ObjectType] = CASE perm.[class]
								   WHEN 1 THEN obj.[type_desc]        -- Schema-contained objects
								   ELSE perm.[class_desc]             -- Higher-level objects
							   END,
				[Schema] = objschem.[name],
				[ObjectName] = CASE perm.[class]
								   WHEN 3 THEN permschem.[name]       -- Schemas
								   WHEN 4 THEN imp.[name]             -- Impersonations
								   ELSE OBJECT_NAME(perm.[major_id])  -- General objects
							   END,
				[ColumnName] = col.[name]
			FROM
				sys.database_role_members          AS members
				JOIN      sys.database_principals  AS roleprinc ON roleprinc.[principal_id] = members.[role_principal_id]
				JOIN      sys.database_principals  AS membprinc ON membprinc.[principal_id] = members.[member_principal_id]
				LEFT JOIN sys.server_principals    AS ulogin    ON ulogin.[sid] = membprinc.[sid]
				LEFT JOIN sys.database_permissions AS perm      ON perm.[grantee_principal_id] = roleprinc.[principal_id]
				LEFT JOIN sys.schemas              AS permschem ON permschem.[schema_id] = perm.[major_id]
				LEFT JOIN sys.objects              AS obj       ON obj.[object_id] = perm.[major_id]
				LEFT JOIN sys.schemas              AS objschem  ON objschem.[schema_id] = obj.[schema_id]
				LEFT JOIN sys.columns              AS col       ON col.[object_id] = perm.[major_id]
																   AND col.[column_id] = perm.[minor_id]
				LEFT JOIN sys.database_principals  AS imp       ON imp.[principal_id] = perm.[major_id]
			WHERE
				membprinc.[type] IN ('+'''S'''+','+'''U'''+','+'''G'''+')				
				AND membprinc.[name] NOT IN ('+'''sys'''+', '+'''INFORMATION_SCHEMA'''+')
		UNION
			SELECT
				@@servername ServerName
				, db_name() DatabaseName,
				[UserType]         = '+'''{All Users}'''+',
				[DatabaseUserName] = '+'''{All Users}'''+',
				[LoginName]        = '+'''{All Users}'''+',
				[Role]             = roleprinc.[name],
				[PermissionType]   = perm.[permission_name],
				[PermissionState]  = perm.[state_desc],
				[ObjectType] = CASE perm.[class]
								   WHEN 1 THEN obj.[type_desc]        
								   ELSE perm.[class_desc]            
							   END,
				[Schema] = objschem.[name],
				[ObjectName] = CASE perm.[class]
								   WHEN 3 THEN permschem.[name]      
								   WHEN 4 THEN imp.[name]            
								   ELSE OBJECT_NAME(perm.[major_id]) 
							   END,
				[ColumnName] = col.[name]
			FROM
				sys.database_principals            AS roleprinc
				LEFT JOIN sys.database_permissions AS perm      ON perm.[grantee_principal_id] = roleprinc.[principal_id]
				LEFT JOIN sys.schemas              AS permschem ON permschem.[schema_id] = perm.[major_id]
				JOIN      sys.objects              AS obj       ON obj.[object_id] = perm.[major_id]
				LEFT JOIN sys.schemas              AS objschem  ON objschem.[schema_id] = obj.[schema_id]
				LEFT JOIN sys.columns              AS col       ON col.[object_id] = perm.[major_id]
																   AND col.[column_id] = perm.[minor_id]
				LEFT JOIN sys.database_principals  AS imp       ON imp.[principal_id] = perm.[major_id]
			WHERE
				roleprinc.[type] = '+'''R'''+'
				AND roleprinc.[name] = '+'''public'''+'
				AND obj.[is_ms_shipped] = 0
			ORDER BY
			[UserType],
			[DatabaseUserName],
			[LoginName],
			[Role],
			[Schema],
			[ObjectName],
			[ColumnName],
			[PermissionType],
			[PermissionState],
			[ObjectType]')
		--print @qry		
		DELETE  @dbs WHERE  dbname = @Next
		SELECT TOP 1 @Next = dbname FROM @dbs
	END 


	BEGIN

		DELETE FROM M_BC_LOG_DW2_DBSIZES WHERE RunDate=CONVERT(date, getdate())

		INSERT INTO M_BC_LOG_DW2_DBSIZES
		SELECT CONVERT(date, getdate()), d.NAME
		,ROUND(SUM(CAST(mf.size AS bigint)) * 8 / 1024, 0) Size_MBs
		,(SUM(CAST(mf.size AS bigint)) * 8 / 1024) / 1024 AS Size_GBs
		FROM sys.master_files mf
		INNER JOIN sys.databases d ON d.database_id = mf.database_id
		WHERE d.database_id > 4 -- Skip system databases
		GROUP BY d.NAME

		

	END

		set nocount off
END

--EXEC [SP_SQLSERVER_UserAccessInfo]
GO
