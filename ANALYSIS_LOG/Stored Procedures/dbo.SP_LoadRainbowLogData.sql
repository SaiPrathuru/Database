SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LoadRainbowLogData]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
DECLARE @strSQL nvarchar(550)
DECLARE @strSQL1 nvarchar(64)



/* Below dynamic query uses the DB link to connect to DB and get the data.Before migrating this code to new server please create the DB link and change the code below to point it to the new link*/


--SET @strSQL=' Insert into T_CQ_LOG_DW2_RAINBOWDISPLAYACCESS Select * from openquery([DBLINK_BI_UCQ00R01] ,'+ '''SELECT * FROM UCQ00R01.DISPACCESSLOG  WHERE  ACCESSDATE>=''''' +convert(varchar,DATEADD(day,-1 ,getdate()), 23)+'''''' +' and ACCESSDATE<=''''' +convert(varchar,getdate(), 23)+''''''''  + ')'

SET @strSQL=' Insert into T_CQ_LOG_DW2_RAINBOWDISPLAYACCESS Select SQLID,ACCESSDATE,USERID,SCREENID,COMPONENTNAME,FUNCTIONNAME,2 from openquery([DBLINK_BI_UCQ00R01] ,'+ '''SELECT * FROM UCQ00R01.DISPACCESSLOG  WHERE  ACCESSDATE>=''''' +convert(varchar,DATEADD(day,-1 ,getdate()), 23)+'''''' +' and ACCESSDATE<=''''' +convert(varchar,getdate(), 23)+''''''''  + ')'

--print @strSQL

EXEC sp_executesql  @strSQL

--DELETE FROM tblSearchConditionLog



SELECT  @strSQL1=MAX(SQLID) FROM ANALYSIS_LOG.dbo.T_CQ_LOG_DW2_RAINBOWSEARCHCONDITION

SET @strSQL= 'INSERT INTO T_CQ_LOG_DW2_RAINBOWSEARCHCONDITION SELECT *  FROM OPENQUERY ([DBLINK_BI_UCQ00S01],'+''' SELECT * FROM UCQ00S01.SEARCHCONDITIONLOG WHERE SQLID>'+@strSQL1+''')'
--PRINT @strSQL
EXEC sp_executesql  @strSQL


--INSERT INTO tblSearchConditionLog SELECT *  FROM OPENQUERY ([DBLINK_BI_UCQ00S01], 'SELECT * FROM UCQ00S01.SEARCHCONDITIONLOG')

DELETE  FROM T_CQ_LOG_DW2_RAINBOWSEARCHCONDITIONINFO


INSERT INTO T_CQ_LOG_DW2_RAINBOWSEARCHCONDITIONINFO  SELECT *  FROM OPENQUERY ([DBLINK_BI_UCQ00R01], 'SELECT DATANAME ,TABLE_NAME,COLUMN_NAME,COLUMN_ID FROM UCQ00R01.SEARCHCONDITIONLOGINFO')

DELETE FROM M_CQ_LOG_DW2_RAINBOWSCREENMASTER


INSERT INTO M_CQ_LOG_DW2_RAINBOWSCREENMASTER SELECT * FROM OPENQUERY ([DBLINK_BI_UCQ00S01] , 'SELECT SCREENID,SCREENNAME,SCREENDIV,SEQNO FROM UCQ00S01.RAINBOWSCREENMST')

END
GO
