/*
Run this script on:

        (local).HawaiiDOT_MRTP_Dev    -  This database will be modified

to synchronize it with:

        USLAS0-SQL135TS.HawaiiDOT_MRTP_Dev

You are recommended to back up your database before running this script

Script created by SQL Compare version 14.7.8.21163 from Red Gate Software Ltd at 3/26/2023 5:52:40 PM

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
PRINT N'Creating [dbo].[Branch]'
GO
CREATE TABLE [dbo].[Branch]
(
[BranchId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Branch_BranchId] DEFAULT (newsequentialid()),
[DivisionId] [uniqueidentifier] NOT NULL,
[BranchName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Abbreviation] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Color] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SortOrder] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_Branch_IsActive] DEFAULT ((1))
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_Branch] on [dbo].[Branch]'
GO
ALTER TABLE [dbo].[Branch] ADD CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED ([DivisionId], [BranchName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Branch]'
GO
ALTER TABLE [dbo].[Branch] ADD CONSTRAINT [UK_Branch] UNIQUE NONCLUSTERED ([BranchId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[Section]'
GO
CREATE TABLE [dbo].[Section]
(
[SectionId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Section_SectionId] DEFAULT (newsequentialid()),
[BranchId] [uniqueidentifier] NOT NULL,
[SectionName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Abbreviation] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SortOrder] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_Section_IsActive] DEFAULT ((1))
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_Section] on [dbo].[Section]'
GO
ALTER TABLE [dbo].[Section] ADD CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED ([BranchId], [SectionName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Section]'
GO
ALTER TABLE [dbo].[Section] ADD CONSTRAINT [UK_Section] UNIQUE NONCLUSTERED ([SectionId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[Division]'
GO
CREATE TABLE [dbo].[Division]
(
[DivisionId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Division_DivisionId] DEFAULT (newsequentialid()),
[DivisionName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SortOrder] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_Division_IsActive] DEFAULT ((1))
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_Division] on [dbo].[Division]'
GO
ALTER TABLE [dbo].[Division] ADD CONSTRAINT [PK_Division] PRIMARY KEY CLUSTERED ([DivisionName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Division]'
GO
ALTER TABLE [dbo].[Division] ADD CONSTRAINT [UK_Division] UNIQUE NONCLUSTERED ([DivisionId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[EnvironmentalItem]'
GO
CREATE TABLE [dbo].[EnvironmentalItem]
(
[EnvironmentalItemId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_EnvironmentalItem_EnvironmentalItemId] DEFAULT (newsequentialid()),
[EnvironmentalItemName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SortOrder] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_EnvironmentalItem_IsActive] DEFAULT ((1))
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_EnvironmentalItem] on [dbo].[EnvironmentalItem]'
GO
ALTER TABLE [dbo].[EnvironmentalItem] ADD CONSTRAINT [PK_EnvironmentalItem] PRIMARY KEY CLUSTERED ([EnvironmentalItemName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[EnvironmentalItem]'
GO
ALTER TABLE [dbo].[EnvironmentalItem] ADD CONSTRAINT [UK_EnvironmentalItem] UNIQUE NONCLUSTERED ([EnvironmentalItemId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ProjectEnvironmentalItem]'
GO
CREATE TABLE [dbo].[ProjectEnvironmentalItem]
(
[ProjectEnvironmentalItemId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProjectEnvironmentalItem_ProjectEnvironmentalItemId] DEFAULT (newsequentialid()),
[EnvironmentalItemId] [uniqueidentifier] NOT NULL,
[ProjectId] [uniqueidentifier] NOT NULL,
[IsApplicable] [bit] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_ProjectEnvironmentalItem] on [dbo].[ProjectEnvironmentalItem]'
GO
ALTER TABLE [dbo].[ProjectEnvironmentalItem] ADD CONSTRAINT [PK_ProjectEnvironmentalItem] PRIMARY KEY CLUSTERED ([EnvironmentalItemId], [ProjectId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[ProjectEnvironmentalItem]'
GO
ALTER TABLE [dbo].[ProjectEnvironmentalItem] ADD CONSTRAINT [UK_ProjectEnvironmentalItem] UNIQUE NONCLUSTERED ([ProjectEnvironmentalItemId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[FederalEnvironmentalDocument]'
GO
CREATE TABLE [dbo].[FederalEnvironmentalDocument]
(
[FederalEnvironmentalDocumentId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_FederalEnvironmentalDocument_FederalEnvironmentalDocumentId] DEFAULT (newsequentialid()),
[FederalEnvironmentalDocumentName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SortOrder] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_FederalEnvironmentalDocument_IsActive] DEFAULT ((1))
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_FederalEnvironmentalDocument] on [dbo].[FederalEnvironmentalDocument]'
GO
ALTER TABLE [dbo].[FederalEnvironmentalDocument] ADD CONSTRAINT [PK_FederalEnvironmentalDocument] PRIMARY KEY CLUSTERED ([FederalEnvironmentalDocumentName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[FederalEnvironmentalDocument]'
GO
ALTER TABLE [dbo].[FederalEnvironmentalDocument] ADD CONSTRAINT [UK_FederalEnvironmentalDocument] UNIQUE NONCLUSTERED ([FederalEnvironmentalDocumentId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ProgramProject]'
GO
CREATE TABLE [dbo].[ProgramProject]
(
[ProgramProjectId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProgramProject_ProgramProjectId] DEFAULT (newsequentialid()),
[ScenarioId] [uniqueidentifier] NOT NULL,
[SectionId] [uniqueidentifier] NULL,
[ProgramManager] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PriorityId] [uniqueidentifier] NULL,
[IsMandated] [bit] NULL,
[MandatedExplanation] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsConsentDecree] [bit] NULL,
[ProgramProjectName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PurposeAndNeed] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WorkDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ImpactOnMeetingNeeds] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ImpactOnOandM] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StateEnvironmentalDocumentId] [uniqueidentifier] NULL,
[FederalEnvironmentalDocumentId] [uniqueidentifier] NULL,
[PrimaryProgramSubCategoryId] [uniqueidentifier] NULL,
[PrimaryProgramCategoryAmount] [tinyint] NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SubmittedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubmittedDate] [datetime] NULL,
[RejectedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RejectedDate] [datetime] NULL,
[ApprovedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ApprovedDate] [datetime] NULL,
[DeletedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DeletedDate] [datetime] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_ProgramProject] on [dbo].[ProgramProject]'
GO
ALTER TABLE [dbo].[ProgramProject] ADD CONSTRAINT [PK_ProgramProject] PRIMARY KEY CLUSTERED ([ProgramProjectId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[FunctionalClass]'
GO
CREATE TABLE [dbo].[FunctionalClass]
(
[FunctionalClassId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_FunctionalClass_FunctionalClassId] DEFAULT (newsequentialid()),
[FunctionalClassName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SortOrder] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_FunctionalClass_IsActive] DEFAULT ((1))
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_FunctionalClass] on [dbo].[FunctionalClass]'
GO
ALTER TABLE [dbo].[FunctionalClass] ADD CONSTRAINT [PK_FunctionalClass] PRIMARY KEY CLUSTERED ([FunctionalClassName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[FunctionalClass]'
GO
ALTER TABLE [dbo].[FunctionalClass] ADD CONSTRAINT [UK_FunctionalClass] UNIQUE NONCLUSTERED ([FunctionalClassId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ProjectLocation]'
GO
CREATE TABLE [dbo].[ProjectLocation]
(
[ProjectLocationId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProjectLocation_ProjectLocationId] DEFAULT (newsequentialid()),
[ProjectId] [uniqueidentifier] NOT NULL,
[RouteNameId] [uniqueidentifier] NOT NULL,
[FunctionalClassId] [uniqueidentifier] NOT NULL,
[BeginMilepost] [decimal] (5, 2) NULL,
[EndMilepost] [decimal] (5, 2) NULL,
[SortOrder] [int] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_ProjectLocation] on [dbo].[ProjectLocation]'
GO
ALTER TABLE [dbo].[ProjectLocation] ADD CONSTRAINT [PK_ProjectLocation] PRIMARY KEY CLUSTERED ([ProjectLocationId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[ProjectLocation]'
GO
ALTER TABLE [dbo].[ProjectLocation] ADD CONSTRAINT [UK_ProjectLocation] UNIQUE NONCLUSTERED ([ProjectLocationId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[Goal]'
GO
CREATE TABLE [dbo].[Goal]
(
[GoalId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Goal_GoalId] DEFAULT (newsequentialid()),
[GoalName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SortOrder] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_Goal_IsActive] DEFAULT ((1))
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_Goal] on [dbo].[Goal]'
GO
ALTER TABLE [dbo].[Goal] ADD CONSTRAINT [PK_Goal] PRIMARY KEY CLUSTERED ([GoalName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Goal]'
GO
ALTER TABLE [dbo].[Goal] ADD CONSTRAINT [UK_Goal] UNIQUE NONCLUSTERED ([GoalId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ProgramProjectGoal]'
GO
CREATE TABLE [dbo].[ProgramProjectGoal]
(
[ProgramProjectGoalId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProgramProjectGoal_ProgramProjectGoalId] DEFAULT (newsequentialid()),
[ProgramProjectId] [uniqueidentifier] NOT NULL,
[GoalId] [uniqueidentifier] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_ProgramProjectGoal] on [dbo].[ProgramProjectGoal]'
GO
ALTER TABLE [dbo].[ProgramProjectGoal] ADD CONSTRAINT [PK_ProgramProjectGoal] PRIMARY KEY CLUSTERED ([ProgramProjectId], [GoalId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[ProgramProjectGoal]'
GO
ALTER TABLE [dbo].[ProgramProjectGoal] ADD CONSTRAINT [UK_ProgramProjectGoal] UNIQUE NONCLUSTERED ([ProgramProjectGoalId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[HdotDistrict]'
GO
CREATE TABLE [dbo].[HdotDistrict]
(
[HdotDistrictId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_HdotDistrict_HdotDistrictId] DEFAULT (newsequentialid()),
[HdotDistrictName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Color] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SortOrder] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_HdotDistrict_IsActive] DEFAULT ((1))
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_HdotDistrict] on [dbo].[HdotDistrict]'
GO
ALTER TABLE [dbo].[HdotDistrict] ADD CONSTRAINT [PK_HdotDistrict] PRIMARY KEY CLUSTERED ([HdotDistrictName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[HdotDistrict]'
GO
ALTER TABLE [dbo].[HdotDistrict] ADD CONSTRAINT [UK_HdotDistrict] UNIQUE NONCLUSTERED ([HdotDistrictId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[Island]'
GO
CREATE TABLE [dbo].[Island]
(
[IslandId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Island_IslandId] DEFAULT (newsequentialid()),
[IslandName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Color] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SortOrder] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_Island_IsActive] DEFAULT ((1)),
[HdotDistrictId] [uniqueidentifier] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_Island] on [dbo].[Island]'
GO
ALTER TABLE [dbo].[Island] ADD CONSTRAINT [PK_Island] PRIMARY KEY CLUSTERED ([IslandName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Island]'
GO
ALTER TABLE [dbo].[Island] ADD CONSTRAINT [UK_Island] UNIQUE NONCLUSTERED ([IslandId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[PlanningDistrict]'
GO
CREATE TABLE [dbo].[PlanningDistrict]
(
[PlanningDistrictId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_PlanningDistrict_PlanningDistrictId] DEFAULT (newsequentialid()),
[PlanningDistrictName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Color] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SortOrder] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_PlanningDistrict_IsActive] DEFAULT ((1)),
[IslandId] [uniqueidentifier] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_PlanningDistrict] on [dbo].[PlanningDistrict]'
GO
ALTER TABLE [dbo].[PlanningDistrict] ADD CONSTRAINT [PK_PlanningDistrict] PRIMARY KEY CLUSTERED ([PlanningDistrictName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[PlanningDistrict]'
GO
ALTER TABLE [dbo].[PlanningDistrict] ADD CONSTRAINT [UK_PlanningDistrict] UNIQUE NONCLUSTERED ([PlanningDistrictId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ProgramProjectIsland]'
GO
CREATE TABLE [dbo].[ProgramProjectIsland]
(
[ProgramProjectIslandId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProgramProjectIsland_ProgramProjectIslandId] DEFAULT (newsequentialid()),
[ProgramProjectId] [uniqueidentifier] NOT NULL,
[IslandId] [uniqueidentifier] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_ProgramProjectIsland] on [dbo].[ProgramProjectIsland]'
GO
ALTER TABLE [dbo].[ProgramProjectIsland] ADD CONSTRAINT [PK_ProgramProjectIsland] PRIMARY KEY CLUSTERED ([ProgramProjectId], [IslandId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[ProgramProjectIsland]'
GO
ALTER TABLE [dbo].[ProgramProjectIsland] ADD CONSTRAINT [UK_ProgramProjectIsland] UNIQUE NONCLUSTERED ([ProgramProjectIslandId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[RouteNumber]'
GO
CREATE TABLE [dbo].[RouteNumber]
(
[RouteNumberId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_RouteNumber_RouteNumberId] DEFAULT (newsequentialid()),
[RouteNumber] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IslandId] [uniqueidentifier] NOT NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SortOrder] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_RouteNumber_IsActive] DEFAULT ((1))
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_RouteNumber] on [dbo].[RouteNumber]'
GO
ALTER TABLE [dbo].[RouteNumber] ADD CONSTRAINT [PK_RouteNumber] PRIMARY KEY CLUSTERED ([RouteNumber])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[RouteNumber]'
GO
ALTER TABLE [dbo].[RouteNumber] ADD CONSTRAINT [UK_RouteNumber] UNIQUE NONCLUSTERED ([RouteNumberId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[Phase]'
GO
CREATE TABLE [dbo].[Phase]
(
[PhaseId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Phase_PhaseId] DEFAULT (newsequentialid()),
[PhaseName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SortOrder] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_Phase_IsActive] DEFAULT ((1))
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_Phase] on [dbo].[Phase]'
GO
ALTER TABLE [dbo].[Phase] ADD CONSTRAINT [PK_Phase] PRIMARY KEY CLUSTERED ([PhaseName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Phase]'
GO
ALTER TABLE [dbo].[Phase] ADD CONSTRAINT [UK_Phase] UNIQUE NONCLUSTERED ([PhaseId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ProgramProjectPhase]'
GO
CREATE TABLE [dbo].[ProgramProjectPhase]
(
[ProgramProjectPhaseId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProgramProjectPhase_ProgramProjectPhaseId] DEFAULT (newsequentialid()),
[ProgramProjectId] [uniqueidentifier] NOT NULL,
[PhaseId] [uniqueidentifier] NOT NULL,
[ProgramProjectPhaseYear] [int] NOT NULL,
[FederalShare] [money] NULL,
[LocalShare] [money] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_ProgramProjectPhase] on [dbo].[ProgramProjectPhase]'
GO
ALTER TABLE [dbo].[ProgramProjectPhase] ADD CONSTRAINT [PK_ProgramProjectPhase] PRIMARY KEY CLUSTERED ([ProgramProjectId], [PhaseId], [ProgramProjectPhaseYear])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[ProgramProjectPhase]'
GO
ALTER TABLE [dbo].[ProgramProjectPhase] ADD CONSTRAINT [UK_ProgramProjectPhase] UNIQUE NONCLUSTERED ([ProgramProjectPhaseId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ProjectPlanningDistrict]'
GO
CREATE TABLE [dbo].[ProjectPlanningDistrict]
(
[ProjectPlanningDistrictId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProjectPlanningDistrict_ProjectPlanningDistrictId] DEFAULT (newsequentialid()),
[PlanningDistrictId] [uniqueidentifier] NOT NULL,
[ProjectId] [uniqueidentifier] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_ProjectPlanningDistrict] on [dbo].[ProjectPlanningDistrict]'
GO
ALTER TABLE [dbo].[ProjectPlanningDistrict] ADD CONSTRAINT [PK_ProjectPlanningDistrict] PRIMARY KEY CLUSTERED ([PlanningDistrictId], [ProjectId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[ProjectPlanningDistrict]'
GO
ALTER TABLE [dbo].[ProjectPlanningDistrict] ADD CONSTRAINT [UK_ProjectPlanningDistrict] UNIQUE NONCLUSTERED ([ProjectPlanningDistrictId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[Priority]'
GO
CREATE TABLE [dbo].[Priority]
(
[PriorityId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Priority_PriorityId] DEFAULT (newsequentialid()),
[PriorityName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SortOrder] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_Priority_IsActive] DEFAULT ((1))
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_Priority] on [dbo].[Priority]'
GO
ALTER TABLE [dbo].[Priority] ADD CONSTRAINT [PK_Priority] PRIMARY KEY CLUSTERED ([PriorityName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Priority]'
GO
ALTER TABLE [dbo].[Priority] ADD CONSTRAINT [UK_Priority] UNIQUE NONCLUSTERED ([PriorityId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ProgramCategory]'
GO
CREATE TABLE [dbo].[ProgramCategory]
(
[ProgramCategoryId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProgramCategory_ProgramCategoryId] DEFAULT (newsequentialid()),
[ProgramCategoryName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Color] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SortOrder] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_ProgramCategory_IsActive] DEFAULT ((1))
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_ProgramCategory] on [dbo].[ProgramCategory]'
GO
ALTER TABLE [dbo].[ProgramCategory] ADD CONSTRAINT [PK_ProgramCategory] PRIMARY KEY CLUSTERED ([ProgramCategoryName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[ProgramCategory]'
GO
ALTER TABLE [dbo].[ProgramCategory] ADD CONSTRAINT [UK_ProgramCategory] UNIQUE NONCLUSTERED ([ProgramCategoryId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ProgramProjectSecondaryProgramCategory]'
GO
CREATE TABLE [dbo].[ProgramProjectSecondaryProgramCategory]
(
[ProgramProjectSecondaryProgramCategoryId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProgramProjectSecondaryProgramCategory_ProgramProjectSecondaryProgramCategoryId] DEFAULT (newsequentialid()),
[ProgramProjectId] [uniqueidentifier] NOT NULL,
[ProgramCategoryId] [uniqueidentifier] NOT NULL,
[Amount] [tinyint] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_ProgramProjectSecondaryProgramCategory] on [dbo].[ProgramProjectSecondaryProgramCategory]'
GO
ALTER TABLE [dbo].[ProgramProjectSecondaryProgramCategory] ADD CONSTRAINT [PK_ProgramProjectSecondaryProgramCategory] PRIMARY KEY CLUSTERED ([ProgramProjectId], [ProgramCategoryId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[ProgramProjectSecondaryProgramCategory]'
GO
ALTER TABLE [dbo].[ProgramProjectSecondaryProgramCategory] ADD CONSTRAINT [UK_ProgramProjectSecondaryProgramCategory] UNIQUE NONCLUSTERED ([ProgramProjectSecondaryProgramCategoryId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ProgramSubCategory]'
GO
CREATE TABLE [dbo].[ProgramSubCategory]
(
[ProgramSubCategoryId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProgramSubCategory_ProgramSubCategoryId] DEFAULT (newsequentialid()),
[ProgramSubCategoryName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ProgramCategoryId] [uniqueidentifier] NOT NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SortOrder] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_ProgramSubCategory_IsActive] DEFAULT ((1))
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_ProgramSubCategory] on [dbo].[ProgramSubCategory]'
GO
ALTER TABLE [dbo].[ProgramSubCategory] ADD CONSTRAINT [PK_ProgramSubCategory] PRIMARY KEY CLUSTERED ([ProgramSubCategoryName], [ProgramCategoryId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[ProgramSubCategory]'
GO
ALTER TABLE [dbo].[ProgramSubCategory] ADD CONSTRAINT [UK_ProgramSubCategory] UNIQUE NONCLUSTERED ([ProgramSubCategoryId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ProgramProjectAlternative]'
GO
CREATE TABLE [dbo].[ProgramProjectAlternative]
(
[ProgramProjectAlternativeId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProgramProjectAlternative_ProgramProjectAlternativeId] DEFAULT (newsequentialid()),
[ProgramProjectId] [uniqueidentifier] NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsNoBuild] [bit] NOT NULL CONSTRAINT [DF_ProgramProjectAlternative_IsNoBuild] DEFAULT ((0)),
[Title] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_ProgramProjectAlternative] on [dbo].[ProgramProjectAlternative]'
GO
ALTER TABLE [dbo].[ProgramProjectAlternative] ADD CONSTRAINT [PK_ProgramProjectAlternative] PRIMARY KEY CLUSTERED ([ProgramProjectAlternativeId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ProgramProjectDocument]'
GO
CREATE TABLE [dbo].[ProgramProjectDocument]
(
[ProgramProjectDocumentId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProgramProjectDocument_ProgramProjectDocumentId] DEFAULT (newsequentialid()),
[ProgramProjectId] [uniqueidentifier] NOT NULL,
[MD5Hash] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[OriginalFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ServerFileName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IsTMS] [bit] NOT NULL,
[Description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileSize] [bigint] NOT NULL,
[UploadedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[UploadedDate] [datetime] NULL,
[UploadError] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDeleted] [bit] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_ProgramProjectDocument] on [dbo].[ProgramProjectDocument]'
GO
ALTER TABLE [dbo].[ProgramProjectDocument] ADD CONSTRAINT [PK_ProgramProjectDocument] PRIMARY KEY CLUSTERED ([ProgramProjectId], [MD5Hash])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[ProgramProjectDocument]'
GO
ALTER TABLE [dbo].[ProgramProjectDocument] ADD CONSTRAINT [UK_ProgramProjectDocument] UNIQUE NONCLUSTERED ([ProgramProjectDocumentId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ProgramProjectHistory]'
GO
CREATE TABLE [dbo].[ProgramProjectHistory]
(
[ProgramProjectHistoryId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProgramProjectHistory_ProgramProjectHistoryId] DEFAULT (newsequentialid()),
[ProgramProjectId] [uniqueidentifier] NOT NULL,
[HistoryDate] [datetime] NOT NULL,
[ChangedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ChangedTabName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChangedFieldName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OldValue] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NewValue] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_ProgramProjectHistory] on [dbo].[ProgramProjectHistory]'
GO
ALTER TABLE [dbo].[ProgramProjectHistory] ADD CONSTRAINT [PK_ProgramProjectHistory] PRIMARY KEY CLUSTERED ([ProgramProjectHistoryId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[Project]'
GO
CREATE TABLE [dbo].[Project]
(
[ProjectId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Project_ProjectId] DEFAULT (newsequentialid()),
[ProgramProjectId] [uniqueidentifier] NOT NULL,
[ProjectManager] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AADT] [int] NULL,
[OnNHS] [bit] NULL,
[IsEligibleForFederalAid] [bit] NULL,
[IsPrimaryHighwayFreightSystem] [bit] NULL,
[IsCriticalUrbanFreightCorridor] [bit] NULL,
[IsCriticalRuralFreightCorridor] [bit] NULL,
[IsHawaiiFreightNetwork] [bit] NULL,
[ExistingAndNewUtilitiesWork] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsWithinRightOfWay] [bit] NULL,
[IsLandIssues] [bit] NULL,
[LandIssuesDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExistingRightOfWayDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsRepeatedlyDamanagedSite] [bit] NULL,
[RepeatedlyDamagedDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdditionalInformation] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_Project] on [dbo].[Project]'
GO
ALTER TABLE [dbo].[Project] ADD CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED ([ProgramProjectId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Project]'
GO
ALTER TABLE [dbo].[Project] ADD CONSTRAINT [UK_Project] UNIQUE NONCLUSTERED ([ProjectId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ProgramProjectSecondaryProgramSubCategory]'
GO
CREATE TABLE [dbo].[ProgramProjectSecondaryProgramSubCategory]
(
[ProgramProjectSecondaryProgramSubCategoryId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProgramProjectSecondaryProgramSubCategory_ProgramProjectSecondaryProgramSubCategoryId] DEFAULT (newsequentialid()),
[ProgramSubCategoryId] [uniqueidentifier] NOT NULL,
[ProgramProjectSecondaryProgramCategoryId] [uniqueidentifier] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_ProgramProjectSecondaryProgramSubCategory] on [dbo].[ProgramProjectSecondaryProgramSubCategory]'
GO
ALTER TABLE [dbo].[ProgramProjectSecondaryProgramSubCategory] ADD CONSTRAINT [PK_ProgramProjectSecondaryProgramSubCategory] PRIMARY KEY CLUSTERED ([ProgramProjectSecondaryProgramCategoryId], [ProgramSubCategoryId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[ProgramProjectSecondaryProgramSubCategory]'
GO
ALTER TABLE [dbo].[ProgramProjectSecondaryProgramSubCategory] ADD CONSTRAINT [UK_ProgramProjectSecondaryProgramSubCategory] UNIQUE NONCLUSTERED ([ProgramProjectSecondaryProgramSubCategoryId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ProjectOtherEnvironmentalItem]'
GO
CREATE TABLE [dbo].[ProjectOtherEnvironmentalItem]
(
[ProjectOtherEnvironmentalItemId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProjectOtherEnvironmentalItem_ProjectOtherEnvironmentalItemId] DEFAULT (newsequentialid()),
[ProjectOtherEnvironmentalItemName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ProjectId] [uniqueidentifier] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_ProjectOtherEnvironmentalItem] on [dbo].[ProjectOtherEnvironmentalItem]'
GO
ALTER TABLE [dbo].[ProjectOtherEnvironmentalItem] ADD CONSTRAINT [PK_ProjectOtherEnvironmentalItem] PRIMARY KEY CLUSTERED ([ProjectOtherEnvironmentalItemName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[ProjectOtherEnvironmentalItem]'
GO
ALTER TABLE [dbo].[ProjectOtherEnvironmentalItem] ADD CONSTRAINT [UK_ProjectOtherEnvironmentalItem] UNIQUE NONCLUSTERED ([ProjectOtherEnvironmentalItemId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[ProjectScopeItem]'
GO
CREATE TABLE [dbo].[ProjectScopeItem]
(
[ProjectScopeItemId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProjectScopeItem_ProjectScopeItemId] DEFAULT (newsequentialid()),
[ProjectScopeItemName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ProjectId] [uniqueidentifier] NOT NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SortOrder] [int] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_ProjectScopeItem] on [dbo].[ProjectScopeItem]'
GO
ALTER TABLE [dbo].[ProjectScopeItem] ADD CONSTRAINT [PK_ProjectScopeItem] PRIMARY KEY CLUSTERED ([ProjectScopeItemName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[ProjectScopeItem]'
GO
ALTER TABLE [dbo].[ProjectScopeItem] ADD CONSTRAINT [UK_ProjectScopeItem] UNIQUE NONCLUSTERED ([ProjectScopeItemId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[RouteName]'
GO
CREATE TABLE [dbo].[RouteName]
(
[RouteNameId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_RouteName_RouteNameId] DEFAULT (newsequentialid()),
[RouteName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RouteNumberId] [uniqueidentifier] NOT NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SortOrder] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_RouteName_IsActive] DEFAULT ((1)),
[BeginMilepost] [decimal] (5, 2) NULL,
[EndMilepost] [decimal] (5, 2) NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_RouteName] on [dbo].[RouteName]'
GO
ALTER TABLE [dbo].[RouteName] ADD CONSTRAINT [PK_RouteName] PRIMARY KEY CLUSTERED ([RouteName], [RouteNumberId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[RouteName]'
GO
ALTER TABLE [dbo].[RouteName] ADD CONSTRAINT [UK_RouteName] UNIQUE NONCLUSTERED ([RouteNameId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[Scenario]'
GO
CREATE TABLE [dbo].[Scenario]
(
[ScenarioId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Scenario_ScenarioId] DEFAULT (newsequentialid()),
[ScenarioName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StatusId] [uniqueidentifier] NOT NULL,
[IsDefault] [bit] NOT NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_Scenario] on [dbo].[Scenario]'
GO
ALTER TABLE [dbo].[Scenario] ADD CONSTRAINT [PK_Scenario] PRIMARY KEY CLUSTERED ([ScenarioName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Scenario]'
GO
ALTER TABLE [dbo].[Scenario] ADD CONSTRAINT [UK_Scenario] UNIQUE NONCLUSTERED ([ScenarioId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[StateEnvironmentalDocument]'
GO
CREATE TABLE [dbo].[StateEnvironmentalDocument]
(
[StateEnvironmentalDocumentId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_StateEnvironmentalDocument_StateEnvironmentalDocumentId] DEFAULT (newsequentialid()),
[StateEnvironmentalDocumentName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SortOrder] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_StateEnvironmentalDocument_IsActive] DEFAULT ((1))
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_StateEnvironmentalDocument] on [dbo].[StateEnvironmentalDocument]'
GO
ALTER TABLE [dbo].[StateEnvironmentalDocument] ADD CONSTRAINT [PK_StateEnvironmentalDocument] PRIMARY KEY CLUSTERED ([StateEnvironmentalDocumentName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[StateEnvironmentalDocument]'
GO
ALTER TABLE [dbo].[StateEnvironmentalDocument] ADD CONSTRAINT [UK_StateEnvironmentalDocument] UNIQUE NONCLUSTERED ([StateEnvironmentalDocumentId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[Status]'
GO
CREATE TABLE [dbo].[Status]
(
[StatusId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Status_StatusId] DEFAULT (newsequentialid()),
[StatusName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CreatedDate] [datetime] NOT NULL,
[ModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ModifiedDate] [datetime] NULL,
[SortOrder] [int] NOT NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF_Status_IsActive] DEFAULT ((1))
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK_Status] on [dbo].[Status]'
GO
ALTER TABLE [dbo].[Status] ADD CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED ([StatusName])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Status]'
GO
ALTER TABLE [dbo].[Status] ADD CONSTRAINT [UK_Status] UNIQUE NONCLUSTERED ([StatusId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[Section]'
GO
ALTER TABLE [dbo].[Section] ADD CONSTRAINT [FK_Branch_Section] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([BranchId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[Branch]'
GO
ALTER TABLE [dbo].[Branch] ADD CONSTRAINT [FK_Division_Branch] FOREIGN KEY ([DivisionId]) REFERENCES [dbo].[Division] ([DivisionId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[ProjectEnvironmentalItem]'
GO
ALTER TABLE [dbo].[ProjectEnvironmentalItem] ADD CONSTRAINT [FK_EnvironmentalItem_ProjectEnvironmentalItem] FOREIGN KEY ([EnvironmentalItemId]) REFERENCES [dbo].[EnvironmentalItem] ([EnvironmentalItemId])
GO
ALTER TABLE [dbo].[ProjectEnvironmentalItem] ADD CONSTRAINT [FK_Project_ProjectEnvironmentalItem] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Project] ([ProjectId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[ProgramProject]'
GO
ALTER TABLE [dbo].[ProgramProject] ADD CONSTRAINT [FK_FederalEnvironmentalDocument_ProgramProject] FOREIGN KEY ([FederalEnvironmentalDocumentId]) REFERENCES [dbo].[FederalEnvironmentalDocument] ([FederalEnvironmentalDocumentId])
GO
ALTER TABLE [dbo].[ProgramProject] ADD CONSTRAINT [FK_Priority_ProgramProject] FOREIGN KEY ([PriorityId]) REFERENCES [dbo].[Priority] ([PriorityId])
GO
ALTER TABLE [dbo].[ProgramProject] ADD CONSTRAINT [FK_Scenario_ProgramProject] FOREIGN KEY ([ScenarioId]) REFERENCES [dbo].[Scenario] ([ScenarioId])
GO
ALTER TABLE [dbo].[ProgramProject] ADD CONSTRAINT [FK_Section_ProgramProject] FOREIGN KEY ([SectionId]) REFERENCES [dbo].[Section] ([SectionId])
GO
ALTER TABLE [dbo].[ProgramProject] ADD CONSTRAINT [FK_StateEnvironmentalDocument_ProgramProject] FOREIGN KEY ([StateEnvironmentalDocumentId]) REFERENCES [dbo].[StateEnvironmentalDocument] ([StateEnvironmentalDocumentId])
GO
ALTER TABLE [dbo].[ProgramProject] ADD CONSTRAINT [FK_ProgramSubCategory_ProgramProject] FOREIGN KEY ([PrimaryProgramSubCategoryId]) REFERENCES [dbo].[ProgramSubCategory] ([ProgramSubCategoryId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[ProjectLocation]'
GO
ALTER TABLE [dbo].[ProjectLocation] ADD CONSTRAINT [FK_FunctionalClass_ProjectLocation] FOREIGN KEY ([FunctionalClassId]) REFERENCES [dbo].[FunctionalClass] ([FunctionalClassId])
GO
ALTER TABLE [dbo].[ProjectLocation] ADD CONSTRAINT [FK_Project_ProjectLocation] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Project] ([ProjectId])
GO
ALTER TABLE [dbo].[ProjectLocation] ADD CONSTRAINT [FK_RouteName_ProjectLocation] FOREIGN KEY ([RouteNameId]) REFERENCES [dbo].[RouteName] ([RouteNameId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[ProgramProjectGoal]'
GO
ALTER TABLE [dbo].[ProgramProjectGoal] ADD CONSTRAINT [FK_Goal_ProgramProjectGoal] FOREIGN KEY ([GoalId]) REFERENCES [dbo].[Goal] ([GoalId])
GO
ALTER TABLE [dbo].[ProgramProjectGoal] ADD CONSTRAINT [FK_ProgramProject_ProgramProjectGoal] FOREIGN KEY ([ProgramProjectId]) REFERENCES [dbo].[ProgramProject] ([ProgramProjectId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[Island]'
GO
ALTER TABLE [dbo].[Island] ADD CONSTRAINT [FK_HdotDistrict_Island] FOREIGN KEY ([HdotDistrictId]) REFERENCES [dbo].[HdotDistrict] ([HdotDistrictId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[PlanningDistrict]'
GO
ALTER TABLE [dbo].[PlanningDistrict] ADD CONSTRAINT [FK_Island_PlanningDistrict] FOREIGN KEY ([IslandId]) REFERENCES [dbo].[Island] ([IslandId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[ProgramProjectIsland]'
GO
ALTER TABLE [dbo].[ProgramProjectIsland] ADD CONSTRAINT [FK_Island_ProgramProjectIsland] FOREIGN KEY ([IslandId]) REFERENCES [dbo].[Island] ([IslandId])
GO
ALTER TABLE [dbo].[ProgramProjectIsland] ADD CONSTRAINT [FK_ProgramProject_ProgramProjectIsland] FOREIGN KEY ([ProgramProjectId]) REFERENCES [dbo].[ProgramProject] ([ProgramProjectId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[RouteNumber]'
GO
ALTER TABLE [dbo].[RouteNumber] ADD CONSTRAINT [FK_Island_RouteNumber] FOREIGN KEY ([IslandId]) REFERENCES [dbo].[Island] ([IslandId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[ProgramProjectPhase]'
GO
ALTER TABLE [dbo].[ProgramProjectPhase] ADD CONSTRAINT [FK_Phase_ProgramProjectPhase] FOREIGN KEY ([PhaseId]) REFERENCES [dbo].[Phase] ([PhaseId])
GO
ALTER TABLE [dbo].[ProgramProjectPhase] ADD CONSTRAINT [FK_ProgramProject_ProgramProjectPhase] FOREIGN KEY ([ProgramProjectId]) REFERENCES [dbo].[ProgramProject] ([ProgramProjectId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[ProjectPlanningDistrict]'
GO
ALTER TABLE [dbo].[ProjectPlanningDistrict] ADD CONSTRAINT [FK_PlanningDistrict_ProjectPlanningDistrict] FOREIGN KEY ([PlanningDistrictId]) REFERENCES [dbo].[PlanningDistrict] ([PlanningDistrictId])
GO
ALTER TABLE [dbo].[ProjectPlanningDistrict] ADD CONSTRAINT [FK_Project_ProjectPlanningDistrict] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Project] ([ProjectId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[ProgramProjectSecondaryProgramCategory]'
GO
ALTER TABLE [dbo].[ProgramProjectSecondaryProgramCategory] ADD CONSTRAINT [FK_ProgramCategory_ProgramProjectSecondaryProgramCategory] FOREIGN KEY ([ProgramCategoryId]) REFERENCES [dbo].[ProgramCategory] ([ProgramCategoryId])
GO
ALTER TABLE [dbo].[ProgramProjectSecondaryProgramCategory] ADD CONSTRAINT [FK_ProgramProject_ProgramProjectSecondaryProgramCategory] FOREIGN KEY ([ProgramProjectId]) REFERENCES [dbo].[ProgramProject] ([ProgramProjectId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[ProgramSubCategory]'
GO
ALTER TABLE [dbo].[ProgramSubCategory] ADD CONSTRAINT [FK_ProgramCategory_ProgramSubCategory] FOREIGN KEY ([ProgramCategoryId]) REFERENCES [dbo].[ProgramCategory] ([ProgramCategoryId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[ProgramProjectAlternative]'
GO
ALTER TABLE [dbo].[ProgramProjectAlternative] ADD CONSTRAINT [FK_ProgramProject_ProgramProjectAlternative] FOREIGN KEY ([ProgramProjectId]) REFERENCES [dbo].[ProgramProject] ([ProgramProjectId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[ProgramProjectDocument]'
GO
ALTER TABLE [dbo].[ProgramProjectDocument] ADD CONSTRAINT [FK_ProgramProject_ProgramProjectDocument] FOREIGN KEY ([ProgramProjectId]) REFERENCES [dbo].[ProgramProject] ([ProgramProjectId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[ProgramProjectHistory]'
GO
ALTER TABLE [dbo].[ProgramProjectHistory] ADD CONSTRAINT [FK_ProgramProject_ProgramProjectHistory] FOREIGN KEY ([ProgramProjectId]) REFERENCES [dbo].[ProgramProject] ([ProgramProjectId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[ProgramProjectSecondaryProgramSubCategory]'
GO
ALTER TABLE [dbo].[ProgramProjectSecondaryProgramSubCategory] ADD CONSTRAINT [FK_ProgramProjectSecondaryProgramSubCategory_ProgramProjectSecondaryProgramCategory] FOREIGN KEY ([ProgramProjectSecondaryProgramCategoryId]) REFERENCES [dbo].[ProgramProjectSecondaryProgramCategory] ([ProgramProjectSecondaryProgramCategoryId])
GO
ALTER TABLE [dbo].[ProgramProjectSecondaryProgramSubCategory] ADD CONSTRAINT [FK_ProgramSubCategory_ProgramProjectSecondaryProgramSubCategory] FOREIGN KEY ([ProgramSubCategoryId]) REFERENCES [dbo].[ProgramSubCategory] ([ProgramSubCategoryId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[Project]'
GO
ALTER TABLE [dbo].[Project] ADD CONSTRAINT [FK_ProgramProject_Project] FOREIGN KEY ([ProgramProjectId]) REFERENCES [dbo].[ProgramProject] ([ProgramProjectId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[ProjectOtherEnvironmentalItem]'
GO
ALTER TABLE [dbo].[ProjectOtherEnvironmentalItem] ADD CONSTRAINT [FK_Project_ProjectOtherEnvironmentalItem] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Project] ([ProjectId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[ProjectScopeItem]'
GO
ALTER TABLE [dbo].[ProjectScopeItem] ADD CONSTRAINT [FK_Project_ProjectScopeItem] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Project] ([ProjectId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[RouteName]'
GO
ALTER TABLE [dbo].[RouteName] ADD CONSTRAINT [FK_RouteNumber_RouteName] FOREIGN KEY ([RouteNumberId]) REFERENCES [dbo].[RouteNumber] ([RouteNumberId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[Scenario]'
GO
ALTER TABLE [dbo].[Scenario] ADD CONSTRAINT [FK_Status_Scenario] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[Status] ([StatusId])
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
