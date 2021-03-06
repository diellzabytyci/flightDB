USE [master]
GO
/****** Object:  Database [diellza]    Script Date: 05/07/2021 23:38:11 ******/
CREATE DATABASE [diellza]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'diellza', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\diellza.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'diellza_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\diellza_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [diellza] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [diellza].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [diellza] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [diellza] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [diellza] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [diellza] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [diellza] SET ARITHABORT OFF 
GO
ALTER DATABASE [diellza] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [diellza] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [diellza] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [diellza] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [diellza] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [diellza] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [diellza] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [diellza] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [diellza] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [diellza] SET  ENABLE_BROKER 
GO
ALTER DATABASE [diellza] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [diellza] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [diellza] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [diellza] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [diellza] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [diellza] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [diellza] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [diellza] SET RECOVERY FULL 
GO
ALTER DATABASE [diellza] SET  MULTI_USER 
GO
ALTER DATABASE [diellza] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [diellza] SET DB_CHAINING OFF 
GO
ALTER DATABASE [diellza] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [diellza] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [diellza] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'diellza', N'ON'
GO
ALTER DATABASE [diellza] SET QUERY_STORE = OFF
GO
USE [diellza]
GO
/****** Object:  User [diellza]    Script Date: 05/07/2021 23:38:11 ******/
CREATE USER [diellza] FOR LOGIN [diellza] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Airplane]    Script Date: 05/07/2021 23:38:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airplane](
	[AirplaneID] [int] NOT NULL,
	[AirplaneName] [varchar](255) NULL,
	[MaxCargo] [decimal](10, 2) NOT NULL,
	[threshhold] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[AirplaneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 05/07/2021 23:38:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] NOT NULL,
	[BookingDate] [date] NOT NULL,
	[Passenger] [int] NULL,
	[FlightNumber] [int] NULL,
	[Cargo] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 05/07/2021 23:38:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[FlightNumber] [int] NOT NULL,
	[Destination] [int] NULL,
	[From] [int] NULL,
	[Airplane] [int] NULL,
	[distance] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[FlightNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passenger]    Script Date: 05/07/2021 23:38:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passenger](
	[PassengerID] [int] NOT NULL,
	[PassengerName] [varchar](255) NOT NULL,
	[PassengerLastName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PassengerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Place]    Script Date: 05/07/2021 23:38:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Place](
	[PlaceID] [int] NOT NULL,
	[PlaceName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlaceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([FlightNumber])
REFERENCES [dbo].[Flight] ([FlightNumber])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([Passenger])
REFERENCES [dbo].[Passenger] ([PassengerID])
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD FOREIGN KEY([Airplane])
REFERENCES [dbo].[Airplane] ([AirplaneID])
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD FOREIGN KEY([Destination])
REFERENCES [dbo].[Place] ([PlaceID])
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD FOREIGN KEY([From])
REFERENCES [dbo].[Place] ([PlaceID])
GO
/****** Object:  StoredProcedure [dbo].[AllPlanesOnTheSameDestination]    Script Date: 05/07/2021 23:38:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AllPlanesOnTheSameDestination]
@destination varchar(255)
as
begin
select distinct a.AirplaneName as 'Airplanes from same destination'
from flight f inner join Airplane a 
					on a.AirplaneID=f.Airplane
				inner join Place p 
					on p.PlaceID=f.Destination
where p.PlaceName=@destination
end
GO
/****** Object:  StoredProcedure [dbo].[getAllPeopleFromFlight]    Script Date: 05/07/2021 23:38:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getAllPeopleFromFlight]
@flightNumber int
as
begin
select p.PassengerName+' '+p.PassengerLastName as 'people from flight the same flight '
from Booking b inner join Passenger p on p.PassengerID=b.Passenger
where b.FlightNumber=@flightNumber
end
GO
USE [master]
GO
ALTER DATABASE [diellza] SET  READ_WRITE 
GO
