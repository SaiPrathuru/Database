SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateLastRunDate]
	(@PackageNO  int)
AS
BEGIN
DECLARE @LRUNDATE DATETIME



		IF @PackageNO=1 
			BEGIN
				SELECT @LRUNDATE=max(CurrentTime)  FROM T_BI_LOG_DW2_SSASTABEXTENDEDEVENTS
				Update M_BI_LOG_DW2_EXECUTION set LastRunDateTime=@LRUNDATE where PackageName='SsasTabExtendedEvents'
			END

		IF @PackageNO=2 
			BEGIN
				SELECT @LRUNDATE=max(CurrentTime)  FROM T_BI_LOG_DW2_SSASMDEXTENDEDEVENTS

				Update M_BI_LOG_DW2_EXECUTION set LastRunDateTime=@LRUNDATE where PackageName='SsasMdExtendedEvents'
			END
		/*IF @PackageNO=3
			BEGIN
				SELECT @LRUNDATE=max(CurrentTime)  FROM tblASTraceLog
				Update M_BI_LOG_DW2_EXECUTION set LastRunDateTime=@LRUNDATE where PackageName='ASTraceLog'
			END
		*/
		IF @PackageNO=4
			BEGIN
				SELECT @LRUNDATE=max(Runtime)  FROM T_BI_LOG_DW2_SSRS
				Update M_BI_LOG_DW2_EXECUTION set LastRunDateTime=@LRUNDATE where PackageName='SSRSLog'
			END

		IF @PackageNO=5
			BEGIN
			
				SELECT @LRUNDATE=max([PROC_DATE])  FROM [ANALYSIS_LOG].[dbo].[T_BI_LOG_DW2_WEBFRONT]

				Update M_BI_LOG_DW2_EXECUTION set LastRunDateTime=@LRUNDATE where PackageName='WebFrontLog'
			END

		IF @PackageNO=6
			BEGIN
			
				SELECT @LRUNDATE=max([EndTime])  FROM [ANALYSIS_LOG].[dbo].T_BI_LOG_DW2_RDBUSERTRACELOG

				Update M_BI_LOG_DW2_EXECUTION set LastRunDateTime=@LRUNDATE where PackageName='RDBUserTraceLog'
			END
END


GO
