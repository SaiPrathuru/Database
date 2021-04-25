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
CREATE  PROCEDURE[dbo].[SP_JsonDataParsing]

AS
BEGIN


	/* Variable declaration section*/

	DECLARE @CreationDate				datetime
	DECLARE @UserIds				VARCHAR(1024)
	DECLARE	@Operations					VARCHAR(1024)
	DECLARE	@AuditData					VARCHAR(4000)

	
	DELETE FROM T_BI_LOG_DW1_STREAMLOG_STG1
	DELETE FROM T_BI_LOG_DW1_STREAMLOG_STG2
	DELETE FROM T_BI_LOG_DW1_STREAMLOG_STG3

--CREATE TABLE #temp_json (
--	[Key] [nvarchar](1024) NULL,
--	[Value] [nvarchar](1024) NULL,
--	[id] [int] NULL
--)

--CREATE TABLE #temp_json_full(
--	[CreationDate] [datetime] NULL,
--	[UserIds] [nvarchar](256) NULL,
--	[Opearations] [nvarchar](256) NULL,
--	[ResourceUrl] [nvarchar](1024) NULL,
--	[ResourceTitle] [nvarchar](1024) NULL,
--	[EntityPath] [nvarchar](1024) NULL,
--	[OperationDetails] [nvarchar](1024) NULL,
--	[ClientApplicationId] [nvarchar](1024) NULL,
--	[ObjectId] [nvarchar](1024) NULL,
--	[UserId] [nvarchar](64) NULL,
--	[ClientIP] [nvarchar](64) NULL,
--	[Id] [nvarchar](64) NULL,
--	[RecordType] [int] NULL,
--	[CreationTime] [datetime] NULL,
--	[Operation] [nvarchar](256) NULL,
--	[OrganizationId] [nvarchar](256) NULL,
--	[UserType] [int] NULL,
--	[UserKey] [nvarchar](64) NULL,
--	[Workload] [nvarchar](64) NULL,
--	[ResultStatus] [nvarchar](64) NULL,
--	[Version] [int] NULL
--)

--CREATE TABLE #temp_json_full_FINAL(
--	[CreationDate] [datetime] NULL,
--	[UserIds] [nvarchar](256) NULL,
--	[Opearations] [nvarchar](256) NULL,
--	[ResourceUrl] [nvarchar](1024) NULL,
--	[ResourceTitle] [nvarchar](1024) NULL,
--	[EntityPath] [nvarchar](1024) NULL,
--	Name NVARCHAR(512),
--	Description NVARCHAR(512),
--	PrivacyMode NVARCHAR(512),

--	[ClientApplicationId] [nvarchar](1024) NULL,
--	[ObjectId] [nvarchar](1024) NULL,
--	[UserId] [nvarchar](64) NULL,
--	[ClientIP] [nvarchar](64) NULL,
--	[Id] [nvarchar](64) NULL,
--	[RecordType] [int] NULL,
--	[CreationTime] [datetime] NULL,
--	[Operation] [nvarchar](256) NULL,
--	[OrganizationId] [nvarchar](256) NULL,
--	[UserType] [int] NULL,
--	[UserKey] [nvarchar](64) NULL,
--	[Workload] [nvarchar](64) NULL,
--	[ResultStatus] [nvarchar](64) NULL,
--	[Version] [int] NULL
--)

	/* The below cursor handles the employees data who are not managers to build the hirearchy*/

	DECLARE Json_cursor CURSOR FOR  	
	SELECT  distinct *
	FROM	 T_BI_LOG_DW1_STREAMLOG 
	


	OPEN Json_cursor    
	FETCH NEXT FROM Json_cursor  INTO 	@CreationDate,@UserIds,@Operations,@AuditData
  	WHILE @@FETCH_STATUS = 0   

	BEGIN
	
			 insert into T_BI_LOG_DW1_STREAMLOG_STG1 --#temp_json  
			 select * from OPENJSON(@AuditData)

			  insert into T_BI_LOG_DW1_STREAMLOG_STG2 ---#temp_json_full
				select @CreationDate,@UserIds,@Operations,
						ResourceUrl,
						ResourceTitle,
						EntityPath,
						OperationDetails,
						ClientApplicationId,
						ObjectId,
						UserId,
						ClientIP,
						Id,
						RecordType,
						CreationTime,
						Operation,
						OrganizationId,
						UserType,
						UserKey,
						Workload,
						ResultStatus,
						Version
						from
						(select [Key]
							  ,[Value]
								from T_BI_LOG_DW1_STREAMLOG_STG1 
								--#temp_json
								)d
						pivot
						(
						  max([Value])
						  for [Key] in 
						(ResourceUrl,
						ResourceTitle,
						EntityPath,
						OperationDetails,
						ClientApplicationId,
						ObjectId,
						UserId,
						ClientIP,
						Id,
						RecordType,
						CreationTime,
						Operation,
						OrganizationId,
						UserType,
						UserKey,
						Workload,
						ResultStatus,
						Version)
						) piv;

			DELETE FROM T_BI_LOG_DW1_STREAMLOG_STG1 --#temp_json
				
			FETCH NEXT FROM Json_cursor INTO  @CreationDate,@UserIds,@Operations,@AuditData

	END   	
	CLOSE Json_cursor    
	DEALLOCATE Json_cursor


	--DECLARE @CreationDate datetime
	--DECLARE @UserIds nvarchar(256)
	DECLARE @Opearations nvarchar(256) 
	DECLARE @ResourceUrl nvarchar(1024) 
	DECLARE @ResourceTitle nvarchar(1024) 
	DECLARE @EntityPath nvarchar(1024) 
	DECLARE @OperationDetails nvarchar(1024) 
	DECLARE @ClientApplicationId nvarchar(1024)
	DECLARE @ObjectId nvarchar(1024) 
	DECLARE @UserId nvarchar(64) 
	DECLARE @ClientIP nvarchar(64) 
	DECLARE @Id nvarchar (64) 
	DECLARE @RecordType int 
	DECLARE @CreationTime datetime
	DECLARE @Operation nvarchar(256) 
	DECLARE @OrganizationId nvarchar(256) 
	DECLARE @UserType int
	DECLARE @UserKey nvarchar(64)
	DECLARE @Workload nvarchar(64) 
	DECLARE @ResultStatus nvarchar(64) 
	DECLARE @Version int


	DELETE FROM T_BI_LOG_DW1_STREAMLOG_STG1 --#temp_json

	DECLARE Json_cursor1 CURSOR FOR  	
	SELECT  *
	FROM T_BI_LOG_DW1_STREAMLOG_STG2	 ---#temp_json_full 
	OPEN Json_cursor1    
	FETCH NEXT FROM Json_cursor1  INTO 	 @CreationDate ,@UserIds ,@Opearations ,@ResourceUrl ,@ResourceTitle ,@EntityPath ,@OperationDetails,@ClientApplicationId,@ObjectId ,@UserId,
	@ClientIP ,@Id,@RecordType ,@CreationTime,@Operation,@OrganizationId,@UserType,@UserKey,@Workload ,@ResultStatus,@Version 

  	WHILE @@FETCH_STATUS = 0   

	BEGIN
	
			 insert into T_BI_LOG_DW1_STREAMLOG_STG1 --#temp_json  
			 select * from OPENJSON(@OperationDetails)

			  insert into  T_BI_LOG_DW1_STREAMLOG_STG3   ---#temp_json_full_FINAL
				select @CreationDate,
				       @UserIds
					  ,@Operations,
						@ResourceUrl,
						@ResourceTitle,
						@EntityPath,

						Name ,
						Description ,
						PrivacyMode ,
						
						@ClientApplicationId,
						@ObjectId,
						@UserId,
						@ClientIP,
						@Id,
						@RecordType,
						@CreationTime,
						@Operation,
						@OrganizationId,
						@UserType,
						@UserKey,
						@Workload,
						@ResultStatus,
						@Version
						from
						(select [Key]
							  ,[Value]
								from T_BI_LOG_DW1_STREAMLOG_STG1 ---#temp_json
								)d
						pivot
						(
						  max([Value])
						  for [Key] in 
						(Name ,
						Description ,
						PrivacyMode )
						) piv;

			DELETE FROM  T_BI_LOG_DW1_STREAMLOG_STG1 ---#temp_json
				
			FETCH NEXT FROM Json_cursor1  INTO 	 @CreationDate ,@UserIds ,@Opearations ,@ResourceUrl ,@ResourceTitle ,@EntityPath ,@OperationDetails,@ClientApplicationId,@ObjectId ,@UserId,
	@ClientIP ,@Id,@RecordType ,@CreationTime,@Operation,@OrganizationId,@UserType,@UserKey,@Workload ,@ResultStatus,@Version 

	END   	
	CLOSE Json_cursor1    
	DEALLOCATE Json_cursor1
	
	DELETE FROM T_BI_LOG_DW1_STREAMLOG_STG1 ---#temp_json
	

MERGE  [ANALYSIS_LOG].[dbo].[T_BI_LOG_DW2_STREAMLOG]   T1
USING /*#temp_json_full_FINAL*/ T_BI_LOG_DW1_STREAMLOG_STG3  SOURCE 
ON (T1.CreationDate = SOURCE.CreationDate and T1.UserIds=SOURCE.UserIds AND T1.Opearations=SOURCE.Opearations AND T1.ResourceUrl=SOURCE.ResourceUrl AND T1.ResourceTitle=SOURCE.ResourceTitle AND T1.EntityPath=SOURCE.EntityPath
--AND T1.Name=SOURCE.Name AND T1.Description=SOURCE.Description 
AND T1.PrivacyMode=SOURCE.PrivacyMode AND T1.ClientApplicationId=SOURCE.ClientApplicationId AND T1.ObjectId=SOURCE.ObjectId AND T1.UserId=SOURCE.UserId AND T1.ClientIP=SOURCE.ClientIP
AND T1.Id=SOURCE.Id AND T1.RecordType=SOURCE.RecordType AND T1.CreationTime=SOURCE.CreationTime AND T1.Operation=SOURCE.Operation AND T1.OrganizationId=SOURCE.OrganizationId
AND T1.UserType=SOURCE.UserType AND T1.UserKey=SOURCE.UserKey AND T1.Workload=SOURCE.Workload AND T1.ResultStatus=SOURCE.ResultStatus AND T1.Version=SOURCE.Version) 
--When records are matched, update the records if there is any change
--When no records are matched, insert the incoming records from source table to target table
WHEN NOT MATCHED BY TARGET 
THEN INSERT ([CreationDate]
		,[CreationDate_TOKYO_STANDARD_DATE]
      ,[UserIds]
      ,[Opearations]
      ,[ResourceUrl]
      ,[ResourceTitle]
      ,[EntityPath]
      ,[Name]
	  ,[Description] 
	   ,[PrivacyMode] 
      ,[ClientApplicationId]
      ,[ObjectId]
      ,[UserId]
      ,[ClientIP]
      ,[Id]
      ,[RecordType]
      ,[CreationTime]
	  ,[CreationTime_TOKYO_STANDARD_TIME]
      ,[Operation]
      ,[OrganizationId]
      ,[UserType]
      ,[UserKey]
      ,[Workload]
      ,[ResultStatus]
      ,[Version]) VALUES (SOURCE.[CreationDate]
	  ,(SOURCE.[CreationDate] AT time zone 'UTC') at time zone 'TOKYO STANDARD DATE'
      ,SOURCE.[UserIds]
      ,SOURCE.[Opearations]
      ,SOURCE.[ResourceUrl]
      ,SOURCE.[ResourceTitle]
      ,SOURCE.[EntityPath]
      ,SOURCE.[Name]
	   ,SOURCE.[Description] 
		,SOURCE.[PrivacyMode] 
      ,SOURCE.[ClientApplicationId]
      ,SOURCE.[ObjectId]
      ,SOURCE.[UserId]
      ,SOURCE.[ClientIP]
      ,SOURCE.[Id]
      ,SOURCE.[RecordType]
      ,SOURCE.[CreationTime]
	  ,(SOURCE.[CreationTime] AT time zone 'UTC') at time zone 'TOKYO STANDARD TIME' 
      ,SOURCE.[Operation]
      ,SOURCE.[OrganizationId]
      ,SOURCE.[UserType]
      ,SOURCE.[UserKey]
      ,SOURCE.[Workload]
      ,SOURCE.[ResultStatus]
      ,SOURCE.[Version]);
	  
--When there is a row that exists in target and same record does not exist in source then delete this record target


	--DROP TABLE #temp_json
	--DROP TABLE #temp_json_full

	--DROP TABLE #temp_json_full_FINAL
	DELETE FROM T_BI_LOG_DW1_STREAMLOG_STG1
	DELETE FROM T_BI_LOG_DW1_STREAMLOG_STG2
	DELETE FROM T_BI_LOG_DW1_STREAMLOG_STG3

end

--EXEC [SP_JsonDataParsing]
GO
