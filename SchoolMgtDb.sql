USE [master]
GO
/****** Object:  Database [SchoolMgtDb]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE DATABASE [SchoolMgtDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SchoolMgtDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SchoolMgtDb.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SchoolMgtDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SchoolMgtDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SchoolMgtDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SchoolMgtDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SchoolMgtDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SchoolMgtDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SchoolMgtDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SchoolMgtDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SchoolMgtDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET RECOVERY FULL 
GO
ALTER DATABASE [SchoolMgtDb] SET  MULTI_USER 
GO
ALTER DATABASE [SchoolMgtDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SchoolMgtDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SchoolMgtDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SchoolMgtDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SchoolMgtDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SchoolMgtDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SchoolMgtDb', N'ON'
GO
ALTER DATABASE [SchoolMgtDb] SET QUERY_STORE = OFF
GO
USE [SchoolMgtDb]
GO
/****** Object:  Table [dbo].[AnnualTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnnualTable](
	[AnnualID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ProgrameID] [int] NOT NULL,
	[Title] [varchar](200) NOT NULL,
	[Description] [varchar](400) NULL,
	[Fees] [float] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_AnnualTables] PRIMARY KEY CLUSTERED 
(
	[AnnualID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttendanceTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceTable](
	[AttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[SessionID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[AttendDate] [datetime] NOT NULL,
	[AttendTime] [time](7) NOT NULL,
	[ClassID] [int] NOT NULL,
 CONSTRAINT [PK_AttendanceTables] PRIMARY KEY CLUSTERED 
(
	[AttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassSubjectTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassSubjectTable](
	[ClassSubjectID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_ClassSubjectTables] PRIMARY KEY CLUSTERED 
(
	[ClassSubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassTable](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_ClassTables] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesignationTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesignationTable](
	[DesignationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Title] [varchar](150) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_DesignationTables] PRIMARY KEY CLUSTERED 
(
	[DesignationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeCertificationTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeEducationTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeLanguageTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeLeavingTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeLeavingTable](
	[EmployeeLeavingID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
	[LeavingDate] [date] NOT NULL,
	[LeavingReason] [nvarchar](150) NOT NULL,
	[LeavingComments] [nvarchar](max) NULL,
	[CreatedDate] [date] NOT NULL,
 CONSTRAINT [PK_EmployeeLeavingTable] PRIMARY KEY CLUSTERED 
(
	[EmployeeLeavingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeResumeTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeSalaryTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSalaryTable](
	[EmployeeSalaryID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[SalaryMonth] [nvarchar](50) NOT NULL,
	[SalaryYear] [nvarchar](50) NOT NULL,
	[SalaryDate] [date] NOT NULL,
	[Comments] [nvarchar](50) NULL,
 CONSTRAINT [PK_EmployeeSalaryTable] PRIMARY KEY CLUSTERED 
(
	[EmployeeSalaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeSkillTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSkillTable](
	[EmployeeSkillID] [int] IDENTITY(1,1) NOT NULL,
	[SkillName] [nvarchar](max) NULL,
	[EmployeeResumeID] [int] NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Skills] PRIMARY KEY CLUSTERED 
(
	[EmployeeSkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeWorkExperienceTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
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
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.WorkExperiences] PRIMARY KEY CLUSTERED 
(
	[EmployeeWorkExperienceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamMarksTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamMarksTable](
	[MarksID] [int] IDENTITY(1,1) NOT NULL,
	[ExamID] [int] NOT NULL,
	[ClassSubjectID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[TotalMarks] [int] NOT NULL,
	[ObtainMarks] [int] NOT NULL,
 CONSTRAINT [PK_ExamMarksTables] PRIMARY KEY CLUSTERED 
(
	[MarksID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamTable](
	[ExamID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Title] [varchar](200) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Descrption] [varchar](200) NULL,
 CONSTRAINT [PK_ExamTables] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpensesTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpensesTable](
	[ExpensesID] [int] NOT NULL,
	[ExpensesTypeID] [int] NOT NULL,
	[ExpensesDate] [date] NOT NULL,
	[Amount] [float] NOT NULL,
	[Reason] [nvarchar](500) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_ExpensesTable] PRIMARY KEY CLUSTERED 
(
	[ExpensesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpenseTypeTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseTypeTable](
	[ExpensesTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ExpenseTypeTable] PRIMARY KEY CLUSTERED 
(
	[ExpensesTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgrameSessionTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgrameSessionTable](
	[ProgrameSessionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SessionID] [int] NOT NULL,
	[ProgrameID] [int] NOT NULL,
	[Details] [varchar](200) NOT NULL,
	[RegDate] [datetime] NOT NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_ProgrameSessionTables] PRIMARY KEY CLUSTERED 
(
	[ProgrameSessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgrameTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgrameTable](
	[ProgrameID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ProgrameTables] PRIMARY KEY CLUSTERED 
(
	[ProgrameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolLeavingTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolLeavingTable](
	[SchoolLeavingID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
	[LeavingDate] [date] NOT NULL,
	[LeavingReason] [nvarchar](150) NOT NULL,
	[LeavingComments] [nvarchar](max) NULL,
	[CreateDate] [date] NOT NULL,
 CONSTRAINT [PK_SchoolLeavingTable] PRIMARY KEY CLUSTERED 
(
	[SchoolLeavingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SectionTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionTable](
	[SectionID] [int] IDENTITY(1,1) NOT NULL,
	[SectionName] [nvarchar](50) NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_SectionTable] PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SessionTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionTable](
	[SessionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SessionTables] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffAttendanceTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffAttendanceTable](
	[StaffAttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NOT NULL,
	[AttendDate] [datetime] NOT NULL,
	[ComingTime] [time](7) NULL,
	[ClosingTime] [time](7) NULL,
 CONSTRAINT [PK_StaffAttendanceTables] PRIMARY KEY CLUSTERED 
(
	[StaffAttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffTable](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[DesignationID] [int] NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[BasicSalary] [float] NOT NULL,
	[EmailAddress] [varchar](100) NULL,
	[Address] [varchar](200) NOT NULL,
	[Qualification] [varchar](500) NOT NULL,
	[Photo] [varchar](max) NULL,
	[Description] [varchar](500) NULL,
	[IsActive] [bit] NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[HomePhone] [nvarchar](50) NOT NULL,
	[Doyouhaveanydisability] [bit] NOT NULL,
	[Ifdisabilityyesthengiveusdetail] [nvarchar](3000) NULL,
	[Areyoutakinganymedication] [bit] NOT NULL,
	[Ifmedicationyesthengiveus] [nvarchar](3000) NULL,
	[AnyCriminaloffcenceagainstyou] [bit] NOT NULL,
	[Ifcriminaloffcenceyesthengiveusdetail] [nvarchar](3000) NULL,
	[RegistrationDate] [date] NULL,
 CONSTRAINT [PK_StaffTables] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentPromoteTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentPromoteTable](
	[StudentPromoteID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
	[ProgrameSessionID] [int] NOT NULL,
	[PromoteDate] [datetime] NOT NULL,
	[AnnualFee] [int] NOT NULL,
	[isActive] [bit] NULL,
	[IsSubmit] [bit] NULL,
	[SectionID] [int] NOT NULL,
 CONSTRAINT [PK_StudentPromoteTables] PRIMARY KEY CLUSTERED 
(
	[StudentPromoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentTable](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[SessionID] [int] NOT NULL,
	[ProgrameID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[FatherName] [varchar](100) NOT NULL,
	[DateofBirth] [datetime] NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[ContactNo] [varchar](20) NOT NULL,
	[CNIC] [varchar](20) NOT NULL,
	[FNIC] [varchar](20) NOT NULL,
	[Photo] [varchar](max) NOT NULL,
	[AdmissionDate] [datetime] NOT NULL,
	[PreviousSchool] [varchar](500) NULL,
	[PreviousPercentage] [float] NULL,
	[EmailAddress] [varchar](100) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[Nationality] [nvarchar](120) NOT NULL,
	[Religion] [nvarchar](50) NULL,
	[TribeorCaste] [nvarchar](50) NULL,
	[FathersGuardiansOccupationofProfession] [nvarchar](150) NULL,
	[FathersGuardiansPostalAddress] [nvarchar](200) NULL,
	[PhoneOffice] [nvarchar](50) NULL,
	[PhoneResident] [nvarchar](50) NULL,
 CONSTRAINT [PK_StudentTables] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectTable](
	[SubjectID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[RegDate] [datetime] NOT NULL,
	[Description] [varchar](400) NULL,
	[TotalMarks] [int] NULL,
 CONSTRAINT [PK_SubjectTables] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubmissionFeeTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubmissionFeeTable](
	[SubmissionFeeID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[ProgrameID] [int] NOT NULL,
	[SubmissionDate] [datetime] NOT NULL,
	[FeesMonth] [varchar](100) NOT NULL,
	[Description] [varchar](500) NULL,
	[ClassID] [int] NOT NULL,
 CONSTRAINT [PK_SubmissionFeeTables] PRIMARY KEY CLUSTERED 
(
	[SubmissionFeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeTblTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeTblTable](
	[TimeTableID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[Day] [varchar](100) NOT NULL,
	[ClassSubjectID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_TimeTblTables] PRIMARY KEY CLUSTERED 
(
	[TimeTableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[ContactNo] [varchar](20) NOT NULL,
	[EmailAddress] [varchar](100) NULL,
	[Address] [varchar](200) NULL,
 CONSTRAINT [PK_UserTables] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypeTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypeTable](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_UserTypeTables] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_AnnualTable_ProgrameTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_AnnualTable_ProgrameTable] ON [dbo].[AnnualTable]
(
	[ProgrameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_AnnualTable_UserTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_AnnualTable_UserTable] ON [dbo].[AnnualTable]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_AttendanceTable_ClassTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_AttendanceTable_ClassTable] ON [dbo].[AttendanceTable]
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_AttendanceTable_StudentTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_AttendanceTable_StudentTable] ON [dbo].[AttendanceTable]
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ClassSubjectTable_ClassTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ClassSubjectTable_ClassTable] ON [dbo].[ClassSubjectTable]
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ClassSubjectTable_SubjectTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ClassSubjectTable_SubjectTable] ON [dbo].[ClassSubjectTable]
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_DesignationTable_UserTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_DesignationTable_UserTable] ON [dbo].[DesignationTable]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ExamMarksTable_StudentTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ExamMarksTable_StudentTable] ON [dbo].[ExamMarksTable]
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ExamMarksTable_UserTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ExamMarksTable_UserTable] ON [dbo].[ExamMarksTable]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ExamTable_UserTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ExamTable_UserTable] ON [dbo].[ExamTable]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProgrameSessionTable_ProgrameTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProgrameSessionTable_ProgrameTable] ON [dbo].[ProgrameSessionTable]
(
	[ProgrameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProgrameSessionTable_SessionTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProgrameSessionTable_SessionTable] ON [dbo].[ProgrameSessionTable]
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProgrameSessionTable_UserTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProgrameSessionTable_UserTable] ON [dbo].[ProgrameSessionTable]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProgrameTable_UserTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProgrameTable_UserTable] ON [dbo].[ProgrameTable]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProgrameTable_UserTables]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProgrameTable_UserTables] ON [dbo].[ProgrameTable]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SessionTable_UserTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_SessionTable_UserTable] ON [dbo].[SessionTable]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StaffAttendanceTable_StaffTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_StaffAttendanceTable_StaffTable] ON [dbo].[StaffAttendanceTable]
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StaffTable_UserTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_StaffTable_UserTable] ON [dbo].[StaffTable]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StudentPromoteTable_ClassTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_StudentPromoteTable_ClassTable] ON [dbo].[StudentPromoteTable]
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StudentPromoteTable_ProgrameSessionTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_StudentPromoteTable_ProgrameSessionTable] ON [dbo].[StudentPromoteTable]
(
	[ProgrameSessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StudentPromoteTable_StudentTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_StudentPromoteTable_StudentTable] ON [dbo].[StudentPromoteTable]
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StudentTable_ProgrameTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_StudentTable_ProgrameTable] ON [dbo].[StudentTable]
(
	[ProgrameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StudentTable_SessionTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_StudentTable_SessionTable] ON [dbo].[StudentTable]
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StudentTable_UserTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_StudentTable_UserTable] ON [dbo].[StudentTable]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SubjectTable_UserTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_SubjectTable_UserTable] ON [dbo].[SubjectTable]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SubmissionFeeTable_ClassTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_SubmissionFeeTable_ClassTable] ON [dbo].[SubmissionFeeTable]
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SubmissionFeeTable_ProgrameTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_SubmissionFeeTable_ProgrameTable] ON [dbo].[SubmissionFeeTable]
(
	[ProgrameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SubmissionFeeTable_StudentTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_SubmissionFeeTable_StudentTable] ON [dbo].[SubmissionFeeTable]
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SubmissionFeeTable_UserTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_SubmissionFeeTable_UserTable] ON [dbo].[SubmissionFeeTable]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_TimeTblTable_ClassSubjectTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_TimeTblTable_ClassSubjectTable] ON [dbo].[TimeTblTable]
(
	[ClassSubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_TimeTblTable_StaffTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_TimeTblTable_StaffTable] ON [dbo].[TimeTblTable]
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_TimeTblTable_UserTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_TimeTblTable_UserTable] ON [dbo].[TimeTblTable]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_UserTable_UserTypeTable]    Script Date: 2021/3/24 下午 03:14:28 ******/
CREATE NONCLUSTERED INDEX [IX_FK_UserTable_UserTypeTable] ON [dbo].[UserTable]
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExpenseTypeTable] ADD  CONSTRAINT [DF_ExpenseTypeTable_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[StaffTable] ADD  CONSTRAINT [DF_StaffTable_Doyouhaveanydisability]  DEFAULT ((0)) FOR [Doyouhaveanydisability]
GO
ALTER TABLE [dbo].[StaffTable] ADD  CONSTRAINT [DF_StaffTable_Areyoutakinganymedication]  DEFAULT ((0)) FOR [Areyoutakinganymedication]
GO
ALTER TABLE [dbo].[StaffTable] ADD  CONSTRAINT [DF_StaffTable_AnyCriminaloffcenceagainstyou]  DEFAULT ((0)) FOR [AnyCriminaloffcenceagainstyou]
GO
ALTER TABLE [dbo].[AnnualTable]  WITH CHECK ADD  CONSTRAINT [FK_AnnualTable_ProgrameTable] FOREIGN KEY([ProgrameID])
REFERENCES [dbo].[ProgrameTable] ([ProgrameID])
GO
ALTER TABLE [dbo].[AnnualTable] CHECK CONSTRAINT [FK_AnnualTable_ProgrameTable]
GO
ALTER TABLE [dbo].[AnnualTable]  WITH CHECK ADD  CONSTRAINT [FK_AnnualTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[AnnualTable] CHECK CONSTRAINT [FK_AnnualTable_UserTable]
GO
ALTER TABLE [dbo].[AttendanceTable]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceTable_ClassTable] FOREIGN KEY([ClassID])
REFERENCES [dbo].[ClassTable] ([ClassID])
GO
ALTER TABLE [dbo].[AttendanceTable] CHECK CONSTRAINT [FK_AttendanceTable_ClassTable]
GO
ALTER TABLE [dbo].[AttendanceTable]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceTable_StudentTable] FOREIGN KEY([StudentID])
REFERENCES [dbo].[StudentTable] ([StudentID])
GO
ALTER TABLE [dbo].[AttendanceTable] CHECK CONSTRAINT [FK_AttendanceTable_StudentTable]
GO
ALTER TABLE [dbo].[ClassSubjectTable]  WITH CHECK ADD  CONSTRAINT [FK_ClassSubjectTable_ClassTable] FOREIGN KEY([ClassID])
REFERENCES [dbo].[ClassTable] ([ClassID])
GO
ALTER TABLE [dbo].[ClassSubjectTable] CHECK CONSTRAINT [FK_ClassSubjectTable_ClassTable]
GO
ALTER TABLE [dbo].[ClassSubjectTable]  WITH CHECK ADD  CONSTRAINT [FK_ClassSubjectTable_SubjectTable] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[SubjectTable] ([SubjectID])
GO
ALTER TABLE [dbo].[ClassSubjectTable] CHECK CONSTRAINT [FK_ClassSubjectTable_SubjectTable]
GO
ALTER TABLE [dbo].[DesignationTable]  WITH CHECK ADD  CONSTRAINT [FK_DesignationTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[DesignationTable] CHECK CONSTRAINT [FK_DesignationTable_UserTable]
GO
ALTER TABLE [dbo].[EmployeeCertificationTable]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EmployeeCertificationTable_dbo.EmployeeResumeTable_EmployeeResumeID] FOREIGN KEY([EmployeeResumeID])
REFERENCES [dbo].[EmployeeResumeTable] ([EmployeeResumeID])
GO
ALTER TABLE [dbo].[EmployeeCertificationTable] CHECK CONSTRAINT [FK_dbo.EmployeeCertificationTable_dbo.EmployeeResumeTable_EmployeeResumeID]
GO
ALTER TABLE [dbo].[EmployeeCertificationTable]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeCertificationTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[EmployeeCertificationTable] CHECK CONSTRAINT [FK_EmployeeCertificationTable_UserTable]
GO
ALTER TABLE [dbo].[EmployeeEducationTable]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EmployeeEducationTable_dbo.EmployeeResumeTable_EmployeeResumeID] FOREIGN KEY([EmployeeResumeID])
REFERENCES [dbo].[EmployeeResumeTable] ([EmployeeResumeID])
GO
ALTER TABLE [dbo].[EmployeeEducationTable] CHECK CONSTRAINT [FK_dbo.EmployeeEducationTable_dbo.EmployeeResumeTable_EmployeeResumeID]
GO
ALTER TABLE [dbo].[EmployeeEducationTable]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeEducationTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[EmployeeEducationTable] CHECK CONSTRAINT [FK_EmployeeEducationTable_UserTable]
GO
ALTER TABLE [dbo].[EmployeeLanguageTable]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EmployeeLanguageTable_dbo.EmployeeResumeTable_EmployeeResumeID] FOREIGN KEY([EmployeeResumeID])
REFERENCES [dbo].[EmployeeResumeTable] ([EmployeeResumeID])
GO
ALTER TABLE [dbo].[EmployeeLanguageTable] CHECK CONSTRAINT [FK_dbo.EmployeeLanguageTable_dbo.EmployeeResumeTable_EmployeeResumeID]
GO
ALTER TABLE [dbo].[EmployeeLanguageTable]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLanguageTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[EmployeeLanguageTable] CHECK CONSTRAINT [FK_EmployeeLanguageTable_UserTable]
GO
ALTER TABLE [dbo].[EmployeeLeavingTable]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLeavingTable_StaffTable] FOREIGN KEY([StaffID])
REFERENCES [dbo].[StaffTable] ([StaffID])
GO
ALTER TABLE [dbo].[EmployeeLeavingTable] CHECK CONSTRAINT [FK_EmployeeLeavingTable_StaffTable]
GO
ALTER TABLE [dbo].[EmployeeLeavingTable]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeLeavingTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[EmployeeLeavingTable] CHECK CONSTRAINT [FK_EmployeeLeavingTable_UserTable]
GO
ALTER TABLE [dbo].[EmployeeSalaryTable]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSalaryTable_StaffTable] FOREIGN KEY([StaffID])
REFERENCES [dbo].[StaffTable] ([StaffID])
GO
ALTER TABLE [dbo].[EmployeeSalaryTable] CHECK CONSTRAINT [FK_EmployeeSalaryTable_StaffTable]
GO
ALTER TABLE [dbo].[EmployeeSalaryTable]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSalaryTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[EmployeeSalaryTable] CHECK CONSTRAINT [FK_EmployeeSalaryTable_UserTable]
GO
ALTER TABLE [dbo].[EmployeeSkillTable]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EmployeeSkillTable_dbo.EmployeeResumeTable_EmployeeResumeID] FOREIGN KEY([EmployeeResumeID])
REFERENCES [dbo].[EmployeeResumeTable] ([EmployeeResumeID])
GO
ALTER TABLE [dbo].[EmployeeSkillTable] CHECK CONSTRAINT [FK_dbo.EmployeeSkillTable_dbo.EmployeeResumeTable_EmployeeResumeID]
GO
ALTER TABLE [dbo].[EmployeeSkillTable]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSkillTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[EmployeeSkillTable] CHECK CONSTRAINT [FK_EmployeeSkillTable_UserTable]
GO
ALTER TABLE [dbo].[EmployeeWorkExperienceTable]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EmployeeWorkExperienceTable_dbo.EmployeeResumeTable_EmployeeResumeID] FOREIGN KEY([EmployeeResumeID])
REFERENCES [dbo].[EmployeeResumeTable] ([EmployeeResumeID])
GO
ALTER TABLE [dbo].[EmployeeWorkExperienceTable] CHECK CONSTRAINT [FK_dbo.EmployeeWorkExperienceTable_dbo.EmployeeResumeTable_EmployeeResumeID]
GO
ALTER TABLE [dbo].[EmployeeWorkExperienceTable]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeWorkExperienceTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[EmployeeWorkExperienceTable] CHECK CONSTRAINT [FK_EmployeeWorkExperienceTable_UserTable]
GO
ALTER TABLE [dbo].[EventTable]  WITH CHECK ADD  CONSTRAINT [FK_EventTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[EventTable] CHECK CONSTRAINT [FK_EventTable_UserTable]
GO
ALTER TABLE [dbo].[ExamMarksTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamMarksTable_ClassSubjectTable] FOREIGN KEY([ClassSubjectID])
REFERENCES [dbo].[ClassSubjectTable] ([ClassSubjectID])
GO
ALTER TABLE [dbo].[ExamMarksTable] CHECK CONSTRAINT [FK_ExamMarksTable_ClassSubjectTable]
GO
ALTER TABLE [dbo].[ExamMarksTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamMarksTable_ExamTable] FOREIGN KEY([ExamID])
REFERENCES [dbo].[ExamTable] ([ExamID])
GO
ALTER TABLE [dbo].[ExamMarksTable] CHECK CONSTRAINT [FK_ExamMarksTable_ExamTable]
GO
ALTER TABLE [dbo].[ExamMarksTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamMarksTable_StudentTable] FOREIGN KEY([StudentID])
REFERENCES [dbo].[StudentTable] ([StudentID])
GO
ALTER TABLE [dbo].[ExamMarksTable] CHECK CONSTRAINT [FK_ExamMarksTable_StudentTable]
GO
ALTER TABLE [dbo].[ExamMarksTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamMarksTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[ExamMarksTable] CHECK CONSTRAINT [FK_ExamMarksTable_UserTable]
GO
ALTER TABLE [dbo].[ExamTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[ExamTable] CHECK CONSTRAINT [FK_ExamTable_UserTable]
GO
ALTER TABLE [dbo].[ExpensesTable]  WITH CHECK ADD  CONSTRAINT [FK_ExpensesTable_ExpenseTypeTable] FOREIGN KEY([ExpensesTypeID])
REFERENCES [dbo].[ExpenseTypeTable] ([ExpensesTypeID])
GO
ALTER TABLE [dbo].[ExpensesTable] CHECK CONSTRAINT [FK_ExpensesTable_ExpenseTypeTable]
GO
ALTER TABLE [dbo].[ExpensesTable]  WITH CHECK ADD  CONSTRAINT [FK_ExpensesTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[ExpensesTable] CHECK CONSTRAINT [FK_ExpensesTable_UserTable]
GO
ALTER TABLE [dbo].[ProgrameSessionTable]  WITH CHECK ADD  CONSTRAINT [FK_ProgrameSessionTable_ProgrameTable] FOREIGN KEY([ProgrameID])
REFERENCES [dbo].[ProgrameTable] ([ProgrameID])
GO
ALTER TABLE [dbo].[ProgrameSessionTable] CHECK CONSTRAINT [FK_ProgrameSessionTable_ProgrameTable]
GO
ALTER TABLE [dbo].[ProgrameSessionTable]  WITH CHECK ADD  CONSTRAINT [FK_ProgrameSessionTable_SessionTable] FOREIGN KEY([SessionID])
REFERENCES [dbo].[SessionTable] ([SessionID])
GO
ALTER TABLE [dbo].[ProgrameSessionTable] CHECK CONSTRAINT [FK_ProgrameSessionTable_SessionTable]
GO
ALTER TABLE [dbo].[ProgrameSessionTable]  WITH CHECK ADD  CONSTRAINT [FK_ProgrameSessionTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[ProgrameSessionTable] CHECK CONSTRAINT [FK_ProgrameSessionTable_UserTable]
GO
ALTER TABLE [dbo].[ProgrameTable]  WITH CHECK ADD  CONSTRAINT [FK_ProgrameTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[ProgrameTable] CHECK CONSTRAINT [FK_ProgrameTable_UserTable]
GO
ALTER TABLE [dbo].[ProgrameTable]  WITH CHECK ADD  CONSTRAINT [FK_ProgrameTable_UserTables] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[ProgrameTable] CHECK CONSTRAINT [FK_ProgrameTable_UserTables]
GO
ALTER TABLE [dbo].[SchoolLeavingTable]  WITH CHECK ADD  CONSTRAINT [FK_SchoolLeavingTable_StudentTable] FOREIGN KEY([StudentID])
REFERENCES [dbo].[StudentTable] ([StudentID])
GO
ALTER TABLE [dbo].[SchoolLeavingTable] CHECK CONSTRAINT [FK_SchoolLeavingTable_StudentTable]
GO
ALTER TABLE [dbo].[SchoolLeavingTable]  WITH CHECK ADD  CONSTRAINT [FK_SchoolLeavingTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[SchoolLeavingTable] CHECK CONSTRAINT [FK_SchoolLeavingTable_UserTable]
GO
ALTER TABLE [dbo].[SectionTable]  WITH CHECK ADD  CONSTRAINT [FK_SectionTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[SectionTable] CHECK CONSTRAINT [FK_SectionTable_UserTable]
GO
ALTER TABLE [dbo].[SessionTable]  WITH CHECK ADD  CONSTRAINT [FK_SessionTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[SessionTable] CHECK CONSTRAINT [FK_SessionTable_UserTable]
GO
ALTER TABLE [dbo].[StaffAttendanceTable]  WITH CHECK ADD  CONSTRAINT [FK_StaffAttendanceTable_StaffTable] FOREIGN KEY([StaffID])
REFERENCES [dbo].[StaffTable] ([StaffID])
GO
ALTER TABLE [dbo].[StaffAttendanceTable] CHECK CONSTRAINT [FK_StaffAttendanceTable_StaffTable]
GO
ALTER TABLE [dbo].[StaffTable]  WITH CHECK ADD  CONSTRAINT [FK_StaffTable_DesignationTable] FOREIGN KEY([DesignationID])
REFERENCES [dbo].[DesignationTable] ([DesignationID])
GO
ALTER TABLE [dbo].[StaffTable] CHECK CONSTRAINT [FK_StaffTable_DesignationTable]
GO
ALTER TABLE [dbo].[StaffTable]  WITH CHECK ADD  CONSTRAINT [FK_StaffTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[StaffTable] CHECK CONSTRAINT [FK_StaffTable_UserTable]
GO
ALTER TABLE [dbo].[StudentPromoteTable]  WITH CHECK ADD  CONSTRAINT [FK_StudentPromoteTable_ClassTable] FOREIGN KEY([ClassID])
REFERENCES [dbo].[ClassTable] ([ClassID])
GO
ALTER TABLE [dbo].[StudentPromoteTable] CHECK CONSTRAINT [FK_StudentPromoteTable_ClassTable]
GO
ALTER TABLE [dbo].[StudentPromoteTable]  WITH CHECK ADD  CONSTRAINT [FK_StudentPromoteTable_ProgrameSessionTable] FOREIGN KEY([ProgrameSessionID])
REFERENCES [dbo].[ProgrameSessionTable] ([ProgrameSessionID])
GO
ALTER TABLE [dbo].[StudentPromoteTable] CHECK CONSTRAINT [FK_StudentPromoteTable_ProgrameSessionTable]
GO
ALTER TABLE [dbo].[StudentPromoteTable]  WITH CHECK ADD  CONSTRAINT [FK_StudentPromoteTable_SectionTable] FOREIGN KEY([SectionID])
REFERENCES [dbo].[SectionTable] ([SectionID])
GO
ALTER TABLE [dbo].[StudentPromoteTable] CHECK CONSTRAINT [FK_StudentPromoteTable_SectionTable]
GO
ALTER TABLE [dbo].[StudentPromoteTable]  WITH CHECK ADD  CONSTRAINT [FK_StudentPromoteTable_StudentTable] FOREIGN KEY([StudentID])
REFERENCES [dbo].[StudentTable] ([StudentID])
GO
ALTER TABLE [dbo].[StudentPromoteTable] CHECK CONSTRAINT [FK_StudentPromoteTable_StudentTable]
GO
ALTER TABLE [dbo].[StudentTable]  WITH CHECK ADD  CONSTRAINT [FK_StudentTable_ClassTable] FOREIGN KEY([ClassID])
REFERENCES [dbo].[ClassTable] ([ClassID])
GO
ALTER TABLE [dbo].[StudentTable] CHECK CONSTRAINT [FK_StudentTable_ClassTable]
GO
ALTER TABLE [dbo].[StudentTable]  WITH CHECK ADD  CONSTRAINT [FK_StudentTable_ProgrameTable] FOREIGN KEY([ProgrameID])
REFERENCES [dbo].[ProgrameTable] ([ProgrameID])
GO
ALTER TABLE [dbo].[StudentTable] CHECK CONSTRAINT [FK_StudentTable_ProgrameTable]
GO
ALTER TABLE [dbo].[StudentTable]  WITH CHECK ADD  CONSTRAINT [FK_StudentTable_SessionTable] FOREIGN KEY([SessionID])
REFERENCES [dbo].[SessionTable] ([SessionID])
GO
ALTER TABLE [dbo].[StudentTable] CHECK CONSTRAINT [FK_StudentTable_SessionTable]
GO
ALTER TABLE [dbo].[StudentTable]  WITH CHECK ADD  CONSTRAINT [FK_StudentTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[StudentTable] CHECK CONSTRAINT [FK_StudentTable_UserTable]
GO
ALTER TABLE [dbo].[SubjectTable]  WITH CHECK ADD  CONSTRAINT [FK_SubjectTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[SubjectTable] CHECK CONSTRAINT [FK_SubjectTable_UserTable]
GO
ALTER TABLE [dbo].[SubmissionFeeTable]  WITH CHECK ADD  CONSTRAINT [FK_SubmissionFeeTable_ClassTable] FOREIGN KEY([ClassID])
REFERENCES [dbo].[ClassTable] ([ClassID])
GO
ALTER TABLE [dbo].[SubmissionFeeTable] CHECK CONSTRAINT [FK_SubmissionFeeTable_ClassTable]
GO
ALTER TABLE [dbo].[SubmissionFeeTable]  WITH CHECK ADD  CONSTRAINT [FK_SubmissionFeeTable_ProgrameTable] FOREIGN KEY([ProgrameID])
REFERENCES [dbo].[ProgrameTable] ([ProgrameID])
GO
ALTER TABLE [dbo].[SubmissionFeeTable] CHECK CONSTRAINT [FK_SubmissionFeeTable_ProgrameTable]
GO
ALTER TABLE [dbo].[SubmissionFeeTable]  WITH CHECK ADD  CONSTRAINT [FK_SubmissionFeeTable_StudentTable] FOREIGN KEY([StudentID])
REFERENCES [dbo].[StudentTable] ([StudentID])
GO
ALTER TABLE [dbo].[SubmissionFeeTable] CHECK CONSTRAINT [FK_SubmissionFeeTable_StudentTable]
GO
ALTER TABLE [dbo].[SubmissionFeeTable]  WITH CHECK ADD  CONSTRAINT [FK_SubmissionFeeTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[SubmissionFeeTable] CHECK CONSTRAINT [FK_SubmissionFeeTable_UserTable]
GO
ALTER TABLE [dbo].[TimeTblTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTblTable_ClassSubjectTable] FOREIGN KEY([ClassSubjectID])
REFERENCES [dbo].[ClassSubjectTable] ([ClassSubjectID])
GO
ALTER TABLE [dbo].[TimeTblTable] CHECK CONSTRAINT [FK_TimeTblTable_ClassSubjectTable]
GO
ALTER TABLE [dbo].[TimeTblTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTblTable_StaffTable] FOREIGN KEY([StaffID])
REFERENCES [dbo].[StaffTable] ([StaffID])
GO
ALTER TABLE [dbo].[TimeTblTable] CHECK CONSTRAINT [FK_TimeTblTable_StaffTable]
GO
ALTER TABLE [dbo].[TimeTblTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTblTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[TimeTblTable] CHECK CONSTRAINT [FK_TimeTblTable_UserTable]
GO
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD  CONSTRAINT [FK_UserTable_UserTypeTable] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserTypeTable] ([UserTypeID])
GO
ALTER TABLE [dbo].[UserTable] CHECK CONSTRAINT [FK_UserTable_UserTypeTable]
GO
USE [master]
GO
ALTER DATABASE [SchoolMgtDb] SET  READ_WRITE 
GO
