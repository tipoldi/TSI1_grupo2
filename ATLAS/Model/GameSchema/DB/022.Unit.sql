/*
   lunes, 12 de mayo de 20144:08:05
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
CREATE TABLE dbo.Unit
	(
	Id bigint NOT NULL,
	IdType bigint NOT NULL,
	Attack numeric(18, 2) NOT NULL,
	Defense numeric(18, 2) NOT NULL,
	Heath numeric(18, 2) NOT NULL,
	MoveSpeed numeric(18, 2) NOT NULL,
	Loot numeric(18, 2) NOT NULL,
	Available varchar(1) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Unit ADD CONSTRAINT
	DF_Unit_Attack DEFAULT 0 FOR Attack
GO
ALTER TABLE dbo.Unit ADD CONSTRAINT
	DF_Unit_Defense DEFAULT 0 FOR Defense
GO
ALTER TABLE dbo.Unit ADD CONSTRAINT
	DF_Unit_Heath DEFAULT 0 FOR Heath
GO
ALTER TABLE dbo.Unit ADD CONSTRAINT
	DF_Unit_MoveSpeed DEFAULT 0 FOR MoveSpeed
GO
ALTER TABLE dbo.Unit ADD CONSTRAINT
	DF_Unit_Loot DEFAULT 0 FOR Loot
GO
ALTER TABLE dbo.Unit ADD CONSTRAINT
	DF_Unit_Available DEFAULT 'Y' FOR Available
GO
ALTER TABLE dbo.Unit ADD CONSTRAINT
	PK_Unit PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Unit SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Unit', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Unit', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Unit', 'Object', 'CONTROL') as Contr_Per 