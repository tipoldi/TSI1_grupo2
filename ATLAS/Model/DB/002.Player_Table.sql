/*
   viernes, 02 de mayo de 201404:53:03 a.m.
   User: 
   Server: MOHAWK\SQLEXPRESS
   Database: Platform
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Player
	(
	PlayerID bigint NOT NULL IDENTITY (1, 1),
	Nick varchar(50) NOT NULL,
	Hash varchar(200) NOT NULL,
	Salt varchar(50) NOT NULL,
	Email varchar(100) NOT NULL,
	State int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Player ADD CONSTRAINT
	DF_Player_Nick DEFAULT '("")' FOR Nick
GO
ALTER TABLE dbo.Player ADD CONSTRAINT
	DF_Player_Hash DEFAULT '("")' FOR Hash
GO
ALTER TABLE dbo.Player ADD CONSTRAINT
	DF_Player_Salt DEFAULT '("")' FOR Salt
GO
ALTER TABLE dbo.Player ADD CONSTRAINT
	DF_Player_Email DEFAULT '("")' FOR Email
GO
ALTER TABLE dbo.Player ADD CONSTRAINT
	DF_Player_State DEFAULT ((0)) FOR State
GO
ALTER TABLE dbo.Player ADD CONSTRAINT
	PK_Player PRIMARY KEY CLUSTERED 
	(
	PlayerID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Player ADD CONSTRAINT
	UK_Nick UNIQUE NONCLUSTERED 
	(
	Nick
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Player ADD CONSTRAINT
	UK_Email UNIQUE NONCLUSTERED 
	(
	Email
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Player SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Player', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Player', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Player', 'Object', 'CONTROL') as Contr_Per 