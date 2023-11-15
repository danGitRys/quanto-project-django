USE [master]
GO
/****** Object:  Database [quanto]    Script Date: 15.11.2023 15:08:37 ******/
CREATE DATABASE [quanto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quanto', FILENAME = N'/var/opt/mssql/data/quanto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'quanto_log', FILENAME = N'/var/opt/mssql/data/quanto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [quanto] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quanto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quanto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quanto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quanto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quanto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quanto] SET ARITHABORT OFF 
GO
ALTER DATABASE [quanto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [quanto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quanto] SET AUTO_UPDATE_STATISTICS OFF 
GO
ALTER DATABASE [quanto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quanto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quanto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quanto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quanto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quanto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quanto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [quanto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quanto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quanto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quanto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quanto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quanto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quanto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quanto] SET RECOVERY FULL 
GO
ALTER DATABASE [quanto] SET  MULTI_USER 
GO
ALTER DATABASE [quanto] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [quanto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quanto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quanto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [quanto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [quanto] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'quanto', N'ON'
GO
ALTER DATABASE [quanto] SET QUERY_STORE = ON
GO
ALTER DATABASE [quanto] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [quanto]
GO
/****** Object:  Table [dbo].[assignment]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assignment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fk_project] [int] NOT NULL,
	[fk_employee] [int] NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_assignment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booking]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fk_employee] [int] NOT NULL,
	[fK_position] [int] NOT NULL,
	[start] [datetime] NOT NULL,
	[end] [datetime] NOT NULL,
	[pause] [float] NULL,
	[time] [int] NULL,
 CONSTRAINT [PK_tracking] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[emp_id] [nvarchar](50) NOT NULL,
	[forename] [nvarchar](50) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[mail] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NULL,
	[fk_team_id] [int] NULL,
	[team_roll] [nvarchar](50) NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[forecast]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forecast](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fk_employee] [int] NOT NULL,
	[fk_position] [int] NOT NULL,
	[start] [datetime] NOT NULL,
	[end] [datetime] NOT NULL,
	[info] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_plan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MSSQL_assignment_History]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MSSQL_assignment_History](
	[id] [int] NOT NULL,
	[fk_project] [int] NOT NULL,
	[fk_employee] [int] NOT NULL,
	[role] [nvarchar](50) NOT NULL,
	[SysStartTime] [datetime2](7) NOT NULL,
	[SysEndTime] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[position]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[position](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[position_id] [nvarchar](50) NOT NULL,
	[fk_project] [int] NOT NULL,
	[rate] [float] NOT NULL,
	[wd] [float] NOT NULL,
	[volume_total] [float] NOT NULL,
	[volume_remaining] [float] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
 CONSTRAINT [PK_position] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[p_id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[company] [nvarchar](50) NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[fk_creator] [int] NOT NULL,
	[creation_date] [datetime] NOT NULL,
 CONSTRAINT [PK_project] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[team]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[team](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[info] [nvarchar](max) NULL,
 CONSTRAINT [PK_team] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [Index_Assignment_Id]    Script Date: 15.11.2023 15:08:37 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Index_Assignment_Id] ON [dbo].[assignment]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[assignment]  WITH CHECK ADD  CONSTRAINT [FK_assignment_employee] FOREIGN KEY([fk_employee])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[assignment] CHECK CONSTRAINT [FK_assignment_employee]
GO
ALTER TABLE [dbo].[assignment]  WITH CHECK ADD  CONSTRAINT [FK_assignment_project] FOREIGN KEY([fk_project])
REFERENCES [dbo].[project] ([id])
GO
ALTER TABLE [dbo].[assignment] CHECK CONSTRAINT [FK_assignment_project]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_tracking_employee] FOREIGN KEY([fk_employee])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK_tracking_employee]
GO
ALTER TABLE [dbo].[booking]  WITH CHECK ADD  CONSTRAINT [FK_tracking_position] FOREIGN KEY([fK_position])
REFERENCES [dbo].[position] ([id])
GO
ALTER TABLE [dbo].[booking] CHECK CONSTRAINT [FK_tracking_position]
GO
ALTER TABLE [dbo].[employee]  WITH NOCHECK ADD  CONSTRAINT [FK_employee_team] FOREIGN KEY([fk_team_id])
REFERENCES [dbo].[team] ([id])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_team]
GO
ALTER TABLE [dbo].[forecast]  WITH CHECK ADD  CONSTRAINT [FK_plan_position] FOREIGN KEY([fk_position])
REFERENCES [dbo].[position] ([id])
GO
ALTER TABLE [dbo].[forecast] CHECK CONSTRAINT [FK_plan_position]
GO
ALTER TABLE [dbo].[position]  WITH CHECK ADD  CONSTRAINT [FK_position_project] FOREIGN KEY([fk_project])
REFERENCES [dbo].[project] ([id])
GO
ALTER TABLE [dbo].[position] CHECK CONSTRAINT [FK_position_project]
GO
ALTER TABLE [dbo].[project]  WITH CHECK ADD  CONSTRAINT [FK_project_creator] FOREIGN KEY([fk_creator])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[project] CHECK CONSTRAINT [FK_project_creator]
GO
/****** Object:  StoredProcedure [dbo].[deleteAssignmentResetIncrement]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[deleteAssignmentResetIncrement]
   
AS
BEGIN
   DELETE FROM assignment
   DBCC CHECKIDENT (assignment, RESEED, 1)
END;
GO
/****** Object:  StoredProcedure [dbo].[deleteEmployeeResetIncrement]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[deleteEmployeeResetIncrement]
   
AS
BEGIN
   DELETE FROM employee
   DBCC CHECKIDENT (employee, RESEED, 1)
END;
GO
/****** Object:  StoredProcedure [dbo].[deletePlanningResetIncrement]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[deletePlanningResetIncrement]
   
AS
BEGIN
   DELETE FROM planning
   DBCC CHECKIDENT (planning, RESEED, 1)
END;
GO
/****** Object:  StoredProcedure [dbo].[deletePositionResetIncrement]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[deletePositionResetIncrement]
   
AS
BEGIN
   DELETE FROM position
   DBCC CHECKIDENT (position, RESEED, 1)
END;
GO
/****** Object:  StoredProcedure [dbo].[deleteProjectResetIncrement]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[deleteProjectResetIncrement]
   
AS
BEGIN
   DELETE FROM project
   DBCC CHECKIDENT (project, RESEED, 1)
END;
GO
/****** Object:  StoredProcedure [dbo].[deleteTeamsResetIncrement]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[deleteTeamsResetIncrement]
   
AS
BEGIN
   DELETE FROM team
   DBCC CHECKIDENT (team, RESEED, 1)
END;
GO
/****** Object:  StoredProcedure [dbo].[deleteTrackingResetIncrement]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[deleteTrackingResetIncrement]
   
AS
BEGIN
   DELETE FROM tracking
   DBCC CHECKIDENT (tracking, RESEED, 1)
END;
GO
/****** Object:  StoredProcedure [dbo].[getRandomTeamId]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getRandomTeamId]
   
AS
BEGIN
   SELECT TOP 1 id FROM team ORDER BY NEWID();
END;
GO
/****** Object:  StoredProcedure [dbo].[getVolume]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getVolume]
    @Project int
AS
BEGIN
    SELECT volume_remaining FROM [position]
    WHERE project = @Project;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertExampleEmployees]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertExampleEmployees]
AS
BEGIN
  INSERT INTO [dbo].[employee] ([emp_id], [forename], [surname], [mail], [phone], [fk_team_id], [team_roll])
VALUES ('EMP1', 'Emily', 'Anderson', 'emily.anderson@testcompany.com', '123-456-7890', 14, 'Member'),
('EMP2', 'Hans', 'Anderson', 'emily.anderson@testcompany.com', '123-456-7890', 1, 'Member'),
('EMP3', 'Dieter', 'Franz', 'temp@testcompany.com', '123-456-7890', 1, 'Member'),
('EMP4', 'Alisha', 'Schneider', 'temp@testcompany.com', '123-456-7890', 1, 'Member'),
('EMP5', '', 'Franz', 'temp@testcompany.com', '123-456-7890', 1, 'Member'),
('EMP6', 'Urusla', 'Stephenson', 'temp@testcompany.com', '123-456-7890', 1, 'Member'),
('EMP7', 'Earnest', 'Collier', 'temp@testcompany.com', '123-456-7890', 2, 'Member'),
('EMP8', 'Sheree', 'Velasquez', 'temp@testcompany.com', '123-456-7890', 2, 'Member'),
('EMP9', 'Desiree', 'Bonilla', 'temp@testcompany.com', '123-456-7890', 2, 'Member'),
('EMP10', 'Annmarie', 'Valentine', 'temp@testcompany.com', '123-456-7890', 3, 'Member'),	
('EMP11', 'Kerry', 'Chavez', 'temp@testcompany.com', '123-456-7890', 3, 'Member'),
('EMP12', 'Lino', 'Mccall', 'temp@testcompany.com', '123-456-7890', 3, 'Member'),
('EMP13', 'Allison', 'Middleton', 'temp@testcompany.com', '123-456-7890', 3, 'Member'),
('EMP14', 'Alta', 'Holt', 'temp@testcompany.com', '123-456-7890', 4, 'Member'),
('EMP15', 'Eloise', 'Haas', 'temp@testcompany.com', '123-456-7890', 4, 'Member')
	END
GO
/****** Object:  StoredProcedure [dbo].[InsertExampleTeams]    Script Date: 15.11.2023 15:08:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertExampleTeams]
AS
BEGIN
    DECLARE @counter INT = 1

    WHILE @counter <= 20
    BEGIN
        DECLARE @teamName NVARCHAR(50)
        SET @teamName = 'team ' + CAST(@counter AS NVARCHAR(10))

        INSERT INTO [dbo].[team] ([name], [info])
        VALUES (@teamName, NULL)

        SET @counter = @counter + 1
    END
END;
GO
USE [master]
GO
ALTER DATABASE [quanto] SET  READ_WRITE 
GO
