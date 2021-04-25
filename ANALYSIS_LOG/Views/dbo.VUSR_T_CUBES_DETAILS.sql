SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO












CREATE VIEW [dbo].[VUSR_T_CUBES_DETAILS]
AS
SELECT                      *
FROM                         [ANALYSIS_LOG].[dbo].VUSR_T_CUBES_TB_DETAILS
UNION ALL
SELECT                      * 
FROM                         [ANALYSIS_LOG].[dbo].VUSR_T_CUBES_MD_DETAILS
GO
