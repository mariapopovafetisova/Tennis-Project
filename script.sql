USE [master]
GO
/****** Object:  Database [Player]    Script Date: 4/25/2022 1:09:11 PM ******/
CREATE DATABASE [YourDtabaseName]
GO
USE [YourDatabaseName]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/25/2022 1:09:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckBoxModel]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckBoxModel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SharedId] [int] NOT NULL,
	[Value] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[IsChecked] [bit] NOT NULL,
	[ListErrorId] [int] NULL,
	[ListErrorId1] [int] NULL,
	[ListErrorId10] [int] NULL,
	[ListErrorId2] [int] NULL,
	[ListErrorId3] [int] NULL,
	[ListErrorId4] [int] NULL,
	[ListErrorId5] [int] NULL,
	[ListErrorId6] [int] NULL,
	[ListErrorId7] [int] NULL,
	[ListErrorId8] [int] NULL,
	[ListErrorId9] [int] NULL,
 CONSTRAINT [PK_CheckBoxModel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorsFP]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorsFP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[point] [int] NOT NULL,
	[game] [int] NULL,
	[set] [int] NULL,
	[FirstPlayerId] [int] NULL,
 CONSTRAINT [PK_ErrorsFP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorsSP]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorsSP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[point] [int] NOT NULL,
	[game] [int] NULL,
	[set] [int] NULL,
	[SecondPlayerId] [int] NULL,
 CONSTRAINT [PK_ErrorsSP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FirstPlayer]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FirstPlayer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[name] [nvarchar](max) NOT NULL,
	[MatchId] [int] NULL,
 CONSTRAINT [PK_FirstPlayer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListError]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListError](
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ListError] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginForm]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginForm](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_LoginForm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Match]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Match](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[UserProfileId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Match] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchDetails]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[yourPlayer] [nvarchar](max) NOT NULL,
	[opponentPlayer] [nvarchar](max) NOT NULL,
	[Event] [nvarchar](max) NULL,
	[date] [nvarchar](max) NULL,
	[MatchId] [int] NULL,
	[MatId] [int] NOT NULL,
 CONSTRAINT [PK_MatchDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pointListFP]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pointListFP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerId] [int] NOT NULL,
	[point] [int] NULL,
	[fSerror] [nvarchar](max) NULL,
	[area] [nvarchar](max) NULL,
	[sSError] [nvarchar](max) NULL,
	[sPOError] [nvarchar](max) NULL,
	[rPOError] [nvarchar](max) NULL,
	[winner] [nvarchar](max) NULL,
	[winnerA] [nvarchar](max) NULL,
	[uError] [nvarchar](max) NULL,
	[uErrorA] [nvarchar](max) NULL,
	[NetError] [nvarchar](max) NULL,
	[ErrorsFPId] [int] NULL,
 CONSTRAINT [PK_pointListFP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pointListSP]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pointListSP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerId] [int] NOT NULL,
	[point] [int] NULL,
	[fSerror] [nvarchar](max) NULL,
	[sSerror] [nvarchar](max) NULL,
	[winner] [nvarchar](max) NULL,
	[uError] [nvarchar](max) NULL,
	[NetError] [nvarchar](max) NULL,
	[ErrorsSPId] [int] NULL,
 CONSTRAINT [PK_pointListSP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationForm]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationForm](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](20) NOT NULL,
	[lastName] [nvarchar](20) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[username] [nvarchar](10) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[comparePassword] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_RegistrationForm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportStats]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportStats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[MatId] [int] NULL,
	[FirstPlayer] [nvarchar](max) NOT NULL,
	[SecondPlayer] [nvarchar](max) NOT NULL,
	[fServeIN] [float] NOT NULL,
	[fServeOUT] [float] NOT NULL,
	[fServePerc] [float] NOT NULL,
	[fServeINOP] [float] NOT NULL,
	[fServeOUTOP] [float] NOT NULL,
	[fServePercOP] [float] NOT NULL,
	[sServeIN] [float] NOT NULL,
	[sServeOUT] [float] NOT NULL,
	[sServePerc] [float] NOT NULL,
	[sServeINOP] [float] NOT NULL,
	[sServePercOP] [float] NOT NULL,
	[doubleFaults] [float] NOT NULL,
	[fw] [float] NOT NULL,
	[ft] [float] NOT NULL,
	[fb] [float] NOT NULL,
	[sw] [float] NOT NULL,
	[st] [float] NOT NULL,
	[sb] [float] NOT NULL,
	[totalWinner] [float] NOT NULL,
	[winnerPerc] [float] NOT NULL,
	[winnerFHI] [float] NOT NULL,
	[winnerFHO] [float] NOT NULL,
	[winnerFHN] [float] NOT NULL,
	[winnerBHI] [float] NOT NULL,
	[winnerBHO] [float] NOT NULL,
	[winnerBHN] [float] NOT NULL,
	[totalWinnerOP] [float] NOT NULL,
	[winnerPercOP] [float] NOT NULL,
	[totalUE] [float] NOT NULL,
	[UEPerc] [float] NOT NULL,
	[ueFHI] [float] NOT NULL,
	[ueFHO] [float] NOT NULL,
	[ueFHN] [float] NOT NULL,
	[ueBHI] [float] NOT NULL,
	[ueBHO] [float] NOT NULL,
	[ueBHN] [float] NOT NULL,
	[totalUEOP] [float] NOT NULL,
	[UEPercOP] [float] NOT NULL,
	[netError] [float] NOT NULL,
	[netErrorPerc] [float] NOT NULL,
	[netErrorOP] [float] NOT NULL,
	[netErrorPercOP] [float] NOT NULL,
	[spowf] [float] NOT NULL,
	[spowb] [float] NOT NULL,
	[spoef] [float] NOT NULL,
	[spoeb] [float] NOT NULL,
	[rpowf] [float] NOT NULL,
	[rpowb] [float] NOT NULL,
	[rpoef] [float] NOT NULL,
	[rpoeb] [float] NOT NULL,
	[MatchId] [int] NULL,
 CONSTRAINT [PK_ReportStats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecondPlayer]    Script Date: 4/25/2022 1:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecondPlayer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[name] [nvarchar](max) NOT NULL,
	[MatchId] [int] NULL,
 CONSTRAINT [PK_SecondPlayer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CheckBoxModel_ListErrorId]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_CheckBoxModel_ListErrorId] ON [dbo].[CheckBoxModel]
(
	[ListErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CheckBoxModel_ListErrorId1]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_CheckBoxModel_ListErrorId1] ON [dbo].[CheckBoxModel]
(
	[ListErrorId1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CheckBoxModel_ListErrorId10]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_CheckBoxModel_ListErrorId10] ON [dbo].[CheckBoxModel]
(
	[ListErrorId10] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CheckBoxModel_ListErrorId2]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_CheckBoxModel_ListErrorId2] ON [dbo].[CheckBoxModel]
(
	[ListErrorId2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CheckBoxModel_ListErrorId3]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_CheckBoxModel_ListErrorId3] ON [dbo].[CheckBoxModel]
(
	[ListErrorId3] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CheckBoxModel_ListErrorId4]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_CheckBoxModel_ListErrorId4] ON [dbo].[CheckBoxModel]
(
	[ListErrorId4] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CheckBoxModel_ListErrorId5]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_CheckBoxModel_ListErrorId5] ON [dbo].[CheckBoxModel]
(
	[ListErrorId5] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CheckBoxModel_ListErrorId6]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_CheckBoxModel_ListErrorId6] ON [dbo].[CheckBoxModel]
(
	[ListErrorId6] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CheckBoxModel_ListErrorId7]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_CheckBoxModel_ListErrorId7] ON [dbo].[CheckBoxModel]
(
	[ListErrorId7] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CheckBoxModel_ListErrorId8]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_CheckBoxModel_ListErrorId8] ON [dbo].[CheckBoxModel]
(
	[ListErrorId8] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CheckBoxModel_ListErrorId9]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_CheckBoxModel_ListErrorId9] ON [dbo].[CheckBoxModel]
(
	[ListErrorId9] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ErrorsFP_FirstPlayerId]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_ErrorsFP_FirstPlayerId] ON [dbo].[ErrorsFP]
(
	[FirstPlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ErrorsSP_SecondPlayerId]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_ErrorsSP_SecondPlayerId] ON [dbo].[ErrorsSP]
(
	[SecondPlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FirstPlayer_MatchId]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_FirstPlayer_MatchId] ON [dbo].[FirstPlayer]
(
	[MatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Match_UserProfileId]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_Match_UserProfileId] ON [dbo].[Match]
(
	[UserProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MatchDetails_MatchId]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_MatchDetails_MatchId] ON [dbo].[MatchDetails]
(
	[MatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_pointListFP_ErrorsFPId]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_pointListFP_ErrorsFPId] ON [dbo].[pointListFP]
(
	[ErrorsFPId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_pointListSP_ErrorsSPId]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_pointListSP_ErrorsSPId] ON [dbo].[pointListSP]
(
	[ErrorsSPId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReportStats_MatchId]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReportStats_MatchId] ON [dbo].[ReportStats]
(
	[MatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SecondPlayer_MatchId]    Script Date: 4/25/2022 1:09:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_SecondPlayer_MatchId] ON [dbo].[SecondPlayer]
(
	[MatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MatchDetails] ADD  DEFAULT ((0)) FOR [MatId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CheckBoxModel]  WITH CHECK ADD  CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId] FOREIGN KEY([ListErrorId])
REFERENCES [dbo].[ListError] ([Id])
GO
ALTER TABLE [dbo].[CheckBoxModel] CHECK CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId]
GO
ALTER TABLE [dbo].[CheckBoxModel]  WITH CHECK ADD  CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId1] FOREIGN KEY([ListErrorId1])
REFERENCES [dbo].[ListError] ([Id])
GO
ALTER TABLE [dbo].[CheckBoxModel] CHECK CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId1]
GO
ALTER TABLE [dbo].[CheckBoxModel]  WITH CHECK ADD  CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId10] FOREIGN KEY([ListErrorId10])
REFERENCES [dbo].[ListError] ([Id])
GO
ALTER TABLE [dbo].[CheckBoxModel] CHECK CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId10]
GO
ALTER TABLE [dbo].[CheckBoxModel]  WITH CHECK ADD  CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId2] FOREIGN KEY([ListErrorId2])
REFERENCES [dbo].[ListError] ([Id])
GO
ALTER TABLE [dbo].[CheckBoxModel] CHECK CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId2]
GO
ALTER TABLE [dbo].[CheckBoxModel]  WITH CHECK ADD  CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId3] FOREIGN KEY([ListErrorId3])
REFERENCES [dbo].[ListError] ([Id])
GO
ALTER TABLE [dbo].[CheckBoxModel] CHECK CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId3]
GO
ALTER TABLE [dbo].[CheckBoxModel]  WITH CHECK ADD  CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId4] FOREIGN KEY([ListErrorId4])
REFERENCES [dbo].[ListError] ([Id])
GO
ALTER TABLE [dbo].[CheckBoxModel] CHECK CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId4]
GO
ALTER TABLE [dbo].[CheckBoxModel]  WITH CHECK ADD  CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId5] FOREIGN KEY([ListErrorId5])
REFERENCES [dbo].[ListError] ([Id])
GO
ALTER TABLE [dbo].[CheckBoxModel] CHECK CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId5]
GO
ALTER TABLE [dbo].[CheckBoxModel]  WITH CHECK ADD  CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId6] FOREIGN KEY([ListErrorId6])
REFERENCES [dbo].[ListError] ([Id])
GO
ALTER TABLE [dbo].[CheckBoxModel] CHECK CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId6]
GO
ALTER TABLE [dbo].[CheckBoxModel]  WITH CHECK ADD  CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId7] FOREIGN KEY([ListErrorId7])
REFERENCES [dbo].[ListError] ([Id])
GO
ALTER TABLE [dbo].[CheckBoxModel] CHECK CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId7]
GO
ALTER TABLE [dbo].[CheckBoxModel]  WITH CHECK ADD  CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId8] FOREIGN KEY([ListErrorId8])
REFERENCES [dbo].[ListError] ([Id])
GO
ALTER TABLE [dbo].[CheckBoxModel] CHECK CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId8]
GO
ALTER TABLE [dbo].[CheckBoxModel]  WITH CHECK ADD  CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId9] FOREIGN KEY([ListErrorId9])
REFERENCES [dbo].[ListError] ([Id])
GO
ALTER TABLE [dbo].[CheckBoxModel] CHECK CONSTRAINT [FK_CheckBoxModel_ListError_ListErrorId9]
GO
ALTER TABLE [dbo].[ErrorsFP]  WITH CHECK ADD  CONSTRAINT [FK_ErrorsFP_FirstPlayer_FirstPlayerId] FOREIGN KEY([FirstPlayerId])
REFERENCES [dbo].[FirstPlayer] ([Id])
GO
ALTER TABLE [dbo].[ErrorsFP] CHECK CONSTRAINT [FK_ErrorsFP_FirstPlayer_FirstPlayerId]
GO
ALTER TABLE [dbo].[ErrorsSP]  WITH CHECK ADD  CONSTRAINT [FK_ErrorsSP_SecondPlayer_SecondPlayerId] FOREIGN KEY([SecondPlayerId])
REFERENCES [dbo].[SecondPlayer] ([Id])
GO
ALTER TABLE [dbo].[ErrorsSP] CHECK CONSTRAINT [FK_ErrorsSP_SecondPlayer_SecondPlayerId]
GO
ALTER TABLE [dbo].[FirstPlayer]  WITH CHECK ADD  CONSTRAINT [FK_FirstPlayer_Match_MatchId] FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([Id])
GO
ALTER TABLE [dbo].[FirstPlayer] CHECK CONSTRAINT [FK_FirstPlayer_Match_MatchId]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_AspNetUsers_UserProfileId] FOREIGN KEY([UserProfileId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_AspNetUsers_UserProfileId]
GO
ALTER TABLE [dbo].[MatchDetails]  WITH CHECK ADD  CONSTRAINT [FK_MatchDetails_Match_MatchId] FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([Id])
GO
ALTER TABLE [dbo].[MatchDetails] CHECK CONSTRAINT [FK_MatchDetails_Match_MatchId]
GO
ALTER TABLE [dbo].[pointListFP]  WITH CHECK ADD  CONSTRAINT [FK_pointListFP_ErrorsFP_ErrorsFPId] FOREIGN KEY([ErrorsFPId])
REFERENCES [dbo].[ErrorsFP] ([Id])
GO
ALTER TABLE [dbo].[pointListFP] CHECK CONSTRAINT [FK_pointListFP_ErrorsFP_ErrorsFPId]
GO
ALTER TABLE [dbo].[pointListSP]  WITH CHECK ADD  CONSTRAINT [FK_pointListSP_ErrorsSP_ErrorsSPId] FOREIGN KEY([ErrorsSPId])
REFERENCES [dbo].[ErrorsSP] ([Id])
GO
ALTER TABLE [dbo].[pointListSP] CHECK CONSTRAINT [FK_pointListSP_ErrorsSP_ErrorsSPId]
GO
ALTER TABLE [dbo].[ReportStats]  WITH CHECK ADD  CONSTRAINT [FK_ReportStats_Match_MatchId] FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([Id])
GO
ALTER TABLE [dbo].[ReportStats] CHECK CONSTRAINT [FK_ReportStats_Match_MatchId]
GO
ALTER TABLE [dbo].[SecondPlayer]  WITH CHECK ADD  CONSTRAINT [FK_SecondPlayer_Match_MatchId] FOREIGN KEY([MatchId])
REFERENCES [dbo].[Match] ([Id])
GO
ALTER TABLE [dbo].[SecondPlayer] CHECK CONSTRAINT [FK_SecondPlayer_Match_MatchId]
GO
USE [master]
GO
ALTER DATABASE [Player] SET  READ_WRITE 
GO
