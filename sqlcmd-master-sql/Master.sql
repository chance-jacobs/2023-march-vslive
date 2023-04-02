:setvar basePath "/src/"

:setvar path "sprint-2022-december-mrtp"
:r $(basePath)$(path)/InitialDBCreation.sql
:r $(basePath)$(path)/1_HDOT-446_Insert_FederalEnvironmentalDocument.sql
:r $(basePath)$(path)/1_HDOT-446_Insert_Goal.sql
:r $(basePath)$(path)/1_HDOT-446_Insert_Island.sql
:r $(basePath)$(path)/1_HDOT-446_Insert_Phase.sql
:r $(basePath)$(path)/1_HDOT-446_Insert_Priority.sql
:r $(basePath)$(path)/1_HDOT-446_Insert_ProgramCategory.sql
:r $(basePath)$(path)/1_HDOT-446_Insert_StateEnvironmentalDocument.sql
:r $(basePath)$(path)/1_HDOT-446_Insert_Status.sql
:r $(basePath)$(path)/1_HDOT-458_Insert_Branch_Section.sql
:r $(basePath)$(path)/2_HDOT-446_Insert_ProgramSubCategory.sql
:r $(basePath)$(path)/2_HDOT-446_Insert_Scenario.sql
:r $(basePath)$(path)/3_HDOT-446_Insert_ProgramProject.sql
:r $(basePath)$(path)/4_HDOT-446_Insert_ProgramProjectGoal.sql
:r $(basePath)$(path)/4_HDOT-446_Insert_ProgramProjectIsland.sql
:r $(basePath)$(path)/4_HDOT-446_Insert_ProgramProjectPhase.sql

:setvar path "sprint-2023-january-mrtp"
:r $(basePath)$(path)/HDOT-426_Add_ProgramProjectSecondaryProgramCategory.sql
:r $(basePath)$(path)/HDOT-471-Islands-Belong-To-A-HdotDistrict.sql
:r $(basePath)$(path)/HDOT-472_RemoveAlternativeColumn.sql

:setvar path "sprint-2023-february-mrtp"
:r $(basePath)$(path)/HDOT-476_LoadPlanningDistricts.sql
:r $(basePath)$(path)/HDOT-486-Add-NA-Section-To-Branches-Which-Dont-Have-Sections.sql

:r $(basePath)HDOT-493_Grid_Filtering_Causes_Exception.sql
