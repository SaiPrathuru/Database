SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SP_GenerateDateTypes]
	(@pTableName VARCHAR(100),@pDateType VARCHAR(50))
	--Example usage' exec SP_GenerateDateTypes 'M_CAL', 'Year'
	--Repeate this for each date type that needs to be updated. This allows specific control over changes.
	--Update the supporting M_CALENDAR_DATETYPE_PARAMETERS table to change the ranges for the updates.
AS
BEGIN

		--Check to see if the table name length is greater than 0 and has a single valid Date Type. Process only if this validation is sucessfull
		DECLARE @VALIDDATETYPE INT
		SELECT @VALIDDATETYPE = COUNT(*) FROM M_CALENDAR_DATETYPE_PARAMETERS WHERE [DateType] = QUOTENAME(@pDateType)

		IF LEN(TRIM(@pTableName)) > 0 AND @VALIDDATETYPE = 0 

		BEGIN
				--DECLARE @pDateType varchar(50) = 'Year' --Examples 'Year', 'Half', 'Quarter', 'Month', 'Week', 'Day', 'Fiscal Year', 'Fiscal Half', 'Fiscal Quarter'
				--DECLARE @pTableName varchar(50) = 'M_CAL';

				-- 1. This starts the function by using the passed parameter to select from the DATETYPE_PARAMETERS table to set the variables used in the rest of the funtion.
				DECLARE @today date = getdate();
				DECLARE @key varchar(50) = (SELECT DateTypeLookupKey FROM M_CALENDAR_DATETYPE_PARAMETERS WHERE DateType = @pDateType)
				DECLARE @col varchar(50) = (SELECT DateTypeColumnName FROM M_CALENDAR_DATETYPE_PARAMETERS WHERE DateType = @pDateType)
				DECLARE @typeSingluar varchar(50) = (SELECT DateTypePrefixSingular FROM M_CALENDAR_DATETYPE_PARAMETERS WHERE DateType = @pDateType)
				DECLARE @typePlural varchar(50) = (SELECT DateTypePrefixPlural FROM M_CALENDAR_DATETYPE_PARAMETERS WHERE DateType = @pDateType)
				DECLARE @otherText varchar(50) = (SELECT DateTypeOtherText FROM M_CALENDAR_DATETYPE_PARAMETERS WHERE DateType = @pDateType)
				DECLARE @suffixPast varchar(50) = (SELECT SuffixPast FROM M_CALENDAR_DATETYPE_PARAMETERS WHERE DateType = @pDateType)
				DECLARE @suffixCurrent varchar(50) = (SELECT SuffixCurrent FROM M_CALENDAR_DATETYPE_PARAMETERS WHERE DateType = @pDateType)
				DECLARE @suffixFuture varchar(50) = (SELECT SuffixFuture FROM M_CALENDAR_DATETYPE_PARAMETERS WHERE DateType = @pDateType)
				DECLARE @rangePos int = (SELECT RangePositive FROM M_CALENDAR_DATETYPE_PARAMETERS WHERE DateType = @pDateType)
				DECLARE @rangeNeg int = (SELECT RangeNegative FROM M_CALENDAR_DATETYPE_PARAMETERS WHERE DateType = @pDateType)
				DECLARE @counter int = @rangeNeg;
				DECLARE @label varchar(50);

				-- 2. Get starting point based on today for reference
				DECLARE @sql nvarchar(max);
				SET @sql = N'SELECT MAX(' + @key + ') FROM ' + QUOTENAME(@pTableName) + ' WHERE [Date] = '''+ convert(varchar(10),@today) +'''';
				DECLARE @currpos TABLE (currpos int);
				INSERT @currpos EXEC (@sql);
				DECLARE @currposition int = (SELECT * FROM @currpos);
				-- SELECT @currposition;

				/*
				-- NOTE: 2019/11/12 JBN
				-- Could not get the following to work as desired so switched to alternate approach used above. 
				-- If it is possible to get the following code working, it seems much more elegant and likely more optimized.
				-- There is no need to create a temp table and declare as many variables using the approach below.
				-- --DECLARE @currposition int = exec sp_executesql @sql, N'@currposition int out', @currposition out;--
				--
				*/

				-- 3. Start with a clean slate. Clear the data previously assigned in case the ranges change or dates are added.
				DECLARE @clearsql nvarchar(max) = N'UPDATE ' + QUOTENAME(@pTableName) + ' SET ' + QUOTENAME(@col) + ' = NULL';
				EXEC (@clearsql);

				-- 4. Loop through range, define labels, and update columns for ranges that have been defined
				WHILE (@counter <= @rangePos)
				BEGIN

				-- 5. Format labels
				IF @counter < -1 SET @label = convert(varchar(5), @counter) + ' ' + @typePlural + ' ' + @suffixPast
				ELSE IF @counter = -1 SET @label = convert(varchar(5), @counter) + ' ' + @typeSingluar + ' ' + @suffixPast
				ELSE IF @counter = 0 SET @label = convert(varchar(5), @counter) + ' ' + @suffixCurrent + ' ' + @typeSingluar
				ELSE IF @counter = 1 SET @label = '+' + convert(varchar(5), @counter) + ' ' + @typeSingluar + ' ' + @suffixFuture
				ELSE SET @label = '+' + convert(varchar(5),@counter) + ' ' + @typePlural + ' ' + @suffixFuture

				-- 6. Create Update Query for assigning labels
				DECLARE @updsql nvarchar(max) = N'UPDATE ' + QUOTENAME(@pTableName) + ' SET ' + QUOTENAME(@col) + ' = ''' + @label + ''' WHERE ' + QUOTENAME(@key) + ' = ' + convert(varchar(5),@currposition + @counter) + '';

				-- 7. Execute the Update Query
				EXEC (@updsql);

				-- 8. Increment counter so we eventually exit the While loop
				SET @counter = @counter + 1;

				END

				-- 9. Create the Query to Update the ranges that have not been defined for the specific date type. i.e. Out of Range
				DECLARE @updsqlOther nvarchar(max) = N'UPDATE ' + QUOTENAME(@pTableName) + ' SET ' + QUOTENAME(@col) + ' = ''' + @otherText + ''' WHERE ' + QUOTENAME(@col) + ' IS NULL';

				-- 10. Execute the Update Query for Out of Range items.
				EXEC (@updsqlOther);
				
		END
		ELSE
		BEGIN
				PRINT 'Validation failed. Either the Table Name was not provided or the Date Type was not correct and unique.'
				PRINT @pTableName + ' = ' 
				PRINT LEN(TRIM(@pTableName))
				PRINT @pDateType
				PRINT @VALIDDATETYPE
		END	
END
GO
