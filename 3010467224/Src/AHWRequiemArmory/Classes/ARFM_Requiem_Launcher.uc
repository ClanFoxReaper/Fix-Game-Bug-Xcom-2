class ARFM_Requiem_Launcher extends X2Item config(RequiemWeapons);

var config WeaponDamageValue AHWKOSMAGRENADE_BASEDAMAGE;
var config int AHWKOSMAGRENADE_RANGE;
var config int AHWKOSMAGRENADE_RADIUS;
var config int AHWKOSMALAUNCHER_RANGEBONUS;
var config int AHWKOSMALAUNCHER_RADIUSBONUS;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Grenades;

	Grenades.AddItem(CreateAHWKosmaGrenade());
	Grenades.AddItem(CreateAHWKosmaLauncher());

	return Grenades;
}

static function X2DataTemplate CreateAHWKosmaGrenade()
{
	local X2GrenadeTemplate					Template;
	local X2Effect_ApplyWeaponDamage		WeaponDamageEffect;
	local X2Effect_Knockback				KnockbackEffect;
	local X2Effect_RemoveEffects			RemoveEffects;
	local AHW_Effect_ApplyCorrosionToWorld	WeaponEffect;
	local ArtifactCost						Essence;
	local ArtifactCost						Core;
	local ArtifactCost						Corpse;

	`CREATE_X2TEMPLATE(class'X2GrenadeTemplate', Template, 'AHWKosmaGrenade');

	Template.strImage = "img:///AHW_MagnasV2_UILibrary.Inv_KosmaGrenade";
	Template.EquipSound = "StrategyUI_Grenade_Equip";
	Template.iRange = default.AHWKOSMAGRENADE_RANGE;
	Template.iRadius = default.AHWKOSMAGRENADE_RADIUS;
	Template.ItemCat = 'ARFMGrenade';
	Template.AddAbilityIconOverride('ThrowGrenade', "img:///UILibrary_PerkIcons.UIPerk_aliengrenade");
	Template.AddAbilityIconOverride('LaunchGrenade', "img:///UILibrary_PerkIcons.UIPerk_aliengrenade");

	Template.BaseDamage = default.AHWKOSMAGRENADE_BASEDAMAGE;
	Template.iSoundRange = class'X2Item_DefaultGrenades'.default.ALIENGRENADE_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultGrenades'.default.ALIENGRENADE_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = class'X2Item_DefaultGrenades'.default.ALIENGRENADE_TRADINGPOSTVALUE;
	Template.PointsToComplete = class'X2Item_DefaultGrenades'.default.ALIENGRENADE_IPOINTS;
	Template.iClipSize = class'X2Item_DefaultGrenades'.default.ALIENGRENADE_ICLIPSIZE;
	Template.DamageTypeTemplateName = 'AHWRequiem';
	Template.Tier = 5;

	Template.Abilities.AddItem('ThrowGrenade');
	Template.Abilities.AddItem('GrenadeFuse');
	Template.Abilities.AddItem('ARFMKosmaGrenada');

	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2Effect_EnergyShield'.default.EffectName);
	Template.ThrownGrenadeEffects.AddItem(RemoveEffects);

	Template.ThrownGrenadeEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateRequiemCorrosionStatusEffect(3));
	WeaponEffect = new class'AHW_Effect_ApplyCorrosionToWorld';	
	Template.ThrownGrenadeEffects.AddItem(WeaponEffect);

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemAndromelidAutopsy');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemNightmareAutopsy');

	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bBypassSustainEffects = true;
	Template.ThrownGrenadeEffects.AddItem(WeaponDamageEffect);
	
	KnockbackEffect = new class'X2Effect_Knockback';
	KnockbackEffect.KnockbackDistance = 3;
	Template.ThrownGrenadeEffects.AddItem(KnockbackEffect);

	Template.GameArchetype = "WP_Magnas_KosmaGrenade.WP_KosmaGrenade";

	Template.iPhysicsImpulse = 10;

	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Core.ItemTemplateName = 'ARFMRequiemCore';
	Core.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Core);

	Essence.ItemTemplateName = 'ARFMRequiemEssence';
	Essence.Quantity = 20;
	Template.Cost.ResourceCosts.AddItem(Essence);

	Corpse.ItemTemplateName = 'CorpseRequiemNightmare';
	Corpse.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Corpse);

	Template.LaunchedGrenadeEffects = Template.ThrownGrenadeEffects;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.AHWKOSMAGRENADE_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.AHWKOSMAGRENADE_RADIUS);
	
	return Template;
}

static function X2GrenadeLauncherTemplate CreateAHWKosmaLauncher()
{
	local X2GrenadeLauncherTemplate		Template;
	local ArtifactCost					Alloys;
	local ArtifactCost					Essence;
	local ArtifactCost					Core;
	local ArtifactCost					Corpse;

	`CREATE_X2TEMPLATE(class'X2GrenadeLauncherTemplate', Template, 'AHWKosmaLauncher');

	Template.strImage = "img:///AHW_MagnasV2_UILibrary.Inv_RequiemLauncher";
	Template.EquipSound = "Secondary_Weapon_Equip_Magnetic";

	Template.iSoundRange = class'X2Item_DefaultGrenades'.default.ADVGRENADELAUNCHER_ISOUNDRANGE;
	Template.iEnvironmentDamage = class'X2Item_DefaultGrenades'.default.ADVGRENADELAUNCHER_IENVIRONMENTDAMAGE;
	Template.TradingPostValue = 80;
	Template.iClipSize = class'X2Item_DefaultGrenades'.default.ADVGRENADELAUNCHER_ICLIPSIZE;
	Template.Tier = 5;
	Template.NumUpgradeSlots = 3;
	Template.IncreaseGrenadeRadius = default.AHWKOSMALAUNCHER_RADIUSBONUS;
	Template.IncreaseGrenadeRange = default.AHWKOSMALAUNCHER_RANGEBONUS;

	Template.GameArchetype = "WP_Magnas_KosmaLauncher.WP_KosmaLauncher";

	Template.Abilities.AddItem('ARFMKosmaLaunch');

	Template.SetUIStatMarkup(class'XLocalizedData'.default.GrenadeRangeBonusLabel, , default.AHWKOSMALAUNCHER_RANGEBONUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.GrenadeRadiusBonusLabel, , default.AHWKOSMALAUNCHER_RADIUSBONUS);

	Template.CanBeBuilt = true;
	Template.bInfiniteItem = false;

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemAndromelidAutopsy');
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemNightmareAutopsy');

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

	return Template;
}