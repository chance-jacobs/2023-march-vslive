--1. Update ProgramProjectSecondaryProgramSubCategory

DELETE FROM [dbo].[ProgramProjectSecondaryProgramSubCategory]
ALTER TABLE [dbo].[ProgramProjectSecondaryProgramSubCategory] DROP COLUMN [Amount]
ALTER TABLE [dbo].[ProgramProjectSecondaryProgramSubCategory] DROP CONSTRAINT [PK_ProgramProjectSecondaryProgramSubCategory]
ALTER TABLE [dbo].[ProgramProjectSecondaryProgramSubCategory] DROP CONSTRAINT [FK_ProgramProject_ProgramProjectSecondaryProgramSubCategory]

ALTER TABLE [dbo].[ProgramProjectSecondaryProgramSubCategory] DROP COLUMN [ProgramProjectId]
ALTER TABLE [dbo].[ProgramProjectSecondaryProgramSubCategory] ADD [ProgramProjectSecondaryProgramCategoryId] [uniqueidentifier] NOT NULL

ALTER TABLE [dbo].[ProgramProjectSecondaryProgramSubCategory] ADD CONSTRAINT [PK_ProgramProjectSecondaryProgramSubCategory] PRIMARY KEY CLUSTERED 
(
	[ProgramProjectSecondaryProgramCategoryId] ASC,
	[ProgramSubCategoryId] ASC
)


--2. Create ProgramProjectSecondaryProgramCategory

/****** Object:  Table [dbo].[ProgramProjectSecondaryProgramCategory]    Script Date: 2/2/2023 10:24:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProgramProjectSecondaryProgramCategory](
	[ProgramProjectSecondaryProgramCategoryId] [uniqueidentifier] NOT NULL,
	[ProgramProjectId] [uniqueidentifier] NOT NULL,
	[ProgramCategoryId] [uniqueidentifier] NOT NULL,
	[Amount] [tinyint] NULL,
 CONSTRAINT [PK_ProgramProjectSecondaryProgramCategory] PRIMARY KEY CLUSTERED 
(
	[ProgramProjectId] ASC,
	[ProgramCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_ProgramProjectSecondaryProgramCategory] UNIQUE NONCLUSTERED 
(
	[ProgramProjectSecondaryProgramCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProgramProjectSecondaryProgramCategory] ADD CONSTRAINT [DF_ProgramProjectSecondaryProgramCategory_ProgramProjectSecondaryProgramCategoryId] DEFAULT (newsequentialid()) FOR [ProgramProjectSecondaryProgramCategoryId]
GO

ALTER TABLE [dbo].[ProgramProjectSecondaryProgramCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProgramCategory_ProgramProjectSecondaryProgramCategory] FOREIGN KEY([ProgramCategoryId])
REFERENCES [dbo].[ProgramCategory] ([ProgramCategoryId])
GO

ALTER TABLE [dbo].[ProgramProjectSecondaryProgramCategory] CHECK CONSTRAINT [FK_ProgramCategory_ProgramProjectSecondaryProgramCategory]
GO

ALTER TABLE [dbo].[ProgramProjectSecondaryProgramCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProgramProject_ProgramProjectSecondaryProgramCategory] FOREIGN KEY([ProgramProjectId])
REFERENCES [dbo].[ProgramProject] ([ProgramProjectId])
GO

ALTER TABLE [dbo].[ProgramProjectSecondaryProgramCategory] CHECK CONSTRAINT [FK_ProgramProject_ProgramProjectSecondaryProgramCategory]
GO


--3. Add join
ALTER TABLE [dbo].[ProgramProjectSecondaryProgramSubCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProgramProjectSecondaryProgramSubCategory_ProgramProjectSecondaryProgramCategory] FOREIGN KEY([ProgramProjectSecondaryProgramCategoryId])
REFERENCES [dbo].[ProgramProjectSecondaryProgramCategory] ([ProgramProjectSecondaryProgramCategoryId])
GO
