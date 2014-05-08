/*
   miércoles, 07 de mayo de 201412:23:17 a.m.
   User: 
   Server: MOHAWK\SQLEXPRESS
   Database: Juego2
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
CREATE TABLE dbo.Clan
	(
	ClanID bigint NOT NULL IDENTITY (1, 1),
	Name varchar(100) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Clan ADD CONSTRAINT
	DF_Clan_Name DEFAULT ('') FOR Name
GO
ALTER TABLE dbo.Clan ADD CONSTRAINT
	PK_Clan PRIMARY KEY CLUSTERED 
	(
	ClanID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Clan ADD CONSTRAINT
	UK_Clan UNIQUE NONCLUSTERED 
	(
	Name
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Clan SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Clan', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Clan', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Clan', 'Object', 'CONTROL') as Contr_Per 