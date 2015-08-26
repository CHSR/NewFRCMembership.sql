SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Chris Papas
-- Create date: <03/23/2015>
-- Description:	<reads the last userid created and adds first userinrole record
-- =============================================
create PROCEDURE [dbo].[spAddFormReview_userTrigger](@username AS VARCHAR(200), @Rolename AS VARCHAR(200), @ApplicationName AS VARCHAR(2), @ProgramFK AS INT, @ProgramSiteFK AS INT)
	
	AS

BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.UsersInRoles
	        ( Username ,
	          Rolename ,
	          ApplicationName ,
	          ProgramFK ,
	          ProgramSiteFK
	        )
	VALUES  ( @username , -- Username - varchar(255)
	          @Rolename , -- Rolename - varchar(255)
	          @ApplicationName , -- ApplicationName - varchar(255)
	          @ProgramFK , -- ProgramFK - int
	          @ProgramSiteFK  -- ProgramSiteFK - int
	        )
END
GO
