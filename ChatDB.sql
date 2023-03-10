USE [master]
GO
/****** Object:  Database [ChatDB]    Script Date: 01.03.2023 11:55:48 ******/
CREATE DATABASE [ChatDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChatDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ChatDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChatDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ChatDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ChatDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChatDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChatDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChatDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChatDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChatDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChatDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChatDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChatDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChatDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChatDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChatDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChatDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChatDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChatDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChatDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChatDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChatDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChatDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChatDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChatDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChatDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChatDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChatDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChatDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ChatDB] SET  MULTI_USER 
GO
ALTER DATABASE [ChatDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChatDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChatDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChatDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChatDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ChatDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ChatDB] SET QUERY_STORE = OFF
GO
USE [ChatDB]
GO
/****** Object:  Table [dbo].[ChatMessage]    Script Date: 01.03.2023 11:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatMessage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SenderId] [int] NOT NULL,
	[ChatroomId] [int] NOT NULL,
	[Date] [datetime] NULL,
	[Message] [nvarchar](500) NULL,
 CONSTRAINT [PK_ChatMessages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chatroom]    Script Date: 01.03.2023 11:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chatroom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Topic] [nvarchar](100) NULL,
 CONSTRAINT [PK_Chatrooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 01.03.2023 11:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 01.03.2023 11:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](80) NULL,
	[DepartmentId] [int] NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeChatroom]    Script Date: 01.03.2023 11:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeChatroom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NULL,
	[ChatroomId] [int] NULL,
 CONSTRAINT [PK_EmployeeChatrooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChatMessage] ON 

INSERT [dbo].[ChatMessage] ([Id], [SenderId], [ChatroomId], [Date], [Message]) VALUES (1, 1, 1, CAST(N'2023-03-01T04:31:34.530' AS DateTime), N'Привет')
INSERT [dbo].[ChatMessage] ([Id], [SenderId], [ChatroomId], [Date], [Message]) VALUES (2, 1, 2, CAST(N'2023-03-01T04:31:54.547' AS DateTime), N'Как твои дела?')
SET IDENTITY_INSERT [dbo].[ChatMessage] OFF
GO
SET IDENTITY_INSERT [dbo].[Chatroom] ON 

INSERT [dbo].[Chatroom] ([Id], [Topic]) VALUES (1, N'Встреча')
INSERT [dbo].[Chatroom] ([Id], [Topic]) VALUES (2, N'Конференеция')
SET IDENTITY_INSERT [dbo].[Chatroom] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Name]) VALUES (1, N'Друзья')
INSERT [dbo].[Department] ([Id], [Name]) VALUES (2, N'Коллеги')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Name], [DepartmentId], [Username], [Password]) VALUES (1, N'Илья', 1, N'XLATE', N'111')
INSERT [dbo].[Employee] ([Id], [Name], [DepartmentId], [Username], [Password]) VALUES (2, N'Даня', 2, N'Dan', N'222')
INSERT [dbo].[Employee] ([Id], [Name], [DepartmentId], [Username], [Password]) VALUES (3, N'Линар', 1, N'linar', N'333')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeChatroom] ON 

INSERT [dbo].[EmployeeChatroom] ([Id], [EmployeeId], [ChatroomId]) VALUES (1, 1, 1)
INSERT [dbo].[EmployeeChatroom] ([Id], [EmployeeId], [ChatroomId]) VALUES (2, 2, 1)
INSERT [dbo].[EmployeeChatroom] ([Id], [EmployeeId], [ChatroomId]) VALUES (3, 1, 2)
INSERT [dbo].[EmployeeChatroom] ([Id], [EmployeeId], [ChatroomId]) VALUES (4, 3, 2)
INSERT [dbo].[EmployeeChatroom] ([Id], [EmployeeId], [ChatroomId]) VALUES (5, 2, 2)
SET IDENTITY_INSERT [dbo].[EmployeeChatroom] OFF
GO
/****** Object:  Index [IX_FK_ChatMessage_Chatroom]    Script Date: 01.03.2023 11:55:48 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ChatMessage_Chatroom] ON [dbo].[ChatMessage]
(
	[ChatroomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ChatMessage_Employee]    Script Date: 01.03.2023 11:55:48 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ChatMessage_Employee] ON [dbo].[ChatMessage]
(
	[SenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Employee_Department]    Script Date: 01.03.2023 11:55:48 ******/
CREATE NONCLUSTERED INDEX [IX_FK_Employee_Department] ON [dbo].[Employee]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_EmployeeChatroom_Chatroom]    Script Date: 01.03.2023 11:55:48 ******/
CREATE NONCLUSTERED INDEX [IX_FK_EmployeeChatroom_Chatroom] ON [dbo].[EmployeeChatroom]
(
	[ChatroomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_EmployeeChatroom_Employee]    Script Date: 01.03.2023 11:55:48 ******/
CREATE NONCLUSTERED INDEX [IX_FK_EmployeeChatroom_Employee] ON [dbo].[EmployeeChatroom]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChatMessage]  WITH CHECK ADD  CONSTRAINT [FK_ChatMessage_Chatroom] FOREIGN KEY([ChatroomId])
REFERENCES [dbo].[Chatroom] ([Id])
GO
ALTER TABLE [dbo].[ChatMessage] CHECK CONSTRAINT [FK_ChatMessage_Chatroom]
GO
ALTER TABLE [dbo].[ChatMessage]  WITH CHECK ADD  CONSTRAINT [FK_ChatMessage_Employee] FOREIGN KEY([SenderId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[ChatMessage] CHECK CONSTRAINT [FK_ChatMessage_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[EmployeeChatroom]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeChatroom_Chatroom] FOREIGN KEY([ChatroomId])
REFERENCES [dbo].[Chatroom] ([Id])
GO
ALTER TABLE [dbo].[EmployeeChatroom] CHECK CONSTRAINT [FK_EmployeeChatroom_Chatroom]
GO
ALTER TABLE [dbo].[EmployeeChatroom]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeChatroom_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeChatroom] CHECK CONSTRAINT [FK_EmployeeChatroom_Employee]
GO
USE [master]
GO
ALTER DATABASE [ChatDB] SET  READ_WRITE 
GO
