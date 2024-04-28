class AHW_Narrative_SupplyRaidSurvival extends X2MissionNarrative;

static function array<X2DataTemplate> CreateTemplates()
{
    local array<X2MissionNarrativeTemplate> Templates;

        Templates.AddItem(AHW_SR_Survival());
		
    return Templates;
}

static function X2MissionNarrativeTemplate AHW_SR_Survival()
{
    local X2MissionNarrativeTemplate Template;

    `CREATE_X2MISSIONNARRATIVE_TEMPLATE(Template, 'AHWSupplyRaidSurvival');

	Template.MissionType = "AHWSupplyRaidSurvival";
	Template.NarrativeMoments[0]="X2NarrativeMoments.TACTICAL.TacticalCallouts.T_Tactical_Callouts_Resistance_Central_01";
    Template.NarrativeMoments[1]="XPACK_NarrativeMoments.SupplyRaid_ManyCratesDestroyed";
    Template.NarrativeMoments[2]="XPACK_NarrativeMoments.X2_XP_CEN_T_Swarm_VIP_Dead_EVAC_Now";
    Template.NarrativeMoments[3]="X2NarrativeMoments.TACTICAL.support.T_Support_Alien_Tech_Crate_Spotted_Central";
    Template.NarrativeMoments[4]="X2NarrativeMoments.TACTICAL.General.CEN_Gen_BurnoutSecured_02";
    Template.NarrativeMoments[5]="XPACK_NarrativeMoments.X2_XP_CEN_T_LNA_Part3_Move_to_Evac";
    Template.NarrativeMoments[6]="X2NarrativeMoments.TACTICAL.General.GenTactical_SecureRetreat";
    Template.NarrativeMoments[7]="X2NarrativeMoments.TACTICAL.General.GenTactical_ConsiderRetreat";
    Template.NarrativeMoments[8]="X2NarrativeMoments.T_EVAC_Some_Out_Firebrand_03";
    Template.NarrativeMoments[9]="X2NarrativeMoments.T_EVAC_All_Out_Firebrand_00";
    Template.NarrativeMoments[10]="X2NarrativeMoments.T_EVAC_All_Dead_Firebrand_04";
    Template.NarrativeMoments[11]="X2NarrativeMoments.TACTICAL.General.GenTactical_MissionExtroFailure";
    Template.NarrativeMoments[12]="X2NarrativeMoments.TACTICAL.General.GenTactical_MissionExtroPartialSuccess";
    Template.NarrativeMoments[13]="X2NarrativeMoments.TACTICAL.General.GenTactical_MissionExtroTotalSuccess";
    Template.NarrativeMoments[14]="XPACK_NarrativeMoments.X2_XP_CEN_T_Swarm_Squad_Secure_VIP_Lost";
    Template.NarrativeMoments[15]="XPACK_NarrativeMoments.X2_XP_CEN_T_Swarm_Squad_Wipe";

    return Template;
}