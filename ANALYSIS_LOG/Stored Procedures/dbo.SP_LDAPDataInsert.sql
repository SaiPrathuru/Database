SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_LDAPDataInsert] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE	@RecordCount				INT

	SET @RecordCount=0
--First we need to find data is available in staging table the existing data in the table.
	SELECT @RecordCount=COUNT(*) FROM [ANALYSIS_LOG].[dbo].[M_EC_LOG_DW2_LDAP_STAGING]
--Insert data Into LDAP table
	IF @RecordCount>0 
	BEGIN
--Delete the existing data from [M_EC_LOG_DW2_LDAP]
	    TRUNCATE TABLE [ANALYSIS_LOG].[dbo].[M_EC_LOG_DW2_LDAP] 
-- Insert the latest data		
		INSERT INTO [ANALYSIS_LOG].[dbo].[M_EC_LOG_DW2_LDAP] 
		SELECT  [Employee Number]
				  ,[DS Number]
				  ,[Renesas HR Company Code]
				  ,[Renesas HR Division Code]
				  ,[Renesas HR Employee Group]
				  ,[Email]
				  ,[CN]
				  ,[Create Timestamp]
				  ,[Modify Timestamp]
	FROM [ANALYSIS_LOG].[dbo].[M_EC_LOG_DW2_LDAP_STAGING]
	END
END


--EXEC SP_EmployeeInsertIntoIM
GO
