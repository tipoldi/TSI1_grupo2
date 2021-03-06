/*
   viernes, 02 de mayo de 201401:28:32 p.m.
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
ALTER TABLE dbo.Player
	DROP CONSTRAINT DF_Player_Hash
GO
ALTER TABLE dbo.Player
	DROP CONSTRAINT DF_Player_Salt
GO
ALTER TABLE dbo.Player
	DROP CONSTRAINT DF_Player_Email
GO
ALTER TABLE dbo.Player ADD CONSTRAINT
	DF_Player_Hash DEFAULT ('') FOR Hash
GO
ALTER TABLE dbo.Player ADD CONSTRAINT
	DF_Player_Salt DEFAULT ('') FOR Salt
GO
ALTER TABLE dbo.Player ADD CONSTRAINT
	DF_Player_Email DEFAULT ('') FOR Email
GO
ALTER TABLE dbo.Player SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Player', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Player', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Player', 'Object', 'CONTROL') as Contr_Per 