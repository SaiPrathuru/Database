SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_EmployeeImportLDAPData] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
	BEGIN
        -- Update the  M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT table to add
		--Employee Number,Renesas HR Company Code,Renesas HR Division Code,Renesas HR Employee Group
		-- from [ANALYSIS_LOG].[dbo].[M_EC_LOG_DW2_LDAP LDP] table
		UPDATE [ANALYSIS_LOG].[dbo].[M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT] 
		SET 		
					 [M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT].[Employee Number]=LDP.[Employee Number]
					,[M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT].[Renesas HR Company Code]=LDP.[Renesas HR Company Code]
					,[M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT].[Renesas HR Division Code]=LDP.[Renesas HR Division Code]
					,[M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT].[Renesas HR Employee Group]=LDP.[Renesas HR Employee Group]
	    FROM		[ANALYSIS_LOG].[dbo].[M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT] IMP
		INNER JOIN	[ANALYSIS_LOG].[dbo].[M_EC_LOG_DW2_LDAP] LDP
		ON			LOWER(LTRIM(RTRIM(IMP.[DS Number])))=LOWER(LTRIM(RTRIM(LDP.[DS Number])))
	END
END


--EXEC SP_EmployeeInsertIntoIM
GO
