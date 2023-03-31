INSERT INTO [dbo].[Scenario] ([ScenarioName] ,[Description] ,[StatusId] ,[IsDefault] ,[CreatedBy] ,[CreatedDate]) VALUES ('Base Scenario' ,'Base Scenario' ,(select statusid from status where statusname = 'Unknown_Status') ,1 ,'Data Load' ,GetDate())
GO


