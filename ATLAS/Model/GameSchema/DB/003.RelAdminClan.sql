/*
   domingo, 11 de mayo de 201422:33:58
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
CREATE TABLE dbo.RelAdminClan
	(
	IdClan bigint NOT NULL,
	IdPlayer bigint NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.RelAdminClan ADD CONSTRAINT
	PK_RelAdminClan PRIMARY KEY CLUSTERED 
	(
	IdClan,
	IdPlayer
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.RelAdminClan SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.RelAdminClan', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.RelAdminClan', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.RelAdminClan', 'Object', 'CONTROL') as Contr_Per 