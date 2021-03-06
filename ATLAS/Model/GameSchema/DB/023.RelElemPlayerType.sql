/*
   lunes, 12 de mayo de 20144:12:30
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
ALTER TABLE dbo.UnitType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.UnitType', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.UnitType', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.UnitType', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Unit ADD CONSTRAINT
	FK_Unit_UnitType FOREIGN KEY
	(
	IdType
	) REFERENCES dbo.UnitType
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Unit SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Unit', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Unit', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Unit', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.TechnologyType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.TechnologyType', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.TechnologyType', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.TechnologyType', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Technology ADD CONSTRAINT
	FK_Technology_TechnologyType FOREIGN KEY
	(
	IdType
	) REFERENCES dbo.TechnologyType
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Technology SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Technology', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Technology', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Technology', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.ResourceType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.ResourceType', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ResourceType', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ResourceType', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Resource ADD CONSTRAINT
	FK_Resource_ResourceType FOREIGN KEY
	(
	IdType
	) REFERENCES dbo.ResourceType
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Resource SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Resource', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Resource', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Resource', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.BuildingType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.BuildingType', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.BuildingType', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.BuildingType', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Building ADD CONSTRAINT
	FK_Building_BuildingType FOREIGN KEY
	(
	IdType
	) REFERENCES dbo.BuildingType
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Building SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Building', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Building', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Building', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Element ADD CONSTRAINT
	FK_Element_Player FOREIGN KEY
	(
	IdPlayer
	) REFERENCES dbo.Player
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Element ADD CONSTRAINT
	FK_Element_Unit FOREIGN KEY
	(
	Id
	) REFERENCES dbo.Unit
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Element ADD CONSTRAINT
	FK_Element_Resource FOREIGN KEY
	(
	Id
	) REFERENCES dbo.Resource
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Element ADD CONSTRAINT
	FK_Element_Building FOREIGN KEY
	(
	Id
	) REFERENCES dbo.Building
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Element ADD CONSTRAINT
	FK_Element_Technology FOREIGN KEY
	(
	Id
	) REFERENCES dbo.Technology
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Element SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Element', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Element', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Element', 'Object', 'CONTROL') as Contr_Per 