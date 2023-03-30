CREATE TABLE [dbo].[HdotDistrict](
	[HdotDistrictId] [uniqueidentifier] NOT NULL,
	[HdotDistrictName] [nvarchar](100) NOT NULL,
	[Color] [char](6) NULL,
	[CreatedBy] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[SortOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_HdotDistrict] PRIMARY KEY CLUSTERED 
(
	[HdotDistrictName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_HdotDistrict] UNIQUE NONCLUSTERED 
(
	[HdotDistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[HdotDistrict] ADD CONSTRAINT [DF_HdotDistrict_HdotDistrictId] DEFAULT (newsequentialid()) FOR [HdotDistrictId]
GO

ALTER TABLE [dbo].[HdotDistrict] ADD CONSTRAINT [DF_HdotDistrict_IsActive] DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [Island]
ADD HdotDistrictId [uniqueidentifier] NULL
GO

ALTER TABLE [Island]  WITH CHECK ADD  CONSTRAINT [FK_HdotDistrict_Island] FOREIGN KEY(HdotDistrictId)
REFERENCES [dbo].HdotDistrict (HdotDistrictId)
GO

ALTER TABLE [Island] CHECK CONSTRAINT [FK_HdotDistrict_Island]
GO

INSERT INTO [dbo].[HdotDistrict]
([HdotDistrictName],[Color],[CreatedBy]
,[CreatedDate],[SortOrder],[IsActive])
VALUES('Statewide','8E2E98','DataLoad',getdate(),1,1)
GO

INSERT INTO [dbo].[HdotDistrict]
([HdotDistrictName],[Color],[CreatedBy]
,[CreatedDate],[SortOrder],[IsActive])
VALUES('Hawaii','D02C90','DataLoad',getdate(),2,1)
GO

INSERT INTO [dbo].[HdotDistrict]
([HdotDistrictName],[Color],[CreatedBy]
,[CreatedDate],[SortOrder],[IsActive])
VALUES('Kauai','902F9B','DataLoad',getdate(),3,1)
GO

INSERT INTO [dbo].[HdotDistrict]
([HdotDistrictName],[Color],[CreatedBy]
,[CreatedDate],[SortOrder],[IsActive])
VALUES('Maui','FDAD7B','DataLoad',getdate(),4,1)
GO

INSERT INTO [dbo].[HdotDistrict]
([HdotDistrictName],[Color],[CreatedBy]
,[CreatedDate],[SortOrder],[IsActive])
VALUES('Oahu','FFE573','DataLoad',getdate(),5,1)
GO

UPDATE I
SET I.[HdotDistrictId]=D.[HdotDistrictId]
FROM HdotDistrict D
LEFT JOIN [Island] I
ON I.IslandName=d.HdotDistrictName

GO

UPDATE  I
SET I.[HdotDistrictId]=(Select [HdotDistrictId] from HdotDistrict where HdotDistrictName='Maui')
FROM [Island] I
WHERE I.IslandName in ('Lanai','Molokai')

ALTER TABLE Island ALTER COLUMN HdotDistrictId [uniqueidentifier] NOT NULL;
