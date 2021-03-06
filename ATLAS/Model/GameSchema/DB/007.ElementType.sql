/*
   lunes, 12 de mayo de 20140:00:28
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
CREATE TABLE dbo.ElementType
	(
	Id bigint NOT NULL IDENTITY (1, 1),
	Name varchar(100) NOT NULL,
	ElementType varchar(1) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ElementType ADD CONSTRAINT
	DF_ElementType_Name DEFAULT '' FOR Name
GO
ALTER TABLE dbo.ElementType ADD CONSTRAINT
	DF_ElementType_ElementType DEFAULT 'U' FOR ElementType
GO
ALTER TABLE dbo.ElementType ADD CONSTRAINT
	PK_ElementType PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ElementType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.ElementType', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.ElementType', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.ElementType', 'Object', 'CONTROL') as Contr_Per 