CREATE TABLE [dbo].[T_CQ_LOG_DW2_RAINBOWSEARCHCONDITION]
(
[SQLID] [int] NOT NULL,
[DATANAME] [nvarchar] (300) COLLATE Japanese_XJIS_100_BIN2 NULL,
[OVERSEASFLG] [nvarchar] (1) COLLATE Japanese_XJIS_100_BIN2 NULL,
[SALESCD] [nvarchar] (12) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DIVISIONCD] [nvarchar] (10) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DEPARTMENTCD] [nvarchar] (10) COLLATE Japanese_XJIS_100_BIN2 NULL,
[SECTIONCD] [nvarchar] (10) COLLATE Japanese_XJIS_100_BIN2 NULL,
[CUSTOMERCD] [nvarchar] (12) COLLATE Japanese_XJIS_100_BIN2 NULL,
[OVERSEASFLG2] [nvarchar] (1) COLLATE Japanese_XJIS_100_BIN2 NULL,
[SALES2CD] [nvarchar] (12) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DIVISION2CD] [nvarchar] (10) COLLATE Japanese_XJIS_100_BIN2 NULL,
[DEPARTMENT2CD] [nvarchar] (10) COLLATE Japanese_XJIS_100_BIN2 NULL,
[SECTION2CD] [nvarchar] (10) COLLATE Japanese_XJIS_100_BIN2 NULL,
[CUSTOMER2CD] [nvarchar] (12) COLLATE Japanese_XJIS_100_BIN2 NULL,
[OVERSEASFLG3] [nvarchar] (1) COLLATE Japanese_XJIS_100_BIN2 NULL,
[AREACD] [nvarchar] (300) COLLATE Japanese_XJIS_100_BIN2 NULL,
[COUNTRYCD] [nvarchar] (300) COLLATE Japanese_XJIS_100_BIN2 NULL,
[COMPANYG1CD] [nvarchar] (300) COLLATE Japanese_XJIS_100_BIN2 NULL,
[COMPANYG2CD] [nvarchar] (300) COLLATE Japanese_XJIS_100_BIN2 NULL,
[CUSTOMER3CD] [nvarchar] (10) COLLATE Japanese_XJIS_100_BIN2 NULL,
[GROUPCD] [nvarchar] (12) COLLATE Japanese_XJIS_100_BIN2 NULL,
[UNITCD] [nvarchar] (10) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRODGROUPCD] [nvarchar] (300) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRODFAMILYCD] [nvarchar] (300) COLLATE Japanese_XJIS_100_BIN2 NULL,
[SEIKANCD] [nvarchar] (2) COLLATE Japanese_XJIS_100_BIN2 NULL,
[CAT1CD] [nvarchar] (2) COLLATE Japanese_XJIS_100_BIN2 NULL,
[CAT12CD] [nvarchar] (4) COLLATE Japanese_XJIS_100_BIN2 NULL,
[CAT123CD] [nvarchar] (6) COLLATE Japanese_XJIS_100_BIN2 NULL,
[CAT1234CD] [nvarchar] (8) COLLATE Japanese_XJIS_100_BIN2 NULL,
[CAT12345CD] [nvarchar] (10) COLLATE Japanese_XJIS_100_BIN2 NULL,
[BASEPN] [nvarchar] (30) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PARTNO] [nvarchar] (40) COLLATE Japanese_XJIS_100_BIN2 NULL,
[SUMMARYKEY2CD] [nvarchar] (40) COLLATE Japanese_XJIS_100_BIN2 NULL,
[SUMMARYKEY1CD] [nvarchar] (40) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PLANNINGPN] [nvarchar] (40) COLLATE Japanese_XJIS_100_BIN2 NULL,
[PRODPN] [nvarchar] (40) COLLATE Japanese_XJIS_100_BIN2 NULL,
[COMPANY] [nvarchar] (2) COLLATE Japanese_XJIS_100_BIN2 NULL,
[FACTORY] [nvarchar] (2) COLLATE Japanese_XJIS_100_BIN2 NULL,
[CHARGE] [nvarchar] (2) COLLATE Japanese_XJIS_100_BIN2 NULL,
[WIPPN] [nvarchar] (50) COLLATE Japanese_XJIS_100_BIN2 NULL,
[TEXTCONDITION] [nvarchar] (4000) COLLATE Japanese_XJIS_100_BIN2 NULL,
[TOTALROWCOUNT] [int] NULL,
[FILENAME] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[T_CQ_LOG_DW2_RAINBOWSEARCHCONDITION] ADD CONSTRAINT [PK_tblSearchConditionLog1] PRIMARY KEY CLUSTERED  ([SQLID]) ON [PRIMARY]
GO
