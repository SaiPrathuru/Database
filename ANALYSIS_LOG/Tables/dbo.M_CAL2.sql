CREATE TABLE [dbo].[M_CAL2]
(
[Date] [date] NOT NULL,
[Sequential_Day_Counter] [int] NULL,
[Sequential_Day_Number] [int] NULL,
[THIS_MONTH_S] [date] NULL,
[THIS_MONTH_E] [date] NULL,
[THIS_MONTH] [nvarchar] (20) COLLATE Japanese_XJIS_100_BIN2 NULL,
[THIS_QUARTER_CY_S] [date] NULL,
[THIS_QUARTER_CY_E] [date] NULL,
[THIS_QUARTER_CY] [nvarchar] (20) COLLATE Japanese_XJIS_100_BIN2 NULL,
[THIS_HALF_CY_S] [date] NULL,
[THIS_HALF_CY_E] [date] NULL,
[THIS_HALF_CY] [nvarchar] (20) COLLATE Japanese_XJIS_100_BIN2 NULL,
[THIS_YEAR_CY_S] [date] NULL,
[THIS_YEAR_CY_E] [date] NULL,
[THIS_YEAR_CY] [nvarchar] (20) COLLATE Japanese_XJIS_100_BIN2 NULL,
[THIS_QUARTER_S] [date] NULL,
[THIS_QUARTER_E] [date] NULL,
[THIS_QUARTER] [nvarchar] (20) COLLATE Japanese_XJIS_100_BIN2 NULL,
[THIS_HALF_S] [date] NULL,
[THIS_HALF_E] [date] NULL,
[THIS_HALF] [nvarchar] (20) COLLATE Japanese_XJIS_100_BIN2 NULL,
[THIS_YEAR_S] [date] NULL,
[THIS_YEAR_E] [date] NULL,
[THIS_YEAR] [nvarchar] (20) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
