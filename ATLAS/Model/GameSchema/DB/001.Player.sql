/*
   sábado, 10 de mayo de 201421:37:50
   User: 
   Server: NICO-PC
   Database: Platform
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
CREATE TABLE dbo.Player
	(
	Id bigint NOT NULL IDENTITY (1, 1),
	Nombre varchar(100) NOT NULL,
	EMail varchar(100) NOT NULL UNIQUE,
	Edad numeric(2, 0) NOT NULL,
	Puntos bigint NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Player ADD CONSTRAINT
	DF_Player_Nombre DEFAULT '' FOR Nombre
GO
ALTER TABLE dbo.Player ADD CONSTRAINT
	DF_Player_EMail DEFAULT '' FOR EMail
GO
ALTER TABLE dbo.Player ADD CONSTRAINT
	DF_Player_Edad DEFAULT 0 FOR Edad
GO
ALTER TABLE dbo.Player ADD CONSTRAINT
	DF_Player_Puntos DEFAULT '' FOR Puntos
GO
ALTER TABLE dbo.Player ADD CONSTRAINT
	PK_Player PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Player SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
