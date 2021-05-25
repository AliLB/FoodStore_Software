USE [master]
GO

/****** Object:  Database [foodDB]    Script Date: 1/13/2021 7:21:04 PM ******/
CREATE DATABASE [foodDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'foodDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\foodDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'foodDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\foodDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [foodDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [foodDB] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [foodDB] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [foodDB] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [foodDB] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [foodDB] SET ARITHABORT OFF 
GO

ALTER DATABASE [foodDB] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [foodDB] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [foodDB] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [foodDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [foodDB] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [foodDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [foodDB] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [foodDB] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [foodDB] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [foodDB] SET  DISABLE_BROKER 
GO

ALTER DATABASE [foodDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [foodDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [foodDB] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [foodDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [foodDB] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [foodDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [foodDB] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [foodDB] SET RECOVERY FULL 
GO

ALTER DATABASE [foodDB] SET  MULTI_USER 
GO

ALTER DATABASE [foodDB] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [foodDB] SET DB_CHAINING OFF 
GO

ALTER DATABASE [foodDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [foodDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [foodDB] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [foodDB] SET QUERY_STORE = OFF
GO

ALTER DATABASE [foodDB] SET  READ_WRITE 
GO