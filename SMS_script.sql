USE [master]
GO
/****** Object:  Database [SchoolMgtDb]    Script Date: 2020/12/28 下午 07:43:04 ******/
CREATE DATABASE [SchoolMgtDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SchoolMgtDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SchoolMgtDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SchoolMgtDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SchoolMgtDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SchoolMgtDb] SET COMPATIBILITY_LEVEL = 150
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
EXEC sys.sp_db_vardecimal_storage_format N'SchoolMgtDb', N'ON'
GO
ALTER DATABASE [SchoolMgtDb] SET QUERY_STORE = OFF
GO
USE [SchoolMgtDb]
GO
/****** Object:  Table [dbo].[UserTypeTable]    Script Date: 2020/12/28 下午 07:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypeTable](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_UserTypeTable] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 2020/12/28 下午 07:43:04 ******/
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
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_AllUsers]    Script Date: 2020/12/28 下午 07:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_AllUsers]
AS
SELECT        dbo.UserTable.UserID, dbo.UserTable.UserTypeID, dbo.UserTypeTable.TypeName, dbo.UserTable.FullName, dbo.UserTable.UserName, dbo.UserTable.ContactNo, dbo.UserTable.EmailAddress, dbo.UserTable.Address
FROM            dbo.UserTable INNER JOIN
                         dbo.UserTypeTable ON dbo.UserTable.UserTypeID = dbo.UserTypeTable.UserTypeID

GO
/****** Object:  Table [dbo].[AnnualTable]    Script Date: 2020/12/28 下午 07:43:04 ******/
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
 CONSTRAINT [PK_AnnualTable] PRIMARY KEY CLUSTERED 
(
	[AnnualID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttendanceTable]    Script Date: 2020/12/28 下午 07:43:04 ******/
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
 CONSTRAINT [PK_AttendanceTable] PRIMARY KEY CLUSTERED 
(
	[AttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesignationTable]    Script Date: 2020/12/28 下午 07:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesignationTable](
	[DesignationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Title] [varchar](150) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_DesignationTable] PRIMARY KEY CLUSTERED 
(
	[DesignationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamMarksTable]    Script Date: 2020/12/28 下午 07:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamMarksTable](
	[MarksID] [int] IDENTITY(1,1) NOT NULL,
	[SessionProgrameSubjectSettingID] [int] NOT NULL,
	[ExamID] [int] NOT NULL,
	[ExamSettingID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[TotalMarks] [int] NOT NULL,
	[ObtainMarks] [int] NOT NULL,
 CONSTRAINT [PK_ExamMarksDetails] PRIMARY KEY CLUSTERED 
(
	[MarksID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamSettingTable]    Script Date: 2020/12/28 下午 07:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamSettingTable](
	[ExamSettingID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SessionID] [int] NOT NULL,
	[ExamID] [int] NOT NULL,
	[ProgrameSession_ID] [int] NOT NULL,
	[Description] [varchar](400) NOT NULL,
 CONSTRAINT [PK_ExamSettingTable] PRIMARY KEY CLUSTERED 
(
	[ExamSettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamTable]    Script Date: 2020/12/28 下午 07:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamTable](
	[ExamID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Title] [varchar](200) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Descrption] [varchar](200) NULL,
 CONSTRAINT [PK_ExamTable] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgrameSessionTable]    Script Date: 2020/12/28 下午 07:43:04 ******/
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
	[RegDate] [date] NOT NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_ProgrameSessionTable] PRIMARY KEY CLUSTERED 
(
	[ProgrameSessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgrameTable]    Script Date: 2020/12/28 下午 07:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgrameTable](
	[ProgrameID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[StartDate] [date] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ProgrameTable] PRIMARY KEY CLUSTERED 
(
	[ProgrameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SessionProgrameSubjectSettingTable]    Script Date: 2020/12/28 下午 07:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionProgrameSubjectSettingTable](
	[SessionProgrameSubjectSettingID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SessionID] [int] NOT NULL,
	[ProgrameID] [int] NOT NULL,
	[AnnualID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[RegDate] [date] NOT NULL,
	[Description] [varchar](200) NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_SessionProgrameSubjectSettingTable] PRIMARY KEY CLUSTERED 
(
	[SessionProgrameSubjectSettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SessionTable]    Script Date: 2020/12/28 下午 07:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionTable](
	[SessionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
 CONSTRAINT [PK_SessionTable] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffAttendanceTable]    Script Date: 2020/12/28 下午 07:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffAttendanceTable](
	[StaffAttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NOT NULL,
	[AttendDate] [date] NOT NULL,
	[ComingTime] [time](7) NULL,
	[ClosingTime] [time](7) NULL,
 CONSTRAINT [PK_StaffAttendanceTable] PRIMARY KEY CLUSTERED 
(
	[StaffAttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffTable]    Script Date: 2020/12/28 下午 07:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffTable](
	[StaffID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Designation_ID] [int] NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[BasicSalary] [float] NOT NULL,
	[EmailAddress] [varchar](100) NULL,
	[Address] [varchar](200) NOT NULL,
	[Qualification] [varchar](500) NOT NULL,
	[Photo] [varchar](max) NOT NULL,
	[Description] [varchar](500) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_StaffTable] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentTable]    Script Date: 2020/12/28 下午 07:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentTable](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[SessionID] [int] NOT NULL,
	[ProgrameID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[FatherName] [varchar](100) NOT NULL,
	[DateofBirth] [date] NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[ContactNo] [varchar](20) NOT NULL,
	[CNIC] [varchar](20) NOT NULL,
	[FNIC] [varchar](20) NOT NULL,
	[Photo] [varchar](max) NOT NULL,
	[IsEnrolled] [bit] NOT NULL,
	[ApplyDate] [date] NOT NULL,
	[IsShortList] [bit] NOT NULL,
	[IsApply] [bit] NOT NULL,
	[PreviousSchool] [varchar](500) NOT NULL,
	[PreviousPercentage] [float] NOT NULL,
	[EmailAddress] [varchar](100) NOT NULL,
	[Address] [varchar](200) NOT NULL,
 CONSTRAINT [PK_StudentTable] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectTable]    Script Date: 2020/12/28 下午 07:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectTable](
	[SubjectID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[RegDate] [date] NOT NULL,
	[Description] [varchar](400) NULL,
	[TotalMarks] [int] NULL,
 CONSTRAINT [PK_SubjectTable] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubmissionFeeTable]    Script Date: 2020/12/28 下午 07:43:04 ******/
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
	[SubmissionDate] [date] NOT NULL,
	[FeesMonth] [varchar](100) NOT NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_SubmissionFeeTable] PRIMARY KEY CLUSTERED 
(
	[SubmissionFeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeTblTable]    Script Date: 2020/12/28 下午 07:43:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeTblTable](
	[TimeTableID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[Day] [varchar](100) NOT NULL,
	[SessionProgrameSubjectSetting_ID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_TimeTblTable] PRIMARY KEY CLUSTERED 
(
	[TimeTableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AnnualTable] ADD  CONSTRAINT [DF_AnnualTable_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DesignationTable] ADD  CONSTRAINT [DF_DesignationTable_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ExamMarksTable] ADD  CONSTRAINT [DF_ExamMarksDetails_TotalMarks]  DEFAULT ((100)) FOR [TotalMarks]
GO
ALTER TABLE [dbo].[ExamMarksTable] ADD  CONSTRAINT [DF_ExamMarksDetails_ObtainMarks]  DEFAULT ((0)) FOR [ObtainMarks]
GO
ALTER TABLE [dbo].[ProgrameTable] ADD  CONSTRAINT [DF_ProgrameTable_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable] ADD  CONSTRAINT [DF_SessionProgrameSubjectSettingTable_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[StaffTable] ADD  CONSTRAINT [DF_StaffTable_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[StudentTable] ADD  CONSTRAINT [DF_StudentTable_IsEnrolled]  DEFAULT ((0)) FOR [IsEnrolled]
GO
ALTER TABLE [dbo].[StudentTable] ADD  CONSTRAINT [DF_StudentTable_IsShortList]  DEFAULT ((0)) FOR [IsShortList]
GO
ALTER TABLE [dbo].[StudentTable] ADD  CONSTRAINT [DF_StudentTable_IsApply]  DEFAULT ((0)) FOR [IsApply]
GO
ALTER TABLE [dbo].[StudentTable] ADD  CONSTRAINT [DF_StudentTable_PreviousPercentage]  DEFAULT ((0)) FOR [PreviousPercentage]
GO
ALTER TABLE [dbo].[SubjectTable] ADD  CONSTRAINT [DF_SubjectTable_TotalMarks]  DEFAULT ((100)) FOR [TotalMarks]
GO
ALTER TABLE [dbo].[TimeTblTable] ADD  CONSTRAINT [DF_TimeTblTable_IsActive]  DEFAULT ((1)) FOR [IsActive]
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
ALTER TABLE [dbo].[AttendanceTable]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceTable_StudentTable] FOREIGN KEY([StudentID])
REFERENCES [dbo].[StudentTable] ([StudentID])
GO
ALTER TABLE [dbo].[AttendanceTable] CHECK CONSTRAINT [FK_AttendanceTable_StudentTable]
GO
ALTER TABLE [dbo].[DesignationTable]  WITH CHECK ADD  CONSTRAINT [FK_DesignationTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[DesignationTable] CHECK CONSTRAINT [FK_DesignationTable_UserTable]
GO
ALTER TABLE [dbo].[ExamMarksTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamMarksTable_ExamSettingTable] FOREIGN KEY([ExamSettingID])
REFERENCES [dbo].[ExamSettingTable] ([ExamSettingID])
GO
ALTER TABLE [dbo].[ExamMarksTable] CHECK CONSTRAINT [FK_ExamMarksTable_ExamSettingTable]
GO
ALTER TABLE [dbo].[ExamMarksTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamMarksTable_SessionProgrameSubjectSettingTable] FOREIGN KEY([SessionProgrameSubjectSettingID])
REFERENCES [dbo].[SessionProgrameSubjectSettingTable] ([SessionProgrameSubjectSettingID])
GO
ALTER TABLE [dbo].[ExamMarksTable] CHECK CONSTRAINT [FK_ExamMarksTable_SessionProgrameSubjectSettingTable]
GO
ALTER TABLE [dbo].[ExamMarksTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamMarksTable_StudentTable] FOREIGN KEY([StudentID])
REFERENCES [dbo].[StudentTable] ([StudentID])
GO
ALTER TABLE [dbo].[ExamMarksTable] CHECK CONSTRAINT [FK_ExamMarksTable_StudentTable]
GO
ALTER TABLE [dbo].[ExamMarksTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamMarksTable_SubjectTable] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[SubjectTable] ([SubjectID])
GO
ALTER TABLE [dbo].[ExamMarksTable] CHECK CONSTRAINT [FK_ExamMarksTable_SubjectTable]
GO
ALTER TABLE [dbo].[ExamMarksTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamMarksTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[ExamMarksTable] CHECK CONSTRAINT [FK_ExamMarksTable_UserTable]
GO
ALTER TABLE [dbo].[ExamSettingTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamSettingTable_ExamTable] FOREIGN KEY([ExamID])
REFERENCES [dbo].[ExamTable] ([ExamID])
GO
ALTER TABLE [dbo].[ExamSettingTable] CHECK CONSTRAINT [FK_ExamSettingTable_ExamTable]
GO
ALTER TABLE [dbo].[ExamSettingTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamSettingTable_SessionTable] FOREIGN KEY([SessionID])
REFERENCES [dbo].[SessionTable] ([SessionID])
GO
ALTER TABLE [dbo].[ExamSettingTable] CHECK CONSTRAINT [FK_ExamSettingTable_SessionTable]
GO
ALTER TABLE [dbo].[ExamSettingTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamSettingTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[ExamSettingTable] CHECK CONSTRAINT [FK_ExamSettingTable_UserTable]
GO
ALTER TABLE [dbo].[ExamTable]  WITH CHECK ADD  CONSTRAINT [FK_ExamTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[ExamTable] CHECK CONSTRAINT [FK_ExamTable_UserTable]
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
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable]  WITH CHECK ADD  CONSTRAINT [FK_SessionProgrameSubjectSettingTable_AnnualTable] FOREIGN KEY([AnnualID])
REFERENCES [dbo].[AnnualTable] ([AnnualID])
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable] CHECK CONSTRAINT [FK_SessionProgrameSubjectSettingTable_AnnualTable]
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable]  WITH CHECK ADD  CONSTRAINT [FK_SessionProgrameSubjectSettingTable_ProgrameTable] FOREIGN KEY([ProgrameID])
REFERENCES [dbo].[ProgrameTable] ([ProgrameID])
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable] CHECK CONSTRAINT [FK_SessionProgrameSubjectSettingTable_ProgrameTable]
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable]  WITH CHECK ADD  CONSTRAINT [FK_SessionProgrameSubjectSettingTable_SessionTable] FOREIGN KEY([SessionID])
REFERENCES [dbo].[SessionTable] ([SessionID])
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable] CHECK CONSTRAINT [FK_SessionProgrameSubjectSettingTable_SessionTable]
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable]  WITH CHECK ADD  CONSTRAINT [FK_SessionProgrameSubjectSettingTable_SubjectTable] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[SubjectTable] ([SubjectID])
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable] CHECK CONSTRAINT [FK_SessionProgrameSubjectSettingTable_SubjectTable]
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable]  WITH CHECK ADD  CONSTRAINT [FK_SessionProgrameSubjectSettingTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[SessionProgrameSubjectSettingTable] CHECK CONSTRAINT [FK_SessionProgrameSubjectSettingTable_UserTable]
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
ALTER TABLE [dbo].[StaffTable]  WITH CHECK ADD  CONSTRAINT [FK_StaffTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[StaffTable] CHECK CONSTRAINT [FK_StaffTable_UserTable]
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
ALTER TABLE [dbo].[TimeTblTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTblTable_SubjectTable] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[SubjectTable] ([SubjectID])
GO
ALTER TABLE [dbo].[TimeTblTable] CHECK CONSTRAINT [FK_TimeTblTable_SubjectTable]
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
