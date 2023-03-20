CREATE TABLE [dbo].[Users]
(
[PKID] [uniqueidentifier] NOT NULL,
[Username] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ApplicationName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Email] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Comment] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Password] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PasswordQuestion] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PasswordAnswer] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsApproved] [bit] NULL,
[LastActivityDate] [datetime] NULL,
[LastLoginDate] [datetime] NULL,
[LastPasswordChangedDate] [datetime] NULL,
[CreationDate] [datetime] NULL,
[IsOnLine] [bit] NULL,
[IsLockedOut] [bit] NULL,
[LastLockedOutDate] [datetime] NULL,
[FailedPasswordAttemptCount] [int] NULL,
[FailedPasswordAttemptWindowStart] [datetime] NULL,
[FailedPasswordAnswerAttemptCount] [int] NULL,
[FailedPasswordAnswerAttemptWindowStart] [datetime] NULL,
[Program] [int] NULL,
[ProgramSite] [int] NULL,
[Role] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[isVerified] [bit] NOT NULL CONSTRAINT [DF__Users__isVerifie__47DBAE45] DEFAULT ((0)),
[verifycode] [varchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[verifiedDate] [datetime] NOT NULL CONSTRAINT [DF__Users__verifiedD__6E01572D] DEFAULT ('9/9/1999'),
[isUsing2Factor] [bit] NOT NULL CONSTRAINT [DF__Users__isUsing2F__01142BA1] DEFAULT ((0))
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[add_userrole]
on [dbo].[Users]
After insert

AS

Declare @UserName AS VARCHAR(200)
Declare @Rolename AS VARCHAR(200)
Declare @ApplicationName AS VARCHAR(2)
DECLARE @ProgramFK AS INT
DECLARE @ProgramSiteFK AS INT

set @UserName = (SELECT username from inserted)
set @Rolename = (SELECT Role from inserted)
SET @ApplicationName = '/'
SET @ProgramFK = (SELECT Program FROM inserted)
SET @ProgramSiteFK = (SELECT ProgramSite FROM inserted)


BEGIN
	EXEC spAddFormReview_userTrigger @UserName, @Rolename, @ApplicationName, @ProgramFK, @ProgramSiteFK
END
GO
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [PK__Users__0519C6AF] PRIMARY KEY CLUSTERED ([PKID]) ON [PRIMARY]
GO
