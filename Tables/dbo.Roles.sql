CREATE TABLE [dbo].[Roles]
(
[Rolename] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ApplicationName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Roles] ADD CONSTRAINT [PKRoles] PRIMARY KEY CLUSTERED  ([Rolename], [ApplicationName]) ON [PRIMARY]
GO
