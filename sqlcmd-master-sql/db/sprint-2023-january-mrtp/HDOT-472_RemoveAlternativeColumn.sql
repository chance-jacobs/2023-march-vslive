ALTER TABLE [dbo].[ProgramProjectAlternative] DROP CONSTRAINT [FK_AlternativeType_ProgramProjectAlternative]
GO

ALTER TABLE dbo.ProgramProjectAlternative DROP COLUMN AlternativeTypeId 
GO

ALTER TABLE dbo.ProgramProjectAlternative ADD IsNoBuild BIT NOT NULL 
GO

ALTER TABLE dbo.ProgramProjectAlternative ADD CONSTRAINT [DF_ProgramProjectAlternative_IsNoBuild] DEFAULT(0) FOR [IsNoBuild]
GO

ALTER TABLE dbo.ProgramProjectAlternative ADD Title nvarchar(255) NOT NULL
GO

DROP TABLE dbo.AlternativeType