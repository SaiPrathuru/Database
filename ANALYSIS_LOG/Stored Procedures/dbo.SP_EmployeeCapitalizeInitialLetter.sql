SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_EmployeeCapitalizeInitialLetter] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- This section of code is for inserting the developer accounts
	
	-- Because we use Truncate, there is no need to delete existing developer accounts first.

	INSERT 
	INTO	 M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE
	SELECT *
	FROM		M_EC_LOG_DW2_DEVELOPERINFO
	WHERE		[User ID] NOT  IN  
	(SELECT		DISTINCT [User ID] 
		FROM		M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE)

	
/*
	INSERT 
	INTO	 M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE
			(
			 [Result Set],[Match Found], 
			 [User ID],[Employee ID],[Username],[User Full Name] ,[First Name],[Last Name]
			  ,[Email]    ,[Email Address]  ,[DS Number]     
			  ,[Global Job Grade]      ,[Global Job Title]      ,[Local Job Grade]      ,[Local Job Title]
			  ,[Location Name]      ,[Group Region]      ,[Global Unit Name]      ,[Global Division Name]
			  ,[Unit Name]      /*,[Unit Name Abbreviation]*/      ,[Division Name]      ,[Department Name]
			  ,[Section Name]      ,[Manager User ID]      ,[Manager Username]     ,[Manager Full Name]
			  ,[Manager First Name]      ,[Manager Last Name]      ,[Manager Email]      ,[Manager DS Number]
			  /*,[Manager DS Number ]  */    ,[Direct Reports]      ,[Total Team Size]      --,[Status]
			  ,[Status Code]      ,[isPrimaryMerged]      ,[Employee Type]      ,[Employment Type]
			  ,[Employment Type Japanese]      ,[Assignment Type]      ,[Last Inactivation Date]      ,[Termination Date]
			  ,[User Last Modified Date]      ,[Created Date]      ,[Hierarchy Level]      ,[Global Unit]
			  ,[Global Unit Code]      ,[Global Division]      ,[Global Division Code]
			  ,[Hierarchy]      ,[Function Head Employee ID]       ,[Function Name]      ,[Function Head Name]
			  ,[Function Head Global Unit]      ,[Function Head Global Division]      ,[Function Head Email]       
			  ,[Login Type]      ,[Location]       ,[Location Code]      ,[Unit]
			  ,[Unit Code]       /*,[Unit Short Name]     */ ,[Division]       ,[Division Code]
			  ,[Department]       ,[Department Code]      ,[Section]       ,[Section Code] ,[Manager isPrimary],[Manager Status Code]
			)
	SELECT 
			'10. Developer',	'1'	,
			
			[User ID],[User ID],[Username],[Full Name],[First Name],[Last Name]
			  ,[Email]    ,[User ID]+'@renesas.com'  ,[DS Number]     
			  ,[Global Job Grade]      ,[Global Job Title]      ,[Local Job Grade]      ,[Local Job Title]
			  ,[Location Name]      ,[Group Region]      ,[Global Unit Name]      ,[Global Division Name]
			  ,[Regional Unit Name]     /* ,[Regional Unit Name Abbreviation]  */    ,[Regional Division Name]      ,[Regional Department Name]
			  ,[Regional Section Name]      ,[Manager User ID]      ,[Manager Username]      ,[Manager Full Name]
			  ,[Manager First Name]      ,[Manager Last Name]      ,[Manager Email]      ,[Manager DS Number]
			 /* ,[Manager DS ID Number] */     ,[Direct Reports]      ,[TotalTeamSize]     -- ,[Status]
			  ,[Status Code]      ,[Is Primary]      ,[Employee Type]      ,[Employment Type]
			  ,[Employment Type Japanese]      ,[Assignment Type]      ,[Last Inactivation Date]      ,[Termination Date]
			  ,[Last Modified Date]      ,[Created Date]      ,[Hierarchy Level]      ,[Global Unit]
			  ,[Global Unit Code]      ,[Global Division]      ,[Global Division Code]
			  ,[Hierarchy]      ,[Function Head Employee ID]       ,[Function Name]      ,[Function Head Name]
			  ,[Function Head Global Unit]      ,[Function Head Global Division]      ,[Function Head Email]       
			  ,[Login Type]      ,[Location]       ,[Location Code]      ,[Regional Unit]
			  ,[Regional Unit Code]       /*,[Regional Unit Short Name]  */    ,[Regional Division]       ,[Regional Division Code]
			  ,[Regional Department]       ,[Regional Department Code]      ,[Regional Section]       ,[Regional Section Code] ,'true','t'
	FROM		M_EC_LOG_DW2_DEVELOPERINFO
	WHERE		[User ID] NOT  IN  
	(SELECT		DISTINCT [User ID] 
		FROM		M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE)

	*/
	
	UPDATE M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEESOURCE 
	SET 
		/* --Old version
		[First Name]			=[dbo].[FN_CapitalizeInitialLetter]([First Name])
		,[Last Name]			=[dbo].[FN_CapitalizeInitialLetter]([Last Name])
		,[Full Name]			=[dbo].[FN_CapitalizeInitialLetter]([Full Name])
		,[Manager First Name]	=[dbo].[FN_CapitalizeInitialLetter]([Manager First Name])
		,[Manager Last Name]	=[dbo].[FN_CapitalizeInitialLetter]([Manager Last Name])
		,[Manager Full Name]	=[dbo].[FN_CapitalizeInitialLetter]([Manager Full Name])	
		*/

		/* New Version 20191121 */
		[User Full Name]          = [dbo].[FN_CapitalizeInitialLetter]([User Full Name])
		,[User First Name]        = [dbo].[FN_CapitalizeInitialLetter]([User First Name])
		,[User Last Name]         = [dbo].[FN_CapitalizeInitialLetter]([User Last Name])
		,[Display Name]           = [dbo].[FN_CapitalizeInitialLetter]([Display Name])
		--,[Formal Name]            = [dbo].[FN_CapitalizeInitialLetter]([Formal Name]) Sai 08/20/20 field dropped from input file
		--,[Birth Name]             = [dbo].[FN_CapitalizeInitialLetter]([Birth Name])  Sai 08/20/20 field dropped from input file
		--,[Preferred Name]         = [dbo].[FN_CapitalizeInitialLetter]([Preferred Name]) Sai 08/20/20 field dropped from input file
		,[First Name]             = [dbo].[FN_CapitalizeInitialLetter]([First Name])
		,[Middle Name]            = [dbo].[FN_CapitalizeInitialLetter]([Middle Name])
		,[Last Name]              = [dbo].[FN_CapitalizeInitialLetter]([Last Name])
		--,[Preferred Last Name]    = [dbo].[FN_CapitalizeInitialLetter]([Preferred Last Name]) Sai 08/20/20 field dropped from input file
		--Below fields are added on 08/08/2020 from new file
		,[IF Formal Last Name]=[dbo].[FN_CapitalizeInitialLetter]([IF Formal Last Name])
		,[IF Formal First Name]=[dbo].[FN_CapitalizeInitialLetter]([IF Formal First Name])
		,[IF Formal Middle Name]=[dbo].[FN_CapitalizeInitialLetter]([IF Formal Middle Name])
		,[IF Formal Last Name Kanji]=[dbo].[FN_CapitalizeInitialLetter]([IF Formal Last Name Kanji])
		,[IF Formal First Name Kanji]=[dbo].[FN_CapitalizeInitialLetter]([IF Formal First Name Kanji])
		,[IF Formal Last Name Kana]=[dbo].[FN_CapitalizeInitialLetter]([IF Formal Last Name Kana])
		,[IF Formal First Name Kana]=[dbo].[FN_CapitalizeInitialLetter]([IF Formal First Name Kana])



END

GO
