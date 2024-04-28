class ARFM_Requiem_Ammo extends X2Item config(RequiemWeapons);

var config int NIVENBOOSTER_SUPPLYCOST;
var config int NIVENBOOSTER_ALLOYCOST;
var config int NIVENBOOSTER_ESSENCECOST;
var config int ESSENCEAMMO_SUPPLYCOST;
var config int ESSENCEAMMO_ALLOYCOST;
var config int ESSENCEAMMO_ESSENCECOST;
var config int STAINLESSVEST_SUPPLYCOST;
var config int STAINLESSVEST_ALLOYCOST;
var config int STAINLESSVEST_ELERIUMCOST;
var config int ESSENCEAMMO_DMGMOD;
var config int ESSENCEAMMO_CLIPMOD;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Items;

	Items.AddItem(CreateRequiemNivenBooster());
	Items.AddItem(CreateRequiemStainlessVest());
	Items.AddItem(CreateRequiemRounds());
	
	return Items;
}

static function X2DataTemplate CreateRequiemNivenBooster()
{
	local X2EquipmentTemplate Template;
	local ArtifactCost		Alloys;
	local ArtifactCost		Essence;
	local ArtifactCost		Core;
	local ArtifactCost		Corpse;
	
	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'RequiemNivenBooster');
	Template.ItemCat = 'psioffense';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Amp_Booster";
	Template.EquipSound = "Psi_Amp_Equip";

	Template.Abilities.AddItem('ARFMNivenCapacitor');

	Template.CanBeBuilt = true;
	Template.TradingPostValue = 25;
	Template.PointsToComplete = 0;
	Template.Tier = 5;

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemNivenAutopsy');
	
	// Cost
	Alloys.ItemTemplateName = 'AlienAlloy';
	Alloys.Quantity = 25;
	Template.Cost.ResourceCosts.AddItem(Alloys);

	Core.ItemTemplateName = 'ARFMRequiemCore';
	Core.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Core);

	Essence.ItemTemplateName = 'ARFMRequiemEssence';
	Essence.Quantity = 20;
	Template.Cost.ResourceCosts.AddItem(Essence);

	Corpse.ItemTemplateName = 'CorpseRequiemNiven';
	Corpse.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Corpse);


	return Template;
}

static function X2DataTemplate CreateRequiemStainlessVest()
{
	local X2EquipmentTemplate Template;
	local ArtifactCost		Resources;
	local ArtifactCost		Alloys;
	local ArtifactCost		Essence;
	local ArtifactCost		Corpse;
	
	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'RequiemStainlessVest');
	Template.ItemCat = 'defense';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.Inv_StainlessVest";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Abilities.AddItem('ARFMStainlessVest');

	Template.CanBeBuilt = true;
	Template.TradingPostValue = 25;
	Template.PointsToComplete = 0;
	Template.Tier = 5;

	Template.Requirements.RequiredTechs.AddItem('PlatedArmor');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_ItemGrantedAbilitySet'.default.PLATED_VEST_HP_BONUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_ItemGrantedAbilitySet'.default.PLATED_VEST_MITIGATION_AMOUNT);
	
	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.STAINLESSVEST_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Alloys.ItemTemplateName = 'AlienAlloy';
	Alloys.Quantity = default.STAINLESSVEST_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Alloys);

	Essence.ItemTemplateName = 'EleriumDust';
	Essence.Quantity = default.STAINLESSVEST_ELERIUMCOST;
	Template.Cost.ResourceCosts.AddItem(Essence);

	Corpse.ItemTemplateName = 'CorpseMuton';
	Corpse.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Corpse);


	return Template;
}

static function X2DataTemplate CreateRequiemRounds()
{
	local X2AmmoTemplate	Template;
	local ArtifactCost		Resources;
	local ArtifactCost		Alloys;
	local ArtifactCost		Essence;
	local WeaponDamageValue DamageValue;

	`CREATE_X2TEMPLATE(class'X2AmmoTemplate', Template, 'RequiemRounds');
	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.Inv_RequiemAmmo";
	Template.ModClipSize = default.ESSENCEAMMO_CLIPMOD;
	DamageValue.Damage = default.ESSENCEAMMO_DMGMOD;
	DamageValue.DamageType = 'AHWRequiem';
	Template.AddAmmoDamageModifier(none, DamageValue);
	Template.Abilities.AddItem('ARFMCaeraThal');
	Template.CanBeBuilt = true;
	Template.TradingPostValue = 30;
	Template.PointsToComplete = 0;
	Template.Tier = 5;
	Template.EquipSound = "StrategyUI_Ammo_Equip";

	Template.SetUIStatMarkup(class'XLocalizedData'.default.DamageBonusLabel, , default.ESSENCEAMMO_DMGMOD);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, eStat_ArmorPiercing, class'ARFM_Abilities_RequiemWeapons'.default.ARFMCaeraThalPierce);

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.ESSENCEAMMO_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Alloys.ItemTemplateName = 'AlienAlloy';
	Alloys.Quantity = default.ESSENCEAMMO_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Alloys);

	Essence.ItemTemplateName = 'ARFMRequiemEssence';
	Essence.Quantity = default.ESSENCEAMMO_ESSENCECOST;
	Template.Cost.ResourceCosts.AddItem(Essence);

	//FX Reference
	Template.GameArchetype = "WP_Requiem_XaeMala.PJ_Essence";

	return Template;
}