/*
   viernes, 02 de mayo de 201404:53:32 a.m.
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
ALTER TABLE dbo.Game ADD CONSTRAINT
	DF_Game_Name DEFAULT '("")' FOR Name
GO
ALTER TABLE dbo.Game ADD CONSTRAINT
	DF_Game_URL DEFAULT '("")' FOR URL
GO
ALTER TABLE dbo.Game SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Game', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Game', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Game', 'Object', 'CONTROL') as Contr_Per 