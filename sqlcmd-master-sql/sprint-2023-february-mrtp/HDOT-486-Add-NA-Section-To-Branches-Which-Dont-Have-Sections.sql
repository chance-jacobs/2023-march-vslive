INSERT INTO [dbo].[Section]
(
    [BranchId],
    [SectionName],
    [Abbreviation],
    [CreatedBy],
    [CreatedDate],
    [SortOrder],
    [IsActive]
)
SELECT 
       B.BranchId,
       '(NA)' AS [SectionName],
       '(NA)' AS [Abbreviation],
       'DataLoad' AS [CreatedBy],
       GETUTCDATE() AS [CreatedDate],
       ROW_NUMBER() OVER (ORDER BY B.BranchId, SectionName) AS [SortOrder],
       1 AS [IsActive]
FROM [dbo].[Branch] B
    LEFT JOIN dbo.Section S
        ON S.BranchId = B.BranchId
WHERE S.SectionId IS NULL;
