USE [PRUEBA]
GO

/****** Object:  Table [dbo].[RelActionElem]    Script Date: 12/05/2014 5:36:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RelActionElem](
	[IdAction] [bigint] NOT NULL,
	[IdElement] [bigint] NOT NULL,
	[Amount] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_RelActionElem] PRIMARY KEY CLUSTERED 
(
	[IdAction] ASC,
	[IdElement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RelActionElem] ADD  CONSTRAINT [DF_RelActionElem_Amount]  DEFAULT ((0)) FOR [Amount]
GO

ALTER TABLE [dbo].[RelActionElem]  WITH CHECK ADD  CONSTRAINT [FK_RelActionElem_Action] FOREIGN KEY([IdAction])
REFERENCES [dbo].[Action] ([Id])
GO

ALTER TABLE [dbo].[RelActionElem] CHECK CONSTRAINT [FK_RelActionElem_Action]
GO

ALTER TABLE [dbo].[RelActionElem]  WITH CHECK ADD  CONSTRAINT [FK_RelActionElem_Element] FOREIGN KEY([IdElement])
REFERENCES [dbo].[Element] ([Id])
GO

ALTER TABLE [dbo].[RelActionElem] CHECK CONSTRAINT [FK_RelActionElem_Element]
GO

