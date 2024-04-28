class AHW_Mission_SupplyRaidSurvival extends X2MissionSet config(GameCore);

static function array<X2DataTemplate> CreateTemplates()
{
    local array<X2MissionTemplate> Templates;

    Templates.AddItem(AddMissionTemplate('AHWSupplyRaidSurvival'));

    return Templates;
}