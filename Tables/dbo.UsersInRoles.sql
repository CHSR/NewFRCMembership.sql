CREATE TABLE [dbo].[UsersInRoles]
(
[Username] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Rolename] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ApplicationName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ProgramFK] [int] NOT NULL,
[ProgramSiteFK] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UsersInRoles] ADD CONSTRAINT [PK_UsersInRoles] PRIMARY KEY CLUSTERED  ([Username], [Rolename], [ApplicationName], [ProgramFK], [ProgramSiteFK]) ON [PRIMARY]
GO
