/*
   lunes, 12 de mayo de 20142:38:27
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
CREATE TABLE dbo.ActionType
	(
	Id bigint NOT NULL IDENTITY (1, 1),
	Name varchar(100) NOT NULL,
	Allowed int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ActionType ADD CONSTRAINT
	DF_ActionType_Name DEFAULT '' FOR Name
GO
ALTER TABLE dbo.ActionType ADD CONSTRAINT
	DF_ActionType_Allowed DEFAULT 0 FOR Allowed
GO
ALTER TABLE dbo.ActionType ADD CONSTRAINT
	PK_ActionType PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ActionType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.ActionType', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ActionType', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ActionType', 'Object', 'CONTROL') as Contr_Per 