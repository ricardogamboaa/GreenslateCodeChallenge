USE [master]
GO
/****** Object:  Database [Greenslate]    Script Date: 7/2/2020 11:32:51 ******/
CREATE DATABASE [Greenslate]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Greenslate', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Greenslate.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Greenslate_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Greenslate_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Greenslate] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Greenslate].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Greenslate] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Greenslate] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Greenslate] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Greenslate] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Greenslate] SET ARITHABORT OFF 
GO
ALTER DATABASE [Greenslate] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Greenslate] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Greenslate] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Greenslate] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Greenslate] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Greenslate] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Greenslate] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Greenslate] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Greenslate] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Greenslate] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Greenslate] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Greenslate] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Greenslate] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Greenslate] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Greenslate] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Greenslate] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Greenslate] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Greenslate] SET RECOVERY FULL 
GO
ALTER DATABASE [Greenslate] SET  MULTI_USER 
GO
ALTER DATABASE [Greenslate] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Greenslate] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Greenslate] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Greenslate] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Greenslate] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Greenslate', N'ON'
GO
ALTER DATABASE [Greenslate] SET QUERY_STORE = OFF
GO
USE [Greenslate]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 7/2/2020 11:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Credits] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/2/2020 11:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProject]    Script Date: 7/2/2020 11:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProject](
	[UserId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AssignedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Credits]) VALUES (1, CAST(N'2020-01-07T00:00:00.000' AS DateTime), CAST(N'2020-11-02T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Credits]) VALUES (2, CAST(N'2020-02-07T00:00:00.000' AS DateTime), CAST(N'2020-11-02T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Credits]) VALUES (3, CAST(N'2020-03-07T00:00:00.000' AS DateTime), CAST(N'2020-11-02T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Credits]) VALUES (4, CAST(N'2020-04-07T00:00:00.000' AS DateTime), CAST(N'2020-11-02T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Credits]) VALUES (5, CAST(N'2020-05-07T00:00:00.000' AS DateTime), CAST(N'2020-11-02T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Credits]) VALUES (6, CAST(N'2020-06-07T00:00:00.000' AS DateTime), CAST(N'2020-11-02T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Credits]) VALUES (7, CAST(N'2020-07-07T00:00:00.000' AS DateTime), CAST(N'2020-11-02T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Credits]) VALUES (8, CAST(N'2020-08-07T00:00:00.000' AS DateTime), CAST(N'2020-11-02T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Credits]) VALUES (9, CAST(N'2020-09-07T00:00:00.000' AS DateTime), CAST(N'2020-11-02T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Project] ([ProjectId], [StartDate], [EndDate], [Credits]) VALUES (10, CAST(N'2020-10-07T00:00:00.000' AS DateTime), CAST(N'2020-11-02T00:00:00.000' AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[Project] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [FirstName], [LastName]) VALUES (1, N'Ricardo', N'Gamboa')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName]) VALUES (2, N'Daniel', N'Valencia')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName]) VALUES (3, N'Adrian', N'Vargas')
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 1, 0, CAST(N'2020-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 2, 1, CAST(N'2020-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 3, 1, CAST(N'2020-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 4, 1, CAST(N'2020-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 5, 1, CAST(N'2020-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 6, 1, CAST(N'2020-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 7, 1, CAST(N'2020-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 8, 1, CAST(N'2020-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 9, 1, CAST(N'2020-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 10, 1, CAST(N'2020-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 1, 1, CAST(N'2020-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 3, 1, CAST(N'2020-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 5, 1, CAST(N'2020-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 7, 1, CAST(N'2020-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 9, 1, CAST(N'2020-05-07T00:00:00.000' AS DateTime))
ALTER TABLE [dbo].[UserProject]  WITH CHECK ADD FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([ProjectId])
GO
ALTER TABLE [dbo].[UserProject]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
USE [master]
GO
ALTER DATABASE [Greenslate] SET  READ_WRITE 
GO
