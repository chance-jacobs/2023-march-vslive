/*
Run this script on:

        (local).HawaiiDOT_MRTP_Dev    -  This database will be modified

to synchronize it with:

        USLAS0-SQL135TS.HawaiiDOT_MRTP_Dev

You are recommended to back up your database before running this script

Script created by SQL Compare version 14.7.8.21163 from Red Gate Software Ltd at 3/26/2023 6:14:48 PM

*/
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL Serializable
GO
BEGIN TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ProgramProjectStatusString]'
GO
-- =============================================
-- Author:		Matt Erker
-- Create date: 02/24/2023
-- Description:	Returns a string of the ProgramProject status
-- *** Any changes here must be also made in ProgramProjectDC.GetProgramProjectStatus
-- =============================================
CREATE   FUNCTION [dbo].[ProgramProjectStatusString] 
(
	-- Add the parameters for the function here
	@SubmittedDate datetime,
	@ApprovedDate datetime,
	@DeletedDate datetime,
	@RejectedDate datetime
)
RETURNS nvarchar(20)
AS
BEGIN
	DECLARE @returnValue nvarchar(20)

	IF @DeletedDate IS NOT NULL BEGIN
		SET @returnValue = 'Deleted'
	END ELSE IF @RejectedDate IS NOT NULL BEGIN 
		SET @returnValue =  'Draft'
	END ELSE IF @SubmittedDate IS NULL BEGIN
		SET @returnValue =  'Draft'
	END ELSE IF @SubmittedDate IS NOT NULL AND @ApprovedDate IS NULL BEGIN
		SET @returnValue =  'Submitted'
	END ELSE IF @ApprovedDate IS NOT NULL BEGIN
		SET @returnValue =  'Approved'
	END ELSE BEGIN
		SET @returnValue =  'None'
	END

	RETURN @returnValue
END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[udfNullableBooleanToYesNoBlank]'
GO

CREATE   FUNCTION [dbo].[udfNullableBooleanToYesNoBlank] 
(
	-- Add the parameters for the function here
	@inputValue bit
)
RETURNS nvarchar(10)
AS
BEGIN
	DECLARE @returnValue nvarchar(10)

	IF @inputValue IS NULL BEGIN
		SET @returnValue = '(blank)'
	END ELSE IF @inputValue = 1 BEGIN
		SET @returnValue = 'Yes'
	END ELSE BEGIN
		SET @returnValue =  'No'
	END

	RETURN @returnValue
END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[udfNullableStringToValueOrBlank]'
GO
-- =============================================
-- Author:		Matt Erker
-- Create date: 03/11/2023
-- Description:	If the input value is null then returns "(blank)" otherwise the input value
-- *** Any changes here must be also made in ProgramProjectRO.GetNullableString
-- =============================================
CREATE   FUNCTION [dbo].[udfNullableStringToValueOrBlank] 
(
	-- Add the parameters for the function here
	@inputString nvarchar(100)
)
RETURNS nvarchar(100)
AS
BEGIN
	DECLARE @returnValue nvarchar(100)

	IF @inputString IS NULL BEGIN
		SET @returnValue = '(blank)'
	END ELSE BEGIN
		SET @returnValue =  @inputString
	END

	RETURN @returnValue
END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[udfProgramProjectStatusString]'
GO
-- =============================================
-- Author:		Matt Erker
-- Create date: 02/24/2023
-- Description:	Returns a string of the ProgramProject status
-- *** Any changes here must be also made in ProgramProjectRO.GetProgramProjectStatus
-- =============================================
CREATE   FUNCTION [dbo].[udfProgramProjectStatusString] 
(
	-- Add the parameters for the function here
	@SubmittedDate datetime,
	@ApprovedDate datetime,
	@DeletedDate datetime,
	@RejectedDate datetime
)
RETURNS nvarchar(20)
AS
BEGIN
	DECLARE @returnValue nvarchar(20)

	IF @DeletedDate IS NOT NULL BEGIN
		SET @returnValue = 'Deleted'
	END ELSE IF @RejectedDate IS NOT NULL BEGIN 
		SET @returnValue =  'Draft'
	END ELSE IF @SubmittedDate IS NULL BEGIN
		SET @returnValue =  'Draft'
	END ELSE IF @SubmittedDate IS NOT NULL AND @ApprovedDate IS NULL BEGIN
		SET @returnValue =  'Submitted'
	END ELSE IF @ApprovedDate IS NOT NULL BEGIN
		SET @returnValue =  'Approved'
	END ELSE BEGIN
		SET @returnValue =  'None'
	END

	RETURN @returnValue
END
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering permissions on  [dbo].[ProgramProjectStatusString]'
GO
GRANT EXECUTE ON  [dbo].[ProgramProjectStatusString] TO [hdotappuser]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering permissions on  [dbo].[udfNullableBooleanToYesNoBlank]'
GO
GRANT EXECUTE ON  [dbo].[udfNullableBooleanToYesNoBlank] TO [hdotappuser]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering permissions on  [dbo].[udfNullableStringToValueOrBlank]'
GO
GRANT EXECUTE ON  [dbo].[udfNullableStringToValueOrBlank] TO [hdotappuser]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering permissions on  [dbo].[udfProgramProjectStatusString]'
GO
GRANT EXECUTE ON  [dbo].[udfProgramProjectStatusString] TO [hdotappuser]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
COMMIT TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
-- This statement writes to the SQL Server Log so SQL Monitor can show this deployment.
IF HAS_PERMS_BY_NAME(N'sys.xp_logevent', N'OBJECT', N'EXECUTE') = 1
BEGIN
    DECLARE @databaseName AS nvarchar(2048), @eventMessage AS nvarchar(2048)
    SET @databaseName = REPLACE(REPLACE(DB_NAME(), N'\', N'\\'), N'"', N'\"')
    SET @eventMessage = N'Redgate SQL Compare: { "deployment": { "description": "Redgate SQL Compare deployed to ' + @databaseName + N'", "database": "' + @databaseName + N'" }}'
    EXECUTE sys.xp_logevent 55000, @eventMessage
END
GO
DECLARE @Success AS BIT
SET @Success = 1
SET NOEXEC OFF
IF (@Success = 1) PRINT 'The database update succeeded'
ELSE BEGIN
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
	PRINT 'The database update failed'
END
GO
