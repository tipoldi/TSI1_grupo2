/*
   lunes, 12 de mayo de 20140:14:41
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
CREATE TABLE dbo.BuildingType
	(
	Id bigint NOT NULL,
	Name varchar(100) NOT NULL,
	Duration numeric(10, 0) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.BuildingType ADD CONSTRAINT
	DF_BuildingType_Name DEFAULT '' FOR Name
GO
ALTER TABLE dbo.BuildingType ADD CONSTRAINT
	DF_BuildingType_Duration DEFAULT 0 FOR Duration
GO
ALTER TABLE dbo.BuildingType ADD CONSTRAINT
	PK_BuildingType PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.BuildingType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.BuildingType', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.BuildingType', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.BuildingType', 'Object', 'CONTROL') as Contr_Per 