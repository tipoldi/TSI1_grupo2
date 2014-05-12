USE [PRUEBA]
GO

/****** Object:  Table [dbo].[Action]    Script Date: 12/05/2014 5:36:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Action](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdPlayer1] [bigint] NOT NULL,
	[IdPlayer2] [bigint] NOT NULL,
	[IdType] [bigint] NOT NULL,
	[EndTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Action] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Action]  WITH CHECK ADD  CONSTRAINT [FK_Action_ActionType] FOREIGN KEY([IdType])
REFERENCES [dbo].[ActionType] ([Id])
GO

ALTER TABLE [dbo].[Action] CHECK CONSTRAINT [FK_Action_ActionType]
GO

ALTER TABLE [dbo].[Action]  WITH CHECK ADD  CONSTRAINT [FK_Action_Player] FOREIGN KEY([IdPlayer1])
REFERENCES [dbo].[Player] ([Id])
GO

ALTER TABLE [dbo].[Action] CHECK CONSTRAINT [FK_Action_Player]
GO

ALTER TABLE [dbo].[Action]  WITH CHECK ADD  CONSTRAINT [FK_Action_Player1] FOREIGN KEY([IdPlayer2])
REFERENCES [dbo].[Player] ([Id])
GO

ALTER TABLE [dbo].[Action] CHECK CONSTRAINT [FK_Action_Player1]
GO

