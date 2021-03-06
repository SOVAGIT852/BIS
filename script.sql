USE [master]
GO
/****** Object:  Database [БИС]    Script Date: 27.01.2021 18:42:48 ******/
CREATE DATABASE [БИС]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'БИС', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\БИС.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'БИС_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\БИС_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [БИС] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [БИС].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [БИС] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [БИС] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [БИС] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [БИС] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [БИС] SET ARITHABORT OFF 
GO
ALTER DATABASE [БИС] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [БИС] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [БИС] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [БИС] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [БИС] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [БИС] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [БИС] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [БИС] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [БИС] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [БИС] SET  DISABLE_BROKER 
GO
ALTER DATABASE [БИС] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [БИС] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [БИС] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [БИС] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [БИС] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [БИС] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [БИС] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [БИС] SET RECOVERY FULL 
GO
ALTER DATABASE [БИС] SET  MULTI_USER 
GO
ALTER DATABASE [БИС] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [БИС] SET DB_CHAINING OFF 
GO
ALTER DATABASE [БИС] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [БИС] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [БИС] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [БИС] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'БИС', N'ON'
GO
ALTER DATABASE [БИС] SET QUERY_STORE = OFF
GO
USE [БИС]
GO
/****** Object:  Table [dbo].[Авторизация]    Script Date: 27.01.2021 18:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Авторизация](
	[Ид_учетной_записи] [int] IDENTITY(1,1) NOT NULL,
	[Логин] [nvarchar](50) NOT NULL,
	[Пароль] [nvarchar](50) NOT NULL,
	[ИД_сотрудника] [int] NOT NULL,
 CONSTRAINT [PK_Авторизация] PRIMARY KEY CLUSTERED 
(
	[Ид_учетной_записи] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Вид_товара]    Script Date: 27.01.2021 18:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Вид_товара](
	[ИД_вида] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](150) NULL,
 CONSTRAINT [PK_Вид_товара] PRIMARY KEY CLUSTERED 
(
	[ИД_вида] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Группы_элементов]    Script Date: 27.01.2021 18:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Группы_элементов](
	[ИД_группы_элементов] [int] IDENTITY(1,1) NOT NULL,
	[ИД_тип_товара] [int] NULL,
	[Группа_элементов] [nvarchar](100) NULL,
 CONSTRAINT [PK_Группы_элементов] PRIMARY KEY CLUSTERED 
(
	[ИД_группы_элементов] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Должность]    Script Date: 27.01.2021 18:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Должность](
	[ИД_должности] [int] IDENTITY(1,1) NOT NULL,
	[Должность] [nvarchar](50) NULL,
 CONSTRAINT [PK_Должность] PRIMARY KEY CLUSTERED 
(
	[ИД_должности] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Конкретные_х_ки]    Script Date: 27.01.2021 18:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Конкретные_х_ки](
	[ИД_записи] [int] IDENTITY(1,1) NOT NULL,
	[ИД_наименования_элемента] [int] NULL,
	[ИД_х_ки] [int] NULL,
	[Значение] [nvarchar](150) NULL,
 CONSTRAINT [PK_Конкретные_х_ки] PRIMARY KEY CLUSTERED 
(
	[ИД_записи] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Наименования_элементов]    Script Date: 27.01.2021 18:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Наименования_элементов](
	[ИД_наименования] [int] IDENTITY(1,1) NOT NULL,
	[ИД_группы_элемента] [int] NULL,
	[Наименование_элемента] [nvarchar](150) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ИД_наименования] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 27.01.2021 18:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[ИД_сотрудника] [int] IDENTITY(1,1) NOT NULL,
	[ФИО] [nvarchar](150) NULL,
	[Телефон] [nvarchar](50) NULL,
	[e_mail] [nvarchar](100) NULL,
	[Фотография] [nvarchar](150) NULL,
	[Ид_должности] [int] NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[ИД_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тип_товара]    Script Date: 27.01.2021 18:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тип_товара](
	[ИД_типа_товара] [int] IDENTITY(1,1) NOT NULL,
	[ИД_вида_товара] [int] NULL,
	[Тип_товара] [nvarchar](50) NULL,
 CONSTRAINT [PK_Тип_товара] PRIMARY KEY CLUSTERED 
(
	[ИД_типа_товара] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Характеристики]    Script Date: 27.01.2021 18:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Характеристики](
	[Ид_характеристики] [int] IDENTITY(1,1) NOT NULL,
	[Ид_группы_элемента] [int] NULL,
	[Наименование_х_к] [nvarchar](100) NULL,
	[Участие_в_сортировке] [int] NULL,
 CONSTRAINT [PK_Характеристики] PRIMARY KEY CLUSTERED 
(
	[Ид_характеристики] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Авторизация]  WITH CHECK ADD  CONSTRAINT [FK_Авторизация_Сотрудники] FOREIGN KEY([ИД_сотрудника])
REFERENCES [dbo].[Сотрудники] ([ИД_сотрудника])
GO
ALTER TABLE [dbo].[Авторизация] CHECK CONSTRAINT [FK_Авторизация_Сотрудники]
GO
ALTER TABLE [dbo].[Группы_элементов]  WITH CHECK ADD  CONSTRAINT [FK_Группы_элементов_Тип_товара] FOREIGN KEY([ИД_тип_товара])
REFERENCES [dbo].[Тип_товара] ([ИД_типа_товара])
GO
ALTER TABLE [dbo].[Группы_элементов] CHECK CONSTRAINT [FK_Группы_элементов_Тип_товара]
GO
ALTER TABLE [dbo].[Конкретные_х_ки]  WITH CHECK ADD  CONSTRAINT [FK_Конкретные_х_ки_Наименования_элементов] FOREIGN KEY([ИД_наименования_элемента])
REFERENCES [dbo].[Наименования_элементов] ([ИД_наименования])
GO
ALTER TABLE [dbo].[Конкретные_х_ки] CHECK CONSTRAINT [FK_Конкретные_х_ки_Наименования_элементов]
GO
ALTER TABLE [dbo].[Конкретные_х_ки]  WITH CHECK ADD  CONSTRAINT [FK_Конкретные_х_ки_Характеристики] FOREIGN KEY([ИД_х_ки])
REFERENCES [dbo].[Характеристики] ([Ид_характеристики])
GO
ALTER TABLE [dbo].[Конкретные_х_ки] CHECK CONSTRAINT [FK_Конкретные_х_ки_Характеристики]
GO
ALTER TABLE [dbo].[Наименования_элементов]  WITH CHECK ADD  CONSTRAINT [FK_Наименования_элементов_Группы_элементов] FOREIGN KEY([ИД_группы_элемента])
REFERENCES [dbo].[Группы_элементов] ([ИД_группы_элементов])
GO
ALTER TABLE [dbo].[Наименования_элементов] CHECK CONSTRAINT [FK_Наименования_элементов_Группы_элементов]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Должность] FOREIGN KEY([Ид_должности])
REFERENCES [dbo].[Должность] ([ИД_должности])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Должность]
GO
ALTER TABLE [dbo].[Тип_товара]  WITH CHECK ADD  CONSTRAINT [FK_Тип_товара_Вид_товара] FOREIGN KEY([ИД_вида_товара])
REFERENCES [dbo].[Вид_товара] ([ИД_вида])
GO
ALTER TABLE [dbo].[Тип_товара] CHECK CONSTRAINT [FK_Тип_товара_Вид_товара]
GO
ALTER TABLE [dbo].[Характеристики]  WITH CHECK ADD  CONSTRAINT [FK_Характеристики_Группы_элементов] FOREIGN KEY([Ид_группы_элемента])
REFERENCES [dbo].[Группы_элементов] ([ИД_группы_элементов])
GO
ALTER TABLE [dbo].[Характеристики] CHECK CONSTRAINT [FK_Характеристики_Группы_элементов]
GO
USE [master]
GO
ALTER DATABASE [БИС] SET  READ_WRITE 
GO
