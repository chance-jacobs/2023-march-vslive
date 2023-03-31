/*
HDOT-476
NMolathati
--https://jacobs-stratcon.atlassian.net/browse/HDOT-476
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PlanningDistrictIsland]') AND type in (N'U'))
DROP TABLE [dbo].[PlanningDistrictIsland]
GO

DELETE FROM ProjectPlanningDistrict
GO

DELETE FROM [dbo].[PlanningDistrict]
GO

ALTER TABLE [dbo].[PlanningDistrict]
ADD [IslandId] [uniqueidentifier] NULL
GO 

ALTER TABLE [dbo].[PlanningDistrict] 
ALTER Column [Color] CHAR(6) NOT NULL 
GO

ALTER TABLE [dbo].[PlanningDistrict]  WITH CHECK ADD  CONSTRAINT [FK_Island_PlanningDistrict] FOREIGN KEY([IslandId])
REFERENCES [dbo].[Island] ([IslandId])
GO

ALTER TABLE [dbo].[PlanningDistrict] CHECK CONSTRAINT [FK_Island_PlanningDistrict]
GO

IF OBJECT_ID('tempdb..#temptable') IS NOT NULL 
DROP TABLE #temptable
GO

CREATE TABLE #temptable
(IslandName nvarchar(255) NULL,PlanningDistrictName nvarchar(255) NULL, Color CHAR(6) Null)
GO

INSERT #temptable (IslandName, PlanningDistrictName, Color) 
VALUES (N'Hawaii', N'Hamakua','d5419b')
,(N'Hawaii', N'Kau','d956a6')
,(N'Hawaii', N'North Hilo','de6bb1')
,(N'Hawaii', N'North Kohala','e380bc')
,(N'Hawaii', N'North Kona','e896c8')
,(N'Hawaii', N'Puna','ecabd3')
,(N'Hawaii', N'South Hilo','f1c0de')
,(N'Hawaii', N'South Kohala','f6d5e9')
,(N'Hawaii', N'South Kona','faeaf4')
,(N'Kauai', N'Hanalei','9b44a5')
,(N'Kauai', N'Kawaihau','a659af')
,(N'Kauai', N'Koloa','b16db9')
,(N'Kauai', N'Lihue','bc82c3')
,(N'Kauai', N'Waimea','c897cd')
,(N'Lanai', N'Lanai','fd568a')
,(N'Maui', N'Hana','fdb588')
,(N'Maui', N'Lahaina','fdbd95')
,(N'Maui', N'Makawao','fec6a3')
,(N'Maui', N'Wailuku','feceb0')
,(N'Molokai', N'Molokai','fbf2d7')
,(N'Oahu', N'Ewa','ffe881')
,(N'Oahu', N'Honolulu','ffea8f')
,(N'Oahu', N'Koolauloa','ffed9d')
,(N'Oahu', N'Koolaupoko','ffefab')
,(N'Oahu', N'Wahiawa','fff2b9')
,(N'Oahu', N'Waialua','fff5c7')
,(N'Oahu', N'Waianae','fff7d5')
GO

INSERT INTO dbo.PlanningDistrict
(
    PlanningDistrictName,
    Color,
    CreatedBy,
    CreatedDate,
    ModifiedBy,
    ModifiedDate,
    SortOrder,
    IsActive,
    IslandId
)
SELECT PlanningDistrictName,
       PD.Color,
       'DataLoad' AS CreatedBy,
       GETUTCDATE() AS CreatedDate,
       NULL AS ModifiedBy,
       NULL AS ModifiedDate,
       ROW_NUMBER() OVER (ORDER BY I.IslandName, PlanningDistrictName) AS SortOrder,
       1 AS IsActive,
       I.IslandId
--,I.IslandName
FROM #temptable PD
    LEFT JOIN dbo.Island I
        ON I.IslandName = PD.IslandName;
GO

IF OBJECT_ID('tempdb..#temptable') IS NOT NULL 
DROP TABLE #temptable
GO