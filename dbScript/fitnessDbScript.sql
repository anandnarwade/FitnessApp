USE [master]
GO
/****** Object:  Database [fitnessdb]    Script Date: 17-10-2020 11:24:35 ******/
CREATE DATABASE [fitnessdb] ON  PRIMARY 
( NAME = N'fitnessdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\fitnessdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'fitnessdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\fitnessdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [fitnessdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [fitnessdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [fitnessdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [fitnessdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [fitnessdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [fitnessdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [fitnessdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [fitnessdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [fitnessdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [fitnessdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [fitnessdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [fitnessdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [fitnessdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [fitnessdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [fitnessdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [fitnessdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [fitnessdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [fitnessdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [fitnessdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [fitnessdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [fitnessdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [fitnessdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [fitnessdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [fitnessdb] SET RECOVERY FULL 
GO
ALTER DATABASE [fitnessdb] SET  MULTI_USER 
GO
ALTER DATABASE [fitnessdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [fitnessdb] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'fitnessdb', N'ON'
GO
USE [fitnessdb]
GO
/****** Object:  Table [dbo].[CompanyMaster]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyMaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyCode] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](255) NULL,
	[BranchCode] [nvarchar](50) NULL,
	[BranchName] [nvarchar](255) NULL,
	[ShortCode] [int] NULL,
	[Address] [text] NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Createdby] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_CompanyMaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyMemberCount]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyMemberCount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[PraposeCount] [int] NULL,
	[ApprovedCount] [int] NULL,
	[startdate] [date] NULL,
	[enddate] [date] NULL,
 CONSTRAINT [PK_CompanyMemberCount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerMaster]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerMaster](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[custcode] [nvarchar](50) NULL,
	[name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[mobile] [nvarchar](50) NULL,
	[dob] [date] NULL,
	[age] [int] NULL,
	[gender] [int] NULL,
	[location] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[reference] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[orgname] [nvarchar](255) NULL,
	[designation] [nvarchar](50) NULL,
	[dept] [nvarchar](50) NULL,
	[business] [nvarchar](50) NULL,
	[bussname] [nvarchar](255) NULL,
	[dailyroutine] [nvarchar](255) NULL,
	[spocname] [nvarchar](50) NULL,
	[spocmob] [nvarchar](50) NULL,
	[IsRegister] [bit] NULL,
	[IsAdmin] [bit] NULL,
	[IsActive] [bit] NULL,
	[SendCredMail] [bit] NULL,
	[UserType] [int] NULL,
	[CompanyId] [int] NULL,
	[CountId] [int] NULL,
	[createdby] [nvarchar](50) NULL,
	[createdon] [datetime] NULL,
	[modifiedby] [nvarchar](50) NULL,
	[modifiedon] [datetime] NULL,
 CONSTRAINT [PK_UserMaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExerciseMaster]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExerciseMaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[exerciseName] [nvarchar](255) NULL,
 CONSTRAINT [PK_ExerciseMaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PasswordMaster]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PasswordMaster](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NULL,
	[pwd] [nvarchar](max) NULL,
	[version] [decimal](18, 0) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionsMaster]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionsMaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question] [text] NULL,
	[sequence] [int] NULL,
	[type] [nvarchar](50) NULL,
	[subtype] [nvarchar](50) NULL,
	[createdby] [nvarchar](50) NULL,
	[createdon] [datetime] NULL,
	[modifiedby] [nvarchar](50) NULL,
	[modifiedon] [datetime] NULL,
 CONSTRAINT [PK_QuestionsMaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SPOCmaster]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SPOCmaster](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[companyId] [int] NULL,
	[companyCode] [nvarchar](50) NULL,
	[branchCode] [nvarchar](50) NULL,
	[spocname] [nvarchar](255) NULL,
	[designation] [nvarchar](50) NULL,
	[spocemail] [nvarchar](255) NULL,
	[spoccontactno] [nvarchar](50) NULL,
	[category] [nvarchar](50) NULL,
	[typeId] [int] NULL,
	[createdby] [nvarchar](50) NULL,
	[createdon] [datetime] NULL,
	[modifiedby] [nvarchar](50) NULL,
	[modifiedon] [datetime] NULL,
 CONSTRAINT [PK_SPOCmaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempExcel]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempExcel](
	[SrNo] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Mobile] [nvarchar](50) NULL,
	[CompanyCode] [nvarchar](50) NULL,
	[BranchCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_TempExcel] PRIMARY KEY CLUSTERED 
(
	[SrNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypeMaster]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypeMaster](
	[id] [int] NULL,
	[typeId] [int] NULL,
	[typeText] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[V115]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[V115](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NULL,
	[parentname] [nvarchar](255) NULL,
	[witnessname] [nvarchar](255) NULL,
	[createdby] [nvarchar](50) NULL,
	[createdon] [datetime] NULL,
	[modifiedby] [nvarchar](50) NULL,
	[modifiedon] [datetime] NULL,
 CONSTRAINT [PK_V115] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[V115Transactions]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[V115Transactions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[v115Id] [bigint] NULL,
	[qid] [int] NULL,
	[answer] [nvarchar](50) NULL,
	[createdby] [nvarchar](50) NULL,
	[createdon] [datetime] NULL,
 CONSTRAINT [PK_V115Transactions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[V126]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[V126](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NULL,
	[physicianName] [nvarchar](255) NULL,
	[physicianPhone] [nvarchar](255) NULL,
	[emergencyContactPersonName] [nvarchar](255) NULL,
	[emergencyContactPersonPhone] [nvarchar](50) NULL,
	[MedicineDrugsAndReason] [text] NULL,
	[PhysicianKnowParticipation] [nvarchar](50) NULL,
	[PhysicalActivity] [text] NULL,
	[cretaedby] [nvarchar](255) NULL,
	[createdon] [datetime] NULL,
	[modifiedby] [nvarchar](255) NULL,
	[modifiedon] [datetime] NULL,
 CONSTRAINT [PK_V126] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[V126Transactions]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[V126Transactions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[v126id] [bigint] NULL,
	[qid] [int] NULL,
	[answer] [nvarchar](50) NULL,
	[createdby] [nvarchar](50) NULL,
	[createdon] [datetime] NULL,
 CONSTRAINT [PK_V126Transactions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[v137]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[v137](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[empEmail] [nvarchar](255) NULL,
	[RateExp] [nvarchar](50) NULL,
	[IsAthlete] [nvarchar](50) NULL,
	[IfAthleteY] [nvarchar](255) NULL,
	[IsNegFeeling] [nvarchar](50) NULL,
	[IfNegFeelingY] [nvarchar](255) NULL,
	[IsNegFeelingFit] [nvarchar](50) NULL,
	[IsNegFeelingFitY] [nvarchar](255) NULL,
	[IsStartExe] [nvarchar](50) NULL,
	[ExeTime] [nvarchar](50) NULL,
	[ExeUnit] [nvarchar](255) NULL,
	[RegIndExe] [nvarchar](50) NULL,
	[IfRegIndExeY] [nvarchar](255) NULL,
	[RegIndExeTime] [nvarchar](50) NULL,
	[RegIndExeUnit] [nvarchar](50) NULL,
	[RateRedIndExe] [nvarchar](50) NULL,
	[ExeFromMonths] [nvarchar](50) NULL,
	[ExeFromYeasrs] [nvarchar](50) NULL,
	[ParticipatedOtherExeMonths] [nvarchar](50) NULL,
	[ParticipatedOtherExeYears] [nvarchar](50) NULL,
	[ExeDuringWRKDY] [nvarchar](50) NULL,
	[ExeInterfereWithJob] [nvarchar](50) NULL,
	[ExeBenefitJob] [nvarchar](50) NULL,
	[WeightInc] [nvarchar](50) NULL,
	[WeightDec] [nvarchar](50) NULL,
	[Createdby] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_v137] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[v137Transactions]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[v137Transactions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[v137id] [bigint] NULL,
	[qid] [int] NULL,
	[subQ] [nvarchar](50) NULL,
	[Ans] [nvarchar](255) NULL,
	[createdby] [nvarchar](50) NULL,
	[createdon] [datetime] NULL,
	[modifiedby] [nvarchar](50) NULL,
	[modifiedon] [datetime] NULL,
 CONSTRAINT [PK_v137Transactions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[V143]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[V143](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NULL,
	[createdby] [nvarchar](255) NULL,
	[createdon] [datetime] NULL,
 CONSTRAINT [PK_V143] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[V143Transactions]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[V143Transactions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[v143id] [bigint] NULL,
	[qid] [int] NULL,
	[answer] [nvarchar](50) NULL,
	[createdby] [nvarchar](255) NULL,
	[createdon] [datetime] NULL,
 CONSTRAINT [PK_V143Transactions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[V158]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[V158](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NULL,
	[medications] [nvarchar](255) NULL,
	[effects] [nvarchar](255) NULL,
	[recommandations] [text] NULL,
	[createdby] [nvarchar](50) NULL,
	[createdon] [datetime] NULL,
 CONSTRAINT [PK_V158] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[V169]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[V169](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[empEmail] [nvarchar](255) NULL,
	[EssRestingHR] [float] NULL,
	[EssExerciseHR] [float] NULL,
	[EssHRDate] [date] NULL,
	[EssRestingBP] [nvarchar](50) NULL,
	[EssRestingBPDate] [date] NULL,
	[BCADate] [date] NULL,
	[WeightIb] [float] NULL,
	[HeightIn] [float] NULL,
	[WeightKg] [float] NULL,
	[HeightM] [float] NULL,
	[BCABMI] [float] NULL,
	[SKMmenChest] [float] NULL,
	[SKMmenAbdomen] [float] NULL,
	[SKMmenThigh] [float] NULL,
	[SKMmenTotal] [float] NULL,
	[SKMwomenTriceps] [float] NULL,
	[SKMwomenSuprailium] [float] NULL,
	[SKMwomenThigh] [float] NULL,
	[SKMwomenTotal] [float] NULL,
	[SKMBodyFatEst] [float] NULL,
	[SKMDate] [date] NULL,
	[GMDate] [date] NULL,
	[GMAbdomen] [float] NULL,
	[GMHip] [float] NULL,
	[GMWaist] [float] NULL,
	[GMWaistToHipRatio] [nvarchar](50) NULL,
	[Createdby] [nvarchar](255) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [nvarchar](255) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_V169] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoGallaryMaster]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoGallaryMaster](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[videoCategory] [nvarchar](50) NULL,
	[videoURL] [text] NULL,
	[isActive] [bit] NULL,
	[createdby] [nvarchar](50) NULL,
	[createdOn] [datetime] NULL,
	[modifiedBy] [nvarchar](50) NULL,
	[modifiedOn] [datetime] NULL,
 CONSTRAINT [PK_VideoGallaryMaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CompanyMaster] ON 

INSERT [dbo].[CompanyMaster] ([id], [CompanyCode], [CompanyName], [BranchCode], [BranchName], [ShortCode], [Address], [City], [State], [Createdby], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'COM0001', N'Soda', N'001', N'aurangabad', 101, N'Shendra', N'Aurangabad', N'mh', N'samir@gmail.com', CAST(N'2020-09-04T21:25:47.997' AS DateTime), NULL, NULL)
INSERT [dbo].[CompanyMaster] ([id], [CompanyCode], [CompanyName], [BranchCode], [BranchName], [ShortCode], [Address], [City], [State], [Createdby], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'T0001', N'tiger hr solution pvt ltd', N'01', N'waluj', 1, N'tilaknagar ', N'abd', N'mh', N'samir@gmail.com', CAST(N'2020-09-04T21:47:34.023' AS DateTime), NULL, NULL)
INSERT [dbo].[CompanyMaster] ([id], [CompanyCode], [CompanyName], [BranchCode], [BranchName], [ShortCode], [Address], [City], [State], [Createdby], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (3, N'COM', N'test company', N'123', N'test branch', 101, N'no address', N'aurangabad', N'mh', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T16:38:10.483' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[CompanyMaster] OFF
SET IDENTITY_INSERT [dbo].[CompanyMemberCount] ON 

INSERT [dbo].[CompanyMemberCount] ([Id], [CompanyId], [PraposeCount], [ApprovedCount], [startdate], [enddate]) VALUES (6, 1, 2, 2, CAST(N'2020-09-21' AS Date), CAST(N'2020-09-30' AS Date))
SET IDENTITY_INSERT [dbo].[CompanyMemberCount] OFF
SET IDENTITY_INSERT [dbo].[CustomerMaster] ON 

INSERT [dbo].[CustomerMaster] ([id], [custcode], [name], [email], [mobile], [dob], [age], [gender], [location], [city], [state], [reference], [type], [orgname], [designation], [dept], [business], [bussname], [dailyroutine], [spocname], [spocmob], [IsRegister], [IsAdmin], [IsActive], [SendCredMail], [UserType], [CompanyId], [CountId], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (1, N'280820232524PM', N'anand narwade', N'anand.narwade11@gmail.com', N'8007978394', CAST(N'1993-10-11' AS Date), 27, 1, N'aurangabad', N'aurangabad', N'mh', N'', N'Corporate', N'', N'', N'', N'', N'', N'', N'test spoc', N'8788374776', 1, 1, NULL, NULL, NULL, NULL, NULL, N'SELF', CAST(N'2020-08-28T23:25:24.457' AS DateTime), NULL, NULL)
INSERT [dbo].[CustomerMaster] ([id], [custcode], [name], [email], [mobile], [dob], [age], [gender], [location], [city], [state], [reference], [type], [orgname], [designation], [dept], [business], [bussname], [dailyroutine], [spocname], [spocmob], [IsRegister], [IsAdmin], [IsActive], [SendCredMail], [UserType], [CompanyId], [CountId], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (2, N'280820233738', N'keshav', N'keshav@gmail.com', N'9960328433', CAST(N'1993-12-12' AS Date), 27, 1, N'kannad', N'aur', N'mh', N'-', N'Service', N'IT', N'se', N'IT', N'', N'', N'', N'', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'SELF', CAST(N'2020-08-28T23:37:38.603' AS DateTime), NULL, NULL)
INSERT [dbo].[CustomerMaster] ([id], [custcode], [name], [email], [mobile], [dob], [age], [gender], [location], [city], [state], [reference], [type], [orgname], [designation], [dept], [business], [bussname], [dailyroutine], [spocname], [spocmob], [IsRegister], [IsAdmin], [IsActive], [SendCredMail], [UserType], [CompanyId], [CountId], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (3, N'290820093526', N'samir', N'samir@gmail.com', N'8007978394', CAST(N'1993-08-15' AS Date), 27, 1, N'abd', N'abd', N'mh', N'-', N'Service', N'test', N'trainee', N'it', N'', N'', N'', N'', N'', 0, NULL, NULL, NULL, NULL, NULL, NULL, N'SELF', CAST(N'2020-08-29T09:35:27.287' AS DateTime), NULL, NULL)
INSERT [dbo].[CustomerMaster] ([id], [custcode], [name], [email], [mobile], [dob], [age], [gender], [location], [city], [state], [reference], [type], [orgname], [designation], [dept], [business], [bussname], [dailyroutine], [spocname], [spocmob], [IsRegister], [IsAdmin], [IsActive], [SendCredMail], [UserType], [CompanyId], [CountId], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (6, NULL, N'sagar', N'sagar@gmail.com', N'9876543210', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, N'keshav@gmail.com', CAST(N'2020-09-06T12:16:30.387' AS DateTime), NULL, NULL)
INSERT [dbo].[CustomerMaster] ([id], [custcode], [name], [email], [mobile], [dob], [age], [gender], [location], [city], [state], [reference], [type], [orgname], [designation], [dept], [business], [bussname], [dailyroutine], [spocname], [spocmob], [IsRegister], [IsAdmin], [IsActive], [SendCredMail], [UserType], [CompanyId], [CountId], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (7, NULL, N'pankaj', N'pankaj@gmail.com', N'1234567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, N'keshav@gmail.com', CAST(N'2020-09-06T12:16:30.393' AS DateTime), NULL, NULL)
INSERT [dbo].[CustomerMaster] ([id], [custcode], [name], [email], [mobile], [dob], [age], [gender], [location], [city], [state], [reference], [type], [orgname], [designation], [dept], [business], [bussname], [dailyroutine], [spocname], [spocmob], [IsRegister], [IsAdmin], [IsActive], [SendCredMail], [UserType], [CompanyId], [CountId], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (8, NULL, N'sangmesh', N'mails.sangamesh@gmail.com', N'8756435678', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'keshav@gmail.com', CAST(N'2020-09-06T12:16:30.397' AS DateTime), NULL, NULL)
INSERT [dbo].[CustomerMaster] ([id], [custcode], [name], [email], [mobile], [dob], [age], [gender], [location], [city], [state], [reference], [type], [orgname], [designation], [dept], [business], [bussname], [dailyroutine], [spocname], [spocmob], [IsRegister], [IsAdmin], [IsActive], [SendCredMail], [UserType], [CompanyId], [CountId], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (9, NULL, N'anand', N'anand@gmail.com', N'8007979394', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 3, 1, NULL, N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:22:05.740' AS DateTime), NULL, NULL)
INSERT [dbo].[CustomerMaster] ([id], [custcode], [name], [email], [mobile], [dob], [age], [gender], [location], [city], [state], [reference], [type], [orgname], [designation], [dept], [business], [bussname], [dailyroutine], [spocname], [spocmob], [IsRegister], [IsAdmin], [IsActive], [SendCredMail], [UserType], [CompanyId], [CountId], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (10, NULL, N'pawan', N'pawan@gmail.com', N'889977665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 3, 1, NULL, N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:22:05.750' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[CustomerMaster] OFF
SET IDENTITY_INSERT [dbo].[ExerciseMaster] ON 

INSERT [dbo].[ExerciseMaster] ([id], [exerciseName]) VALUES (1, N'Weight loss')
INSERT [dbo].[ExerciseMaster] ([id], [exerciseName]) VALUES (2, N'weigght gain')
INSERT [dbo].[ExerciseMaster] ([id], [exerciseName]) VALUES (3, N'cardio')
INSERT [dbo].[ExerciseMaster] ([id], [exerciseName]) VALUES (4, N'Reshape')
SET IDENTITY_INSERT [dbo].[ExerciseMaster] OFF
SET IDENTITY_INSERT [dbo].[PasswordMaster] ON 

INSERT [dbo].[PasswordMaster] ([id], [email], [pwd], [version]) VALUES (1, N'samir@gmail.com', N'Password', CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[PasswordMaster] ([id], [email], [pwd], [version]) VALUES (3, N'anand.narwade11@gmail.com', N'AnandN$#$000', CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[PasswordMaster] ([id], [email], [pwd], [version]) VALUES (4, N'keshav@gmail.com', N'KeshavK@#@123', CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[PasswordMaster] ([id], [email], [pwd], [version]) VALUES (5, N'mails.sangamesh@gmail.com', N'SangameshB@#@123', CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[PasswordMaster] ([id], [email], [pwd], [version]) VALUES (7, N'anand.narwade11@gmail.com', N'VijayV$#$123', CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[PasswordMaster] ([id], [email], [pwd], [version]) VALUES (8, N'anand.narwade11@gmail.com', N'PassW#@#123', CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[PasswordMaster] ([id], [email], [pwd], [version]) VALUES (6, N'anand.narwade11@gmail.com', N'AnandN$#$123', CAST(1 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[PasswordMaster] OFF
SET IDENTITY_INSERT [dbo].[QuestionsMaster] ON 

INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (1, N'Has your doctor ever said that you have a heart condition and that you should only do physical activity recommended by a doctor? ', 1, N'Par-q and you', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (2, N'Do you feel pain in your chest when you do physical activity?', 2, N'Par-q and you', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (3, N'In the past month, have you had chest pain when you were not doing physical activity?', 3, N'Par-q and you', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (4, N'Do you lose your balance because of dizziness or do you ever lose consciousness?', 4, N'Par-q and you', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (5, N'Do you have a bone or joint problem (for example, back, knee or hip) that could be made worse by a change in your physical activity?', 5, N'Par-q and you', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (6, N'Is your doctor currently prescribing drugs (for example, water pills) for your blood pressure or heart con- dition?', 6, N'Par-q and you', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (7, N'Do you know of any other reason why you should not do physical activity?', 7, N'Par-q and you', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (8, N'History of heart problems, chest pain, or stroke', 1, N'V126', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (9, N'Elevated blood pressure', 2, N'V126', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (10, N'Any chronic illness or condition', 3, N'V126', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (11, N'Difficulty with physical exercise', 4, N'V126', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (12, N'Advice from physician not to exercise', 5, N'V126', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (13, N'Recent surgery (last 12 months)', 6, N'V126', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (14, N'Pregnancy (now or within last 3 months)', 7, N'V126', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (15, N'History of breathing or lung problems', 8, N'V126', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (16, N'Muscle, joint, or back disorder, or any previous injury still affecting you', 9, N'V126', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (17, N'Diabetes or metabolic syndrome', 10, N'V126', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (18, N'Thyroid condition', 11, N'V126', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (19, N'Cigarette smoking habit', 12, N'V126', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (20, N'Obesity [body mass index (BMI) =30 kg/m2]', 13, N'V126', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (21, N'Elevated blood cholesterol', 14, N'V126', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (22, N'History of heart problems in immediate family', 15, N'V126', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (23, N'Hernia, or any condition that may be aggravated by lifting weights or other physical activity', 16, N'V126', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (24, N'Are you looking to change a specific behavior?', 1, N'V143', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (25, N'Are you willing to make this behavioral change a top priority?2', 2, N'V143', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (26, N'Have you tried to change this behavior before?', 3, N'V143', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (27, N'Do you believe there are inherent risks/dangers associated with not making this behavioral change?', 4, N'V143', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (28, N'Are you committed to making this change, even though it may prove challenging?', 5, N'V143', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (29, N'Do you have support for making this change from friends, family, and loved ones?', 6, N'V143', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (30, N'Besides health reasons, do you have other reasons for wanting to change this behavior?', 7, N'V143', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (31, N'Are you prepared to be patient with yourself if you encounter obstacles, barriers, and/or setbacks?', 8, N'V143', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (32, N'Characterize your present athletic ability', 1, N'V137', N'Q5', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (33, N'When you exercise, how important is competition?', 2, N'V137', N'Q5', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (34, N'Characterize your present cardiovascular capacity.', 3, N'V137', N'Q5', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (35, N'Characterize your present muscular capacity.', 4, N'V137', N'Q5', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (36, N'Characterize your present flexibility capacity.', 5, N'V137', N'Q5', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (37, N'Walking', 1, N'V137', N'Q14', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (38, N'Jogging', 2, N'V137', N'Q14', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (39, N'Strength training', 3, N'V137', N'Q14', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (40, N'Cycling', 4, N'V137', N'Q14', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (41, N'Traditional aerobics', 5, N'V137', N'Q14', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (42, N'Racquet sports', 6, N'V137', N'Q14', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (43, N'Stationary biking', 7, N'V137', N'Q14', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (44, N'Elliptical striding', 8, N'V137', N'Q14', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (45, N'Yoga/Pilates', 9, N'V137', N'Q14', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (46, N'Stair climbing', 10, N'V137', N'Q14', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (47, N'Swimming', 11, N'V137', N'Q14', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (48, N'Other activities', 12, N'V137', N'Q14', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (49, N'Improve cardiovascular fitness', 1, N'V137', N'Q15', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (50, N'Lose weight/body fat', 2, N'V137', N'Q15', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (51, N'Reshape or tone my body', 3, N'V137', N'Q15', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (52, N'Improve performance for a specific sport', 4, N'V137', N'Q15', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (53, N'Improve moods and ability to cope with stress', 5, N'V137', N'Q15', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (54, N'Improve flexibility', 6, N'V137', N'Q15', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (55, N'Increase strength', 7, N'V137', N'Q15', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (56, N'Increase energy level', 8, N'V137', N'Q15', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (57, N'Feel better', 9, N'V137', N'Q15', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (58, N'Increase enjoyment', 10, N'V137', N'Q15', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (59, N'Social interaction', 11, N'V137', N'Q15', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [subtype], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (60, N'Other', 12, N'V137', N'Q15', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[QuestionsMaster] OFF
SET IDENTITY_INSERT [dbo].[SPOCmaster] ON 

INSERT [dbo].[SPOCmaster] ([id], [companyId], [companyCode], [branchCode], [spocname], [designation], [spocemail], [spoccontactno], [category], [typeId], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (6, 1, NULL, NULL, N'b', N'', N'anand.narwade11@gmail.com', N'8788374776', NULL, 2, N'anand.narwade11@gmail.com', CAST(N'2020-09-19T21:15:26.960' AS DateTime), N'anand.narwade11@gmail.com', CAST(N'2020-09-19T21:15:56.243' AS DateTime))
INSERT [dbo].[SPOCmaster] ([id], [companyId], [companyCode], [branchCode], [spocname], [designation], [spocemail], [spoccontactno], [category], [typeId], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (7, 1, NULL, NULL, N'Sakharam pant', NULL, N'sakharam.pant@gmail.com', N'4455668877', NULL, 3, N'anand.narwade11@gmail.com', CAST(N'2020-09-19T21:17:30.537' AS DateTime), N'anand.narwade11@gmail.com', CAST(N'2020-09-19T22:51:06.007' AS DateTime))
INSERT [dbo].[SPOCmaster] ([id], [companyId], [companyCode], [branchCode], [spocname], [designation], [spocemail], [spoccontactno], [category], [typeId], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (8, 1, NULL, NULL, N'D', N'', N'sachin.tendulkar@icc.com', N'9988009988', NULL, 3, N'anand.narwade11@gmail.com', CAST(N'2020-09-19T21:33:47.977' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[SPOCmaster] OFF
INSERT [dbo].[TempExcel] ([SrNo], [Name], [Email], [Mobile], [CompanyCode], [BranchCode]) VALUES (1, N'anand', N'anand@gmail.com', N'8007979394', NULL, NULL)
INSERT [dbo].[TempExcel] ([SrNo], [Name], [Email], [Mobile], [CompanyCode], [BranchCode]) VALUES (2, N'pawan', N'pawan@gmail.com', N'889977665', NULL, NULL)
INSERT [dbo].[UserTypeMaster] ([id], [typeId], [typeText]) VALUES (1, 1, N'Admin')
INSERT [dbo].[UserTypeMaster] ([id], [typeId], [typeText]) VALUES (2, 2, N'SPOC')
INSERT [dbo].[UserTypeMaster] ([id], [typeId], [typeText]) VALUES (3, 3, N'Team Member')
INSERT [dbo].[UserTypeMaster] ([id], [typeId], [typeText]) VALUES (4, 4, N'Customer')
SET IDENTITY_INSERT [dbo].[V115] ON 

INSERT [dbo].[V115] ([id], [email], [parentname], [witnessname], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (9, N'anand.narwade11@gmail.com', N'Keshav', N'Kunthe', N'anand.narwade11@gmail.com', CAST(N'2020-09-09T22:01:33.490' AS DateTime), NULL, NULL)
INSERT [dbo].[V115] ([id], [email], [parentname], [witnessname], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (10, N'anand.narwade11@gmail.com', N'ajinkya', N'jadhav', N'anand.narwade11@gmail.com', CAST(N'2020-09-09T22:01:50.233' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[V115] OFF
SET IDENTITY_INSERT [dbo].[V115Transactions] ON 

INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (64, 9, 1, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-09T22:01:33.497' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (65, 9, 2, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-09T22:01:33.503' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (66, 9, 3, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-09T22:01:33.503' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (67, 9, 4, N'No', N'anand.narwade11@gmail.com', CAST(N'2020-09-09T22:01:33.507' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (68, 9, 5, N'No', N'anand.narwade11@gmail.com', CAST(N'2020-09-09T22:01:33.507' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (69, 9, 6, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-09T22:01:33.507' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (70, 9, 7, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-09T22:01:33.510' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (71, 10, 1, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-09T22:01:50.237' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (72, 10, 2, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-09T22:01:50.237' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (73, 10, 3, N'No', N'anand.narwade11@gmail.com', CAST(N'2020-09-09T22:01:50.237' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (74, 10, 4, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-09T22:01:50.240' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (75, 10, 5, N'No', N'anand.narwade11@gmail.com', CAST(N'2020-09-09T22:01:50.240' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (76, 10, 6, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-09T22:01:50.240' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (77, 10, 7, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-09T22:01:50.240' AS DateTime))
SET IDENTITY_INSERT [dbo].[V115Transactions] OFF
SET IDENTITY_INSERT [dbo].[V126] ON 

INSERT [dbo].[V126] ([id], [email], [physicianName], [physicianPhone], [emergencyContactPersonName], [emergencyContactPersonPhone], [MedicineDrugsAndReason], [PhysicianKnowParticipation], [PhysicalActivity], [cretaedby], [createdon], [modifiedby], [modifiedon]) VALUES (1, N'samir@gmail.com', N'dr. xyz', N'02438234894', N'xyz', N'9966332211', N'test', N'no', N'nothing', N'samir@gmail.com', CAST(N'2020-08-29T16:33:38.680' AS DateTime), NULL, NULL)
INSERT [dbo].[V126] ([id], [email], [physicianName], [physicianPhone], [emergencyContactPersonName], [emergencyContactPersonPhone], [MedicineDrugsAndReason], [PhysicianKnowParticipation], [PhysicalActivity], [cretaedby], [createdon], [modifiedby], [modifiedon]) VALUES (2, N'anand.narwade11@gmail.com', N'Dr. kiran', N'0240232345', N'--', N'9874568990', N'---', N'--', N'----', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:25:19.920' AS DateTime), NULL, NULL)
INSERT [dbo].[V126] ([id], [email], [physicianName], [physicianPhone], [emergencyContactPersonName], [emergencyContactPersonPhone], [MedicineDrugsAndReason], [PhysicianKnowParticipation], [PhysicalActivity], [cretaedby], [createdon], [modifiedby], [modifiedon]) VALUES (3, N'anand.narwade11@gmail.com', N'Dr. Abhay', N'9898989898', N'---', N'----', N'-----', N'------', N'------', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:33:05.430' AS DateTime), N'anand.narwade11@gmail.com', CAST(N'2020-09-18T23:36:55.637' AS DateTime))
SET IDENTITY_INSERT [dbo].[V126] OFF
SET IDENTITY_INSERT [dbo].[V126Transactions] ON 

INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (1, 1, 8, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T16:34:01.347' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (2, 1, 9, N'No', N'samir@gmail.com', CAST(N'2020-08-29T16:34:07.867' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (3, 1, 10, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T16:34:13.260' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (4, 1, 11, N'No', N'samir@gmail.com', CAST(N'2020-08-29T16:34:19.357' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (5, 1, 12, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T16:34:25.580' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (6, 1, 13, N'No', N'samir@gmail.com', CAST(N'2020-08-29T16:34:31.640' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (7, 1, 14, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T16:34:37.680' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (8, 1, 15, N'No', N'samir@gmail.com', CAST(N'2020-08-29T16:34:45.340' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (9, 1, 16, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T16:34:51.893' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (10, 1, 17, N'No', N'samir@gmail.com', CAST(N'2020-08-29T16:34:57.463' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (11, 1, 18, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T16:35:03.550' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (12, 1, 19, N'No', N'samir@gmail.com', CAST(N'2020-08-29T16:35:09.363' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (13, 1, 20, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T16:35:15.967' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (14, 1, 21, N'No', N'samir@gmail.com', CAST(N'2020-08-29T16:35:25.793' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (15, 1, 22, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T16:35:34.103' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (16, 1, 23, N'No', N'samir@gmail.com', CAST(N'2020-08-29T16:35:40.927' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (17, 2, 8, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:25:19.930' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (18, 2, 9, N'No', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:25:19.930' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (19, 2, 10, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:25:19.930' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (20, 2, 11, N'No', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:25:19.933' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (21, 2, 12, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:25:19.933' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (22, 2, 13, N'No', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:25:19.933' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (23, 2, 14, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:25:19.933' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (24, 2, 15, N'No', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:25:19.933' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (25, 2, 16, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:25:19.937' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (26, 2, 17, N'No', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:25:19.937' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (27, 2, 18, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:25:19.937' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (28, 2, 19, N'No', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:25:19.940' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (29, 2, 20, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:25:19.940' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (30, 2, 21, N'No', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:25:19.940' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (31, 2, 22, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:25:19.940' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (32, 2, 23, N'No', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:25:19.940' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (33, 3, 8, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:33:05.433' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (34, 3, 9, N'No', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:33:05.437' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (35, 3, 10, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:33:05.437' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (36, 3, 11, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:33:05.437' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (37, 3, 12, N'No', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:33:05.440' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (38, 3, 13, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:33:05.443' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (39, 3, 14, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:33:05.443' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (40, 3, 15, N'No', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:33:05.447' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (41, 3, 16, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:33:05.447' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (42, 3, 17, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:33:05.447' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (43, 3, 18, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:33:05.447' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (44, 3, 19, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:33:05.447' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (45, 3, 20, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:33:05.450' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (46, 3, 21, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:33:05.450' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (47, 3, 22, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:33:05.450' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (48, 3, 23, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T22:33:05.450' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (65, 3, 8, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T23:36:55.640' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (66, 3, 9, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T23:36:55.647' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (67, 3, 10, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T23:36:55.647' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (68, 3, 11, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T23:36:55.650' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (69, 3, 12, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T23:36:55.650' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (70, 3, 13, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T23:36:55.650' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (71, 3, 14, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T23:36:55.650' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (72, 3, 15, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T23:36:55.650' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (73, 3, 16, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T23:36:55.650' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (74, 3, 17, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T23:36:55.650' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (75, 3, 18, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T23:36:55.650' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (76, 3, 19, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T23:36:55.653' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (77, 3, 20, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T23:36:55.653' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (78, 3, 21, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T23:36:55.653' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (79, 3, 22, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T23:36:55.653' AS DateTime))
INSERT [dbo].[V126Transactions] ([id], [v126id], [qid], [answer], [createdby], [createdon]) VALUES (80, 3, 23, N'Yes', N'anand.narwade11@gmail.com', CAST(N'2020-09-18T23:36:55.653' AS DateTime))
SET IDENTITY_INSERT [dbo].[V126Transactions] OFF
SET IDENTITY_INSERT [dbo].[v137] ON 

INSERT [dbo].[v137] ([id], [empEmail], [RateExp], [IsAthlete], [IfAthleteY], [IsNegFeeling], [IfNegFeelingY], [IsNegFeelingFit], [IsNegFeelingFitY], [IsStartExe], [ExeTime], [ExeUnit], [RegIndExe], [IfRegIndExeY], [RegIndExeTime], [RegIndExeUnit], [RateRedIndExe], [ExeFromMonths], [ExeFromYeasrs], [ParticipatedOtherExeMonths], [ParticipatedOtherExeYears], [ExeDuringWRKDY], [ExeInterfereWithJob], [ExeBenefitJob], [WeightInc], [WeightDec], [Createdby], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (24, N'anand.narwade11@gmail.com', N'21–30', N'Yes', N'', N'No', N'', N'No', N'', N'No', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'8', N'9', NULL, CAST(N'2020-09-19T01:57:06.643' AS DateTime), NULL, NULL)
INSERT [dbo].[v137] ([id], [empEmail], [RateExp], [IsAthlete], [IfAthleteY], [IsNegFeeling], [IfNegFeelingY], [IsNegFeelingFit], [IsNegFeelingFitY], [IsStartExe], [ExeTime], [ExeUnit], [RegIndExe], [IfRegIndExeY], [RegIndExeTime], [RegIndExeUnit], [RateRedIndExe], [ExeFromMonths], [ExeFromYeasrs], [ParticipatedOtherExeMonths], [ParticipatedOtherExeYears], [ExeDuringWRKDY], [ExeInterfereWithJob], [ExeBenefitJob], [WeightInc], [WeightDec], [Createdby], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (25, N'anand.narwade11@gmail.com', N'41–50', N'No', N'', N'', N'', N'No', N'', N'No', N'90', N'days/week', N'No', N'', N'', N'minutes/day', N'Light', N'', N'', N'', N'', N'Yes', N'Yes', N'Yes', N'7', N'9', NULL, CAST(N'2020-09-19T02:02:05.213' AS DateTime), NULL, NULL)
INSERT [dbo].[v137] ([id], [empEmail], [RateExp], [IsAthlete], [IfAthleteY], [IsNegFeeling], [IfNegFeelingY], [IsNegFeelingFit], [IsNegFeelingFitY], [IsStartExe], [ExeTime], [ExeUnit], [RegIndExe], [IfRegIndExeY], [RegIndExeTime], [RegIndExeUnit], [RateRedIndExe], [ExeFromMonths], [ExeFromYeasrs], [ParticipatedOtherExeMonths], [ParticipatedOtherExeYears], [ExeDuringWRKDY], [ExeInterfereWithJob], [ExeBenefitJob], [WeightInc], [WeightDec], [Createdby], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (26, N'anand.narwade11@gmail.com', N'41–50', N'No', N'', N'No', N'', N'No', N'', N'No', N'', N'', N'No', N'', N'', N'', N' Fairly light', N'5', N'5', N'8', N'8', N'Yes', N'Yes', N'Yes', N'10', N'20', NULL, CAST(N'2020-09-22T15:00:11.717' AS DateTime), NULL, NULL)
INSERT [dbo].[v137] ([id], [empEmail], [RateExp], [IsAthlete], [IfAthleteY], [IsNegFeeling], [IfNegFeelingY], [IsNegFeelingFit], [IsNegFeelingFitY], [IsStartExe], [ExeTime], [ExeUnit], [RegIndExe], [IfRegIndExeY], [RegIndExeTime], [RegIndExeUnit], [RateRedIndExe], [ExeFromMonths], [ExeFromYeasrs], [ParticipatedOtherExeMonths], [ParticipatedOtherExeYears], [ExeDuringWRKDY], [ExeInterfereWithJob], [ExeBenefitJob], [WeightInc], [WeightDec], [Createdby], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (27, N'anand.narwade11@gmail.com', N'41–50', N'No', N'', N'No', N'', N'No', N'', N'No', N'', N'', N'No', N'', N'', N'', N' Fairly light', N'5', N'5', N'8', N'8', N'Yes', N'Yes', N'Yes', N'10', N'20', NULL, CAST(N'2020-09-22T15:00:21.437' AS DateTime), NULL, NULL)
INSERT [dbo].[v137] ([id], [empEmail], [RateExp], [IsAthlete], [IfAthleteY], [IsNegFeeling], [IfNegFeelingY], [IsNegFeelingFit], [IsNegFeelingFitY], [IsStartExe], [ExeTime], [ExeUnit], [RegIndExe], [IfRegIndExeY], [RegIndExeTime], [RegIndExeUnit], [RateRedIndExe], [ExeFromMonths], [ExeFromYeasrs], [ParticipatedOtherExeMonths], [ParticipatedOtherExeYears], [ExeDuringWRKDY], [ExeInterfereWithJob], [ExeBenefitJob], [WeightInc], [WeightDec], [Createdby], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (28, N'anand.narwade11@gmail.com', N'21–30', N'No', N'', N'No', N'', N'No', N'', N'No', N'', N'', N'No', N'', N'', N'', N'Hard', N'1', N'2', N'4', N'4', N'No', N'No', N'No', N'5', N'8', NULL, CAST(N'2020-09-22T15:12:42.943' AS DateTime), N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.160' AS DateTime))
INSERT [dbo].[v137] ([id], [empEmail], [RateExp], [IsAthlete], [IfAthleteY], [IsNegFeeling], [IfNegFeelingY], [IsNegFeelingFit], [IsNegFeelingFitY], [IsStartExe], [ExeTime], [ExeUnit], [RegIndExe], [IfRegIndExeY], [RegIndExeTime], [RegIndExeUnit], [RateRedIndExe], [ExeFromMonths], [ExeFromYeasrs], [ParticipatedOtherExeMonths], [ParticipatedOtherExeYears], [ExeDuringWRKDY], [ExeInterfereWithJob], [ExeBenefitJob], [WeightInc], [WeightDec], [Createdby], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (29, N'anand.narwade11@gmail.com', N'21–30', N'Yes', N'', N'No', N'', N'No', N'', N'No', N'10', N'minutes/day', N'Yes', N'', N'', N'', N'Light', N'6', N'6', N'7', N'7', N'No', N'No', N'No', N'10', N'10', NULL, CAST(N'2020-09-22T21:33:34.127' AS DateTime), NULL, NULL)
INSERT [dbo].[v137] ([id], [empEmail], [RateExp], [IsAthlete], [IfAthleteY], [IsNegFeeling], [IfNegFeelingY], [IsNegFeelingFit], [IsNegFeelingFitY], [IsStartExe], [ExeTime], [ExeUnit], [RegIndExe], [IfRegIndExeY], [RegIndExeTime], [RegIndExeUnit], [RateRedIndExe], [ExeFromMonths], [ExeFromYeasrs], [ParticipatedOtherExeMonths], [ParticipatedOtherExeYears], [ExeDuringWRKDY], [ExeInterfereWithJob], [ExeBenefitJob], [WeightInc], [WeightDec], [Createdby], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (30, N'anand.narwade11@gmail.com', N'21–30', N'No', N'', N'No', N'', N'No', N'', N'No', N'n', N'', N'No', N'', N'', N'days/week', N' Fairly light', N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL, CAST(N'2020-09-22T21:41:08.630' AS DateTime), NULL, NULL)
INSERT [dbo].[v137] ([id], [empEmail], [RateExp], [IsAthlete], [IfAthleteY], [IsNegFeeling], [IfNegFeelingY], [IsNegFeelingFit], [IsNegFeelingFitY], [IsStartExe], [ExeTime], [ExeUnit], [RegIndExe], [IfRegIndExeY], [RegIndExeTime], [RegIndExeUnit], [RateRedIndExe], [ExeFromMonths], [ExeFromYeasrs], [ParticipatedOtherExeMonths], [ParticipatedOtherExeYears], [ExeDuringWRKDY], [ExeInterfereWithJob], [ExeBenefitJob], [WeightInc], [WeightDec], [Createdby], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (31, N'anand.narwade11@gmail.com', N'15–20', N'No', N'', N'No', N'', N'No', N'', N'No', N'', N'', N'No', N'', N'', N'', N'Hard', N'5', N'6', N'6', N'6', N'No', N'No', N'No', N'67', N'87', NULL, CAST(N'2020-09-22T21:55:42.947' AS DateTime), NULL, NULL)
INSERT [dbo].[v137] ([id], [empEmail], [RateExp], [IsAthlete], [IfAthleteY], [IsNegFeeling], [IfNegFeelingY], [IsNegFeelingFit], [IsNegFeelingFitY], [IsStartExe], [ExeTime], [ExeUnit], [RegIndExe], [IfRegIndExeY], [RegIndExeTime], [RegIndExeUnit], [RateRedIndExe], [ExeFromMonths], [ExeFromYeasrs], [ParticipatedOtherExeMonths], [ParticipatedOtherExeYears], [ExeDuringWRKDY], [ExeInterfereWithJob], [ExeBenefitJob], [WeightInc], [WeightDec], [Createdby], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (32, N'anand.narwade11@gmail.com', N'21–30', N'No', N'', N'No', N'', N'No', N'', N'No', N'', N'', N'No', N'', N'', N'', N'Hard', N'6', N'6', N'6', N'7', N'No', N'No', N'No', N'67', N'90', NULL, CAST(N'2020-09-22T22:06:29.240' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[v137] OFF
SET IDENTITY_INSERT [dbo].[v137Transactions] ON 

INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (47, 24, 32, N'Q5', N'4', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T01:57:06.647' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (48, 24, 33, N'Q5', N'2', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T01:57:06.647' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (49, 24, 34, N'Q5', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T01:57:06.650' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (50, 24, 35, N'Q5', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T01:57:06.650' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (51, 24, 37, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T01:57:06.653' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (52, 24, 42, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T01:57:06.657' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (53, 24, 48, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T01:57:06.657' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (54, 24, 49, N'Q15', N'2', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T01:57:06.657' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (55, 24, 50, N'Q15', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T01:57:06.660' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (56, 24, 51, N'Q15', N'4', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T01:57:06.660' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (57, 24, 52, N'Q15', N'5', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T01:57:06.660' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (58, 24, 53, N'Q15', N'6', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T01:57:06.660' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (59, 24, 54, N'Q15', N'7', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T01:57:06.660' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (60, 24, 55, N'Q15', N'8', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T01:57:06.660' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (61, 24, 56, N'Q15', N'9', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T01:57:06.663' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (62, 24, 57, N'Q15', N'10', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T01:57:06.663' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (63, 24, 58, N'Q15', N'9', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T01:57:06.667' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (64, 24, 59, N'Q15', N'8', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T01:57:06.667' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (65, 25, 32, N'Q5', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.220' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (66, 25, 33, N'Q5', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.220' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (67, 25, 34, N'Q5', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.223' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (68, 25, 35, N'Q5', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.223' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (69, 25, 38, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.227' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (70, 25, 40, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.227' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (71, 25, 41, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.227' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (72, 25, 42, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.230' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (73, 25, 43, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.230' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (74, 25, 45, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.230' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (75, 25, 46, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.230' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (76, 25, 47, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.230' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (77, 25, 48, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.233' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (78, 25, 49, N'Q15', N'2', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.237' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (79, 25, 50, N'Q15', N'2', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.237' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (80, 25, 51, N'Q15', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.237' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (81, 25, 52, N'Q15', N'4', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.240' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (82, 25, 53, N'Q15', N'5', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.240' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (83, 25, 54, N'Q15', N'6', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.240' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (84, 25, 55, N'Q15', N'7', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.240' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (85, 25, 56, N'Q15', N'8', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.240' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (86, 25, 57, N'Q15', N'9', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.240' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (87, 25, 58, N'Q15', N'10', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.243' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (88, 25, 59, N'Q15', N'5', N'anand.narwade11@gmail.com', CAST(N'2020-09-19T02:02:05.243' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (89, 26, 32, N'Q5', N'2', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.730' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (90, 26, 33, N'Q5', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.730' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (91, 26, 34, N'Q5', N'4', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.730' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (92, 26, 35, N'Q5', N'5', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.730' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (93, 26, 37, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.733' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (94, 26, 41, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.737' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (95, 26, 47, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.737' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (96, 26, 48, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.737' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (97, 26, 49, N'Q15', N'2', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.737' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (98, 26, 50, N'Q15', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.740' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (99, 26, 51, N'Q15', N'4', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.740' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (100, 26, 52, N'Q15', N'5', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.740' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (101, 26, 53, N'Q15', N'6', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.740' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (102, 26, 54, N'Q15', N'7', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.740' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (103, 26, 55, N'Q15', N'8', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.740' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (104, 26, 56, N'Q15', N'9', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.740' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (105, 26, 57, N'Q15', N'10', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.743' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (106, 26, 58, N'Q15', N'9', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.743' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (107, 26, 59, N'Q15', N'8', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:11.747' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (108, 27, 32, N'Q5', N'2', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.447' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (109, 27, 33, N'Q5', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.447' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (110, 27, 34, N'Q5', N'4', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.447' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (111, 27, 35, N'Q5', N'5', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.447' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (112, 27, 37, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.450' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (113, 27, 41, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.450' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (114, 27, 47, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.450' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (115, 27, 48, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.453' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (116, 27, 49, N'Q15', N'2', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.453' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (117, 27, 50, N'Q15', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.457' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (118, 27, 51, N'Q15', N'4', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.457' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (119, 27, 52, N'Q15', N'5', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.457' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (120, 27, 53, N'Q15', N'6', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.457' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (121, 27, 54, N'Q15', N'7', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.460' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (122, 27, 55, N'Q15', N'8', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.460' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (123, 27, 56, N'Q15', N'9', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.460' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (124, 27, 57, N'Q15', N'10', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.463' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (125, 27, 58, N'Q15', N'9', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.463' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (126, 27, 59, N'Q15', N'8', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T15:00:21.463' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (148, 29, 32, N'Q5', N'2', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:37.407' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (149, 29, 33, N'Q5', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:37.417' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (150, 29, 34, N'Q5', N'4', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:37.417' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (151, 29, 35, N'Q5', N'5', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:37.420' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (152, 29, 37, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.603' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (153, 29, 38, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.610' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (154, 29, 39, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.613' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (155, 29, 41, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.613' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (156, 29, 43, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.613' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (157, 29, 45, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.613' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (158, 29, 46, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.617' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (159, 29, 48, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.617' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (160, 29, 49, N'Q15', N'2', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.620' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (161, 29, 50, N'Q15', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.620' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (162, 29, 51, N'Q15', N'4', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.620' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (163, 29, 52, N'Q15', N'5', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.620' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (164, 29, 53, N'Q15', N'6', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.623' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (165, 29, 54, N'Q15', N'7', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.623' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (166, 29, 55, N'Q15', N'8', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.623' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (167, 29, 56, N'Q15', N'9', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.623' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (168, 29, 57, N'Q15', N'10', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.627' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (169, 29, 58, N'Q15', N'9', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.630' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (170, 29, 59, N'Q15', N'9', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:34:38.630' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (171, 30, 32, N'Q5', N'2', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:41:08.647' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (172, 30, 33, N'Q5', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:41:08.647' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (173, 30, 34, N'Q5', N'4', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:41:08.647' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (174, 30, 35, N'Q5', N'5', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:41:08.647' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (175, 30, 49, N'Q15', N'2', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:41:08.650' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (176, 30, 50, N'Q15', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:41:08.653' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (177, 30, 51, N'Q15', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:41:08.653' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (178, 30, 52, N'Q15', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:41:08.653' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (179, 30, 53, N'Q15', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:41:08.657' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (180, 30, 54, N'Q15', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:41:08.657' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (181, 30, 55, N'Q15', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:41:08.657' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (182, 30, 56, N'Q15', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:41:08.657' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (183, 30, 57, N'Q15', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:41:08.657' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (184, 30, 58, N'Q15', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:41:08.660' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (185, 30, 59, N'Q15', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:41:08.660' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (186, 31, 32, N'Q5', N'2', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.960' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (187, 31, 33, N'Q5', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.960' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (188, 31, 34, N'Q5', N'4', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.963' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (189, 31, 35, N'Q5', N'5', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.963' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (190, 31, 37, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.970' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (191, 31, 40, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.970' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (192, 31, 42, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.970' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (193, 31, 44, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.973' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (194, 31, 46, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.973' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (195, 31, 48, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.977' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (196, 31, 49, N'Q15', N'2', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.977' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (197, 31, 50, N'Q15', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.977' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (198, 31, 51, N'Q15', N'4', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.980' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (199, 31, 52, N'Q15', N'5', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.980' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (200, 31, 53, N'Q15', N'6', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.980' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (201, 31, 54, N'Q15', N'7', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.980' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (202, 31, 55, N'Q15', N'8', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.980' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (203, 31, 56, N'Q15', N'9', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.983' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (204, 31, 57, N'Q15', N'10', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.983' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (205, 31, 58, N'Q15', N'9', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.987' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (206, 31, 59, N'Q15', N'8', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T21:55:42.987' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (207, 28, 32, N'Q5', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.180' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (208, 28, 33, N'Q5', N'4', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.190' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (209, 28, 34, N'Q5', N'5', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.190' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (210, 28, 35, N'Q5', N'5', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.193' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (211, 28, 37, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.203' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (212, 28, 40, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.207' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (213, 28, 42, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.210' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (214, 28, 44, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.210' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (215, 28, 46, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.217' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (216, 28, 48, N'Q14', N'1', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.217' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (217, 28, 49, N'Q15', N'3', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.220' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (218, 28, 50, N'Q15', N'4', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.220' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (219, 28, 51, N'Q15', N'5', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.220' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (220, 28, 52, N'Q15', N'6', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.220' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (221, 28, 53, N'Q15', N'7', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.223' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (222, 28, 54, N'Q15', N'8', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.223' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (223, 28, 55, N'Q15', N'9', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.223' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (224, 28, 56, N'Q15', N'9', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.227' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (225, 28, 57, N'Q15', N'10', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.230' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (226, 28, 58, N'Q15', N'10', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.233' AS DateTime), NULL, NULL)
INSERT [dbo].[v137Transactions] ([id], [v137id], [qid], [subQ], [Ans], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (227, 28, 59, N'Q15', N'10', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:44:29.233' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[v137Transactions] OFF
SET IDENTITY_INSERT [dbo].[V143] ON 

INSERT [dbo].[V143] ([id], [email], [createdby], [createdon]) VALUES (1, N'samir@gmail.com', N'samir@gmail.com', CAST(N'2020-08-29T19:45:15.700' AS DateTime))
INSERT [dbo].[V143] ([id], [email], [createdby], [createdon]) VALUES (2, N'anand.narwade11@gmail.com', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:46:35.440' AS DateTime))
INSERT [dbo].[V143] ([id], [email], [createdby], [createdon]) VALUES (3, N'anand.narwade11@gmail.com', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:52:20.250' AS DateTime))
INSERT [dbo].[V143] ([id], [email], [createdby], [createdon]) VALUES (4, N'anand.narwade11@gmail.com', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:55:45.240' AS DateTime))
INSERT [dbo].[V143] ([id], [email], [createdby], [createdon]) VALUES (5, N'anand.narwade11@gmail.com', N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:57:18.643' AS DateTime))
SET IDENTITY_INSERT [dbo].[V143] OFF
SET IDENTITY_INSERT [dbo].[V143Transactions] ON 

INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (1, 1, 24, NULL, N'samir@gmail.com', CAST(N'2020-08-29T19:45:49.273' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (2, 1, 25, NULL, N'samir@gmail.com', CAST(N'2020-08-29T19:45:56.540' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (3, 1, 26, NULL, N'samir@gmail.com', CAST(N'2020-08-29T19:46:00.370' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (4, 1, 27, NULL, N'samir@gmail.com', CAST(N'2020-08-29T19:46:04.337' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (5, 1, 28, NULL, N'samir@gmail.com', CAST(N'2020-08-29T19:46:08.497' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (6, 1, 29, NULL, N'samir@gmail.com', CAST(N'2020-08-29T19:46:13.980' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (7, 1, 30, NULL, N'samir@gmail.com', CAST(N'2020-08-29T19:46:28.800' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (8, 1, 31, NULL, N'samir@gmail.com', CAST(N'2020-08-29T19:46:30.637' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (9, 2, 24, NULL, N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:46:35.450' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (10, 2, 25, NULL, N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:46:35.450' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (11, 2, 26, NULL, N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:46:35.450' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (12, 2, 27, NULL, N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:46:35.450' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (13, 2, 28, NULL, N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:46:35.453' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (14, 2, 29, NULL, N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:46:35.453' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (15, 2, 30, NULL, N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:46:35.453' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (16, 2, 31, NULL, N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:46:35.453' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (17, 5, 24, NULL, N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:57:54.700' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (18, 5, 25, NULL, N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:57:54.710' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (19, 5, 26, NULL, N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:57:54.710' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (20, 5, 27, NULL, N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:57:54.710' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (21, 5, 28, NULL, N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:57:54.710' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (22, 5, 29, NULL, N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:57:54.713' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (23, 5, 30, NULL, N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:57:54.713' AS DateTime))
INSERT [dbo].[V143Transactions] ([id], [v143id], [qid], [answer], [createdby], [createdon]) VALUES (24, 5, 31, NULL, N'anand.narwade11@gmail.com', CAST(N'2020-09-22T22:57:54.717' AS DateTime))
SET IDENTITY_INSERT [dbo].[V143Transactions] OFF
SET IDENTITY_INSERT [dbo].[V158] ON 

INSERT [dbo].[V158] ([id], [email], [medications], [effects], [recommandations], [createdby], [createdon]) VALUES (1, N'samir@gmail.com', N'--', N'--', N'----', N'samir@gmail.com', CAST(N'2020-08-29T20:29:12.490' AS DateTime))
SET IDENTITY_INSERT [dbo].[V158] OFF
SET IDENTITY_INSERT [dbo].[V169] ON 

INSERT [dbo].[V169] ([id], [empEmail], [EssRestingHR], [EssExerciseHR], [EssHRDate], [EssRestingBP], [EssRestingBPDate], [BCADate], [WeightIb], [HeightIn], [WeightKg], [HeightM], [BCABMI], [SKMmenChest], [SKMmenAbdomen], [SKMmenThigh], [SKMmenTotal], [SKMwomenTriceps], [SKMwomenSuprailium], [SKMwomenThigh], [SKMwomenTotal], [SKMBodyFatEst], [SKMDate], [GMDate], [GMAbdomen], [GMHip], [GMWaist], [GMWaistToHipRatio], [Createdby], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'mails.sangamesh@gmail.com', 1.1, 2.2, CAST(N'2020-09-07' AS Date), N'3.3', CAST(N'2020-09-07' AS Date), CAST(N'2020-09-07' AS Date), 4.404708, 5.4999889999999994, 1.9976000000000003, 0.1397, 102.36, 6.6, 8.8, 10.1, 12.12, 7.7, 9.9, 11.11, 13.13, 56, CAST(N'2020-09-07' AS Date), CAST(N'2020-09-07' AS Date), 14.14, 15.15, 16.16, N'17.17', N'mails.sangamesh@gmail.com', CAST(N'2020-09-07T22:34:07.480' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[V169] OFF
SET IDENTITY_INSERT [dbo].[VideoGallaryMaster] ON 

INSERT [dbo].[VideoGallaryMaster] ([id], [videoCategory], [videoURL], [isActive], [createdby], [createdOn], [modifiedBy], [modifiedOn]) VALUES (1, N'BODY COMBAT', N'https://www.youtube.com/embed/FTU0Yi-_dGM', 0, N'anand.narwade11@gmail.com', CAST(N'2020-10-17T10:19:55.327' AS DateTime), NULL, NULL)
INSERT [dbo].[VideoGallaryMaster] ([id], [videoCategory], [videoURL], [isActive], [createdby], [createdOn], [modifiedBy], [modifiedOn]) VALUES (2, N'ZUMBA', N'https://www.youtube.com/embed/t1QRdhVCzeA', 1, N'anand.narwade11@gmail.com', CAST(N'2020-10-17T10:23:57.630' AS DateTime), NULL, NULL)
INSERT [dbo].[VideoGallaryMaster] ([id], [videoCategory], [videoURL], [isActive], [createdby], [createdOn], [modifiedBy], [modifiedOn]) VALUES (3, N'YOGA', N'https://www.youtube.com/embed/uc7aJpYRIZg', 1, N'anand.narwade11@gmail.com', CAST(N'2020-10-17T10:24:22.167' AS DateTime), NULL, NULL)
INSERT [dbo].[VideoGallaryMaster] ([id], [videoCategory], [videoURL], [isActive], [createdby], [createdOn], [modifiedBy], [modifiedOn]) VALUES (4, N'BODY COMBAT', N'https://www.youtube.com/embed/txIUXG29vzc', 1, N'anand.narwade11@gmail.com', CAST(N'2020-10-17T10:24:49.883' AS DateTime), N'anand.narwade11@gmail.com', CAST(N'2020-10-17T11:22:30.097' AS DateTime))
SET IDENTITY_INSERT [dbo].[VideoGallaryMaster] OFF
/****** Object:  Index [IX_UserMaster]    Script Date: 17-10-2020 11:24:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserMaster] ON [dbo].[CustomerMaster]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyMemberCount]  WITH CHECK ADD  CONSTRAINT [FK_CompanyMemberCount_CompanyMaster] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyMaster] ([id])
GO
ALTER TABLE [dbo].[CompanyMemberCount] CHECK CONSTRAINT [FK_CompanyMemberCount_CompanyMaster]
GO
ALTER TABLE [dbo].[SPOCmaster]  WITH CHECK ADD  CONSTRAINT [FK_SPOCmaster_CompanyMaster] FOREIGN KEY([companyId])
REFERENCES [dbo].[CompanyMaster] ([id])
GO
ALTER TABLE [dbo].[SPOCmaster] CHECK CONSTRAINT [FK_SPOCmaster_CompanyMaster]
GO
ALTER TABLE [dbo].[V115Transactions]  WITH CHECK ADD  CONSTRAINT [FK_V115Transactions_V115] FOREIGN KEY([v115Id])
REFERENCES [dbo].[V115] ([id])
GO
ALTER TABLE [dbo].[V115Transactions] CHECK CONSTRAINT [FK_V115Transactions_V115]
GO
ALTER TABLE [dbo].[V126Transactions]  WITH CHECK ADD  CONSTRAINT [FK_V126Transactions_V126] FOREIGN KEY([v126id])
REFERENCES [dbo].[V126] ([id])
GO
ALTER TABLE [dbo].[V126Transactions] CHECK CONSTRAINT [FK_V126Transactions_V126]
GO
ALTER TABLE [dbo].[v137Transactions]  WITH CHECK ADD  CONSTRAINT [FK_v137Transactions_v137] FOREIGN KEY([v137id])
REFERENCES [dbo].[v137] ([id])
GO
ALTER TABLE [dbo].[v137Transactions] CHECK CONSTRAINT [FK_v137Transactions_v137]
GO
ALTER TABLE [dbo].[V143Transactions]  WITH CHECK ADD  CONSTRAINT [FK_V143Transactions_V143] FOREIGN KEY([v143id])
REFERENCES [dbo].[V143] ([id])
GO
ALTER TABLE [dbo].[V143Transactions] CHECK CONSTRAINT [FK_V143Transactions_V143]
GO
/****** Object:  StoredProcedure [dbo].[sp_137_Transactions]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_137_Transactions]
	-- Add the parameters for the stored procedure here
@id bigint = null,
@v137id BIGINT = NULL,
@qid int = null,
@subQ int = null,
@Ans nvarchar(255) = null,
@loginUser nvarchar(255) = null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO v137Transactions VALUES(@v137id, @qid, @subQ, @Ans, @loginUser, GETDATE(), NULL, NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_143]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_143]
	-- Add the parameters for the stored procedure here
	@email nvarchar(255),
	@v143id bigint out

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		INSERT INTO V143 VALUES(@email, @email, GETDATE())
		SELECT TOP 1 @v143id = id FROM V143 WHERE email = @email ORDER BY ID DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_143Trans]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_143Trans]
	-- Add the parameters for the stored procedure here
@v143id bigint,
@qid int,
@answer nvarchar(50) = null,
@createdby nvarchar(255)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO V143Transactions VALUES(@v143id, @qid, @answer, @createdby, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[sp_158]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_158]
	-- Add the parameters for the stored procedure here
@email nvarchar(255) = null,
@medications nvarchar(255) = null,
@effects nvarchar(255) = null,
@recommandations text = null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO V158 VALUES(@email, @medications, @effects, @recommandations, @email, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[sp_company]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_company]
	-- Add the parameters for the stored procedure here
@id bigint = null,
@CompanyCode nvarchar(50) = null,
@CompanyName nvarchar(255) = null,
@BranchCode nvarchar(50) = null,
@BranchName nvarchar(255) = null,
@ShortCode int = null,
@Address text = null,
@City nvarchar(50) = null,
@State nvarchar(50) = null,
@loginUser nvarchar(255) = null,
@action nvarchar(50) = null,
@CompanyId bigint out
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	set @CompanyId = 0
    -- Insert statements for procedure here
	if(@action = 'INSERT')
	BEGIN
		INSERT INTO CompanyMaster VALUES(@CompanyCode, @CompanyName, @BranchCode, @BranchName, @ShortCode, @Address, @City, @State, @loginUser, GETDATE(), NULL, NULL);
		Select @CompanyId = SCOPE_IDENTITY() from CompanyMaster
	END

	IF(@action = 'UPDATE')
	BEGIN
		UPDATE CompanyMaster SET
		CompanyCode = @CompanyCode,
		CompanyName = @CompanyName,
		BranchCode = @BranchCode,
		BranchName = @BranchName,
		ShortCode = @ShortCode,
		Address = @Address,
		City = @City,
		State = @State
		WHERE id = @id
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_spoc]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_spoc]
	-- Add the parameters for the stored procedure here
@id bigint = null,	
@companyId int = null,
@companyCode nvarchar(50) = null,
@branchCode nvarchar(50) = null,
@spocname nvarchar(255) = null,
@designation nvarchar(50) = null,
@spocemail nvarchar(255) = null,
@spoccontactno nvarchar(50) = null,
@category nvarchar(50) = null,
@loginUser nvarchar(255) = null,
@typeId int = null,
@action nvarchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF(@action = 'INSERT')
	BEGIN
	INSERT INTO SPOCmaster VALUES(@companyId, @companyCode, @branchCode, @spocname, @designation, @spocemail, @spoccontactno, @category, @typeId, @loginUser, GETDATE(), NULL, NULL)
	END
	
	IF(@action = 'UPDATE')
	BEGIN
		UPDATE SPOCmaster SET
		companyId = @companyId,
		companyCode = @companyCode,
		branchCode = @branchCode,
		spocname = @spocname,
		designation = @designation,
		spocemail = @spocemail,
		spoccontactno = @spoccontactno,
		category = @category,
		modifiedby = @loginUser,
		modifiedon = GETDATE()
		where id = @id
		
	END

	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_v115]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_v115]
	-- Add the parameters for the stored procedure here
	@email nvarchar(255) = null,
	@parentname nvarchar(255) = null,
	@witnessname nvarchar(255) = null,
	@v115Id bigint OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO V115 VALUES(@email, @parentname, @witnessname, @email, GETDATE(), NULL, NULL);

	  SELECT TOP 1 @v115Id = ID FROM V115 WHERE EMAIL = @email ORDER BY ID DESC
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_v115Trans]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_v115Trans]
	-- Add the parameters for the stored procedure here
		@v115Id bigint,
	@qid int,
	@answer nvarchar(50) = null,
	@loginUser nvarchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into V115Transactions values(@v115Id, @qid, @answer, @loginUser, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[sp_v126]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_v126]
	-- Add the parameters for the stored procedure here
@id bigint = null,
@email nvarchar(255),
@physicianName nvarchar(255) = null,
@physicianPhone nvarchar(255) = null,
@emergencyContactPersonName nvarchar(255) = null,
@emergencyContactPersonPhone nvarchar(50) = null,
@MedicineDrugsAndReason text = null,
@PhysicianKnowParticipation nvarchar(50) = null,
@PhysicalActivity text = null,
@cretaedby nvarchar(50),
@action nvarchar(10),
@v126 bigint out
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if(@action = 'INSERT')
	begin
	INSERT INTO V126 VALUES(@email, @physicianName, @physicianPhone, @emergencyContactPersonName, @emergencyContactPersonPhone, @MedicineDrugsAndReason, @PhysicianKnowParticipation, @PhysicalActivity, @cretaedby, GETDATE(), NULL, NULL)

	SELECT top 1 @v126 = id FROM V126 WHERE email = @email order by id desc
	end
    -- Insert statements for procedure here
	if(@action = 'UPDATE')
	BEGIN
	UPDATE V126 SET
	physicianName = @physicianName,
	PhysicalActivity = @PhysicalActivity,
	physicianPhone = @physicianPhone,
	emergencyContactPersonName = @emergencyContactPersonName,
	emergencyContactPersonPhone = @emergencyContactPersonPhone,
	MedicineDrugsAndReason = @MedicineDrugsAndReason,
	modifiedby = @email,
	modifiedon = GETDATE()
	WHERE id = @id

	sELECT @v126 = @id
	END

END
GO
/****** Object:  StoredProcedure [dbo].[sp_v126Transactions]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_v126Transactions]
	-- Add the parameters for the stored procedure here
	@v126id bigint = null,
	@qid int = null,
	@answer nvarchar(50) = null,
	@loginUser nvarchar(255) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO V126Transactions VALUES(@v126id, @qid, @answer, @loginUser, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[sp_v137]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_v137]
	-- Add the parameters for the stored procedure here
@id bigint = null,
@empEmail nvarchar(255) = null,
@RateExp nvarchar(50) = null,
@IsAthlete nvarchar(50) = null,
@IfAthleteY nvarchar(255) = null,
@IsNegFeeling nvarchar(50) = null,
@IfNegFeelingY nvarchar(255) = null,
@IsNegFeelingFit nvarchar(50) = null,
@IsNegFeelingFitY nvarchar(255) = null,
@IsStartExe nvarchar(50) = null,
@ExeTime nvarchar(50) = null,
@ExeUnit nvarchar(255) = null,
@RegIndExe nvarchar(50) = null,
@IfRegIndExeY nvarchar(255) = null,
@RegIndExeTime nvarchar(50) = null,
@RegIndExeUnit nvarchar(50) = null,
@RateRedIndExe nvarchar(50) = null,
@ExeFromMonths nvarchar(50) = null,
@ExeFromYeasrs nvarchar(50) = null,
@ParticipatedOtherExeMonths nvarchar(50) = null,
@ParticipatedOtherExeYears nvarchar(50) = null,
@ExeDuringWRKDY nvarchar(50) = null,
@ExeInterfereWithJob nvarchar(50) = null,
@ExeBenefitJob nvarchar(50) = null,
@WeightInc nvarchar(50) = null,
@WeightDec nvarchar(50) = null,
@v137Id bigint out,
@loginUser nvarchar(255) = null,
@action nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF(@action = 'INSERT')
	BEGIN
		INSERT INTO v137 VALUES(@empEmail,
			@RateExp, 
			@IsAthlete, 
			@IfAthleteY, 
			@IsNegFeeling, 
			@IfNegFeelingY, 
			@IsNegFeelingFit, 
			@IsNegFeelingFitY, 
			@IsStartExe, 
			@ExeTime, 
			@ExeUnit, 
			@RegIndExe, 
			@IfRegIndExeY,
			@RegIndExeTime, 
			@RegIndExeUnit,
			@RateRedIndExe,
			@ExeFromMonths, 
			@ExeFromYeasrs, 
			@ParticipatedOtherExeMonths, 
			@ParticipatedOtherExeYears, 
			@ExeDuringWRKDY, 
			@ExeInterfereWithJob, 
			@ExeBenefitJob, 
			@WeightInc, 
			@WeightDec, 
			NULL, 
			GETDATE(), 
			null, 
			null) ;
			Select @v137Id = SCOPE_IDENTITY() from v137
	END

	if(@action = 'UPDATE')
	BEGIN
	UPDATE v137 SET
	RateExp = @RateExp,
	IsAthlete = @IsAthlete,
	IfAthleteY = @IfAthleteY,
	IsNegFeeling = @IsNegFeeling,
	IfNegFeelingY = @IfNegFeelingY,
	IsNegFeelingFit = @IsNegFeelingFit,
	IsNegFeelingFitY = @IsNegFeelingFitY,
	IsStartExe = @IsStartExe,
	ExeTime = @ExeTime,
	ExeUnit = @ExeUnit,
	RegIndExe = @RegIndExe,
	IfRegIndExeY = @IfRegIndExeY,
	RegIndExeTime= @RegIndExeTime,
	RegIndExeUnit = @RegIndExeUnit,
	RateRedIndExe = @RateRedIndExe,
	ExeFromMonths = @ExeFromMonths, 
			ExeFromYeasrs = @ExeFromYeasrs, 
		ParticipatedOtherExeMonths =	@ParticipatedOtherExeMonths, 
		ParticipatedOtherExeYears =	@ParticipatedOtherExeYears, 
		ExeDuringWRKDY = @ExeDuringWRKDY, 
		ExeInterfereWithJob =	@ExeInterfereWithJob, 
		ExeBenefitJob =	@ExeBenefitJob, 
		WeightInc = @WeightInc, 
		WeightDec =	@WeightDec,

		ModifiedBy = @empEmail,
		ModifiedOn = GETDATE()
		WHERE id = @id

		seLECT @v137Id = @id
	END


	--SElect top 1 @v137Id = id from v137 where empEmail = @empEmail order by id desc
	


END
GO
/****** Object:  StoredProcedure [dbo].[sp_v169]    Script Date: 17-10-2020 11:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_v169]
	-- Add the parameters for the stored procedure here
@id bigint = null,
@empEmail nvarchar(255) = null,
@EssRestingHR float = null,
@EssExerciseHR float = null,
@EssHRDate date = null,
@EssRestingBP nvarchar(50) = null,
@EssRestingBPDate date = null,
@BCADate date = null,
@WeightIb float = null,
@HeightIn float = null,
@WeightKg float = null,
@HeightM float = null,
@BCABMI float = null,
@SKMmenChest float = null,
@SKMmenAbdomen float = null,
@SKMmenThigh float = null,
@SKMmenTotal float = null,
@SKMwomenTriceps float = null,
@SKMwomenSuprailium float = null,
@SKMwomenThigh float = null,
@SKMwomenTotal float = null,
@SKMBodyFatEst float = null,
@SKMDate date = null,
@GMDate date = null,
@GMAbdomen float = null,
@GMHip float = null,
@GMWaist float = null,
@GMWaistToHipRatio nvarchar(50) = null,
@loginUser nvarchar(50) = null,
@action nvarchar(50) = null


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if(@action = 'INSERT')
	BEGIN
		INSERT INTO V169 VALUES(@empEmail, @EssRestingHR, @EssExerciseHR, @EssHRDate, @EssRestingBP, @EssRestingBPDate, @BCADate, @WeightIb, @HeightIn, @WeightKg, @HeightM, @BCABMI, @SKMmenChest, @SKMmenAbdomen, @SKMmenThigh, @SKMmenTotal, @SKMwomenTriceps, @SKMwomenSuprailium, @SKMwomenThigh, @SKMwomenTotal, @SKMBodyFatEst, @SKMDate, @GMDate, @GMAbdomen, @GMHip, @GMWaist, @GMWaistToHipRatio, @loginUser, GETDATE(), NULL, NULL)
	END

	IF(@action = 'UPDATE')
	BEGIN
		UPDATE V169 SET 
[EssRestingHR] = @EssRestingHR,
[EssExerciseHR] =@EssExerciseHR,
[EssHRDate] = @EssHRDate,
[EssRestingBP] = @EssRestingBP, 
[EssRestingBPDate] = @EssRestingBPDate,
[BCADate] = @BCADate,
[WeightIb] = @WeightIb,
[HeightIn] = @HeightIn,
[WeightKg] = @WeightKg,
[HeightM] = @HeightM,
[BCABMI] = @BCABMI,
[SKMmenChest] = @SKMmenChest,
[SKMmenAbdomen] = @SKMmenAbdomen,
[SKMmenThigh] = @SKMmenThigh,
[SKMmenTotal] = @SKMmenTotal,
[SKMwomenTriceps] = @SKMwomenTriceps,
[SKMwomenSuprailium] = @SKMwomenSuprailium,
[SKMwomenThigh] = @SKMwomenThigh,
[SKMwomenTotal] = @SKMwomenTotal,
[SKMBodyFatEst] = @SKMBodyFatEst,
[SKMDate] = @SKMDate,
[GMDate] = @GMDate,
[GMAbdomen] = @GMAbdomen,
[GMHip] = @GMHip,
[GMWaist] = @GMWaist,
[GMWaistToHipRatio] = @GMWaistToHipRatio,
ModifiedBy = @empEmail,
ModifiedOn = GETDATE()
where id = @id




	END
END
GO
USE [master]
GO
ALTER DATABASE [fitnessdb] SET  READ_WRITE 
GO
