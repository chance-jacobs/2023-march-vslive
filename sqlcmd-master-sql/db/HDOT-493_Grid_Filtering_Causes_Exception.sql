-- =============================================
-- Author:		Matt Erker
-- Create date: 02/24/2023
-- Description:	Returns a string of the ProgramProject status
-- *** Any changes here must be also made in ProgramProjectDC.GetProgramProjectStatus
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[ProgramProjectStatusString] 
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


