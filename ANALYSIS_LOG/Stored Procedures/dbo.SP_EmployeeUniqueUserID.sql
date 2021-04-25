SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[SP_EmployeeUniqueUserID] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


/***
-- HRIS SAP SuccessFactors Employee Central Data Pre-Processing
-- Created 11/13 12:40AM JST by Jonathan Nawrocki
-- Last Modified 11/21/2019 8:00PM CST by Jonathan Nawrocki
-- -- Changed [Assignemtn Type] to [Employment Assignment Type]
--  Use CTEs to build up the queries to union and produce the desired result set.

-- General Steps.
-- 1. Load HRIS Extract into Staging Table (Truncate and Load)
-- 2. Generate the isPrimaryMerged field. (If this field cannot be prepared from the extract originally.)
-- 3. Run this script to derive the correct User IDs for each Employee ID and Insert the results into a source table. (Truncate and Load)
-- 4. Process column formatting, column splitting / renaming, the hierarchy, the Function Head, etc. This will be the result to use. (Stored Procedure) - I wonder if this should possibly be done before #3.
-- 5. Build base views.

***/

--Create CTEs
WITH 
-- 1. Get list of Distinct Employee IDs. This will serve as the base part for joining the final result set.
DistinctEmployeeIDs AS
(
SELECT DISTINCT [Employee ID] FROM M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT
),

-- 2. Get all Global Assignments that are primary and active and have a single Primary Active User ID. This is priority one and needs to be used in the final result set.
gaPrimaryActive AS
(
SELECT [Employee ID], MAX([User ID]) AS [User ID] 
FROM M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT 
WHERE [Employment Assignment Type] = 'GA' AND [Status Code] = 't' AND [isPrimaryMerged] = 'true'
GROUP BY [Employee ID]
HAVING COUNT([Employee ID]) = 1
),

-- 3. Get all Global Assignments that are primary and active but might have multiple Primary Active User IDs.  
-- This needs to be included in the final result set after logic has been applied.
-- This situation should never happen. It means there are multiple Global Assignments marketd as Primary and Active.
-- GA Employee IDs will never match User IDs (as the first User ID entered should always be ST Assignment and that will have the same ID for both Employee ID and User ID)
-- Because of this, we don't know which Global Assignment User ID to choose, so we do not choose a GA User ID.
-- Instead, this logic forces the User ID to equal Employee ID. At this point, it is not a GA anymore.
-- May need to consult more with HR on what to do in this scenario. 11/11 JBN
gaPrimaryActiveMulti AS
(
SELECT [Employee ID], [Employee ID] AS [User ID] 
FROM M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT 
WHERE [Employment Assignment Type] = 'GA' AND [Status Code] = 't' AND [isPrimaryMerged] = 'true'
GROUP BY [Employee ID]
HAVING COUNT([Employee ID]) > 1
),

-- 4. Get Standard Assignment Employee IDs having only a single User ID (only one USER ID per Employee ID), 
-- irrespective of Status, but excluding Employee IDs having a Primary Active User ID in a Global Assignment.
stSUI AS
(
SELECT [Employee ID], MAX([User ID]) AS [User ID] FROM M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT 
WHERE [Employment Assignment Type] = 'ST'
AND [Employee ID] NOT IN 
	(
	SELECT ga.[Employee ID] 
	FROM M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT ga 
	WHERE [Employment Assignment Type] = 'GA' AND [Status Code] = 't' AND [isPrimaryMerged] ='true'
	)
GROUP BY [Employee ID]
HAVING count([Employee ID]) = 1
),

-- 5. Get a working list of the remaining ST Assignment Type Employees. 
-- These Employee IDs will have multiple User IDs and different combinations of isPrimary and Status code.
stActive AS 
(
-- This has multiple User IDs that are Primary Active for ST.
SELECT * FROM M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT 
WHERE 
--As we have our GA group already, remove Employee IDs that have a Global Assignment and are Active
[Employee ID] NOT IN (
	SELECT [Employee ID] FROM M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT 
	WHERE [Employee ID] IN 
		(
		SELECT ga.[Employee ID] 
		FROM M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT ga 
		WHERE [Employment Assignment Type] = 'GA'
		AND [Status Code] = 't'
		)
	)
-- As we have our ST Employee ID group with only a single User ID, remove Employees having only one User ID
AND [Employee ID] NOT IN 
	(
	SELECT [Employee ID]
	FROM M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT 
	WHERE [Employment Assignment Type] = 'ST'
	GROUP BY [Employee ID]
	HAVING count([Employee ID]) = 1
	)
AND [Employment Assignment Type] = 'ST'
AND [Status Code] = 't'
AND [isPrimaryMerged] = 'true'
),

-- 6. Get Primary Active ST Assignment Employee IDs that only have 1 User ID. Use MAX as the 'HAVING' clause reduces count to one.
stPrimaryActive AS
(
SELECT [Employee ID], MAX([User ID]) AS [User ID]
FROM stActive 
GROUP BY [Employee ID]
HAVING COUNT([Employee ID]) = 1
),

-- 7. Get Primary Active ST Assignment Employee IDs that have multiple User IDs.
-- The Rule to determine which User ID is valid when multiple options exist is to select the one where User ID and Employee ID are equal.
-- As such, we select Employee ID and alias it again (set it to) as User ID.
stPrimaryActiveMulti AS
(
SELECT [Employee ID], [Employee ID] AS [User ID]
FROM stActive 
GROUP BY [Employee ID]
HAVING COUNT([Employee ID]) > 1
),

-- 8. Get a working set of Primary Inactive ST Assignment Employee IDs
stInactive AS
(
SELECT * FROM M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT WHERE 
	--As we have our GA group already, remove Employee IDs that have an Active Global Assignment
	[Employee ID] NOT IN 
		(
		SELECT ga.[Employee ID] 
		FROM M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT ga 
		WHERE [Employment Assignment Type] = 'GA'
		AND [Status Code] ='t'
		)
	-- As we have our ST Employee ID group with only a single User ID, remove Employees having only one User ID
	AND [Employee ID] NOT IN 
		(
		SELECT [Employee ID]
		FROM M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT 
		WHERE [Employment Assignment Type] = 'ST'
		GROUP BY [Employee ID]
		HAVING count([Employee ID]) = 1
		)
	--remove ST Employee IDs with Primary Active
	AND [Employee ID] NOT IN
		(
		SELECT [Employee ID] FROM M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT
		WHERE [Employment Assignment Type] = 'ST'
		AND [isPrimaryMerged] = 'true'
		AND [Status Code] = 't'
		)
	AND [Employment Assignment Type] = 'ST'
	AND [Status Code] = 'f'
	AND [isPrimaryMerged] = 'true'

),

-- 9. Get the Primary Inactive ST Assignment User IDs that only have one User ID per Employee ID.
-- Use this in the final result set.
stPrimaryInactive AS
(
SELECT [Employee ID], MAX([User ID]) AS [User ID] FROM stInactive
GROUP BY [Employee ID]
HAVING COUNT([Employee ID]) = 1
),

-- 10. Get the Primary Inactive ST Assignment User IDs where there are more than one User ID per Employee ID. Set the User ID equal to the Employee ID. 
-- Use this in the final result set.
stPrimaryInactiveMulti AS
(
SELECT [Employee ID], [Employee ID] AS [User ID] FROM stInactive
GROUP BY [Employee ID]
HAVING COUNT([Employee ID]) > 1
),

-- 11. This is a work around for finding Employee IDs that do not have any User IDs marked as Primary.
-- First we must create a tally by counting the isPrimaryMerged per value type.
isPrimaryCounts AS
(
SELECT [Employee ID]
, CASE WHEN [isPrimaryMerged] = 'true' THEN COUNT([Employee ID]) ELSE 0 END AS [isPrimary True Count]
, CASE WHEN [isPrimaryMerged] = 'false' THEN COUNT([Employee ID]) ELSE 0 END AS [isPrimary False Count]
FROM M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT
GROUP BY [Employee ID], [isPrimaryMerged]
),

-- 12. Get Employee IDs that have multiple User IDs that are also all not Primary. 
-- Sum [isPrimary True Count] and then filter to where there are no True (Sum([isPrimary True Count]) = 0).
-- Use this in the final result set.
stNotPrimary AS
(
SELECT [Employee ID], [Employee ID] AS [User ID]
--, SUM([isPrimary True Count]) as PrimaryTrueCount, SUM([isPrimary False Count]) AS PrimaryFalseCount
FROM isPrimaryCounts
GROUP BY [Employee ID]
HAVING Sum([isPrimary True Count]) = 0 
AND COUNT([Employee ID]) > 1
),

-- 13. Union all of the previous CTEs that should be used in the result set.
UnionedEmployeeIDs AS
(
SELECT [Employee ID], [User ID], '1. Global Assignment Primary Active (gaPA)' AS [Result Set] FROM gaPrimaryActive
-- Top Priority. Supercedes other ST Assignments.
UNION ALL

SELECT [Employee ID], [User ID], '2. Global Assignment Primary Active Multiple User IDs (gaPAM)' AS [Result Set] FROM gaPrimaryActiveMulti 
-- We should not encounter this if data is properly maintained.
UNION ALL

SELECT [Employee ID], [User ID], '3. Standard Assignment Single User ID (stUI)' AS [Result Set] FROM stSUI
-- Selects Employee IDs with only a Single User ID, irrespective of isPrimaryMerged (True/False) and Status Code (Active/Inactive)
-- This is the bulk of users.
UNION ALL

SELECT [Employee ID], [User ID], '4. Standard Assignment Primary Active (stPA)' AS [Result Set] FROM stPrimaryActive
-- This selects all other Primary Active employees.
UNION ALL

SELECT [Employee ID], [User ID], '5. Standard Assignment Primary Active Multiple User IDs (stPAM)' AS [Result Set] FROM stPrimaryActiveMulti 
-- We should not encounter this if data is properly maintained.
UNION ALL

SELECT [Employee ID], [User ID], '6. Standard Assignment Primary Inactive (stPI)' AS [Result Set] FROM stPrimaryInactive
-- This selects all other Primary Inactive employees.
UNION ALL

SELECT [Employee ID], [User ID], '7. Standard Assignment Primary Inactive Multiple User IDs (stPIM)' AS [Result Set] FROM stPrimaryInactiveMulti 
-- We should not encounter this if data is properly maintained.
UNION ALL

SELECT [Employee ID], [User ID], '8. Standard Assignment NotPrimary Multiple User IDs (stNPM)' AS [Result Set] FROM stNotPrimary 
-- This is to detect Employee IDS with Multiple Users and no Primary flag set. It is a case that should never exixt if data is properly maintained.
-- At this point, we do not distinguish between Status Code, but rather just default to assigning Employee ID to the User ID field.
),

-- 14. Join the final result set Union with the list of Distinct Employee IDs 
-- This will generate a list with only one current User ID per Employee ID.
-- We insert case logic that fills in [User ID] = [EmployeeID] when a match is not found. This is a last step failsafe.
-- We add a column to help us later identify items that do not find matches. This should be used to improve the logic above.
JoinedEmployeeIDUserIDs AS
(
SELECT 
u.[Result Set]
, CASE WHEN u.[Employee ID] IS NULL THEN 0 ELSE 1 END AS [Match Found]
, d.[Employee ID]
, CASE WHEN u.[Employee ID] IS NULL THEN d.[Employee ID] ELSE u.[User ID] END AS [User ID] 
FROM DistinctEmployeeIDs d LEFT JOIN UnionedEmployeeIDs u ON d.[Employee ID] = u.[Employee ID]
)

-- 15. Merge the JoinedEmployeeIDsUserIDs CTE with the original HRIS SAP SuccessFactors Employee Central (EC) Data Table.
-- This query should be used in a process that truncates and then inserts into another table that will serve as the Source table from which views will be built upon.
SELECT j.[Result Set], j.[Match Found]
, ec.* 
--this will likely need to be explicitly listed out for every column for the insert,
--as well as adding '' or NULL for columns that will need to be added / processed later.
FROM JoinedEmployeeIDUserIDs j LEFT JOIN M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT ec ON j.[User ID] = ec.[User ID]
ORDER BY j.[Match Found], j.[Result Set], ec.[Employee ID], ec.[User ID]


END

GO
