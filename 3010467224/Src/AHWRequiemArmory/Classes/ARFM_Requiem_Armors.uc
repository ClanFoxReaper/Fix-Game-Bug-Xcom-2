class ARFM_Requiem_Armors extends X2Item;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Armors;

	Armors.AddItem(CreateAHWStainlessSpark());
	Armors.AddItem(CreateAHWFloaterArmor());

	return Armors;
}

static function X2DataTemplate CreateAHWStainlessSpark()
{
	local X2SparkArmorTemplate_DLC_3 Template;
	local ArtifactCost	   Alloys;
	local ArtifactCost	   Core;
	local ArtifactCost	   Essence;
	local ArtifactCost	   Corpse;

	`CREATE_X2TEMPLATE(class'X2SparkArmorTemplate_DLC_3', Template, 'AHWStainlessSpark');
	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.Inv_StainlessChassis";
	Template.ItemCat = 'armor';
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	Template.TradingPostValue = 60;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('PoweredSparkArmorStats');
	Template.Abilities.AddItem('ARFMStainlessChassis');
	Template.Abilities.AddItem('AHWCyberdiscHardened');
	Template.ArmorTechCat = 'powered';
	Template.ArmorCat = 'spark';
	Template.Tier = 5;
	Template.AkAudioSoldierArmorSwitch = 'Warden';
	Template.EquipSound = "StrategyUI_Armor_Equip_Powered_Spark";

	Alloys.ItemTemplateName = 'AlienAlloy';
	Alloys.Quantity = 25;
	Template.Cost.ResourceCosts.AddItem(Alloys);

	Core.ItemTemplateName = 'ARFMRequiemCore';
	Core.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Core);

	Essence.ItemTemplateName = 'ARFMRequiemEssence';
	Essence.Quantity = 20;
	Template.Cost.ResourceCosts.AddItem(Essence);

	Corpse.ItemTemplateName = 'CorpseRequiemMechtoid';
	Corpse.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Corpse);

	Template.IntimidateStrength = class'X2Item_DLC_Day90Armors'.default.TIER3_INTIMIDATE_STRENGTH;
	Template.StrikeDamage = class'X2Item_DLC_Day90Armors'.default.TIER3_STRIKE_DMG;

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemMechtoidAutopsy');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_DLC_Day90ItemGrantedAbilitySet'.default.SPARK_POWERED_HEALTH_BONUS, true);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_DLC_Day90ItemGrantedAbilitySet'.default.SPARK_POWERED_MITIGATION_AMOUNT);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_DLC_Day90ItemGrantedAbilitySet'.default.SPARK_POWERED_MOBILITY_BONUS);

	return Template;
}

static function X2DataTemplate CreateAHWFloaterArmor()
{
	local X2ArmorTemplate Template;
	local ArtifactCost	   Alloys;
	local ArtifactCost	   Core;
	local ArtifactCost	   Essence;
	local ArtifactCost	   Corpse;
			
	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'AHWFloaterArmor');
	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.Inv_FloaterArmor";
	Template.ItemCat = 'armor';
	Template.bAddsUtilitySlot = true;
	Template.bHeavyWeapon = true;
	Template.StartingItem = false;
	Template.CanBeBuilt = true;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('HeavyAlienArmorMk2Stats');
	Template.Abilities.AddItem('ARFMValkyrie');
	Template.Abilities.AddItem('AHWFloaterTeleport');
	Template.Abilities.AddItem('AHWFloaterFlightXCOM');
	Template.ArmorTechCat = 'powered';
	Template.Tier = 5;
	Template.EquipNarrative = "DLC_60_NarrativeMoments.CIN_ArmorIntro_AlienMedium";
	Template.EquipSound = "StrategyUI_Armor_Equip_Powered";

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_DLC_Day60ItemGrantedAbilitySet'.default.HEAVY_ALIEN_MK2_HEALTH_BONUS, true);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_DLC_Day60ItemGrantedAbilitySet'.default.HEAVY_ALIEN_MK2_MOBILITY_BONUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_DLC_Day60ItemGrantedAbilitySet'.default.HEAVY_ALIEN_MK2_MITIGATION_AMOUNT);

	Alloys.ItemTemplateName = 'AlienAlloy';
	Alloys.Quantity = 25;
	Template.Cost.ResourceCosts.AddItem(Alloys);

	Core.ItemTemplateName = 'ARFMRequiemCore';
	Core.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Core);

	Essence.ItemTemplateName = 'ARFMRequiemEssence';
	Essence.Quantity = 20;
	Template.Cost.ResourceCosts.AddItem(Essence);

	Corpse.ItemTemplateName = 'CorpseRequiemFloater';
	Corpse.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Corpse);

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemFloaterAutopsy');

	return Template;
}
