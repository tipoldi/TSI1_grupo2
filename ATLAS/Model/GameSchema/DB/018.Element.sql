USE [PRUEBA]
GO

/****** Object:  Table [dbo].[Element]    Script Date: 12/05/2014 5:28:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Element](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdPlayer] [bigint] NOT NULL,
	[ElementType] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Element_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Element] ADD  CONSTRAINT [DF_Element_ElementType]  DEFAULT ('U') FOR [ElementType]
GO

ALTER TABLE [dbo].[Element]  WITH CHECK ADD  CONSTRAINT [FK_Element_Building] FOREIGN KEY([Id])
REFERENCES [dbo].[Building] ([Id])
GO

ALTER TABLE [dbo].[Element] CHECK CONSTRAINT [FK_Element_Building]
GO

ALTER TABLE [dbo].[Element]  WITH CHECK ADD  CONSTRAINT [FK_Element_Player] FOREIGN KEY([IdPlayer])
REFERENCES [dbo].[Player] ([Id])
GO

ALTER TABLE [dbo].[Element] CHECK CONSTRAINT [FK_Element_Player]
GO

ALTER TABLE [dbo].[Element]  WITH CHECK ADD  CONSTRAINT [FK_Element_Resource] FOREIGN KEY([Id])
REFERENCES [dbo].[Resource] ([Id])
GO

ALTER TABLE [dbo].[Element] CHECK CONSTRAINT [FK_Element_Resource]
GO

ALTER TABLE [dbo].[Element]  WITH CHECK ADD  CONSTRAINT [FK_Element_Technology] FOREIGN KEY([Id])
REFERENCES [dbo].[Technology] ([Id])
GO

ALTER TABLE [dbo].[Element] CHECK CONSTRAINT [FK_Element_Technology]
GO

ALTER TABLE [dbo].[Element]  WITH CHECK ADD  CONSTRAINT [FK_Element_Unit] FOREIGN KEY([Id])
REFERENCES [dbo].[Unit] ([Id])
GO

ALTER TABLE [dbo].[Element] CHECK CONSTRAINT [FK_Element_Unit]
GO

