USE [PRUEBA]
GO

/****** Object:  Table [dbo].[TechnologyType]    Script Date: 12/05/2014 0:34:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TechnologyType](
	[Id] [bigint] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Duration] [numeric](10, 0) NOT NULL,
 CONSTRAINT [PK_TechnologyType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[TechnologyType] ADD  CONSTRAINT [DF_TechnologyType_Name]  DEFAULT ('') FOR [Name]
GO

ALTER TABLE [dbo].[TechnologyType] ADD  CONSTRAINT [DF_TechnologyType_Duration]  DEFAULT ((0)) FOR [Duration]
GO

