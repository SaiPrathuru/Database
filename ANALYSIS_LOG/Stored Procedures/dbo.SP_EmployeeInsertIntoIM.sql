SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_EmployeeInsertIntoIM] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


--First we need to clear the existing data in the table.

--DELETE openquery (DBLINK_BI_UVK00001_QA,'SELECT * FROM UWA00001.M_EC_EMPLOYEE')

--DELETE  OPENQUERY(DBLINK_BI_UVK00001_QA ,'SELECT * FROM UWA00001.M_EC_EMPLOYEE')

EXECUTE('BEGIN UWA00001.P_TRUNC_M_EC_EMPLOYEE; END;') at DBLINK_BI_UVK00001_QA;


-- This can be very inefficient. We apparently cannot execute a TRUNCATE commany over a DBLINK to a remote table.
-- So, a work around is to create a Procudure on IM that executes a TRUNCATE on the table and then we call that Procedure from openquery.

--Insert Into the IM table
	INSERT INTO openquery (
DBLINK_BI_UVK00001_QA,
'SELECT 
RESULT_SET,
MATCH_FOUND,
EMPLOYEE_ID,
PERSON_ID,
USER_ID,
USERNAME,
USER_ACCOUNT,
SEQUENCE_NUMBER,
HIERARCHY,
HIERARCHY_LEVEL,
DS_NUMBER,
EMAIL,
EMAIL_ADDRESS,
USER_FULL_NAME,
USER_FIRST_NAME,
USER_LAST_NAME,
DISPLAY_NAME,
FORMAL_NAME,
BIRTH_NAME,
PREFERRED_NAME,
FIRST_NAME,
MIDDLE_NAME,
LAST_NAME,
PREFERRED_LAST_NAME,
DISPLAY_NAME_KANJI,
FORMAL_NAME_KANJI,
BIRTH_NAME_KANJI,
FIRST_NAME_KANJI,
MIDDLE_NAME_KANJI,
LAST_NAME_KANJI,
PREFERRED_LAST_NAME_KANJI,
DISPLAY_NAME_KANA,
FORMAL_NAME_KANA,
BIRTH_NAME_KANA,
FIRST_NAME_KANA,
MIDDLE_NAME_KANA,
LAST_NAME_KANA,
PREFERRED_LAST_NAME_KANA,
TITLE,
SUFFIX,
GENDER,
BUSINESS_PHONE_COUNTRY_CODE,
BUSINESS_PHONE_NUMBER,
BUSINESS_PHONE_EXTENSION,
BUSINESS_PHONE_VOIP,
MOBILE_PHONE_COUNTRY_CODE,
MOBILE_PHONE_NUMBER,
MOBILE_PHONE_EXTENSION,
MOBILE_PHONE_VOIP,
FAX_COUNTRY_CODE,
FAX_NUMBER,
FAX_EXTENSION,
FAX_VOIP,
COST_CENTER,
COST_CENTER_NAME,
JOB_COST_CENTER,
JOB_COST_CENTER_CODE,
JOB_COST_CENTER_NAME,
LOCATION_CODE,
LOCATION,
LOCATION_NAME,
COMPANY_COUNTRY,
COMPANY_CODE,
COMPANY,
COMPANY_NAME,
GROUP_REGION,
LOCAL_EMPLOYEE_NUMBER,
LOCAL_JOB_GRADE,
LOCAL_JOB_TITLE,
GLOBAL_JOB_GRADE,
GLOBAL_JOB_TITLE,
GLOBAL_UNIT_CODE,
GLOBAL_UNIT,
GLOBAL_UNIT_NAME,
GLOBAL_DIVISION_CODE,
GLOBAL_DIVISION,
GLOBAL_DIVISION_NAME,
UNIT_CODE,
UNIT_NAME,
UNIT,
DIVISION_CODE,
DIVISION_NAME,
DIVISION,
DEPARTMENT_CODE,
DEPARTMENT_NAME,
DEPARTMENT,
SECTION_CODE,
SECTION_NAME,
SECTION,
SOLID_LINE_MANAGER_USER_ID,
MANAGER_EMPLOYEE_ID,
MANAGER_USER_ID,
MANAGER_USERNAME,
MANAGER_DS_NUMBER,
MANAGER_EMAIL,
MANAGER_FULL_NAME,
MANAGER_FIRST_NAME,
MANAGER_LAST_NAME,
MANAGER_ISPRIMARY,
MANAGER_STATUS_CODE,
DIRECT_REPORTS,
TOTAL_TEAM_SIZE,
STATUS_CODE,
ASSIGNMENT_TYPE_CODE,
ASSIGNMENT_TYPE,
EMPLOYMENT_ASSIGNMENT_TYPE,
ISPRIMARYMERGED,
EMPLOYMENT_CLASSIFICATION_CODE,
EMPLOYMENT_CLASSIFICATION,
EMPLOYEE_TYPE_CODE,
EMPLOYEE_TYPE,
EMPLOYMENT_TYPE_CODE,
EMPLOYMENT_TYPE,
EMPLOYMENT_TYPE_JAPANESE,
EMPLOYMENT_DETAILS_NOTES,
JOB_INFO_NOTES,
EVENT,
EVENT_REASON_CODE,
EVENT_REASON,
BIRTH_DATE,
HIRE_DATE,
START_DATE,
ORIGINAL_START_DATE,
SERVICE_DATE,
LAST_INACTIVATION_DATE,
LEGAL_RETIREMENT_DATE,
LAST_DATE_WORKED,
PAYROLL_END_DATE,
TERMINATION_DATE,
JOB_TERMINATION_DATE,
CREATED_DATE,
USER_LAST_MODIFIED_DATE,
JOB_LAST_MODIFIED_DATE,
EMPLOYMENT_LAST_MODIFIED_DATE,
BIOGRAPHIC_LAST_MODIFIED_DATE,
PERSONAL_LAST_MODIFIED_DATE
FROM UWA00001.M_EC_EMPLOYEE'
)
SELECT 
--TOP 5 --Comment this out later.
[Result Set]
      ,[Match Found]
      ,[Employee ID]
      ,[Person ID]
      ,[User ID]
      ,[Username]
      ,[User Account]
      ,[Sequence Number]
      ,[Hierarchy]
      ,[Hierarchy Level]
      ,[DS Number]
      ,[Email]
      ,[Email Address]
      ,[User Full Name]
      ,[User First Name]
      ,[User Last Name]
      ,[Display Name]
      ,NULL --[Formal Name] Fields dropper in new file 08/20/20
      ,NULL --[Birth Name] Fields dropper in new file 08/20/20
      ,NULL --[Preferred Name] Fields dropper in new file 08/20/20
      ,[First Name]
      ,[Middle Name]
      ,[Last Name]
      ,[Last Name] --[Preferred Last Name] Fields dropper in new file 08/20/20
      ,[Display Name Kanji]
      ,NULL --[Formal Name Kanji] Fields dropper in new file 08/20/20
      ,NULL --[Birth Name Kanji] Fields dropper in new file 08/20/20
      ,[First Name Kanji]
      ,[Middle Name Kanji]
      ,[Last Name Kanji]
      ,NULL --[Preferred Last Name Kanji] Fields dropper in new file 08/20/20
      ,[Display Name Kana]
      ,NULL --[Formal Name Kana] Fields dropper in new file 08/20/20
      ,NULL --[Birth Name Kana] Fields dropper in new file 08/20/20
      ,[First Name Kana]
      ,[Middle Name Kana]
      ,[Last Name Kana]
      ,NULL --[Preferred Last Name Kana] Fields dropper in new file 08/20/20
      ,[Title]
      ,[Suffix]
      ,[Gender]
      ,[Business Phone Country Code]
      ,[Business Phone Number]
      ,[Business Phone Extension]
      ,[Business Phone VOIP]
      ,[Mobile Phone Country Code]
      ,[Mobile Phone Number]
      ,[Mobile Phone Extension]
      ,[Mobile Phone VOIP]
      ,[Fax Country Code]
      ,[Fax Number]
      ,[Fax Extension]
      ,[Fax VOIP]
      ,[Cost Center]
      ,[Cost Center Name]
      ,[Job Cost Center]
      ,[Job Cost Center Code]
      ,[Job Cost Center Name]
      ,[Location Code]
      ,[Location]
      ,[Location Name]
      ,[Company Country]
      ,[Company Code]
      ,[Company]
      ,[Company Name]
      ,[Group Region]
      ,[Local Employee Number]
      ,[Local Job Grade]
      ,[Local Job Title]
      ,[Global Job Grade]
      ,[Global Job Title]
      ,[Unit Code] --[Global Unit Code] Fields dropper in new file 08/20/20
      ,Unit --[Global Unit] Fields dropper in new file 08/20/20
      ,[Unit Name] --[Global Unit Name] Fields dropper in new file 08/20/20
      ,[Division Code] --[Global Division Code] Fields dropper in new file 08/20/20
      ,Division --[Global Division] Fields dropper in new file 08/20/20
      ,[Division Name] --[Global Division Name] Fields dropper in new file 08/20/20
      ,[Unit Code]
      ,[Unit Name]
      ,[Unit]
      ,[Division Code]
      ,[Division Name]
      ,[Division]
      ,[Department Code]
      ,[Department Name]
      ,[Department]
      ,[Section Code]
      ,[Section Name]
      ,[Section]
      ,[Solid Line Manager User ID]
	  ,[Manager Employee ID]
      ,[Manager User ID]
      ,[Manager Username]
      ,[Manager DS Number]
      ,[Manager Email]
      ,[Manager Full Name]
      ,[Manager First Name]
      ,[Manager Last Name]
      ,[Manager isPrimary]
      ,[Manager Status Code]
      ,[Direct Reports]
      ,[Total Team Size]
      ,[Status Code]
      ,[Assignment Type Code]
      ,[Assignment Type]
      ,[Employment Assignment Type]
      ,[isPrimaryMerged]
      ,[Employment Classification Code]
      ,[Employment Classification]
      ,[Employee Type Code]
      ,[Employee Type]
      ,[Employment Type Code]
      ,[Employment Type]
      ,[Employment Type Japanese]
      ,[Employment Details Notes]
      ,[Job Info Notes]
      ,[Event]
      ,[Event Reason Code]
      ,[Event Reason]
	  ,NULL
      -- ,[Birth Date]
      ,[Hire Date]
      --,[Start Date]
	  ,NULL
      -- ,[Original Start Date]
	  ,NULL
      --,[Service Date]
	  ,NULL
      ,[Last Inactivation Date]
      --,[Legal Retirement Date]
	  ,NULL
      -- ,[Last Date Worked]
	  ,NULL
      -- ,[Payroll End Date]
	  ,NULL
	  ,[Termination Date]
      ,[Job Termination Date]
      ,[Created Date]
      ,[User Last Modified Date]
      ,[Job Last Modified Date]
      ,[Employment Last Modified Date]
      ,[Biographic Last Modified Date]
      ,[Personal Last Modified Date]

FROM M_EC_LOG_DW2_EMPLOYEE 
WHERE [Login Type] <> 'Developer'
--ORDER BY [User ID] --Comment this out later.


END

GO
