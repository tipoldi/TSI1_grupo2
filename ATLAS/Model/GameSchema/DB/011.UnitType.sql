/*
   lunes, 12 de mayo de 20140:45:51
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
CREATE TABLE dbo.UnitType
	(
	Id bigint NOT NULL,
	Name varchar(100) NOT NULL,
	Duration numeric(10, 0) NOT NULL,
	Attack numeric(18, 2) NOT NULL,
	Defense numeric(18, 2) NOT NULL,
	Health numeric(18, 2) NOT NULL,
	MoveSpeed numeric(18, 2) NOT NULL,
	LootCapacity numeric(18, 2) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.UnitType ADD CONSTRAINT
	DF_UnitType_Name DEFAULT '' FOR Name
GO
ALTER TABLE dbo.UnitType ADD CONSTRAINT
	DF_UnitType_Duration DEFAULT 0 FOR Duration
GO
ALTER TABLE dbo.UnitType ADD CONSTRAINT
	DF_UnitType_Attack DEFAULT 0 FOR Attack
GO
ALTER TABLE dbo.UnitType ADD CONSTRAINT
	DF_UnitType_Defense DEFAULT 0 FOR Defense
GO
ALTER TABLE dbo.UnitType ADD CONSTRAINT
	DF_UnitType_Health DEFAULT 0 FOR Health
GO
ALTER TABLE dbo.UnitType ADD CONSTRAINT
	DF_UnitType_MoveSpeed DEFAULT 0 FOR MoveSpeed
GO
ALTER TABLE dbo.UnitType ADD CONSTRAINT
	DF_UnitType_LootCapacity DEFAULT 0 FOR LootCapacity
GO
ALTER TABLE dbo.UnitType ADD CONSTRAINT
	PK_UnitType PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.UnitType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.UnitType', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.UnitType', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.UnitType', 'Object', 'CONTROL') as Contr_Per 