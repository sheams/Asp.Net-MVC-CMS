USE [AspNetMvcCms]
GO
/****** Object:  Database [AspNetMvcCms]    Script Date: 11/20/2015 9:55:30 PM ******/

ALTER DATABASE [AspNetMvcCms] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AspNetMvcCms].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AspNetMvcCms] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET ARITHABORT OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AspNetMvcCms] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AspNetMvcCms] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AspNetMvcCms] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AspNetMvcCms] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AspNetMvcCms] SET  MULTI_USER 
GO
ALTER DATABASE [AspNetMvcCms] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AspNetMvcCms] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AspNetMvcCms] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AspNetMvcCms] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AspNetMvcCms] SET DELAYED_DURABILITY = DISABLED 
GO
USE [AspNetMvcCms]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/20/2015 9:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/20/2015 9:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/20/2015 9:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[User_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/20/2015 9:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/20/2015 9:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/20/2015 9:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CommentReplies]    Script Date: 11/20/2015 9:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentReplies](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ReplyText] [nvarchar](max) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[ModifyBy] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[Comment_Id] [bigint] NULL,
 CONSTRAINT [PK_dbo.CommentReplies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 11/20/2015 9:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CommentText] [nvarchar](max) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[ModifyBy] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[Page_Id] [bigint] NULL,
 CONSTRAINT [PK_dbo.Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menus]    Script Date: 11/20/2015 9:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[DisplayText] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
	[ActionType] [int] NOT NULL,
	[Order] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[ModifyBy] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[Parent_Id] [bigint] NULL,
	[Page_Id] [bigint] NULL,
	[PageCategory_Id] [bigint] NULL,
 CONSTRAINT [PK_dbo.Menus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PageCategories]    Script Date: 11/20/2015 9:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageCategories](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[ModifyBy] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[Parent_Id] [bigint] NULL,
 CONSTRAINT [PK_dbo.PageCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pages]    Script Date: 11/20/2015 9:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pages](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[MetaKeyword] [nvarchar](max) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[ShortDescription] [nvarchar](max) NULL,
	[Body] [varbinary](max) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[ModifyBy] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[PageCategory_Id] [bigint] NULL,
 CONSTRAINT [PK_dbo.Pages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SiteSettings]    Script Date: 11/20/2015 9:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteSettings](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SiteTitle] [nvarchar](max) NULL,
	[SiteSlogan] [nvarchar](max) NULL,
	[SiteDomain] [nvarchar](max) NULL,
	[BannerImage] [nvarchar](max) NULL,
	[SiteLogo] [nvarchar](max) NULL,
	[Favicon] [nvarchar](max) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
	[CreateBy] [nvarchar](max) NULL,
	[ModifyBy] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.SiteSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User_Id]    Script Date: 11/20/2015 9:55:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_Id] ON [dbo].[AspNetUserClaims]
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 11/20/2015 9:55:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 11/20/2015 9:55:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 11/20/2015 9:55:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comment_Id]    Script Date: 11/20/2015 9:55:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comment_Id] ON [dbo].[CommentReplies]
(
	[Comment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Page_Id]    Script Date: 11/20/2015 9:55:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_Page_Id] ON [dbo].[Comments]
(
	[Page_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Page_Id]    Script Date: 11/20/2015 9:55:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_Page_Id] ON [dbo].[Menus]
(
	[Page_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PageCategory_Id]    Script Date: 11/20/2015 9:55:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_PageCategory_Id] ON [dbo].[Menus]
(
	[PageCategory_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Parent_Id]    Script Date: 11/20/2015 9:55:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_Parent_Id] ON [dbo].[Menus]
(
	[Parent_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Parent_Id]    Script Date: 11/20/2015 9:55:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_Parent_Id] ON [dbo].[PageCategories]
(
	[Parent_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PageCategory_Id]    Script Date: 11/20/2015 9:55:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_PageCategory_Id] ON [dbo].[Pages]
(
	[PageCategory_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CommentReplies]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CommentReplies_dbo.Comments_Comment_Id] FOREIGN KEY([Comment_Id])
REFERENCES [dbo].[Comments] ([Id])
GO
ALTER TABLE [dbo].[CommentReplies] CHECK CONSTRAINT [FK_dbo.CommentReplies_dbo.Comments_Comment_Id]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Comments_dbo.Pages_Page_Id] FOREIGN KEY([Page_Id])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_dbo.Comments_dbo.Pages_Page_Id]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Menus_dbo.Menus_Parent_Id] FOREIGN KEY([Parent_Id])
REFERENCES [dbo].[Menus] ([Id])
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_dbo.Menus_dbo.Menus_Parent_Id]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Menus_dbo.PageCategories_PageCategory_Id] FOREIGN KEY([PageCategory_Id])
REFERENCES [dbo].[PageCategories] ([Id])
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_dbo.Menus_dbo.PageCategories_PageCategory_Id]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Menus_dbo.Pages_Page_Id] FOREIGN KEY([Page_Id])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_dbo.Menus_dbo.Pages_Page_Id]
GO
ALTER TABLE [dbo].[PageCategories]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PageCategories_dbo.PageCategories_Parent_Id] FOREIGN KEY([Parent_Id])
REFERENCES [dbo].[PageCategories] ([Id])
GO
ALTER TABLE [dbo].[PageCategories] CHECK CONSTRAINT [FK_dbo.PageCategories_dbo.PageCategories_Parent_Id]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Pages_dbo.PageCategories_PageCategory_Id] FOREIGN KEY([PageCategory_Id])
REFERENCES [dbo].[PageCategories] ([Id])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_dbo.Pages_dbo.PageCategories_PageCategory_Id]
GO
USE [master]
GO
ALTER DATABASE [AspNetMvcCms] SET  READ_WRITE 
GO
