/*
   lunes, 12 de mayo de 20142:21:48
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
CREATE TABLE dbo.Price
	(
	IdElement bigint NOT NULL,
	IdResource bigint NOT NULL,
	Amount numeric(18, 0) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Price ADD CONSTRAINT
	DF_Price_Amount DEFAULT 0 FOR Amount
GO
ALTER TABLE dbo.Price ADD CONSTRAINT
	PK_Price PRIMARY KEY CLUSTERED 
	(
	IdElement,
	IdResource
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Price SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Price', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Price', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Price', 'Object', 'CONTROL') as Contr_Per 