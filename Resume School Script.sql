 
CREATE TABLE [dbo].[EmployeeCertificationTable](
	[EmployeeCertificationID] [int] IDENTITY(1,1) NOT NULL,
	[CertificationName] [nvarchar](max) NULL,
	[CertificationAuthority] [nvarchar](max) NULL,
	[LevelCertification] [nvarchar](max) NULL,
	[FromYear] [datetime] NULL,
	[EmployeeResumeID] [int] NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Certifications] PRIMARY KEY CLUSTERED 
(
	[EmployeeCertificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeEducationTable]    Script Date: 16/10/2019 2:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeEducationTable](
	[EmployeeEducationID] [int] IDENTITY(1,1) NOT NULL,
	[InstituteUniversity] [nvarchar](max) NULL,
	[TitleOfDiploma] [nvarchar](max) NULL,
	[Degree] [nvarchar](max) NULL,
	[FromYear] [datetime] NULL,
	[ToYear] [datetime] NULL,
	[City] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[EmployeeResumeID] [int] NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Educations] PRIMARY KEY CLUSTERED 
(
	[EmployeeEducationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EventTable]    Script Date: 16/10/2019 2:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventTable](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[EventTitle] [nvarchar](max) NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.EventTable] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeLanguageTable]    Script Date: 16/10/2019 2:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeLanguageTable](
	[EmployeeLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageName] [nvarchar](max) NULL,
	[Proficiency] [nvarchar](max) NULL,
	[EmployeeResumeID] [int] NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Languages] PRIMARY KEY CLUSTERED 
(
	[EmployeeLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeResumeTable]    Script Date: 16/10/2019 2:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeResumeTable](
	[EmployeeResumeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[DateOfBirth] [datetime] NULL,
	[Nationality] [nvarchar](max) NULL,
	[EducationalLevel] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Tel] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Summary] [nvarchar](max) NULL,
	[LinkedInProdil] [nvarchar](max) NULL,
	[FaceBookProfil] [nvarchar](max) NULL,
	[C_CornerProfil] [nvarchar](max) NULL,
	[TwitterProfil] [nvarchar](max) NULL,
	[Profil] [varbinary](max) NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK_dbo.People] PRIMARY KEY CLUSTERED 
(
	[EmployeeResumeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeeSkillTable]    Script Date: 16/10/2019 2:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSkillTable](
	[EmployeeSkillID] [int] IDENTITY(1,1) NOT NULL,
	[SkillName] [nvarchar](max) NULL,
	[EmployeeResumeID] [int] NULL,
	[UserID] [int] Not Null,
 CONSTRAINT [PK_dbo.Skills] PRIMARY KEY CLUSTERED 
(
	[EmployeeSkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeWorkExperienceTable]    Script Date: 16/10/2019 2:52:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeWorkExperienceTable](
	[EmployeeWorkExperienceID] [int] IDENTITY(1,1) NOT NULL,
	[Company] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[FromYear] [datetime] NULL,
	[ToYear] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[EmployeeResumeID] [int] NULL,
	[UserID] [int] Not Null,
 CONSTRAINT [PK_dbo.WorkExperiences] PRIMARY KEY CLUSTERED 
(
	[EmployeeWorkExperienceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[EmployeeCertificationTable]  WITH CHECK 
ADD CONSTRAINT [FK_dbo.EmployeeCertificationTable_dbo.EmployeeResumeTable_EmployeeResumeID] FOREIGN KEY([EmployeeResumeID])
REFERENCES [dbo].[EmployeeResumeTable] ([EmployeeResumeID])
GO
ALTER TABLE [dbo].[EmployeeCertificationTable] 
CHECK CONSTRAINT [FK_dbo.EmployeeCertificationTable_dbo.EmployeeResumeTable_EmployeeResumeID]
GO

ALTER TABLE [dbo].[EmployeeEducationTable]  WITH CHECK 
ADD CONSTRAINT [FK_dbo.EmployeeEducationTable_dbo.EmployeeResumeTable_EmployeeResumeID] FOREIGN KEY([EmployeeResumeID])
REFERENCES [dbo].[EmployeeResumeTable] ([EmployeeResumeID])
GO
ALTER TABLE [dbo].[EmployeeEducationTable] 
CHECK CONSTRAINT [FK_dbo.EmployeeEducationTable_dbo.EmployeeResumeTable_EmployeeResumeID]
GO

ALTER TABLE [dbo].[EmployeeLanguageTable]  WITH CHECK 
ADD CONSTRAINT [FK_dbo.EmployeeLanguageTable_dbo.EmployeeResumeTable_EmployeeResumeID] FOREIGN KEY([EmployeeResumeID])
REFERENCES [dbo].[EmployeeResumeTable] ([EmployeeResumeID])
GO
ALTER TABLE [dbo].[EmployeeLanguageTable] 
CHECK CONSTRAINT [FK_dbo.EmployeeLanguageTable_dbo.EmployeeResumeTable_EmployeeResumeID]
GO

ALTER TABLE [dbo].[EmployeeSkillTable]  WITH CHECK 
ADD CONSTRAINT [FK_dbo.EmployeeSkillTable_dbo.EmployeeResumeTable_EmployeeResumeID] FOREIGN KEY([EmployeeResumeID])
REFERENCES [dbo].[EmployeeResumeTable] ([EmployeeResumeID])
GO
ALTER TABLE [dbo].[EmployeeSkillTable] 
CHECK CONSTRAINT [FK_dbo.EmployeeSkillTable_dbo.EmployeeResumeTable_EmployeeResumeID]
GO

ALTER TABLE [dbo].[EmployeeWorkExperienceTable]  WITH CHECK 
ADD CONSTRAINT [FK_dbo.EmployeeWorkExperienceTable_dbo.EmployeeResumeTable_EmployeeResumeID] FOREIGN KEY([EmployeeResumeID])
REFERENCES [dbo].[EmployeeResumeTable] ([EmployeeResumeID])
GO
ALTER TABLE [dbo].[EmployeeWorkExperienceTable] 
CHECK CONSTRAINT [FK_dbo.EmployeeWorkExperienceTable_dbo.EmployeeResumeTable_EmployeeResumeID]
GO
