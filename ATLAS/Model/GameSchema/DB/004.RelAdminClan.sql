/*
   domingo, 11 de mayo de 201423:16:36
   User: 
   Server: NICO-PC
   Database: PRUEBA
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
ALTER TABLE dbo.Player SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Player', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Player', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Player', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Clan SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Clan', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Clan', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Clan', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.RelAdminClan ADD CONSTRAINT
	FK_RelAdminClan_Player FOREIGN KEY
	(
	IdPlayer
	) REFERENCES dbo.Player
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.RelAdminClan ADD CONSTRAINT
	FK_RelAdminClan_Clan FOREIGN KEY
	(
	IdClan
	) REFERENCES dbo.Clan
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.RelAdminClan SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.RelAdminClan', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.RelAdminClan', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.RelAdminClan', 'Object', 'CONTROL') as Contr_Per 