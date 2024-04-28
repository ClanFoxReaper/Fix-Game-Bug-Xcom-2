class ARFM_Requiem_Weapons extends X2Item config(RequiemWeapons);

var config WeaponDamageValue AHWXAEQUEZ_BASEDAMAGE;
var config WeaponDamageValue AHWKALAMAL_BASEDAMAGE;
var config WeaponDamageValue AHWTAZNAL_BASEDAMAGE;
var config WeaponDamageValue AHWBALADUM_BASEDAMAGE;
var config WeaponDamageValue AHWBALAKAL_BASEDAMAGE;
var config WeaponDamageValue AHWBALAKOR_BASEDAMAGE;
var config WeaponDamageValue AHWTAZKOR_BASEDAMAGE;
var config WeaponDamageValue AHWTALKHAZAN_BASEDAMAGE;
var config array <WeaponDamageValue> AHWTALKHAZAN_EXTRADAMAGE;
var config WeaponDamageValue AHWMORKHAZAN_BASEDAMAGE;
var config WeaponDamageValue AHWKORKHAZAN_BASEDAMAGE;
var config WeaponDamageValue AHWHADUM_BASEDAMAGE;
var config WeaponDamageValue AHWHAKOR_BASEDAMAGE;
var config WeaponDamageValue AHWXAEMALA_BASEDAMAGE;
var config int AHWXAEMALA_AIM;


var config array<int> BALADUM_RANGE;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Weapons;

	//XCOM
	Weapons.AddItem(AHW_RequiemMagnetron()); // Complete?
	Weapons.AddItem(AHW_RequiemHeavyRifle()); // Complete?
	Weapons.AddItem(AHW_RequiemLance()); // Complete?
	Weapons.AddItem(AHW_RequiemPistol()); // Complete?
	Weapons.AddItem(AHW_RequiemSword()); // Complete?
	Weapons.AddItem(AHW_RequiemCannon()); // Complete?
	Weapons.AddItem(AHW_RequiemShotgun()); // Complete?
	Weapons.AddItem(AHW_RequiemRifle()); // Complete?
	Weapons.AddItem(AHW_RequiemSMG()); //Complete?
	Weapons.AddItem(AHW_RequiemScoutSniper()); // Complete?
	Weapons.AddItem(AHW_RequiemSniper()); // Complete?
	Weapons.AddItem(AHW_RequiemBolter()); // Complete?
	Weapons.AddItem(AHW_RequiemSparkSniper()); // Complete?
	
	return Weapons;
}

// XCOM Weapons

static function X2DataTemplate AHW_RequiemMagnetron()
{
	local X2WeaponTemplate	Template;
	local ArtifactCost		Alloys;
	local ArtifactCost		Essence;
	local ArtifactCost		Core;
	local ArtifactCost		Corpse;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWRequiemMagnetron');
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'heavy';
	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.Inv_RequiemMagnetron";
	Template.EquipSound = "StrategyUI_Heavy_Weapon_Equip";

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_BEAM_RANGE;
	Template.BaseDamage = default.AHWXAEQUEZ_BASEDAMAGE;
	Template.iClipSize = 2;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = 80;
	Template.iIdealRange = class'X2Item_DefaultWeapons'.default.ANDROMEDON_IDEALRANGE;
	Template.InfiniteAmmo = false;
	Template.bHideClipSizeStat = true;
	
	Template.InventorySlot = eInvSlot_HeavyWeapon;
	Template.StowedLocation = eSlot_HeavyWeapon;
	Template.GameArchetype = "WP_Requiem_Magnetron.WP__Requiem_Magnetron";
	Template.AltGameArchetype = "WP_Requiem_Magnetron.WP_Requiem_Magnetron_Powered";
	Template.ArmorTechCatForAltArchetype = 'powered';
	Template.bMergeAmmo = true;

	Template.Abilities.AddItem('AHWCyberdiscShot');
	Template.Abilities.AddItem('ARFMTractorBeam');
	Template.Abilities.AddItem('ARFMReloadXaequez');

	Template.CanBeBuilt = true;

	Alloys.ItemTemplateName = 'AlienAlloy';
	Alloys.Quantity = 25;
	Template.Cost.ResourceCosts.AddItem(Alloys);

	Core.ItemTemplateName = 'ARFMRequiemCore';
	Core.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Core);

	Essence.ItemTemplateName = 'ARFMRequiemEssence';
	Essence.Quantity = 20;
	Template.Cost.ResourceCosts.AddItem(Essence);

	Corpse.ItemTemplateName = 'CorpseRequiemCyberdisc';
	Corpse.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Corpse);

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemCyberdiscAutopsy');

	return Template;
}

static function X2DataTemplate AHW_RequiemHeavyRifle()
{
	local X2WeaponTemplate	Template;
	local ArtifactCost		Alloys;
	local ArtifactCost		Essence;
	local ArtifactCost		Core;
	local ArtifactCost		Corpse;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWRequiemHeavyRifle');
	
	Template.WeaponPanelImage = "_ConventionalRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///AHW_MagnasV2_UILibrary.Inv_RequiemHeavyRifle";
	Template.EquipSound = "StrategyUI_Mindshield_Equip";
	Template.Tier = 5;
	Template.InventorySlot = eInvSlot_PrimaryWeapon;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.FLAT_BEAM_RANGE;
	Template.BaseDamage = default.AHWKALAMAL_BASEDAMAGE;
	Template.iClipSize = 4;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.iIdealRange = class'X2Item_DefaultWeapons'.default.ANDROMEDON_IDEALRANGE;

	Template.DamageTypeTemplateName = 'AHWRequiem';
	
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('Suppression');
	Template.Abilities.AddItem('ARFMSuperSuppression');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	Alloys.ItemTemplateName = 'AlienAlloy';
	Alloys.Quantity = 25;
	Template.Cost.ResourceCosts.AddItem(Alloys);

	Core.ItemTemplateName = 'ARFMRequiemCore';
	Core.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Core);

	Essence.ItemTemplateName = 'ARFMRequiemEssence';
	Essence.Quantity = 20;
	Template.Cost.ResourceCosts.AddItem(Essence);

	Corpse.ItemTemplateName = 'CorpseRequiemAndromelid';
	Corpse.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Corpse);

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemAndromelidAutopsy');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Requiem_KalaMal.WP_KalaMal";

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	return Template;
}

static function X2DataTemplate AHW_RequiemLance()
{
	local X2WeaponTemplate	Template;
	local ArtifactCost		Alloys;
	local ArtifactCost		Essence;
	local ArtifactCost		Core;
	local ArtifactCost		Corpse;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWRequiemLance');
	
	Template.WeaponPanelImage = "_ConventionalRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sparkrifle';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///AHW_MagnasV2_UILibrary.Inv_RequiemLance";
	Template.EquipSound = "StrategyUI_Mindshield_Equip";
	Template.Tier = 5;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_BEAM_RANGE;
	Template.BaseDamage = default.AHWBALAKOR_BASEDAMAGE;
	Template.iClipSize = 3;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_MAGNETIC_IENVIRONMENTDAMAGE;
	Template.iIdealRange = class'X2Item_DefaultWeapons'.default.ANDROMEDON_IDEALRANGE;
	Template.InfiniteAmmo = true;
	Template.bHideClipSizeStat = true;
	Template.DamageTypeTemplateName = 'AHWRequiem';
	

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('AHWCoringBeam');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Requiem_BalaKor.WP_BalaKor";

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemMechtoidAutopsy');

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

	Template.DamageTypeTemplateName = 'AHWRequiem';

	return Template;
}

static function X2DataTemplate AHW_RequiemBolter()
{
	local X2WeaponTemplate	Template;
	local ArtifactCost		Alloys;
	local ArtifactCost		Essence;
	local ArtifactCost		Core;
	local ArtifactCost		Corpse;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWRequiemBolter');
	Template.WeaponPanelImage = "_BeamRifle";                       // used by the UI. Probably determines iconview of the weapon.

	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'beam';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///AHW_MagnasV2_UILibrary.Inv_RequiemBolter";
	Template.EquipSound = "StrategyUI_Mindshield_Equip";
	Template.Tier = 5;

	Template.bCanBeDodged = false;
	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.LONG_BEAM_RANGE;
	Template.BaseDamage = default.AHWKORKHAZAN_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_BEAM_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_BEAM_CRITCHANCE;
	Template.iClipSize = 1;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_BEAM_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = 3;


	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('ARFMKorKhazanCripple');
	Template.Abilities.AddItem('ARFMKorKhazanImpaler');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.GameArchetype = "WP_Requiem_KorZal.WP_KorZal";
	
	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemAndromelidAutopsy');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTaipanAutopsy');

	Alloys.ItemTemplateName = 'AlienAlloy';
	Alloys.Quantity = 25;
	Template.Cost.ResourceCosts.AddItem(Alloys);

	Core.ItemTemplateName = 'ARFMRequiemCore';
	Core.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Core);

	Essence.ItemTemplateName = 'ARFMRequiemEssence';
	Essence.Quantity = 20;
	Template.Cost.ResourceCosts.AddItem(Essence);

	Corpse.ItemTemplateName = 'CorpseRequiemTaipan';
	Corpse.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Corpse);

	Template.DamageTypeTemplateName = 'AHWRequiem';

	return Template;
}

static function X2DataTemplate AHW_RequiemSword()
{
	local X2WeaponTemplate	Template;
	local ArtifactCost		Alloys;
	local ArtifactCost		Essence;
	local ArtifactCost		Core;
	local ArtifactCost		Corpse;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWRequiemSword');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///AHW_MagnasV2_UILibrary.Inv_RequiemSword";
	Template.EquipSound = "StrategyUI_Mindshield_Equip";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Requiem_TazNal.WP_Taznal";
	Template.AddDefaultAttachment('R_Back', "BeamSword.Meshes.SM_BeamSword_Sheath", false);
	Template.Tier = 5;

	Template.iRadius = 1;
	Template.NumUpgradeSlots = 3;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.iRange = 0;
	Template.BaseDamage = default.AHWTAZNAL_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_CRITCHANCE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_IENVIRONMENTDAMAGE;
	Template.BaseDamage.DamageType='AHWRequiem';
	
	Template.Abilities.AddItem('ARFMTazNalAssault');
	Template.Abilities.AddItem('SwordSlice');

	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemNightmareAutopsy');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTitanAutopsy');

	Alloys.ItemTemplateName = 'AlienAlloy';
	Alloys.Quantity = 25;
	Template.Cost.ResourceCosts.AddItem(Alloys);

	Core.ItemTemplateName = 'ARFMRequiemCore';
	Core.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Core);

	Essence.ItemTemplateName = 'ARFMRequiemEssence';
	Essence.Quantity = 20;
	Template.Cost.ResourceCosts.AddItem(Essence);

	Corpse.ItemTemplateName = 'CorpseRequiemTitan';
	Corpse.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Corpse);

	Template.DamageTypeTemplateName = 'AHWRequiem';
	
	return Template;
}

static function X2DataTemplate AHW_RequiemShotgun()
{
	local X2WeaponTemplate	Template;
	local ArtifactCost		Alloys;
	local ArtifactCost		Essence;
	local ArtifactCost		Core;
	local ArtifactCost		Corpse;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWRequiemShotgun');
	Template.WeaponPanelImage = "_BeamShotgun";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'shotgun';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///AHW_MagnasV2_UILibrary.Inv_RequiemShotgun";
	Template.EquipSound = "StrategyUI_Mindshield_Equip";
	Template.Tier = 5;

	Template.RangeAccuracy = default.BALADUM_RANGE;
	Template.BaseDamage = default.AHWBALADUM_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.SHOTGUN_BEAM_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.SHOTGUN_BEAM_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.SHOTGUN_BEAM_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.SHOTGUN_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.SHOTGUN_BEAM_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = 3;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('ARFMBalaDumExecute');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Requiem_BalaDum.WP_BalaDum";

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemMechtoidAutopsy');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemIncubatorAutopsy');

	Alloys.ItemTemplateName = 'AlienAlloy';
	Alloys.Quantity = 25;
	Template.Cost.ResourceCosts.AddItem(Alloys);

	Core.ItemTemplateName = 'ARFMRequiemCore';
	Core.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Core);

	Essence.ItemTemplateName = 'ARFMRequiemEssence';
	Essence.Quantity = 20;
	Template.Cost.ResourceCosts.AddItem(Essence);

	Corpse.ItemTemplateName = 'CorpseRequiemIncubator';
	Corpse.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Corpse);

	Template.DamageTypeTemplateName = 'AHWRequiem';

	return Template;
}

static function X2DataTemplate AHW_RequiemCannon()
{
	local X2WeaponTemplate	Template;
	local ArtifactCost		Alloys;
	local ArtifactCost		Essence;
	local ArtifactCost		Core;
	local ArtifactCost		Corpse;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWRequiemCannon');
	Template.WeaponPanelImage = "_BeamCannon";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannon';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///AHW_MagnasV2_UILibrary.Inv_RequiemCannon";
	Template.EquipSound = "StrategyUI_Mindshield_Equip";
	Template.Tier = 5;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_BEAM_RANGE;
	Template.BaseDamage = default.AHWBALAKAL_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.LMG_BEAM_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.LMG_BEAM_CRITCHANCE;
	Template.iClipSize = 5;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.LMG_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.LMG_BEAM_IENVIRONMENTDAMAGE;
	Template.bIsLargeWeapon = true;

	Template.NumUpgradeSlots = 3;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot_NoEnd');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('ARFMBalaKalReload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Requiem_BalaKal.WP_BalaKal";

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemMechtoidAutopsy');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemSeraphAutopsy');

	Alloys.ItemTemplateName = 'AlienAlloy';
	Alloys.Quantity = 25;
	Template.Cost.ResourceCosts.AddItem(Alloys);

	Core.ItemTemplateName = 'ARFMRequiemCore';
	Core.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Core);

	Essence.ItemTemplateName = 'ARFMRequiemEssence';
	Essence.Quantity = 20;
	Template.Cost.ResourceCosts.AddItem(Essence);

	Corpse.ItemTemplateName = 'CorpseRequiemSeraph';
	Corpse.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Corpse);

	Template.DamageTypeTemplateName = 'AHWRequiem';

	return Template;
}

static function X2DataTemplate AHW_RequiemRifle()
{
	local X2WeaponTemplate	Template;
	local ArtifactCost		Alloys;
	local ArtifactCost		Essence;
	local ArtifactCost		Core;
	local ArtifactCost		Corpse;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWRequiemRifle');
	Template.WeaponPanelImage = "_BeamRifle";                       // used by the UI. Probably determines iconview of the weapon.

	Template.WeaponCat = 'rifle';
	Template.WeaponTech = 'beam';
	Template.ItemCat = 'weapon';
	Template.strImage = "img:///AHW_MagnasV2_UILibrary.Inv_RequiemRifle";
	Template.EquipSound = "StrategyUI_Mindshield_Equip";
	Template.Tier = 5;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.MEDIUM_BEAM_RANGE;
	Template.BaseDamage = default.AHWTAZKOR_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_BEAM_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_BEAM_CRITCHANCE;
	Template.iClipSize = 6;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.ASSAULTRIFLE_BEAM_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = 3;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('ARFMTazKorOverwatch');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HoloTargeting');
	Template.Abilities.AddItem('SkirmisherInterrupt');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	Template.GameArchetype = "WP_Requiem_TazKor.WP_TazKor";

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemSeraphAutopsy');

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

	Template.DamageTypeTemplateName = 'AHWRequiem';

	return Template;
}

static function X2DataTemplate AHW_RequiemSniper()
{
	local X2WeaponTemplate	Template;
	local ArtifactCost		Alloys;
	local ArtifactCost		Essence;
	local ArtifactCost		Core;
	local ArtifactCost		Corpse;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWRequiemSniper');
	Template.WeaponPanelImage = "_BeamSniperRifle";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sniper_rifle';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///AHW_MagnasV2_UILibrary.Inv_RequiemSniper";
	Template.EquipSound = "StrategyUI_Mindshield_Equip";
	Template.iTypicalActionCost = 6;
	Template.Tier = 5;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.LONG_BEAM_RANGE;
	Template.BaseDamage = default.AHWTALKHAZAN_BASEDAMAGE;
	Template.ExtraDamage =  default.AHWTALKHAZAN_EXTRADAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_BEAM_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_BEAM_CRITCHANCE;
	Template.iClipSize = 1;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_BEAM_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = 3;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('ARFMTalKhazanShot');
	Template.Abilities.AddItem('ARFMTalKhazanCharge');
	Template.Abilities.AddItem('ARFMTalKhazanCrit');
	Template.Abilities.AddItem('ARFMTalKhazanAntiCrit');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Requiem_TalKhazan.WP_TalKhazan";

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTaipanAutopsy');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemMechtoidAutopsy');

	Alloys.ItemTemplateName = 'AlienAlloy';
	Alloys.Quantity = 25;
	Template.Cost.ResourceCosts.AddItem(Alloys);

	Core.ItemTemplateName = 'ARFMRequiemCore';
	Core.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Core);

	Essence.ItemTemplateName = 'ARFMRequiemEssence';
	Essence.Quantity = 20;
	Template.Cost.ResourceCosts.AddItem(Essence);

	Corpse.ItemTemplateName = 'CorpseRequiemTaipan';
	Corpse.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Corpse);

	Template.DamageTypeTemplateName = 'AHWRequiem';

	return Template;
}

static function X2DataTemplate AHW_RequiemScoutSniper()
{
	local X2WeaponTemplate	Template;
	local ArtifactCost		Alloys;
	local ArtifactCost		Essence;
	local ArtifactCost		Core;
	local ArtifactCost		Corpse;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWRequiemScoutSniper');
	Template.WeaponPanelImage = "_BeamSniperRifle";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'vektor_rifle';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///AHW_MagnasV2_UILibrary.Inv_RequiemScoutSniper";
	Template.EquipSound = "StrategyUI_Mindshield_Equip";
	Template.Tier = 5;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.LONG_BEAM_RANGE;
	Template.BaseDamage = default.AHWMORKHAZAN_BASEDAMAGE;
	Template.Aim = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_BEAM_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_BEAM_CRITCHANCE;
	Template.iClipSize = 1;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_BEAM_IENVIRONMENTDAMAGE;
	Template.iTypicalActionCost = 2;
	Template.NumUpgradeSlots = 3;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('ARFMMorKhazanStealth');
	Template.Abilities.AddItem('ARFMMorKhazanMobility');
	Template.Abilities.AddItem('SniperStandardFire');
	Template.Abilities.AddItem('SniperRifleOverwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Requiem_MorKhazan.WP_MorKhazan";

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTaipanAutopsy');

	Alloys.ItemTemplateName = 'AlienAlloy';
	Alloys.Quantity = 25;
	Template.Cost.ResourceCosts.AddItem(Alloys);

	Core.ItemTemplateName = 'ARFMRequiemCore';
	Core.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Core);

	Essence.ItemTemplateName = 'ARFMRequiemEssence';
	Essence.Quantity = 20;
	Template.Cost.ResourceCosts.AddItem(Essence);

	Corpse.ItemTemplateName = 'CorpseRequiemTaipan';
	Corpse.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Corpse);

	Template.DamageTypeTemplateName = 'AHWRequiem';

	return Template;
}

static function X2DataTemplate AHW_RequiemSMG()
{
	local X2WeaponTemplate	Template;
	local ArtifactCost		Alloys;
	local ArtifactCost		Essence;
	local ArtifactCost		Core;
	local ArtifactCost		Corpse;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWRequiemSMG');
	Template.WeaponPanelImage = "_BeamShotgun";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'bullpup';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///AHW_MagnasV2_UILibrary.Inv_RequiemSMG";
	Template.EquipSound = "StrategyUI_Mindshield_Equip";
	Template.Tier = 5;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_BEAM_RANGE;
	Template.BaseDamage = default.AHWHADUM_BASEDAMAGE;
	Template.Aim = class'X2Item_XpackWeapons'.default.BULLPUP_BEAM_AIM;
	Template.CritChance = class'X2Item_XpackWeapons'.default.BULLPUP_BEAM_CRITCHANCE;
	Template.iClipSize = 3;
	Template.iSoundRange = class'X2Item_XpackWeapons'.default.BULLPUP_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_XpackWeapons'.default.BULLPUP_BEAM_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = 3;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('StandardShot');
	Template.Abilities.AddItem('ARFMHaDumBanish');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Requiem_HaDum.WP_HaDum";

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemOutsiderAutopsy');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemSeraphAutopsy');

	Alloys.ItemTemplateName = 'AlienAlloy';
	Alloys.Quantity = 25;
	Template.Cost.ResourceCosts.AddItem(Alloys);

	Core.ItemTemplateName = 'ARFMRequiemCore';
	Core.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Core);

	Essence.ItemTemplateName = 'ARFMRequiemEssence';
	Essence.Quantity = 20;
	Template.Cost.ResourceCosts.AddItem(Essence);

	Corpse.ItemTemplateName = 'CorpseRequiemOutsider';
	Corpse.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Corpse);

	Template.DamageTypeTemplateName = 'AHWRequiem';

	return Template;
}

static function X2DataTemplate AHW_RequiemPistol()
{
	local X2WeaponTemplate	Template;
	local ArtifactCost		Alloys;
	local ArtifactCost		Essence;
	local ArtifactCost		Core;
	local ArtifactCost		Corpse;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWRequiemPistol');
	Template.WeaponPanelImage = "_Pistol";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'pistol';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///AHW_MagnasV2_UILibrary.Inv_RequiemPistol";
	Template.EquipSound = "StrategyUI_Mindshield_Equip";
	Template.Tier = 5;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.SHORT_BEAM_RANGE;
	Template.BaseDamage = default.AHWHAKOR_BASEDAMAGE;
	Template.Aim = class'X2Item_XpackWeapons'.default.BULLPUP_BEAM_AIM;
	Template.CritChance = class'X2Item_XpackWeapons'.default.BULLPUP_BEAM_CRITCHANCE;
	Template.iClipSize = class'X2Item_DefaultWeapons'.default.PISTOL_BEAM_ICLIPSIZE;
	Template.iSoundRange = class'X2Item_XpackWeapons'.default.BULLPUP_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_XpackWeapons'.default.BULLPUP_BEAM_IENVIRONMENTDAMAGE;

	Template.NumUpgradeSlots = 3;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.Abilities.AddItem('PistolStandardShot');
	Template.Abilities.AddItem('PistolOverwatch');
	Template.Abilities.AddItem('PistolOverwatchShot');
	Template.Abilities.AddItem('PistolReturnFire');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	Template.SetAnimationNameForAbility('FanFire', 'FF_FireMultiShotBeamA');
	
	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;
	Template.InfiniteAmmo = true;
	Template.bHideClipSizeStat = true;

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Requiem_HaKor.WP_HaKor";

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;
	
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemOutsiderAutopsy');

	Alloys.ItemTemplateName = 'AlienAlloy';
	Alloys.Quantity = 25;
	Template.Cost.ResourceCosts.AddItem(Alloys);

	Core.ItemTemplateName = 'ARFMRequiemCore';
	Core.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Core);

	Essence.ItemTemplateName = 'ARFMRequiemEssence';
	Essence.Quantity = 20;
	Template.Cost.ResourceCosts.AddItem(Essence);

	Corpse.ItemTemplateName = 'CorpseRequiemOutsider';
	Corpse.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Corpse);

	Template.DamageTypeTemplateName = 'AHWRequiem';

	return Template;
}

static function X2DataTemplate AHW_RequiemSparkSniper()
{
	local X2WeaponTemplate	Template;
	local ArtifactCost		Alloys;
	local ArtifactCost		Essence;
	local ArtifactCost		Core;
	local ArtifactCost		Corpse;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'AHWRequiemSparkSniper');
	
	Template.WeaponPanelImage = "_ConventionalRifle";                       // used by the UI. Probably determines iconview of the weapon.
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sparkrifle';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.Inv_RequiemSparkSniper";
	Template.EquipSound = "StrategyUI_Mindshield_Equip";
	Template.Tier = 5;

	Template.RangeAccuracy = class'X2Item_DefaultWeapons'.default.LONG_BEAM_RANGE;
	Template.BaseDamage = default.AHWXAEMALA_BASEDAMAGE;
	Template.Aim = default.AHWXAEMALA_AIM;
	Template.CritChance = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_BEAM_CRITCHANCE;
	Template.iClipSize = 1;
	Template.iSoundRange = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_BEAM_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.SNIPERRIFLE_BEAM_IENVIRONMENTDAMAGE;
	Template.iTypicalActionCost = 2;
	Template.NumUpgradeSlots = 0;
	Template.DamageTypeTemplateName = 'AHWRequiem';
	
	Template.BonusWeaponEffects.AddItem(new class'ARFM_Effect_NeverMore');

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('Squadsight');
	Template.Abilities.AddItem('ARFMXaeMala');
	Template.Abilities.AddItem('SniperStandardFire');
	Template.Abilities.AddItem('LongWatch');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Requiem_XaeMala.WP_XaeMala";

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemMechtoidAutopsy');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemCyberdiscAutopsy');

	Alloys.ItemTemplateName = 'AlienAlloy';
	Alloys.Quantity = 25;
	Template.Cost.ResourceCosts.AddItem(Alloys);

	Core.ItemTemplateName = 'ARFMRequiemCore';
	Core.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Core);

	Essence.ItemTemplateName = 'ARFMRequiemEssence';
	Essence.Quantity = 20;
	Template.Cost.ResourceCosts.AddItem(Essence);

	Corpse.ItemTemplateName = 'CorpseRequiemCyberdisc';
	Corpse.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Corpse);


	Template.DamageTypeTemplateName = 'AHWRequiem';

	return Template;
}