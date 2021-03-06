/*
   lunes, 12 de mayo de 20142:00:00
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
ALTER TABLE dbo.ElementType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.ElementType', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ElementType', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ElementType', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.TechnologyType ADD CONSTRAINT
	FK_TechnologyType_ElementType FOREIGN KEY
	(
	Id
	) REFERENCES dbo.ElementType
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.TechnologyType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.TechnologyType', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.TechnologyType', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.TechnologyType', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.ResourceType ADD CONSTRAINT
	FK_ResourceType_ElementType FOREIGN KEY
	(
	Id
	) REFERENCES dbo.ElementType
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ResourceType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.ResourceType', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ResourceType', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ResourceType', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.UnitType ADD CONSTRAINT
	FK_UnitType_ElementType FOREIGN KEY
	(
	Id
	) REFERENCES dbo.ElementType
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.UnitType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.UnitType', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.UnitType', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.UnitType', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.BuildingType ADD CONSTRAINT
	FK_BuildingType_ElementType FOREIGN KEY
	(
	Id
	) REFERENCES dbo.ElementType
	(
	Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.BuildingType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.BuildingType', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.BuildingType', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.BuildingType', 'Object', 'CONTROL') as Contr_Per 