USE [master]
GO
/****** Object:  Database [fitnessdb]    Script Date: 05-09-2020 00:59:20 ******/
CREATE DATABASE [fitnessdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'fitnessdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\fitnessdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'fitnessdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\fitnessdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [fitnessdb] SET COMPATIBILITY_LEVEL = 130
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
ALTER DATABASE [fitnessdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [fitnessdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [fitnessdb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'fitnessdb', N'ON'
GO
ALTER DATABASE [fitnessdb] SET QUERY_STORE = OFF
GO
USE [fitnessdb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [fitnessdb]
GO
/****** Object:  Table [dbo].[CompanyMaster]    Script Date: 05-09-2020 00:59:20 ******/
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
/****** Object:  Table [dbo].[CustomerMaster]    Script Date: 05-09-2020 00:59:20 ******/
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
/****** Object:  Table [dbo].[ExerciseMaster]    Script Date: 05-09-2020 00:59:20 ******/
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
/****** Object:  Table [dbo].[PasswordMaster]    Script Date: 05-09-2020 00:59:20 ******/
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
/****** Object:  Table [dbo].[QuestionsMaster]    Script Date: 05-09-2020 00:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionsMaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question] [text] NULL,
	[sequence] [int] NULL,
	[type] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[SPOCmaster]    Script Date: 05-09-2020 00:59:20 ******/
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
/****** Object:  Table [dbo].[TempExcel]    Script Date: 05-09-2020 00:59:20 ******/
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
/****** Object:  Table [dbo].[V115]    Script Date: 05-09-2020 00:59:20 ******/
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
/****** Object:  Table [dbo].[V115Transactions]    Script Date: 05-09-2020 00:59:20 ******/
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
/****** Object:  Table [dbo].[V126]    Script Date: 05-09-2020 00:59:20 ******/
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
/****** Object:  Table [dbo].[V126Transactions]    Script Date: 05-09-2020 00:59:20 ******/
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
/****** Object:  Table [dbo].[V143]    Script Date: 05-09-2020 00:59:20 ******/
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
/****** Object:  Table [dbo].[V143Transactions]    Script Date: 05-09-2020 00:59:20 ******/
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
/****** Object:  Table [dbo].[V158]    Script Date: 05-09-2020 00:59:20 ******/
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
SET IDENTITY_INSERT [dbo].[CompanyMaster] ON 

INSERT [dbo].[CompanyMaster] ([id], [CompanyCode], [CompanyName], [BranchCode], [BranchName], [ShortCode], [Address], [City], [State], [Createdby], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'COM0001', N'Soda', N'001', N'aurangabad', 101, N'Shendra', N'Aurangabad', N'mh', N'samir@gmail.com', CAST(N'2020-09-04T21:25:47.997' AS DateTime), NULL, NULL)
INSERT [dbo].[CompanyMaster] ([id], [CompanyCode], [CompanyName], [BranchCode], [BranchName], [ShortCode], [Address], [City], [State], [Createdby], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'T0001', N'tiger hr solution pvt ltd', N'01', N'waluj', 1, N'tilaknagar ', N'abd', N'mh', N'samir@gmail.com', CAST(N'2020-09-04T21:47:34.023' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[CompanyMaster] OFF
SET IDENTITY_INSERT [dbo].[CustomerMaster] ON 

INSERT [dbo].[CustomerMaster] ([id], [custcode], [name], [email], [mobile], [dob], [age], [gender], [location], [city], [state], [reference], [type], [orgname], [designation], [dept], [business], [bussname], [dailyroutine], [spocname], [spocmob], [IsRegister], [IsAdmin], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (1, N'280820232524PM', N'anand narwade', N'anand.narwade11@gmail.com', N'8007978394', CAST(N'1993-10-11' AS Date), 27, 1, N'aurangabad', N'aurangabad', N'mh', N'', N'Corporate', N'', N'', N'', N'', N'', N'', N'test spoc', N'8788374776', NULL, NULL, N'SELF', CAST(N'2020-08-28T23:25:24.457' AS DateTime), NULL, NULL)
INSERT [dbo].[CustomerMaster] ([id], [custcode], [name], [email], [mobile], [dob], [age], [gender], [location], [city], [state], [reference], [type], [orgname], [designation], [dept], [business], [bussname], [dailyroutine], [spocname], [spocmob], [IsRegister], [IsAdmin], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (2, N'280820233738', N'keshav', N'keshav@gmail.com', N'9960328433', CAST(N'1993-12-12' AS Date), 27, 1, N'kannad', N'aur', N'mh', N'-', N'Service', N'IT', N'se', N'IT', N'', N'', N'', N'', N'', NULL, NULL, N'SELF', CAST(N'2020-08-28T23:37:38.603' AS DateTime), NULL, NULL)
INSERT [dbo].[CustomerMaster] ([id], [custcode], [name], [email], [mobile], [dob], [age], [gender], [location], [city], [state], [reference], [type], [orgname], [designation], [dept], [business], [bussname], [dailyroutine], [spocname], [spocmob], [IsRegister], [IsAdmin], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (3, N'290820093526', N'samir', N'samir@gmail.com', N'8007978394', CAST(N'1993-08-15' AS Date), 27, 1, N'abd', N'abd', N'mh', N'-', N'Service', N'test', N'trainee', N'it', N'', N'', N'', N'', N'', NULL, NULL, N'SELF', CAST(N'2020-08-29T09:35:27.287' AS DateTime), NULL, NULL)
INSERT [dbo].[CustomerMaster] ([id], [custcode], [name], [email], [mobile], [dob], [age], [gender], [location], [city], [state], [reference], [type], [orgname], [designation], [dept], [business], [bussname], [dailyroutine], [spocname], [spocmob], [IsRegister], [IsAdmin], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (4, NULL, N'anand', N'anand@gmail.com', N'8007979394', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, N'samir@gmail.com', CAST(N'2020-09-05T00:56:17.973' AS DateTime), NULL, NULL)
INSERT [dbo].[CustomerMaster] ([id], [custcode], [name], [email], [mobile], [dob], [age], [gender], [location], [city], [state], [reference], [type], [orgname], [designation], [dept], [business], [bussname], [dailyroutine], [spocname], [spocmob], [IsRegister], [IsAdmin], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (5, NULL, N'pawan', N'pawan@gmail.com', N'889977665', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, N'samir@gmail.com', CAST(N'2020-09-05T00:56:25.043' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[CustomerMaster] OFF
SET IDENTITY_INSERT [dbo].[ExerciseMaster] ON 

INSERT [dbo].[ExerciseMaster] ([id], [exerciseName]) VALUES (1, N'Weight loss')
INSERT [dbo].[ExerciseMaster] ([id], [exerciseName]) VALUES (2, N'weigght gain')
INSERT [dbo].[ExerciseMaster] ([id], [exerciseName]) VALUES (3, N'cardio')
INSERT [dbo].[ExerciseMaster] ([id], [exerciseName]) VALUES (4, N'Reshape')
SET IDENTITY_INSERT [dbo].[ExerciseMaster] OFF
SET IDENTITY_INSERT [dbo].[PasswordMaster] ON 

INSERT [dbo].[PasswordMaster] ([id], [email], [pwd], [version]) VALUES (1, N'samir@gmail.com', N'Password', CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[PasswordMaster] ([id], [email], [pwd], [version]) VALUES (2, N'anand.narwade11@gmail.com', N'Password', CAST(1 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[PasswordMaster] OFF
SET IDENTITY_INSERT [dbo].[QuestionsMaster] ON 

INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (1, N'Has your doctor ever said that you have a heart condition and that you should only do physical activity recommended by a doctor? ', 1, N'Par-q and you', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (2, N'Do you feel pain in your chest when you do physical activity?', 2, N'Par-q and you', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (3, N'In the past month, have you had chest pain when you were not doing physical activity?', 3, N'Par-q and you', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (4, N'Do you lose your balance because of dizziness or do you ever lose consciousness?', 4, N'Par-q and you', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (5, N'Do you have a bone or joint problem (for example, back, knee or hip) that could be made worse by a change in your physical activity?', 5, N'Par-q and you', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (6, N'Is your doctor currently prescribing drugs (for example, water pills) for your blood pressure or heart con- dition?', 6, N'Par-q and you', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (7, N'Do you know of any other reason why you should not do physical activity?', 7, N'Par-q and you', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (8, N'History of heart problems, chest pain, or stroke', 1, N'V126', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (9, N'Elevated blood pressure', 2, N'V126', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (10, N'Any chronic illness or condition', 3, N'V126', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (11, N'Difficulty with physical exercise', 4, N'V126', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (12, N'Advice from physician not to exercise', 5, N'V126', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (13, N'Recent surgery (last 12 months)', 6, N'V126', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (14, N'Pregnancy (now or within last 3 months)', 7, N'V126', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (15, N'History of breathing or lung problems', 8, N'V126', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (16, N'Muscle, joint, or back disorder, or any previous injury still affecting you', 9, N'V126', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (17, N'Diabetes or metabolic syndrome', 10, N'V126', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (18, N'Thyroid condition', 11, N'V126', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (19, N'Cigarette smoking habit', 12, N'V126', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (20, N'Obesity [body mass index (BMI) =30 kg/m2]', 13, N'V126', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (21, N'Elevated blood cholesterol', 14, N'V126', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (22, N'History of heart problems in immediate family', 15, N'V126', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (23, N'Hernia, or any condition that may be aggravated by lifting weights or other physical activity', 16, N'V126', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (24, N'Are you looking to change a specific behavior?', 1, N'V143', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (25, N'Are you willing to make this behavioral change a top priority?2', 2, N'V143', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (26, N'Have you tried to change this behavior before?', 3, N'V143', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (27, N'Do you believe there are inherent risks/dangers associated with not making this behavioral change?', 4, N'V143', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (28, N'Are you committed to making this change, even though it may prove challenging?', 5, N'V143', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (29, N'Do you have support for making this change from friends, family, and loved ones?', 6, N'V143', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (30, N'Besides health reasons, do you have other reasons for wanting to change this behavior?', 7, N'V143', NULL, NULL, NULL, NULL)
INSERT [dbo].[QuestionsMaster] ([id], [question], [sequence], [type], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (31, N'Are you prepared to be patient with yourself if you encounter obstacles, barriers, and/or setbacks?', 8, N'V143', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[QuestionsMaster] OFF
SET IDENTITY_INSERT [dbo].[SPOCmaster] ON 

INSERT [dbo].[SPOCmaster] ([id], [companyId], [companyCode], [branchCode], [spocname], [designation], [spocemail], [spoccontactno], [category], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (1, 1, NULL, NULL, N'Anand narwade', N'Software Developer', N'anand.narwade11@gmail.com', N'8788374776', N'Regular', N'samir@gmail.com', CAST(N'2020-09-04T23:24:49.267' AS DateTime), N'samir@gmail.com', CAST(N'2020-09-04T23:39:22.210' AS DateTime))
INSERT [dbo].[SPOCmaster] ([id], [companyId], [companyCode], [branchCode], [spocname], [designation], [spocemail], [spoccontactno], [category], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (2, 2, NULL, NULL, N'sarvesh', N'accountant', N'sarvesh@gmail.com', N'9098909899', N'Regular', N'samir@gmail.com', CAST(N'2020-09-04T23:41:54.057' AS DateTime), N'samir@gmail.com', CAST(N'2020-09-04T23:43:28.690' AS DateTime))
SET IDENTITY_INSERT [dbo].[SPOCmaster] OFF
INSERT [dbo].[TempExcel] ([SrNo], [Name], [Email], [Mobile], [CompanyCode], [BranchCode]) VALUES (1, N'anand', N'anand@gmail.com', N'8007979394', N'COM0001', N'1')
INSERT [dbo].[TempExcel] ([SrNo], [Name], [Email], [Mobile], [CompanyCode], [BranchCode]) VALUES (2, N'pawan', N'pawan@gmail.com', N'889977665', N'COM0001', N'1')
SET IDENTITY_INSERT [dbo].[V115] ON 

INSERT [dbo].[V115] ([id], [email], [parentname], [witnessname], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (2, N'samir@gmail.com', N'new parent', N'new witness', N'samir@gmail.com', CAST(N'2020-08-29T11:46:31.080' AS DateTime), NULL, NULL)
INSERT [dbo].[V115] ([id], [email], [parentname], [witnessname], [createdby], [createdon], [modifiedby], [modifiedon]) VALUES (3, N'samir@gmail.com', N'xyz', N'pqr', N'samir@gmail.com', CAST(N'2020-08-29T19:20:36.427' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[V115] OFF
SET IDENTITY_INSERT [dbo].[V115Transactions] ON 

INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (1, 2, 1, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T11:47:00.150' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (2, 2, 2, N'No', N'samir@gmail.com', CAST(N'2020-08-29T11:47:09.440' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (3, 2, 3, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T11:47:16.910' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (4, 2, 4, N'No', N'samir@gmail.com', CAST(N'2020-08-29T11:47:25.180' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (5, 2, 5, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T11:47:32.753' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (6, 2, 6, N'No', N'samir@gmail.com', CAST(N'2020-08-29T11:47:40.287' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (7, 2, 7, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T11:47:46.100' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (8, 3, 1, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T19:20:36.537' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (9, 3, 2, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T19:20:36.553' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (10, 3, 3, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T19:20:36.553' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (11, 3, 4, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T19:20:36.557' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (12, 3, 5, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T19:20:36.557' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (13, 3, 6, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T19:20:36.557' AS DateTime))
INSERT [dbo].[V115Transactions] ([id], [v115Id], [qid], [answer], [createdby], [createdon]) VALUES (14, 3, 7, N'Yes', N'samir@gmail.com', CAST(N'2020-08-29T19:20:36.557' AS DateTime))
SET IDENTITY_INSERT [dbo].[V115Transactions] OFF
SET IDENTITY_INSERT [dbo].[V126] ON 

INSERT [dbo].[V126] ([id], [email], [physicianName], [physicianPhone], [emergencyContactPersonName], [emergencyContactPersonPhone], [MedicineDrugsAndReason], [PhysicianKnowParticipation], [PhysicalActivity], [cretaedby], [createdon], [modifiedby], [modifiedon]) VALUES (1, N'samir@gmail.com', N'dr. xyz', N'02438234894', N'xyz', N'9966332211', N'test', N'no', N'nothing', N'samir@gmail.com', CAST(N'2020-08-29T16:33:38.680' AS DateTime), NULL, NULL)
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
SET IDENTITY_INSERT [dbo].[V126Transactions] OFF
SET IDENTITY_INSERT [dbo].[V143] ON 

INSERT [dbo].[V143] ([id], [email], [createdby], [createdon]) VALUES (1, N'samir@gmail.com', N'samir@gmail.com', CAST(N'2020-08-29T19:45:15.700' AS DateTime))
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
SET IDENTITY_INSERT [dbo].[V143Transactions] OFF
SET IDENTITY_INSERT [dbo].[V158] ON 

INSERT [dbo].[V158] ([id], [email], [medications], [effects], [recommandations], [createdby], [createdon]) VALUES (1, N'samir@gmail.com', N'--', N'--', N'----', N'samir@gmail.com', CAST(N'2020-08-29T20:29:12.490' AS DateTime))
SET IDENTITY_INSERT [dbo].[V158] OFF
/****** Object:  Index [IX_UserMaster]    Script Date: 05-09-2020 00:59:21 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserMaster] ON [dbo].[CustomerMaster]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[V143Transactions]  WITH CHECK ADD  CONSTRAINT [FK_V143Transactions_V143] FOREIGN KEY([v143id])
REFERENCES [dbo].[V143] ([id])
GO
ALTER TABLE [dbo].[V143Transactions] CHECK CONSTRAINT [FK_V143Transactions_V143]
GO
/****** Object:  StoredProcedure [dbo].[sp_143]    Script Date: 05-09-2020 00:59:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_143Trans]    Script Date: 05-09-2020 00:59:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_158]    Script Date: 05-09-2020 00:59:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_company]    Script Date: 05-09-2020 00:59:21 ******/
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
@action nvarchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if(@action = 'INSERT')
	BEGIN
		INSERT INTO CompanyMaster VALUES(@CompanyCode, @CompanyName, @BranchCode, @BranchName, @ShortCode, @Address, @City, @State, @loginUser, GETDATE(), NULL, NULL);
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
/****** Object:  StoredProcedure [dbo].[sp_spoc]    Script Date: 05-09-2020 00:59:21 ******/
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
@action nvarchar(50) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF(@action = 'INSERT')
	BEGIN
	INSERT INTO SPOCmaster VALUES(@companyId, @companyCode, @branchCode, @spocname, @designation, @spocemail, @spoccontactno, @category, @loginUser, GETDATE(), NULL, NULL)
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
/****** Object:  StoredProcedure [dbo].[sp_v115]    Script Date: 05-09-2020 00:59:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_v115Trans]    Script Date: 05-09-2020 00:59:21 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_v126]    Script Date: 05-09-2020 00:59:21 ******/
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
@email nvarchar(255),
@physicianName nvarchar(255) = null,
@physicianPhone nvarchar(255) = null,
@emergencyContactPersonName nvarchar(255) = null,
@emergencyContactPersonPhone nvarchar(50) = null,
@MedicineDrugsAndReason text = null,
@PhysicianKnowParticipation nvarchar(50) = null,
@PhysicalActivity text = null,
@cretaedby nvarchar(50),
@v126 bigint out
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO V126 VALUES(@email, @physicianName, @physicianPhone, @emergencyContactPersonName, @emergencyContactPersonPhone, @MedicineDrugsAndReason, @PhysicianKnowParticipation, @PhysicalActivity, @cretaedby, GETDATE(), NULL, NULL)

	SELECT top 1 @v126 = id FROM V126 WHERE email = @email order by id desc

END
GO
/****** Object:  StoredProcedure [dbo].[sp_v126Transactions]    Script Date: 05-09-2020 00:59:21 ******/
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
USE [master]
GO
ALTER DATABASE [fitnessdb] SET  READ_WRITE 
GO
