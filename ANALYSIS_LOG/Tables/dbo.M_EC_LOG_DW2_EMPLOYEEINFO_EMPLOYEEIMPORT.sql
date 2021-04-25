CREATE TABLE [dbo].[M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT]
(
[Employee ID] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[Person ID] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[User ID] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NOT NULL,
[Username] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[User Account] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Sequence Number] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Hierarchy] [nvarchar] (4000) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Hierarchy Level] [int] NULL,
[DS Number] [nvarchar] (64) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Email] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Email Address] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[User Full Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[User First Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[User Last Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Display Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[First Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Middle Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Last Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Display Name Kanji] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[First Name Kanji] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Middle Name Kanji] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Last Name Kanji] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Display Name Kana] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[First Name Kana] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Middle Name Kana] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Last Name Kana] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[IF Formal Last Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[IF Formal First Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[IF Formal Middle Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[IF Formal Last Name Kanji] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[IF Formal First Name Kanji] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[IF Formal Last Name Kana] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[IF Formal First Name Kana] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Title] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Suffix] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Gender] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Business Phone Country Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Business Phone Number] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Business Phone Extension] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Business Phone VOIP] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Mobile Phone Country Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Mobile Phone Number] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Mobile Phone Extension] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Mobile Phone VOIP] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Fax Country Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Fax Number] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Fax Extension] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Fax VOIP] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Cost Center] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Cost Center Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Job Cost Center] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Job Cost Center Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Job Cost Center Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Location Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Location] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Location Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Company Country] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Company Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Legal Entity ID] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Company] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Company Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Group Region] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Timezone] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[User Timezone] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Local Employee Number] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Local Job Grade] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Local Job Title] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Global Job Grade] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Global Job Title Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Global Job Title] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Job Title] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Unit Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Unit Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Unit] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Division Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Division Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Division] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Department Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Department Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Department] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Section Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Section Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Section] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Solid Line Manager User ID] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager Employee ID] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager User ID] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager Username] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager DS Number] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager Email] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager Full Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager First Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager Last Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager isPrimary] [nvarchar] (8) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Manager Status Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Direct Reports] [int] NULL,
[Total Team Size] [int] NULL,
[Function Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Function Head Employee ID] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Function Head DS Number] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Function Head Email] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Function Head Name] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Function Head Global Unit] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Function Head Global Division] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Login Type] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Status Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Employee Status Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Employee Status Option ID] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Assignment Type Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Assignment Type] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Employment Assignment Type] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[isPrimaryMerged] [nvarchar] (8) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Employment Classification Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Employment Classification] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Employee Type Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Employee Type] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Employment Type Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Employment Type] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Employment Type Japanese] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Employment Details Notes] [nvarchar] (4000) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Job Info Notes] [nvarchar] (4000) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Event] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Event Reason Code] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Event Reason] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Leave of Absence Reason] [nvarchar] (256) COLLATE Japanese_XJIS_100_BIN2 NULL,
[Birth Date] [datetime] NULL,
[Hire Date] [datetime] NULL,
[Start Date] [datetime] NULL,
[Original Start Date] [datetime] NULL,
[Service Date] [datetime] NULL,
[Last Inactivation Date] [datetime] NULL,
[Legal Retirement Date] [datetime] NULL,
[Last Date Worked] [datetime] NULL,
[Payroll End Date] [datetime] NULL,
[Termination Date] [datetime] NULL,
[Job Termination Date] [datetime] NULL,
[Created Date] [datetime] NULL,
[User Last Modified Date] [datetime] NULL,
[Job Last Modified Date] [datetime] NULL,
[Employment Last Modified Date] [datetime] NULL,
[Biographic Last Modified Date] [datetime] NULL,
[Personal Last Modified Date] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT] ADD CONSTRAINT [PK_M_EC_LOG_DW2_EMPLOYEEINFO_EMPLOYEEIMPORT_1] PRIMARY KEY CLUSTERED  ([User ID]) ON [PRIMARY]
GO
