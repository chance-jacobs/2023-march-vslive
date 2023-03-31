/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      DATA MODEL
 *
 * Date Created : Thursday, January 12, 2023 16:18:39
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: AlternativeType 
 */

CREATE TABLE AlternativeType(
    AlternativeTypeId    uniqueidentifier    CONSTRAINT [DF_AlternativeType_AlternativeTypeId] DEFAULT (newsequentialid()) NOT NULL,
    AlternativeName      nvarchar(255)       NOT NULL,
    CreatedBy            nvarchar(100)       NOT NULL,
    CreatedDate          datetime            NOT NULL,
    ModifiedBy           nvarchar(100)       NULL,
    ModifiedDate         datetime            NULL,
    SortOrder            int                 NOT NULL,
    IsActive             bit                 CONSTRAINT [DF_AlternativeType_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT PK_AlternativeType PRIMARY KEY CLUSTERED (AlternativeName),
    CONSTRAINT UK_AlternativeType  UNIQUE (AlternativeTypeId)
)

go


IF OBJECT_ID('AlternativeType') IS NOT NULL
    PRINT '<<< CREATED TABLE AlternativeType >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE AlternativeType >>>'
go

/* 
 * TABLE: Branch 
 */

CREATE TABLE Branch(
    BranchId        uniqueidentifier    CONSTRAINT [DF_Branch_BranchId] DEFAULT (newsequentialid()) NOT NULL,
    DivisionId      uniqueidentifier    NOT NULL,
    BranchName      nvarchar(100)       NOT NULL,
    Abbreviation    nvarchar(50)        NOT NULL,
    Color           char(6)             NULL,
    CreatedBy       nvarchar(100)       NULL,
    CreatedDate     datetime            NOT NULL,
    ModifiedBy      nvarchar(100)       NULL,
    ModifiedDate    datetime            NULL,
    SortOrder       int                 NOT NULL,
    IsActive        bit                 CONSTRAINT [DF_Branch_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT PK_Branch PRIMARY KEY CLUSTERED (DivisionId, BranchName),
    CONSTRAINT UK_Branch  UNIQUE (BranchId)
)

go


IF OBJECT_ID('Branch') IS NOT NULL
    PRINT '<<< CREATED TABLE Branch >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Branch >>>'
go

/* 
 * TABLE: Division 
 */

CREATE TABLE Division(
    DivisionId      uniqueidentifier    CONSTRAINT [DF_Division_DivisionId] DEFAULT (newsequentialid()) NOT NULL,
    DivisionName    nvarchar(100)       NOT NULL,
    CreatedBy       nvarchar(100)       NOT NULL,
    CreatedDate     datetime            NOT NULL,
    ModifiedBy      nvarchar(100)       NULL,
    ModifiedDate    datetime            NULL,
    SortOrder       int                 NOT NULL,
    IsActive        bit                 CONSTRAINT [DF_Division_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT PK_Division PRIMARY KEY CLUSTERED (DivisionName),
    CONSTRAINT UK_Division  UNIQUE (DivisionId)
)

go


IF OBJECT_ID('Division') IS NOT NULL
    PRINT '<<< CREATED TABLE Division >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Division >>>'
go

/* 
 * TABLE: EnvironmentalItem 
 */

CREATE TABLE EnvironmentalItem(
    EnvironmentalItemId      uniqueidentifier    CONSTRAINT [DF_EnvironmentalItem_EnvironmentalItemId] DEFAULT (newsequentialid()) NOT NULL,
    EnvironmentalItemName    nvarchar(100)       NOT NULL,
    CreatedBy                nvarchar(100)       NOT NULL,
    CreatedDate              datetime            NOT NULL,
    ModifiedBy               nvarchar(100)       NULL,
    ModifiedDate             datetime            NULL,
    SortOrder                int                 NOT NULL,
    IsActive                 bit                 CONSTRAINT [DF_EnvironmentalItem_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT PK_EnvironmentalItem PRIMARY KEY CLUSTERED (EnvironmentalItemName),
    CONSTRAINT UK_EnvironmentalItem  UNIQUE (EnvironmentalItemId)
)

go


IF OBJECT_ID('EnvironmentalItem') IS NOT NULL
    PRINT '<<< CREATED TABLE EnvironmentalItem >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE EnvironmentalItem >>>'
go

/* 
 * TABLE: FederalEnvironmentalDocument 
 */

CREATE TABLE FederalEnvironmentalDocument(
    FederalEnvironmentalDocumentId      uniqueidentifier    CONSTRAINT [DF_FederalEnvironmentalDocument_FederalEnvironmentalDocumentId] DEFAULT (newsequentialid()) NOT NULL,
    FederalEnvironmentalDocumentName    nvarchar(100)       NOT NULL,
    CreatedBy                           nvarchar(100)       NOT NULL,
    CreatedDate                         datetime            NOT NULL,
    ModifiedBy                          nvarchar(100)       NULL,
    ModifiedDate                        datetime            NULL,
    SortOrder                           int                 NOT NULL,
    IsActive                            bit                 CONSTRAINT [DF_FederalEnvironmentalDocument_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT PK_FederalEnvironmentalDocument PRIMARY KEY CLUSTERED (FederalEnvironmentalDocumentName),
    CONSTRAINT UK_FederalEnvironmentalDocument  UNIQUE (FederalEnvironmentalDocumentId)
)

go


IF OBJECT_ID('FederalEnvironmentalDocument') IS NOT NULL
    PRINT '<<< CREATED TABLE FederalEnvironmentalDocument >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FederalEnvironmentalDocument >>>'
go

/* 
 * TABLE: FunctionalClass 
 */

CREATE TABLE FunctionalClass(
    FunctionalClassId      uniqueidentifier    CONSTRAINT [DF_FunctionalClass_FunctionalClassId] DEFAULT (newsequentialid()) NOT NULL,
    FunctionalClassName    nvarchar(100)       NOT NULL,
    CreatedBy              nvarchar(100)       NOT NULL,
    CreatedDate            datetime            NOT NULL,
    ModifiedBy             nvarchar(100)       NULL,
    ModifiedDate           datetime            NULL,
    SortOrder              int                 NOT NULL,
    IsActive               bit                 CONSTRAINT [DF_FunctionalClass_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT PK_FunctionalClass PRIMARY KEY CLUSTERED (FunctionalClassName),
    CONSTRAINT UK_FunctionalClass  UNIQUE (FunctionalClassId)
)

go


IF OBJECT_ID('FunctionalClass') IS NOT NULL
    PRINT '<<< CREATED TABLE FunctionalClass >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FunctionalClass >>>'
go

/* 
 * TABLE: Goal 
 */

CREATE TABLE Goal(
    GoalId          uniqueidentifier    CONSTRAINT [DF_Goal_GoalId] DEFAULT (newsequentialid()) NOT NULL,
    GoalName        nvarchar(100)       NOT NULL,
    CreatedBy       nvarchar(100)       NOT NULL,
    CreatedDate     datetime            NOT NULL,
    ModifiedBy      nvarchar(100)       NULL,
    ModifiedDate    datetime            NULL,
    SortOrder       int                 NOT NULL,
    IsActive        bit                 CONSTRAINT [DF_Goal_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT PK_Goal PRIMARY KEY CLUSTERED (GoalName),
    CONSTRAINT UK_Goal  UNIQUE (GoalId)
)

go


IF OBJECT_ID('Goal') IS NOT NULL
    PRINT '<<< CREATED TABLE Goal >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Goal >>>'
go

/* 
 * TABLE: Island 
 */

CREATE TABLE Island(
    IslandId        uniqueidentifier    CONSTRAINT [DF_Island_IslandId] DEFAULT (newsequentialid()) NOT NULL,
    IslandName      nvarchar(100)       NOT NULL,
    Color           char(6)             NULL,
    CreatedBy       nvarchar(100)       NOT NULL,
    CreatedDate     datetime            NOT NULL,
    ModifiedBy      nvarchar(100)       NULL,
    ModifiedDate    datetime            NULL,
    SortOrder       int                 NOT NULL,
    IsActive        bit                 CONSTRAINT [DF_Island_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT PK_Island PRIMARY KEY CLUSTERED (IslandName),
    CONSTRAINT UK_Island  UNIQUE (IslandId)
)

go


IF OBJECT_ID('Island') IS NOT NULL
    PRINT '<<< CREATED TABLE Island >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Island >>>'
go

/* 
 * TABLE: Phase 
 */

CREATE TABLE Phase(
    PhaseId         uniqueidentifier    CONSTRAINT [DF_Phase_PhaseId] DEFAULT (newsequentialid()) NOT NULL,
    PhaseName       nvarchar(100)       NOT NULL,
    CreatedBy       nvarchar(100)       NOT NULL,
    CreatedDate     datetime            NOT NULL,
    ModifiedBy      nvarchar(100)       NULL,
    ModifiedDate    datetime            NULL,
    SortOrder       int                 NOT NULL,
    IsActive        bit                 CONSTRAINT [DF_Phase_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT PK_Phase PRIMARY KEY CLUSTERED (PhaseName),
    CONSTRAINT UK_Phase  UNIQUE (PhaseId)
)

go


IF OBJECT_ID('Phase') IS NOT NULL
    PRINT '<<< CREATED TABLE Phase >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Phase >>>'
go

/* 
 * TABLE: PlanningDistrict 
 */

CREATE TABLE PlanningDistrict(
    PlanningDistrictId      uniqueidentifier    CONSTRAINT [DF_PlanningDistrict_PlanningDistrictId] DEFAULT (newsequentialid()) NOT NULL,
    PlanningDistrictName    nvarchar(100)       NOT NULL,
    Color                   char(6)             NULL,
    CreatedBy               nvarchar(100)       NOT NULL,
    CreatedDate             datetime            NOT NULL,
    ModifiedBy              nvarchar(100)       NULL,
    ModifiedDate            datetime            NULL,
    SortOrder               int                 NOT NULL,
    IsActive                bit                 CONSTRAINT [DF_PlanningDistrict_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT PK_PlanningDistrict PRIMARY KEY CLUSTERED (PlanningDistrictName),
    CONSTRAINT UK_PlanningDistrict  UNIQUE (PlanningDistrictId)
)

go


IF OBJECT_ID('PlanningDistrict') IS NOT NULL
    PRINT '<<< CREATED TABLE PlanningDistrict >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PlanningDistrict >>>'
go

/* 
 * TABLE: PlanningDistrictIsland 
 */

CREATE TABLE PlanningDistrictIsland(
    PlanningDistrictIslandId    uniqueidentifier    CONSTRAINT [DF_PlanningDistrictIsland_PlanningDistrictIslandId] DEFAULT (newsequentialid()) NOT NULL,
    PlanningDistrictId          uniqueidentifier    NOT NULL,
    IslandId                    uniqueidentifier    NOT NULL,
    CONSTRAINT PK_PlanningDistrictIsland PRIMARY KEY CLUSTERED (PlanningDistrictId, IslandId),
    CONSTRAINT UK_PlanningDistrictIsland  UNIQUE (PlanningDistrictIslandId)
)

go


IF OBJECT_ID('PlanningDistrictIsland') IS NOT NULL
    PRINT '<<< CREATED TABLE PlanningDistrictIsland >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE PlanningDistrictIsland >>>'
go

/* 
 * TABLE: Priority 
 */

CREATE TABLE Priority(
    PriorityId      uniqueidentifier    CONSTRAINT [DF_Priority_PriorityId] DEFAULT (newsequentialid()) NOT NULL,
    PriorityName    nvarchar(100)       NOT NULL,
    CreatedBy       nvarchar(100)       NOT NULL,
    CreatedDate     datetime            NOT NULL,
    ModifiedBy      nvarchar(100)       NULL,
    ModifiedDate    datetime            NULL,
    SortOrder       int                 NOT NULL,
    IsActive        bit                 CONSTRAINT [DF_Priority_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT PK_Priority PRIMARY KEY CLUSTERED (PriorityName),
    CONSTRAINT UK_Priority  UNIQUE (PriorityId)
)

go


IF OBJECT_ID('Priority') IS NOT NULL
    PRINT '<<< CREATED TABLE Priority >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Priority >>>'
go

/* 
 * TABLE: ProgramCategory 
 */

CREATE TABLE ProgramCategory(
    ProgramCategoryId      uniqueidentifier    CONSTRAINT [DF_ProgramCategory_ProgramCategoryId] DEFAULT (newsequentialid()) NOT NULL,
    ProgramCategoryName    nvarchar(100)       NOT NULL,
    Color                  char(6)             NULL,
    CreatedBy              nvarchar(100)       NOT NULL,
    CreatedDate            datetime            NOT NULL,
    ModifiedBy             nvarchar(100)       NULL,
    ModifiedDate           datetime            NULL,
    SortOrder              int                 NOT NULL,
    IsActive               bit                 CONSTRAINT [DF_ProgramCategory_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT PK_ProgramCategory PRIMARY KEY CLUSTERED (ProgramCategoryName),
    CONSTRAINT UK_ProgramCategory  UNIQUE (ProgramCategoryId)
)

go


IF OBJECT_ID('ProgramCategory') IS NOT NULL
    PRINT '<<< CREATED TABLE ProgramCategory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ProgramCategory >>>'
go

/* 
 * TABLE: ProgramProject 
 */

CREATE TABLE ProgramProject(
    ProgramProjectId                  uniqueidentifier    CONSTRAINT [DF_ProgramProject_ProgramProjectId] DEFAULT (newsequentialid()) NOT NULL,
    ScenarioId                        uniqueidentifier    NOT NULL,
    SectionId                         uniqueidentifier    NULL,
    ProgramManager                    nvarchar(100)       NULL,
    PriorityId                        uniqueidentifier    NULL,
    IsMandated                        bit                 NULL,
    MandatedExplanation               nvarchar(max)       NULL,
    IsConsentDecree                   bit                 NULL,
    ProgramProjectName                nvarchar(255)       NOT NULL,
    PurposeAndNeed                    nvarchar(max)       NULL,
    WorkDescription                   nvarchar(max)       NULL,
    ImpactOnMeetingNeeds              nvarchar(max)       NULL,
    ImpactOnOandM                     nvarchar(max)       NULL,
    StateEnvironmentalDocumentId      uniqueidentifier    NULL,
    FederalEnvironmentalDocumentId    uniqueidentifier    NULL,
    PrimaryProgramSubCategoryId       uniqueidentifier    NULL,
    PrimaryProgramCategoryAmount      tinyint             NULL,
    CreatedBy                         nvarchar(100)       NOT NULL,
    CreatedDate                       datetime            NOT NULL,
    ModifiedBy                        nvarchar(100)       NULL,
    ModifiedDate                      datetime            NULL,
    SubmittedBy                       nvarchar(100)       NULL,
    SubmittedDate                     datetime            NULL,
    RejectedBy                        nvarchar(100)       NULL,
    RejectedDate                      datetime            NULL,
    ApprovedBy                        nvarchar(100)       NULL,
    ApprovedDate                      datetime            NULL,
    DeletedBy                         nvarchar(100)       NULL,
    DeletedDate                       datetime            NULL,
    CONSTRAINT PK_ProgramProject PRIMARY KEY CLUSTERED (ProgramProjectId)
)

go


IF OBJECT_ID('ProgramProject') IS NOT NULL
    PRINT '<<< CREATED TABLE ProgramProject >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ProgramProject >>>'
go

/* 
 * TABLE: ProgramProjectAlternative 
 */

CREATE TABLE ProgramProjectAlternative(
    ProgramProjectAlternativeId    uniqueidentifier    CONSTRAINT [DF_ProgramProjectAlternative_ProgramProjectAlternativeId] DEFAULT (newsequentialid()) NOT NULL,
    ProgramProjectId               uniqueidentifier    NOT NULL,
    AlternativeTypeId              uniqueidentifier    NOT NULL,
    Description                    nvarchar(max)       NULL,
    CONSTRAINT PK_ProgramProjectAlternative PRIMARY KEY CLUSTERED (ProgramProjectAlternativeId)
)

go


IF OBJECT_ID('ProgramProjectAlternative') IS NOT NULL
    PRINT '<<< CREATED TABLE ProgramProjectAlternative >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ProgramProjectAlternative >>>'
go

/* 
 * TABLE: ProgramProjectDocument 
 */

CREATE TABLE ProgramProjectDocument(
    ProgramProjectDocumentId    uniqueidentifier    CONSTRAINT [DF_ProgramProjectDocument_ProgramProjectDocumentId] DEFAULT (newsequentialid()) NOT NULL,
    ProgramProjectId            uniqueidentifier    NOT NULL,
    MD5Hash                     nvarchar(100)       NOT NULL,
    OriginalFileName            nvarchar(255)       NOT NULL,
    ServerFileName              nvarchar(255)       NOT NULL,
    IsTMS                       bit                 NOT NULL,
    Description                 nvarchar(255)       NULL,
    FileSize                    bigint              NOT NULL,
    UploadedBy                  nvarchar(100)       NOT NULL,
    UploadedDate                datetime            NULL,
    UploadError                 varchar(max)        NULL,
    IsDeleted                   bit                 NOT NULL,
    CONSTRAINT PK_ProgramProjectDocument PRIMARY KEY CLUSTERED (ProgramProjectId, MD5Hash),
    CONSTRAINT UK_ProgramProjectDocument  UNIQUE (ProgramProjectDocumentId)
)

go


IF OBJECT_ID('ProgramProjectDocument') IS NOT NULL
    PRINT '<<< CREATED TABLE ProgramProjectDocument >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ProgramProjectDocument >>>'
go

/* 
 * TABLE: ProgramProjectGoal 
 */

CREATE TABLE ProgramProjectGoal(
    ProgramProjectGoalId    uniqueidentifier    CONSTRAINT [DF_ProgramProjectGoal_ProgramProjectGoalId] DEFAULT (newsequentialid()) NOT NULL,
    ProgramProjectId        uniqueidentifier    NOT NULL,
    GoalId                  uniqueidentifier    NOT NULL,
    CONSTRAINT PK_ProgramProjectGoal PRIMARY KEY CLUSTERED (ProgramProjectId, GoalId),
    CONSTRAINT UK_ProgramProjectGoal  UNIQUE (ProgramProjectGoalId)
)

go


IF OBJECT_ID('ProgramProjectGoal') IS NOT NULL
    PRINT '<<< CREATED TABLE ProgramProjectGoal >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ProgramProjectGoal >>>'
go

/* 
 * TABLE: ProgramProjectHistory 
 */

CREATE TABLE ProgramProjectHistory(
    ProgramProjectHistoryId    uniqueidentifier    CONSTRAINT [DF_ProgramProjectHistory_ProgramProjectHistoryId] DEFAULT (newsequentialid()) NOT NULL,
    ProgramProjectId           uniqueidentifier    NOT NULL,
    HistoryDate                datetime            NOT NULL,
    ChangedBy                  nvarchar(100)       NOT NULL,
    ChangedTabName             nvarchar(255)       NULL,
    ChangedFieldName           nvarchar(255)       NULL,
    OldValue                   nvarchar(max)       NULL,
    NewValue                   nvarchar(max)       NULL,
    CONSTRAINT PK_ProgramProjectHistory PRIMARY KEY CLUSTERED (ProgramProjectHistoryId)
)

go


IF OBJECT_ID('ProgramProjectHistory') IS NOT NULL
    PRINT '<<< CREATED TABLE ProgramProjectHistory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ProgramProjectHistory >>>'
go

/* 
 * TABLE: ProgramProjectIsland 
 */

CREATE TABLE ProgramProjectIsland(
    ProgramProjectIslandId    uniqueidentifier    CONSTRAINT [DF_ProgramProjectIsland_ProgramProjectIslandId] DEFAULT (newsequentialid()) NOT NULL,
    ProgramProjectId          uniqueidentifier    NOT NULL,
    IslandId                  uniqueidentifier    NOT NULL,
    CONSTRAINT PK_ProgramProjectIsland PRIMARY KEY CLUSTERED (ProgramProjectId, IslandId),
    CONSTRAINT UK_ProgramProjectIsland  UNIQUE (ProgramProjectIslandId)
)

go


IF OBJECT_ID('ProgramProjectIsland') IS NOT NULL
    PRINT '<<< CREATED TABLE ProgramProjectIsland >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ProgramProjectIsland >>>'
go

/* 
 * TABLE: ProgramProjectPhase 
 */

CREATE TABLE ProgramProjectPhase(
    ProgramProjectPhaseId      uniqueidentifier    CONSTRAINT [DF_ProgramProjectPhase_ProgramProjectPhaseId] DEFAULT (newsequentialid()) NOT NULL,
    ProgramProjectId           uniqueidentifier    NOT NULL,
    PhaseId                    uniqueidentifier    NOT NULL,
    ProgramProjectPhaseYear    int                 NOT NULL,
    FederalShare               money               NULL,
    LocalShare                 money               NULL,
    CONSTRAINT PK_ProgramProjectPhase PRIMARY KEY CLUSTERED (ProgramProjectId, PhaseId, ProgramProjectPhaseYear),
    CONSTRAINT UK_ProgramProjectPhase  UNIQUE (ProgramProjectPhaseId)
)

go


IF OBJECT_ID('ProgramProjectPhase') IS NOT NULL
    PRINT '<<< CREATED TABLE ProgramProjectPhase >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ProgramProjectPhase >>>'
go

/* 
 * TABLE: ProgramProjectSecondaryProgramSubCategory 
 */

CREATE TABLE ProgramProjectSecondaryProgramSubCategory(
    ProgramProjectSecondaryProgramSubCategoryId    uniqueidentifier    CONSTRAINT [DF_ProgramProjectSecondaryProgramSubCategory_ProgramProjectSecondaryProgramSubCategoryId] DEFAULT (newsequentialid()) NOT NULL,
    ProgramProjectId                               uniqueidentifier    NOT NULL,
    ProgramSubCategoryId                           uniqueidentifier    NOT NULL,
    Amount                                         tinyint             NULL,
    CONSTRAINT PK_ProgramProjectSecondaryProgramSubCategory PRIMARY KEY CLUSTERED (ProgramProjectSecondaryProgramSubCategoryId),
    CONSTRAINT UK_ProgramProjectSecondaryProgramSubCategory  UNIQUE (ProgramProjectSecondaryProgramSubCategoryId)
)

go


IF OBJECT_ID('ProgramProjectSecondaryProgramSubCategory') IS NOT NULL
    PRINT '<<< CREATED TABLE ProgramProjectSecondaryProgramSubCategory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ProgramProjectSecondaryProgramSubCategory >>>'
go

/* 
 * TABLE: ProgramSubCategory 
 */

CREATE TABLE ProgramSubCategory(
    ProgramSubCategoryId      uniqueidentifier    CONSTRAINT [DF_ProgramSubCategory_ProgramSubCategoryId] DEFAULT (newsequentialid()) NOT NULL,
    ProgramSubCategoryName    nvarchar(100)       NOT NULL,
    ProgramCategoryId         uniqueidentifier    NOT NULL,
    CreatedBy                 nvarchar(100)       NOT NULL,
    CreatedDate               datetime            NOT NULL,
    ModifiedBy                nvarchar(100)       NULL,
    ModifiedDate              datetime            NULL,
    SortOrder                 int                 NOT NULL,
    IsActive                  bit                 CONSTRAINT [DF_ProgramSubCategory_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT PK_ProgramSubCategory PRIMARY KEY CLUSTERED (ProgramSubCategoryName, ProgramCategoryId),
    CONSTRAINT UK_ProgramSubCategory  UNIQUE (ProgramSubCategoryId)
)

go


IF OBJECT_ID('ProgramSubCategory') IS NOT NULL
    PRINT '<<< CREATED TABLE ProgramSubCategory >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ProgramSubCategory >>>'
go

/* 
 * TABLE: Project 
 */

CREATE TABLE Project(
    ProjectId                         uniqueidentifier    CONSTRAINT [DF_Project_ProjectId] DEFAULT (newsequentialid()) NOT NULL,
    ProgramProjectId                  uniqueidentifier    NOT NULL,
    ProjectManager                    nvarchar(100)       NOT NULL,
    AADT                              int                 NOT NULL,
    OnNHS                             bit                 NOT NULL,
    IsEligibleForFederalAid           bit                 NOT NULL,
    IsPrimaryHighwayFreightSystem     bit                 NOT NULL,
    IsCriticalUrbanFreightCorridor    bit                 NOT NULL,
    IsCriticalRuralFreightCorridor    bit                 NOT NULL,
    IsHawaiiFreightNetwork            bit                 NOT NULL,
    ExistingAndNewUtilitiesWork       nvarchar(max)       NULL,
    IsWithinRightOfWay                bit                 NOT NULL,
    IsLandIssues                      bit                 NOT NULL,
    LandIssuesDescription             nvarchar(max)       NULL,
    ExistingRightOfWayDescription     nvarchar(max)       NULL,
    IsRepeatedlyDamanagedSite         bit                 NOT NULL,
    RepeatedlyDamagedDescription      nvarchar(max)       NULL,
    AdditionalInformation             nvarchar(max)       NULL,
    CONSTRAINT PK_Project PRIMARY KEY CLUSTERED (ProgramProjectId),
    CONSTRAINT UK_Project  UNIQUE (ProjectId)
)

go


IF OBJECT_ID('Project') IS NOT NULL
    PRINT '<<< CREATED TABLE Project >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Project >>>'
go

/* 
 * TABLE: ProjectEnvironmentalItem 
 */

CREATE TABLE ProjectEnvironmentalItem(
    ProjectEnvironmentalItemId    uniqueidentifier    CONSTRAINT [DF_ProjectEnvironmentalItem_ProjectEnvironmentalItemId] DEFAULT (newsequentialid()) NOT NULL,
    EnvironmentalItemId           uniqueidentifier    NOT NULL,
    ProjectId                     uniqueidentifier    NOT NULL,
    IsApplicable                  bit                 NULL,
    CONSTRAINT PK_ProjectEnvironmentalItem PRIMARY KEY CLUSTERED (EnvironmentalItemId, ProjectId),
    CONSTRAINT UK_ProjectEnvironmentalItem  UNIQUE (ProjectEnvironmentalItemId)
)

go


IF OBJECT_ID('ProjectEnvironmentalItem') IS NOT NULL
    PRINT '<<< CREATED TABLE ProjectEnvironmentalItem >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ProjectEnvironmentalItem >>>'
go

/* 
 * TABLE: ProjectLocation 
 */

CREATE TABLE ProjectLocation(
    ProjectLocationId    uniqueidentifier    CONSTRAINT [DF_ProjectLocation_ProjectLocationId] DEFAULT (newsequentialid()) NOT NULL,
    ProjectId            uniqueidentifier    NOT NULL,
    RouteNameId          uniqueidentifier    NOT NULL,
    FunctionalClassId    uniqueidentifier    NOT NULL,
    BeginMilepost        decimal(5, 2)       NULL,
    EndMilepost          decimal(5, 2)       NULL,
    SortOrder            int                 NOT NULL,
    CONSTRAINT PK_ProjectLocation PRIMARY KEY CLUSTERED (ProjectLocationId),
    CONSTRAINT UK_ProjectLocation  UNIQUE (ProjectLocationId)
)

go


IF OBJECT_ID('ProjectLocation') IS NOT NULL
    PRINT '<<< CREATED TABLE ProjectLocation >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ProjectLocation >>>'
go

/* 
 * TABLE: ProjectOtherEnvironmentalItem 
 */

CREATE TABLE ProjectOtherEnvironmentalItem(
    ProjectOtherEnvironmentalItemId      uniqueidentifier    CONSTRAINT [DF_ProjectOtherEnvironmentalItem_ProjectOtherEnvironmentalItemId] DEFAULT (newsequentialid()) NOT NULL,
    ProjectOtherEnvironmentalItemName    nvarchar(255)       NOT NULL,
    ProjectId                            uniqueidentifier    NOT NULL,
    CONSTRAINT PK_ProjectOtherEnvironmentalItem PRIMARY KEY CLUSTERED (ProjectOtherEnvironmentalItemName),
    CONSTRAINT UK_ProjectOtherEnvironmentalItem  UNIQUE (ProjectOtherEnvironmentalItemId)
)

go


IF OBJECT_ID('ProjectOtherEnvironmentalItem') IS NOT NULL
    PRINT '<<< CREATED TABLE ProjectOtherEnvironmentalItem >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ProjectOtherEnvironmentalItem >>>'
go

/* 
 * TABLE: ProjectPlanningDistrict 
 */

CREATE TABLE ProjectPlanningDistrict(
    ProjectPlanningDistrictId    uniqueidentifier    CONSTRAINT [DF_ProjectPlanningDistrict_ProjectPlanningDistrictId] DEFAULT (newsequentialid()) NOT NULL,
    PlanningDistrictId           uniqueidentifier    NOT NULL,
    ProjectId                    uniqueidentifier    NOT NULL,
    CONSTRAINT PK_ProjectPlanningDistrict PRIMARY KEY CLUSTERED (PlanningDistrictId, ProjectId),
    CONSTRAINT UK_ProjectPlanningDistrict  UNIQUE (ProjectPlanningDistrictId)
)

go


IF OBJECT_ID('ProjectPlanningDistrict') IS NOT NULL
    PRINT '<<< CREATED TABLE ProjectPlanningDistrict >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ProjectPlanningDistrict >>>'
go

/* 
 * TABLE: ProjectScopeItem 
 */

CREATE TABLE ProjectScopeItem(
    ProjectScopeItemId      uniqueidentifier    CONSTRAINT [DF_ProjectScopeItem_ProjectScopeItemId] DEFAULT (newsequentialid()) NOT NULL,
    ProjectScopeItemName    nvarchar(255)       NOT NULL,
    ProjectId               uniqueidentifier    NOT NULL,
    Description             nvarchar(max)       NULL,
    SortOrder               int                 NOT NULL,
    CONSTRAINT PK_ProjectScopeItem PRIMARY KEY CLUSTERED (ProjectScopeItemName),
    CONSTRAINT UK_ProjectScopeItem  UNIQUE (ProjectScopeItemId)
)

go


IF OBJECT_ID('ProjectScopeItem') IS NOT NULL
    PRINT '<<< CREATED TABLE ProjectScopeItem >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE ProjectScopeItem >>>'
go

/* 
 * TABLE: RouteName 
 */

CREATE TABLE RouteName(
    RouteNameId      uniqueidentifier    CONSTRAINT [DF_RouteName_RouteNameId] DEFAULT (newsequentialid()) NOT NULL,
    RouteName        nvarchar(200)       NOT NULL,
    RouteNumberId    uniqueidentifier    NOT NULL,
    CreatedBy        nvarchar(100)       NOT NULL,
    CreatedDate      datetime            NOT NULL,
    ModifiedBy       nvarchar(100)       NULL,
    ModifiedDate     datetime            NULL,
    SortOrder        int                 NOT NULL,
    IsActive         bit                 CONSTRAINT [DF_RouteName_IsActive] DEFAULT ((1)) NOT NULL,
    BeginMilepost    decimal(5, 2)       NULL,
    EndMilepost      decimal(5, 2)       NULL,
    CONSTRAINT PK_RouteName PRIMARY KEY CLUSTERED (RouteName, RouteNumberId),
    CONSTRAINT UK_RouteName  UNIQUE (RouteNameId)
)

go


IF OBJECT_ID('RouteName') IS NOT NULL
    PRINT '<<< CREATED TABLE RouteName >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RouteName >>>'
go

/* 
 * TABLE: RouteNumber 
 */

CREATE TABLE RouteNumber(
    RouteNumberId    uniqueidentifier    CONSTRAINT [DF_RouteNumber_RouteNumberId] DEFAULT (newsequentialid()) NOT NULL,
    RouteNumber      nvarchar(50)        NOT NULL,
    IslandId         uniqueidentifier    NOT NULL,
    CreatedBy        nvarchar(100)       NOT NULL,
    CreatedDate      datetime            NOT NULL,
    ModifiedBy       nvarchar(100)       NULL,
    ModifiedDate     datetime            NULL,
    SortOrder        int                 NOT NULL,
    IsActive         bit                 CONSTRAINT [DF_RouteNumber_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT PK_RouteNumber PRIMARY KEY CLUSTERED (RouteNumber),
    CONSTRAINT UK_RouteNumber  UNIQUE (RouteNumberId)
)

go


IF OBJECT_ID('RouteNumber') IS NOT NULL
    PRINT '<<< CREATED TABLE RouteNumber >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE RouteNumber >>>'
go

/* 
 * TABLE: Scenario 
 */

CREATE TABLE Scenario(
    ScenarioId      uniqueidentifier    CONSTRAINT [DF_Scenario_ScenarioId] DEFAULT (newsequentialid()) NOT NULL,
    ScenarioName    nvarchar(100)       NOT NULL,
    Description     nvarchar(255)       NULL,
    StatusId        uniqueidentifier    NOT NULL,
    IsDefault       bit                 NOT NULL,
    CreatedBy       nvarchar(100)       NOT NULL,
    CreatedDate     datetime            NOT NULL,
    ModifiedBy      nvarchar(100)       NULL,
    ModifiedDate    datetime            NULL,
    CONSTRAINT PK_Scenario PRIMARY KEY CLUSTERED (ScenarioName),
    CONSTRAINT UK_Scenario  UNIQUE (ScenarioId)
)

go


IF OBJECT_ID('Scenario') IS NOT NULL
    PRINT '<<< CREATED TABLE Scenario >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Scenario >>>'
go

/* 
 * TABLE: Section 
 */

CREATE TABLE Section(
    SectionId       uniqueidentifier    CONSTRAINT [DF_Section_SectionId] DEFAULT (newsequentialid()) NOT NULL,
    BranchId        uniqueidentifier    NOT NULL,
    SectionName     nvarchar(100)       NOT NULL,
    Abbreviation    nvarchar(50)        NOT NULL,
    CreatedBy       nvarchar(100)       NOT NULL,
    CreatedDate     datetime            NOT NULL,
    ModifiedBy      nvarchar(100)       NULL,
    ModifiedDate    datetime            NULL,
    SortOrder       int                 NOT NULL,
    IsActive        bit                 CONSTRAINT [DF_Section_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT PK_Section PRIMARY KEY CLUSTERED (BranchId, SectionName),
    CONSTRAINT UK_Section  UNIQUE (SectionId)
)

go


IF OBJECT_ID('Section') IS NOT NULL
    PRINT '<<< CREATED TABLE Section >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Section >>>'
go

/* 
 * TABLE: StateEnvironmentalDocument 
 */

CREATE TABLE StateEnvironmentalDocument(
    StateEnvironmentalDocumentId      uniqueidentifier    CONSTRAINT [DF_StateEnvironmentalDocument_StateEnvironmentalDocumentId] DEFAULT (newsequentialid()) NOT NULL,
    StateEnvironmentalDocumentName    nvarchar(100)       NOT NULL,
    CreatedBy                         nvarchar(100)       NOT NULL,
    CreatedDate                       datetime            NOT NULL,
    ModifiedBy                        nvarchar(100)       NULL,
    ModifiedDate                      datetime            NULL,
    SortOrder                         int                 NOT NULL,
    IsActive                          bit                 CONSTRAINT [DF_StateEnvironmentalDocument_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT PK_StateEnvironmentalDocument PRIMARY KEY CLUSTERED (StateEnvironmentalDocumentName),
    CONSTRAINT UK_StateEnvironmentalDocument  UNIQUE (StateEnvironmentalDocumentId)
)

go


IF OBJECT_ID('StateEnvironmentalDocument') IS NOT NULL
    PRINT '<<< CREATED TABLE StateEnvironmentalDocument >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE StateEnvironmentalDocument >>>'
go

/* 
 * TABLE: Status 
 */

CREATE TABLE Status(
    StatusId        uniqueidentifier    CONSTRAINT [DF_Status_StatusId] DEFAULT (newsequentialid()) NOT NULL,
    StatusName      nvarchar(100)       NOT NULL,
    CreatedBy       nvarchar(100)       NOT NULL,
    CreatedDate     datetime            NOT NULL,
    ModifiedBy      nvarchar(100)       NULL,
    ModifiedDate    datetime            NULL,
    SortOrder       int                 NOT NULL,
    IsActive        bit                 CONSTRAINT [DF_Status_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT PK_Status PRIMARY KEY CLUSTERED (StatusName),
    CONSTRAINT UK_Status  UNIQUE (StatusId)
)

go


IF OBJECT_ID('Status') IS NOT NULL
    PRINT '<<< CREATED TABLE Status >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Status >>>'
go

/* 
 * TABLE: Branch 
 */

ALTER TABLE Branch ADD CONSTRAINT FK_Division_Branch 
    FOREIGN KEY (DivisionId)
    REFERENCES Division(DivisionId)
go


/* 
 * TABLE: PlanningDistrictIsland 
 */

ALTER TABLE PlanningDistrictIsland ADD CONSTRAINT FK_Island_PlanningDistrictIsland 
    FOREIGN KEY (IslandId)
    REFERENCES Island(IslandId)
go

ALTER TABLE PlanningDistrictIsland ADD CONSTRAINT FK_PlanningDistrict_PlanningDistrictIsland 
    FOREIGN KEY (PlanningDistrictId)
    REFERENCES PlanningDistrict(PlanningDistrictId)
go


/* 
 * TABLE: ProgramProject 
 */

ALTER TABLE ProgramProject ADD CONSTRAINT FK_FederalEnvironmentalDocument_ProgramProject 
    FOREIGN KEY (FederalEnvironmentalDocumentId)
    REFERENCES FederalEnvironmentalDocument(FederalEnvironmentalDocumentId)
go

ALTER TABLE ProgramProject ADD CONSTRAINT FK_Priority_ProgramProject 
    FOREIGN KEY (PriorityId)
    REFERENCES Priority(PriorityId)
go

ALTER TABLE ProgramProject ADD CONSTRAINT FK_ProgramSubCategory_ProgramProject 
    FOREIGN KEY (PrimaryProgramSubCategoryId)
    REFERENCES ProgramSubCategory(ProgramSubCategoryId)
go

ALTER TABLE ProgramProject ADD CONSTRAINT FK_Scenario_ProgramProject 
    FOREIGN KEY (ScenarioId)
    REFERENCES Scenario(ScenarioId)
go

ALTER TABLE ProgramProject ADD CONSTRAINT FK_Section_ProgramProject 
    FOREIGN KEY (SectionId)
    REFERENCES Section(SectionId)
go

ALTER TABLE ProgramProject ADD CONSTRAINT FK_StateEnvironmentalDocument_ProgramProject 
    FOREIGN KEY (StateEnvironmentalDocumentId)
    REFERENCES StateEnvironmentalDocument(StateEnvironmentalDocumentId)
go


/* 
 * TABLE: ProgramProjectAlternative 
 */

ALTER TABLE ProgramProjectAlternative ADD CONSTRAINT FK_AlternativeType_ProgramProjectAlternative 
    FOREIGN KEY (AlternativeTypeId)
    REFERENCES AlternativeType(AlternativeTypeId)
go

ALTER TABLE ProgramProjectAlternative ADD CONSTRAINT FK_ProgramProject_ProgramProjectAlternative 
    FOREIGN KEY (ProgramProjectId)
    REFERENCES ProgramProject(ProgramProjectId)
go


/* 
 * TABLE: ProgramProjectDocument 
 */

ALTER TABLE ProgramProjectDocument ADD CONSTRAINT FK_ProgramProject_ProgramProjectDocument 
    FOREIGN KEY (ProgramProjectId)
    REFERENCES ProgramProject(ProgramProjectId)
go


/* 
 * TABLE: ProgramProjectGoal 
 */

ALTER TABLE ProgramProjectGoal ADD CONSTRAINT FK_Goal_ProgramProjectGoal 
    FOREIGN KEY (GoalId)
    REFERENCES Goal(GoalId)
go

ALTER TABLE ProgramProjectGoal ADD CONSTRAINT FK_ProgramProject_ProgramProjectGoal 
    FOREIGN KEY (ProgramProjectId)
    REFERENCES ProgramProject(ProgramProjectId)
go


/* 
 * TABLE: ProgramProjectHistory 
 */

ALTER TABLE ProgramProjectHistory ADD CONSTRAINT FK_ProgramProject_ProgramProjectHistory 
    FOREIGN KEY (ProgramProjectId)
    REFERENCES ProgramProject(ProgramProjectId)
go


/* 
 * TABLE: ProgramProjectIsland 
 */

ALTER TABLE ProgramProjectIsland ADD CONSTRAINT FK_Island_ProgramProjectIsland 
    FOREIGN KEY (IslandId)
    REFERENCES Island(IslandId)
go

ALTER TABLE ProgramProjectIsland ADD CONSTRAINT FK_ProgramProject_ProgramProjectIsland 
    FOREIGN KEY (ProgramProjectId)
    REFERENCES ProgramProject(ProgramProjectId)
go


/* 
 * TABLE: ProgramProjectPhase 
 */

ALTER TABLE ProgramProjectPhase ADD CONSTRAINT FK_Phase_ProgramProjectPhase 
    FOREIGN KEY (PhaseId)
    REFERENCES Phase(PhaseId)
go

ALTER TABLE ProgramProjectPhase ADD CONSTRAINT FK_ProgramProject_ProgramProjectPhase 
    FOREIGN KEY (ProgramProjectId)
    REFERENCES ProgramProject(ProgramProjectId)
go


/* 
 * TABLE: ProgramProjectSecondaryProgramSubCategory 
 */

ALTER TABLE ProgramProjectSecondaryProgramSubCategory ADD CONSTRAINT FK_ProgramProject_ProgramProjectSecondaryProgramSubCategory 
    FOREIGN KEY (ProgramProjectId)
    REFERENCES ProgramProject(ProgramProjectId)
go

ALTER TABLE ProgramProjectSecondaryProgramSubCategory ADD CONSTRAINT FK_ProgramSubCategory_ProgramProjectSecondaryProgramSubCategory 
    FOREIGN KEY (ProgramSubCategoryId)
    REFERENCES ProgramSubCategory(ProgramSubCategoryId)
go


/* 
 * TABLE: ProgramSubCategory 
 */

ALTER TABLE ProgramSubCategory ADD CONSTRAINT FK_ProgramCategory_ProgramSubCategory 
    FOREIGN KEY (ProgramCategoryId)
    REFERENCES ProgramCategory(ProgramCategoryId)
go


/* 
 * TABLE: Project 
 */

ALTER TABLE Project ADD CONSTRAINT FK_ProgramProject_Project 
    FOREIGN KEY (ProgramProjectId)
    REFERENCES ProgramProject(ProgramProjectId)
go


/* 
 * TABLE: ProjectEnvironmentalItem 
 */

ALTER TABLE ProjectEnvironmentalItem ADD CONSTRAINT FK_EnvironmentalItem_ProjectEnvironmentalItem 
    FOREIGN KEY (EnvironmentalItemId)
    REFERENCES EnvironmentalItem(EnvironmentalItemId)
go

ALTER TABLE ProjectEnvironmentalItem ADD CONSTRAINT FK_Project_ProjectEnvironmentalItem 
    FOREIGN KEY (ProjectId)
    REFERENCES Project(ProjectId)
go


/* 
 * TABLE: ProjectLocation 
 */

ALTER TABLE ProjectLocation ADD CONSTRAINT FK_FunctionalClass_ProjectLocation 
    FOREIGN KEY (FunctionalClassId)
    REFERENCES FunctionalClass(FunctionalClassId)
go

ALTER TABLE ProjectLocation ADD CONSTRAINT FK_Project_ProjectLocation 
    FOREIGN KEY (ProjectId)
    REFERENCES Project(ProjectId)
go

ALTER TABLE ProjectLocation ADD CONSTRAINT FK_RouteName_ProjectLocation 
    FOREIGN KEY (RouteNameId)
    REFERENCES RouteName(RouteNameId)
go


/* 
 * TABLE: ProjectOtherEnvironmentalItem 
 */

ALTER TABLE ProjectOtherEnvironmentalItem ADD CONSTRAINT FK_Project_ProjectOtherEnvironmentalItem 
    FOREIGN KEY (ProjectId)
    REFERENCES Project(ProjectId)
go


/* 
 * TABLE: ProjectPlanningDistrict 
 */

ALTER TABLE ProjectPlanningDistrict ADD CONSTRAINT FK_PlanningDistrict_ProjectPlanningDistrict 
    FOREIGN KEY (PlanningDistrictId)
    REFERENCES PlanningDistrict(PlanningDistrictId)
go

ALTER TABLE ProjectPlanningDistrict ADD CONSTRAINT FK_Project_ProjectPlanningDistrict 
    FOREIGN KEY (ProjectId)
    REFERENCES Project(ProjectId)
go


/* 
 * TABLE: ProjectScopeItem 
 */

ALTER TABLE ProjectScopeItem ADD CONSTRAINT FK_Project_ProjectScopeItem 
    FOREIGN KEY (ProjectId)
    REFERENCES Project(ProjectId)
go


/* 
 * TABLE: RouteName 
 */

ALTER TABLE RouteName ADD CONSTRAINT FK_RouteNumber_RouteName 
    FOREIGN KEY (RouteNumberId)
    REFERENCES RouteNumber(RouteNumberId)
go


/* 
 * TABLE: RouteNumber 
 */

ALTER TABLE RouteNumber ADD CONSTRAINT FK_Island_RouteNumber 
    FOREIGN KEY (IslandId)
    REFERENCES Island(IslandId)
go


/* 
 * TABLE: Scenario 
 */

ALTER TABLE Scenario ADD CONSTRAINT FK_Status_Scenario 
    FOREIGN KEY (StatusId)
    REFERENCES Status(StatusId)
go


/* 
 * TABLE: Section 
 */

ALTER TABLE Section ADD CONSTRAINT FK_Branch_Section 
    FOREIGN KEY (BranchId)
    REFERENCES Branch(BranchId)
go


