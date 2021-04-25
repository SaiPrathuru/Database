SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE  PROCEDURE [dbo].[SP_DBSizeInfo]
	(@ServerName  NVARCHAR(64))
AS
BEGIN
	set nocount on
		INSERT INTO M_BC_LOG_DW2_DBSIZES
		SELECT CONVERT(date, getdate()), d.NAME
		,ROUND(SUM(CAST(mf.size AS bigint)) * 8 / 1024, 0) Size_MBs
		,(SUM(CAST(mf.size AS bigint)) * 8 / 1024) / 1024 AS Size_GBs
		FROM sys.master_files mf
		INNER JOIN sys.databases d ON d.database_id = mf.database_id
		WHERE d.database_id > 4 -- Skip system databases
		GROUP BY d.NAME
		--ORDER BY d.NAME

	set nocount off
	
END


GO
