class ARFM_Abilities_RequiemWeapons extends X2Ability config(RequiemWeapons);

var config int ARFMNivenCapacitorPsi;
var config int ARFMIncubatorAutopsyBonus;
var config int ARFMTitanAutopsyBonus;
var config int ARFMNightmareAutopsyBonus;
var config int ARFMKosmaCharges;
var config int ARFMXaeQuezRechargeCooldown;
var config int ARFMSuperSuppressionCooldown;
var config int ARFMBalaDumExecuteCooldown;
var config int ARFMTazNalAssaultCooldown;
var config int ARFMHaDumBanishCooldown;
var config int ARFMMorKhazanStealthCooldown;
var config int ARFMKorKhazanCrippleCooldown;

var config int ARFMSuperSuppressionCharges;
var config int ARFMHaDumBanishCharges;
var config int ARFMHaDumBanishAimPenalty;
var config int ARFMBalaDumExecuteCharges;
var config int ARFMMorKhazanStealthCharges;
var config int ARFMCaeraThalPierce;

var name TalKhazanChargeName;		// Effect name referenced in code/script
var name KosmaCoreName;
var localized string TalKhazanCritDisplayText;

var name					MorKhazanCurrentLevelName;
var name					MorKhazanMaxLevelName;

var localized string		strHeatLevelName;
var localized string		strHeatLevelDesc;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(ARFM_NivenCapacitor());
	Templates.AddItem(ARFM_StainlessVest_LW());
	Templates.AddItem(ARFM_StainlessVest());
	Templates.AddItem(ARFM_StainlessChassis());
	Templates.AddItem(ARFM_CaeraThal());
	Templates.AddItem(ARFM_Valkyrie());
	Templates.AddItem(ARFM_ReloadXaequez());
	Templates.AddItem(ARFM_TractorBeam());
	Templates.AddItem(ARFM_ArmorBonus());
	Templates.AddItem(ARFM_RipjackBonus());
	Templates.AddItem(ARFM_ShardGauntletsBonus());
	// Bala'Kal
	Templates.AddItem(ARFM_BalaKalReload());
	// Bala'Dum
	Templates.AddItem(ARFM_BalaDumExecute());
	// Kor'Khazan
	Templates.AddItem(ARFM_KorKhazanCripple());
	Templates.AddItem(ARFM_KorKhazanImpaler());
	// Taz'Kor
	Templates.AddItem(ARFM_TazKorOverwatch());
	// Taz'Nal
	Templates.AddItem(ARFM_TazNalAssault());
	Templates.AddItem(ARFM_TazNalAssault2());
	// Tal'Khazan
	Templates.AddItem(ARFM_TalKhazanAntiCrit());
	Templates.AddItem(ARFM_TalKhazanCrit());
	Templates.AddItem(ARFM_TalKhazanCharge());
	Templates.AddItem(ARFM_TalKhazanShot());
	// Mor'Khazan
	Templates.AddItem(ARFM_MorKhazanStealth());
	Templates.AddItem(ARFM_MorKhazanMobility());
	// Ha'Dum
	Templates.AddItem(ARFM_HaDumBanish());
	Templates.AddItem(ARFM_HaDumBanishContinue());
	// Ha'Kor
	// Kosma Launcher
	Templates.AddItem(ARFM_KosmaGrenada());
	Templates.AddItem(ARFM_KosmaLaunch());
	// Kala'Mal
	Templates.AddItem(ARFM_SuperSuppression());
	Templates.AddItem(ARFM_SuperSuppressionContinue());

	return Templates;
}

static function X2AbilityTemplate ARFM_NivenCapacitor()
{
	local X2AbilityTemplate					Template;
	local ARFM_Effect_NivenCapacitor		PersistentNiven;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMNivenCapacitor');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_ampbooster";

	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentNiven = new class'ARFM_Effect_NivenCapacitor';
	PersistentNiven.BuildPersistentEffect(1, true, false, false);
	PersistentNiven.EffectName = 'ARFMNivenCapacitor';
	PersistentNiven.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	Template.AddTargetEffect(PersistentNiven);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipFireAction = true;

	return Template;
}

static function X2AbilityTemplate ARFM_StainlessVest_LW()
{
	local X2AbilityTemplate					Template;
	local X2Effect_DamageImmunity           DamageImmunity;
	local ARFM_Effect_StainlessDreams       StainlessDreams;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMStainlessVest_LW');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_nanofibervest";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	StainlessDreams = new class'ARFM_Effect_StainlessDreams';
	StainlessDreams.BuildPersistentEffect(1, true, true, true);
	Template.AddTargetEffect(StainlessDreams);

	DamageImmunity = new class'X2Effect_DamageImmunity';
	DamageImmunity.ImmuneTypes.AddItem('AHWRequiemCorrosion');
	DamageImmunity.ImmuneTypes.AddItem('AHWSevereRequiemCorrosion');
	DamageImmunity.BuildPersistentEffect(1, true, false, false);
	DamageImmunity.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	Template.AddTargetEffect(DamageImmunity);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate ARFM_StainlessChassis()
{
	local X2AbilityTemplate					Template;
	local X2Effect_DamageImmunity           DamageImmunity;
	local ARFM_Effect_StainlessDreams       StainlessDreams;
	local AHW_Effect_Fortitude				Fortitude;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMStainlessChassis');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_nanofibervest";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	StainlessDreams = new class'ARFM_Effect_StainlessDreams';
	StainlessDreams.BuildPersistentEffect(1, true, true, true);
	Template.AddTargetEffect(StainlessDreams);

	Fortitude = new class'AHW_Effect_Fortitude';
	Fortitude.BuildPersistentEffect(1, true, true, true);
	Template.AddTargetEffect(Fortitude);

	DamageImmunity = new class'X2Effect_DamageImmunity';
	DamageImmunity.ImmuneTypes.AddItem('AHWRequiemCorrosion');
	DamageImmunity.ImmuneTypes.AddItem('AHWSevereRequiemCorrosion');
	DamageImmunity.BuildPersistentEffect(1, true, false, false);
	DamageImmunity.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	Template.AddTargetEffect(DamageImmunity);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate ARFM_StainlessVest()
{
	local X2AbilityTemplate					Template;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local ARFM_Effect_StainlessDreams       StainlessDreams;
	local X2Effect_DamageImmunity           DamageImmunity;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMStainlessVest');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_nanofibervest";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	// Bonus to health stat Effect, also has armor
	//
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.EffectName = 'ARFMStainlessVest';
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, class'X2Ability_ItemGrantedAbilitySet'.default.PLATED_VEST_HP_BONUS);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorChance, class'X2Ability_ItemGrantedAbilitySet'.default.PLATED_VEST_MITIGATION_CHANCE);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, class'X2Ability_ItemGrantedAbilitySet'.default.PLATED_VEST_MITIGATION_AMOUNT);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	StainlessDreams = new class'ARFM_Effect_StainlessDreams';
	StainlessDreams.BuildPersistentEffect(1, true, true, true);
	Template.AddTargetEffect(StainlessDreams);

	DamageImmunity = new class'X2Effect_DamageImmunity';
	DamageImmunity.ImmuneTypes.AddItem('AHWRequiemCorrosion');
	DamageImmunity.ImmuneTypes.AddItem('AHWSevereRequiemCorrosion');
	DamageImmunity.BuildPersistentEffect(1, true, false, false);
	DamageImmunity.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	Template.AddTargetEffect(DamageImmunity);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}


static function X2AbilityTemplate ARFM_CaeraThal()
{
	local X2AbilityTemplate             Template;
	local ARFM_Effect_APMunitions       Effect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMCaeraThal');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.bDisplayInUITacticalText = false;

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	Effect = new class'ARFM_Effect_APMunitions';
	Effect.BuildPersistentEffect(1, true, false, false);
	Effect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false);
	Effect.Pierce = default.ARFMCaeraThalPierce;
	Template.AddShooterEffect(Effect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate ARFM_Valkyrie()
{
	local X2AbilityTemplate						Template;
	local X2Effect_PersistentTraversalChange	WallPhasing;
	local X2AbilityTrigger						Trigger;
	local ARFM_Effect_Aerial					TargetEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMValkyrie');

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityToHitCalc = default.DeadEye;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	WallPhasing = new class'X2Effect_PersistentTraversalChange';
	WallPhasing.BuildPersistentEffect( 1, true, true, false, eGameRule_PlayerTurnBegin );
	WallPhasing.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText( ), Template.IconImage, true );
	WallPhasing.AddTraversalChange(eTraversal_Launch, true);
	WallPhasing.AddTraversalChange(eTraversal_Flying, true);
	WallPhasing.AddTraversalChange(eTraversal_Land, true);
	WallPhasing.AddTraversalChange(eTraversal_JumpUp, true);
	WallPhasing.EffectName = 'WallBreakingEffect';
	WallPhasing.DuplicateResponse = eDupe_Refresh;
	Template.AddTargetEffect( WallPhasing );

	TargetEffect = new class'ARFM_Effect_Aerial';
	TargetEffect.BuildPersistentEffect(1, true, true, false);
	Template.AddTargetEffect(TargetEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_flight";
	Template.Hostility = eHostility_Defensive;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;

	return Template;
}

static function X2AbilityTemplate ARFM_ReloadXaequez()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2Condition_UnitProperty          ShooterPropertyCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityCooldown					Cooldown;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMReloadXaequez');
	
	Template.AbilityIconColor = "df07b7";

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.ARFMXaeQuezRechargeCooldown;
	Template.AbilityCooldown = Cooldown;

	ShooterPropertyCondition = new class'X2Condition_UnitProperty';	
	ShooterPropertyCondition.ExcludeDead = true;                    //Can't reload while dead
	Template.AbilityShooterConditions.AddItem(ShooterPropertyCondition);

	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	
	Template.AbilitySourceName = 'eAbilitySource_Debuff';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_reload";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.RELOAD_PRIORITY;
	Template.DisplayTargetHitChance = true;

	Template.ActivationSpeech = 'Reloading';
	Template.Hostility = eHostility_Neutral;
	Template.BuildNewGameStateFn = ReloadKosma_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.OverrideAbilityAvailabilityFn = ReloadKosma_OverrideAbilityAvailability;

	return Template;	
}

static function X2AbilityTemplate ARFM_TractorBeam()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_Ammo				AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;
	local X2Condition_UnitProperty			TargetCondition, PullCondition;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2Effect_GetOverHere				GetOverHereEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMTractorBeam');

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);	

	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.bAllowCrit = true;
	Template.AbilityToHitCalc = ToHitCalc;
	Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;
	
	Template.bAllowAmmoEffects = true;
	Template.bAllowBonusWeaponEffects = true;

	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeDead = true;
	TargetCondition.ExcludeFriendlyToSource = true;
	TargetCondition.ExcludeHostileToSource = false;
	TargetCondition.TreatMindControlledSquadmateAsHostile = false;
	TargetCondition.FailOnNonUnits = true;
	TargetCondition.ExcludeCivilian = true;
	TargetCondition.ExcludeCosmetic = true;
	Template.AbilityTargetConditions.AddItem(TargetCondition);

	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddTargetEffect(WeaponDamageEffect);

	PullCondition = new class'X2Condition_UnitProperty';
	PullCondition.ExcludeLargeUnits = true;
	PullCondition.ExcludeRobotic = true;
	PullCondition.ExcludeAlien = true;
	GetOverHereEffect = new class'X2Effect_GetOverHere';
	GetOverHereEffect.TargetConditions.AddItem(PullCondition);
	Template.AddTargetEffect(GetOverHereEffect);

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.AbilityIconColor = "df07b7";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.bUseAmmoAsChargesForHUD = true;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_stun";

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate ARFM_BalaDumExecute()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_Ammo				AmmoCost;
	local X2AbilityCharges					Charges;
	local X2AbilityCost_Charges				ChargeCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2Condition_UnitEffects			CullingCondition;
	local X2Effect_KillUnit					TheCullingEffect;
	local X2Condition_Visibility            TargetVisibilityCondition;
	local X2AbilityCooldown					Cooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMBalaDumExecute');
	Template.AbilityIconColor = "df07b7";
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);	

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = default.ARFMBalaDumExecuteCharges;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.ARFMBalaDumExecuteCooldown;
	Template.AbilityCooldown = Cooldown;

	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.bAllowCrit = true;
	Template.AbilityToHitCalc = ToHitCalc;
	
	Template.bAllowAmmoEffects = true;	
	Template.bAllowBonusWeaponEffects = true;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bAllowSquadsight = true;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);

	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddTargetEffect(WeaponDamageEffect);

	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
	Template.AssociatedPassives.AddItem('HoloTargeting');
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());

	CullingCondition = new class'X2Condition_UnitEffects';
	CullingCondition.AddRequireEffect(class'X2AbilityTemplateManager'.default.StunnedName, 'AA_MissingRequiredEffect');
	Template.AbilityTargetConditions.AddItem(CullingCondition);

	TheCullingEffect = new class'X2Effect_KillUnit';
	Template.AddTargetEffect(TheCullingEffect);

	Template.AbilitySourceName = 'eAbilitySource_Debuff';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_cover";
	Template.bShowActivation = true;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate ARFM_BalaKalReload()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2Condition_UnitProperty          ShooterPropertyCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMBalaKalReload');
	
	Template.AbilityIconColor = "df07b7";

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	ShooterPropertyCondition = new class'X2Condition_UnitProperty';	
	ShooterPropertyCondition.ExcludeDead = true;                    //Can't reload while dead
	Template.AbilityShooterConditions.AddItem(ShooterPropertyCondition);

	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	
	Template.AbilitySourceName = 'eAbilitySource_Debuff';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_reload";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.RELOAD_PRIORITY;
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;
	Template.DisplayTargetHitChance = false;

	Template.ActivationSpeech = 'Reloading';
	Template.Hostility = eHostility_Neutral;
	Template.CustomFireAnim = 'HL_Reload';
	Template.BuildNewGameStateFn = ReloadKosma_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.OverrideAbilityAvailabilityFn = ReloadKosma_OverrideAbilityAvailability;

	return Template;	
}

static function X2AbilityTemplate ARFM_HaDumBanish()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2AbilityCost_Ammo				AmmoCost;
	local X2AbilityCharges					Charges;
	local X2AbilityCost_Charges				ChargeCost;
	local X2AbilityToHitCalc_StandardAim	StandardAim;
	local X2AbilityCooldown					Cooldown;
	local X2Effect_PersistentStatChange		StatChangeEffect;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMHaDumBanish');

	Template.AbilityIconColor = "df07b7";
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	//  require 2 ammo to be present so that multiple shots will be taken - otherwise it's a waste
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 2;
	AmmoCost.bFreeCost = true;
	Template.AbilityCosts.AddItem(AmmoCost);
	//  actually charge 1 ammo for this shot. the 2nd shot will charge the extra ammo.
	
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = default.ARFMHaDumBanishCharges;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.ARFMHaDumBanishCooldown;
	Template.AbilityCooldown = Cooldown;

	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bAllowCrit = true;
	Template.AbilityToHitCalc = StandardAim;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitOnlyProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
	Template.AssociatedPassives.AddItem('HoloTargeting');
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());
	Template.bAllowAmmoEffects = true;
	Template.bAllowBonusWeaponEffects = true;

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	StatChangeEffect = new class'X2Effect_PersistentStatChange';
	StatChangeEffect.EffectName = 'HaDumBanishAimPenalty';
	StatChangeEffect.DuplicateResponse = eDupe_Allow;
	StatChangeEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnEnd);
	StatChangeEffect.AddPersistentStatChange(eStat_Offense, default.ARFMHaDumBanishAimPenalty);
	Template.AddShooterEffect(StatChangeEffect);

	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.AdditionalAbilities.AddItem('ARFMHaDumBanishContinue');
	Template.PostActivationEvents.AddItem('HaDumBanishContinue');

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_soulreaper";
	Template.ActivationSpeech = 'Banish';

	return Template;
}

static function X2AbilityTemplate ARFM_HaDumBanishContinue()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_Ammo				AmmoCost;
	local X2AbilityTrigger_EventListener    Trigger;
	local X2AbilityToHitCalc_StandardAim	StandardAim;
	local X2Effect_PersistentStatChange		StatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMHaDumBanishContinue');

	Template.AbilityIconColor = "df07b7";
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bAllowCrit = true;
	Template.AbilityToHitCalc = StandardAim;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
	Template.AssociatedPassives.AddItem('HoloTargeting');
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());
	Template.bAllowAmmoEffects = true;
	Template.bAllowBonusWeaponEffects = true;

	StatChangeEffect = new class'X2Effect_PersistentStatChange';
	StatChangeEffect.EffectName = 'HaDumBanishAimPenalty';
	StatChangeEffect.DuplicateResponse = eDupe_Allow;
	StatChangeEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnEnd);
	StatChangeEffect.AddPersistentStatChange(eStat_Offense, default.ARFMHaDumBanishAimPenalty);
	Template.AddShooterEffect(StatChangeEffect);

	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.EventID = 'HaDumBanishContinue';
	Trigger.ListenerData.Filter = eFilter_Unit;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.ChainShotListener;
	Template.AbilityTriggers.AddItem(Trigger);

	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.MergeVisualizationFn = SequentialShot_MergeVisualization;

	Template.PostActivationEvents.AddItem('HaDumBanishContinue');
	Template.bShowActivation = true;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_soulreaper";

	return Template;
}

static function X2AbilityTemplate ARFM_MorKhazanMobility()
{
	local X2AbilityTemplate					Template;
	local ARFM_Effect_KhazanMobility		OperatorEffect;
	local ARFM_Effect_KhazanHunt			HuntingEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMMorKhazanMobility');
	Template.AbilityIconColor = "df07b7";
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_PaleHorse";
	Template.ActivationSpeech = 'ForwardOperator';
//END AUTOGENERATED CODE: Template Overrides 'ForwardOperator'

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	OperatorEffect = new class'ARFM_Effect_KhazanMobility';
	OperatorEffect.BuildPersistentEffect(1, true, false, false);
	OperatorEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddTargetEffect(OperatorEffect);

	HuntingEffect = new class'ARFM_Effect_KhazanHunt';
	HuntingEffect.BuildPersistentEffect(1, true, false, false);
	HuntingEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddTargetEffect(HuntingEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}
	

static function X2AbilityTemplate ARFM_SuperSuppression()
{
	local X2AbilityTemplate						Template;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2AbilityCost_Ammo					AmmoCost;
	local X2Effect_ApplyDirectionalWorldDamage  WorldDamage;
	local X2AbilityCooldown						Cooldown;
	local X2Condition_UnitProperty              TargetCondition;
	local X2AbilityToHitCalc_StandardAim        StandardAim;
	local X2Effect_Suppression					SuppressionEffect;
	local X2Effect_ReserveActionPoints			ReserveActionPointsEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMSuperSuppression');

	Template.AbilityIconColor = "df07b7";
	
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_supression";
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.bLimitTargetIcons = true;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 2;
	ActionPointCost.bConsumeAllPoints = false;
	ActionPointCost.bFreeCost = true;
	Template.AbilityCosts.AddItem(ActionPointCost);	

	ReserveActionPointsEffect = new class'X2Effect_ReserveActionPoints';
	ReserveActionPointsEffect.ReserveType = 'Suppression';
	Template.AddShooterEffect(ReserveActionPointsEffect);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.ARFMSuperSuppressionCooldown;
	Template.AbilityCooldown = Cooldown;

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 4;
	AmmoCost.bFreeCost = true;
	Template.AbilityCosts.AddItem(AmmoCost);
	
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 2;
	Template.AbilityCosts.AddItem(AmmoCost);

	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bIgnoreCoverBonus = true;
	Template.AbilityToHitCalc = StandardAim;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeAlive=false;
	TargetCondition.ExcludeDead=true;
	TargetCondition.ExcludeFriendlyToSource=true;
	TargetCondition.ExcludeHostileToSource=false;
	TargetCondition.TreatMindControlledSquadmateAsHostile=true;
	TargetCondition.ExcludeNoCover=true;
	TargetCondition.ExcludeNoCoverToSource=true;
	TargetCondition.FailOnNonUnits = true;
	Template.AbilityTargetConditions.AddItem(TargetCondition);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	WorldDamage = new class'X2Effect_ApplyDirectionalWorldDamage';
	WorldDamage.bUseWeaponDamageType = true;
	WorldDamage.bUseWeaponEnvironmentalDamage = false;
	WorldDamage.EnvironmentalDamageAmount = 30;
	WorldDamage.bApplyOnHit = true;
	WorldDamage.bApplyOnMiss = false;
	WorldDamage.bApplyToWorldOnHit = true;
	WorldDamage.bApplyToWorldOnMiss = false;
	WorldDamage.bHitAdjacentDestructibles = true;
	WorldDamage.PlusNumZTiles = 1;
	WorldDamage.bHitTargetTile = true;
	Template.AddTargetEffect(WorldDamage);

	SuppressionEffect = new class'X2Effect_Suppression';
	SuppressionEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	SuppressionEffect.bRemoveWhenTargetDies = true;
	SuppressionEffect.bRemoveWhenSourceDamaged = true;
	SuppressionEffect.bBringRemoveVisualizationForward = true;
	SuppressionEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, class'X2Ability_GrenadierAbilitySet'.default.SuppressionTargetEffectDesc, Template.IconImage);
	SuppressionEffect.SetSourceDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, class'X2Ability_GrenadierAbilitySet'.default.SuppressionSourceEffectDesc, Template.IconImage);
	Template.AddTargetEffect(SuppressionEffect);

	Template.OverrideAbilities.AddItem('Suppression');
	Template.AdditionalAbilities.AddItem('ARFMSuperSuppressionContinue');
	Template.AdditionalAbilities.AddItem('SuppressionShot');
	Template.PostActivationEvents.AddItem('ARFMSuperSuppression');

	//  visually always appear as a miss so the target unit doesn't look like it's being damaged
	Template.bOverrideVisualResult = true;
	Template.OverrideVisualResult = eHit_Miss;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;
	
	return Template;	
}

static function X2AbilityTemplate ARFM_SuperSuppressionContinue()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_Ammo				AmmoCost;
	local X2AbilityTrigger_EventListener    Trigger;
	local X2AbilityToHitCalc_StandardAim	StandardAim;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMSuperSuppressionContinue');

	Template.AbilityIconColor = "df07b7";
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bAllowCrit = true;
	Template.AbilityToHitCalc = StandardAim;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
	Template.AssociatedPassives.AddItem('HoloTargeting');
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());
	Template.bAllowAmmoEffects = true;
	Template.bAllowBonusWeaponEffects = true;

	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.EventID = 'ARFMSuperSuppression';
	Trigger.ListenerData.Filter = eFilter_Unit;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_OriginalTarget;
	Template.AbilityTriggers.AddItem(Trigger);

	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.MergeVisualizationFn = SequentialShot_MergeVisualization;

	Template.bShowActivation = true;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_supression";

	return Template;
}


static function X2AbilityTemplate ARFM_ArmorBonus()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityTrigger					Trigger;
	local X2AbilityTarget_Self				TargetStyle;
	local X2Effect_BonusArmor				BonusArmor;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMArmorBonus');
	// Template.IconImage  -- no icon needed for armor stats

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	Template.AbilityIconColor = "df07b7";
	Template.AbilityToHitCalc = default.DeadEye;
	
	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);
	
	BonusArmor = new class'X2Effect_BonusArmor';
	BonusArmor.ArmorMitigationAmount = default.ARFMIncubatorAutopsyBonus;
	BonusArmor.EffectName = 'IncubatorAutopsy';
	Template.AddTargetEffect(BonusArmor);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate ARFM_RipjackBonus()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_BonusWeaponDamage			BonusEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMRipjackBonus');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityIconColor = "df07b7";
	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	BonusEffect = new class'X2Effect_BonusWeaponDamage';
	BonusEffect.BuildPersistentEffect(1, true, true, true);
	BonusEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, "", "", false);
	BonusEffect.BonusDmg = default.ARFMNightmareAutopsyBonus;
	BonusEffect.bDisplayInSpecialDamageMessageUI = false;
	Template.AddTargetEffect(BonusEffect);

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

static function X2AbilityTemplate ARFM_ShardGauntletsBonus()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_BonusWeaponDamage			BonusEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMShardGauntletsBonus');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityIconColor = "df07b7";
	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	BonusEffect = new class'X2Effect_BonusWeaponDamage';
	BonusEffect.BuildPersistentEffect(1, true, true, true);
	BonusEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, "", "", false);
	BonusEffect.BonusDmg = default.ARFMTitanAutopsyBonus;
	BonusEffect.bDisplayInSpecialDamageMessageUI = false;
	Template.AddTargetEffect(BonusEffect);

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

static function X2AbilityTemplate ARFM_KorKhazanImpaler()
{
	local X2AbilityTemplate                 Template;
	local X2Effect_PersistentStatChange		BuffEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMKorKhazanImpaler');

	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.str_poisonous";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	Template.AbilityIconColor = "df07b7";
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	BuffEffect = new class'X2Effect_PersistentStatChange';
	BuffEffect.BuildPersistentEffect(1, true, false);
	BuffEffect.DuplicateResponse = eDupe_Allow;
	BuffEffect.EffectName = 'ARFMKorKhazanBoost';
	BuffEffect.AddPersistentStatChange(eStat_FlankingCritChance, 50);
	BuffEffect.AddPersistentStatChange(eStat_FlankingAimBonus, 50);
	BuffEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddTargetEffect(BuffEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}


static function X2AbilityTemplate ARFM_KorKhazanCripple()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_Ammo				AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;
	local X2Effect_Stunned					StunnedEffect;
	local X2Condition_Visibility            TargetVisibilityCondition;
	local X2AbilityCooldown					Cooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMKorKhazanCripple');
	Template.AbilityIconColor = "df07b7";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);	

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.ARFMKorKhazanCrippleCooldown;
	Template.AbilityCooldown = Cooldown;

	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.bAllowCrit = true;
	ToHitCalc.bHitsAreCrits = true;
	Template.AbilityToHitCalc = ToHitCalc;
	Template.AbilityToHitOwnerOnMissCalc = ToHitCalc;
	
	Template.bAllowAmmoEffects = true;	
	Template.bAllowBonusWeaponEffects = true;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bAllowSquadsight = true;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);
	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitOnlyProperty);

	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
	Template.AssociatedPassives.AddItem('HoloTargeting');
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());

	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, 70, false);
	StunnedEffect.bRemoveWhenSourceDies = true;
	Template.AddTargetEffect(StunnedEffect);

	Template.AbilitySourceName = 'eAbilitySource_Debuff';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_cover";
	Template.bShowActivation = true;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate ARFM_TazKorOverwatch()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Effect_ReserveOverwatchPoints   ReserveActionPointsEffect;
	local array<name>                       SkipExclusions;
	local X2Condition_UnitProperty          ConcealedCondition;
	local X2Effect_SetUnitValue             UnitValueEffect;
	local X2Condition_UnitEffects           SuppressedCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMTazKorOverwatch');
	Template.AbilityIconColor = "df07b7";
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.bConsumeAllPoints = true;   //  this will guarantee the unit has at least 1 action point
	ActionPointCost.bFreeCost = true;           //  ReserveActionPoints effect will take all action points away
	ActionPointCost.DoNotConsumeAllEffects.Length = 0;
	ActionPointCost.DoNotConsumeAllSoldierAbilities.Length = 0;
	ActionPointCost.AllowedTypes.RemoveItem(class'X2CharacterTemplateManager'.default.SkirmisherInterruptActionPoint);
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	SuppressedCondition = new class'X2Condition_UnitEffects';
	SuppressedCondition.AddExcludeEffect(class'X2Effect_Suppression'.default.EffectName, 'AA_UnitIsSuppressed');
	SuppressedCondition.AddExcludeEffect(class'X2Effect_SkirmisherInterrupt'.default.EffectName, 'AA_AbilityUnavailable');
	Template.AbilityShooterConditions.AddItem(SuppressedCondition);

	ReserveActionPointsEffect = new class'X2Effect_ReserveOverwatchPoints';
	ReserveActionPointsEffect.UseAllPointsWithAbilities.Length = 0;
	ReserveActionPointsEffect.ReserveType = 'ReserveInterrupt';
	Template.AddTargetEffect(ReserveActionPointsEffect);

	ConcealedCondition = new class'X2Condition_UnitProperty';
	ConcealedCondition.ExcludeFriendlyToSource = false;
	ConcealedCondition.IsConcealed = true;
	UnitValueEffect = new class'X2Effect_SetUnitValue';
	UnitValueEffect.UnitName = class'X2Ability_DefaultAbilitySet'.default.ConcealedOverwatchTurn;
	UnitValueEffect.CleanupType = eCleanup_BeginTurn;
	UnitValueEffect.NewValueToSet = 1;
	UnitValueEffect.TargetConditions.AddItem(ConcealedCondition);
	Template.AddTargetEffect(UnitValueEffect);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Interrupt";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.OVERWATCH_PRIORITY;
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;
	Template.AbilityConfirmSound = "Unreal2DSounds_OverWatch";

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipFireAction = true;
	Template.bShowActivation = true;
	Template.CinescriptCameraType = "Overwatch";

	Template.OverrideAbilities.AddItem('SkirmisherInterruptInput');

	Template.Hostility = eHostility_Defensive;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}
static function X2AbilityTemplate ARFM_TazNalAssault()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityCooldown					Cooldown;
	local X2AbilityToHitCalc_StandardMelee  StandardMelee;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMTazNalAssault');
	Template.AbilityIconColor = "df07b7";
	Template.AbilitySourceName = 'eAbilitySource_Debuff';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_AlwaysShow;
	Template.BuildNewGameStateFn = TypicalMoveEndAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalMoveEndAbility_BuildInterruptGameState;	
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_swordSlash";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;
	Template.AbilityConfirmSound = "TacticalUI_SwordConfirm";

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.ARFMTazNalAssaultCooldown;
	Template.AbilityCooldown = Cooldown;

	StandardMelee = new class'X2AbilityToHitCalc_StandardMelee';
	Template.AbilityToHitCalc = StandardMelee;

	Template.AbilityTargetStyle = new class'X2AbilityTarget_MovingMelee';
	Template.TargetingMethod = class'X2TargetingMethod_MeleePath';

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_EndOfMove');

	// Target Conditions
	//
	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);

	// Shooter Conditions
	//
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	// Damage Effect
	//
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bBypassSustainEffects = true;
	Template.AddTargetEffect(WeaponDamageEffect);

	Template.AdditionalAbilities.AddItem('ARFMTazNalAssault2');
	Template.PostActivationEvents.AddItem('ARFMTazNalAssault');

	Template.bAllowBonusWeaponEffects = true;
	Template.bSkipMoveStop = true;
	
	// Voice events
	//
	Template.SourceMissSpeech = 'SwordMiss';

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.MeleeLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

static function X2AbilityTemplate ARFM_TazNalAssault2()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityToHitCalc_StandardMelee  StandardMelee;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityTrigger_EventListener    Trigger;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMTazNalAssault2');
	Template.AbilityIconColor = "df07b7";
	Template.AbilitySourceName = 'eAbilitySource_Debuff';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.BuildNewGameStateFn = TypicalMoveEndAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalMoveEndAbility_BuildInterruptGameState;	
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_swordSlash";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_COLONEL_PRIORITY;
	Template.AbilityConfirmSound = "TacticalUI_SwordConfirm";

	StandardMelee = new class'X2AbilityToHitCalc_StandardMelee';
	Template.AbilityToHitCalc = StandardMelee;

	Template.AbilityTargetStyle = new class'X2AbilityTarget_MovingMelee';
	Template.TargetingMethod = class'X2TargetingMethod_MeleePath';

	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.EventID = 'ARFMTazNalAssault';
	Trigger.ListenerData.Filter = eFilter_Unit;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_OriginalTarget;
	Template.AbilityTriggers.AddItem(Trigger);

	// Target Conditions
	//
	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);

	// Shooter Conditions
	//
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	// Damage Effect
	//
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bBypassSustainEffects = true;
	Template.AddTargetEffect(WeaponDamageEffect);

	Template.bAllowBonusWeaponEffects = true;
	Template.bSkipMoveStop = true;
	
	// Voice events
	//
	Template.SourceMissSpeech = 'SwordMiss';

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.MeleeLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

// Bala Series


static function X2AbilityTemplate  ARFM_MorKhazanStealth()
{
	local X2AbilityTemplate					Template;
	local X2Effect_RangerStealth			StealthEffect;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2AbilityCooldown					Cooldown;
	local X2AbilityCharges					Charges;
	local X2AbilityCost_Charges				ChargeCost;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMMorKhazanStealth');
	Template.AbilityIconColor = "df07b7";
	Template.AbilitySourceName = 'eAbilitySource_Debuff';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_stealth";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SERGEANT_PRIORITY;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	
	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = default.ARFMMorKhazanStealthCharges;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.ARFMMorKhazanStealthCooldown;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.AllowedTypes.AddItem(class'X2CharacterTemplateManager'.default.MoveActionPoint);
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityShooterConditions.AddItem(new class'X2Condition_Stealth');
	Template.AddShooterEffectExclusions();

	StealthEffect = new class'X2Effect_RangerStealth';
	StealthEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnEnd);
	StealthEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, true);
	StealthEffect.bRemoveWhenTargetConcealmentBroken = true;
	Template.AddTargetEffect(StealthEffect);

	Template.AddTargetEffect(class'X2Effect_Spotted'.static.CreateUnspottedEffect());

	Template.ActivationSpeech = 'ActivateConcealment';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipFireAction = true;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.NonAggressiveChosenActivationIncreasePerUse;

	return Template;
}

// Tal Series

static function X2AbilityTemplate ARFM_TalKhazanAntiCrit()
{
	local X2AbilityTemplate             Template;
	local X2Effect_ToHitModifier        PersistentEffect;
	local X2Condition_UnitProperty		TargetCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMTalKhazanAntiCrit');
	Template.AbilityIconColor = "df07b7";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bIsPassive = true;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_maximumordanance";
	Template.OverrideAbilities.AddItem('Overwatch');

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeRobotic = true;
	TargetCondition.IncludeWeakAgainstTechLikeRobot = false;
	PersistentEffect = new class'X2Effect_ToHitModifier';
	PersistentEffect.DuplicateResponse = eDupe_Ignore;
	PersistentEffect.EffectName = 'ARFMTalKhazanAntiCrit';
	PersistentEffect.BuildPersistentEffect(1, true, false);
	PersistentEffect.AddEffectHitModifier(eHit_Crit, -20, default.TalKhazanCritDisplayText,,,,,,,,true);
	PersistentEffect.ToHitConditions.AddItem(TargetCondition);
	Template.AddTargetEffect(PersistentEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	// Note: no visualization on purpose!
	
	return Template;
}

static function X2AbilityTemplate ARFM_TalKhazanCrit()
{
	local X2AbilityTemplate             Template;
	local X2Effect_ToHitModifier        PersistentEffect;
	local X2Condition_UnitProperty		TargetCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMTalKhazanCrit');
	Template.AbilityIconColor = "df07b7";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bIsPassive = true;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_maximumordanance";

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeRobotic = false;
	TargetCondition.IncludeWeakAgainstTechLikeRobot = true;
	TargetCondition.ExcludeOrganic = true;
	PersistentEffect = new class'X2Effect_ToHitModifier';
	PersistentEffect.DuplicateResponse = eDupe_Ignore;
	PersistentEffect.EffectName = 'ARFMTalKhazanCrit';
	PersistentEffect.BuildPersistentEffect(1, true, false);
	PersistentEffect.AddEffectHitModifier(eHit_Crit, 50, default.TalKhazanCritDisplayText,,,,,,,,true);
	PersistentEffect.ToHitConditions.AddItem(TargetCondition);
	Template.AddTargetEffect(PersistentEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	// Note: no visualization on purpose!
	
	return Template;
}

static function X2AbilityTemplate ARFM_TalKhazanCharge()
{
	local X2AbilityTemplate						Template;
	local X2Condition_UnitEffects				TalKhazanCondition;
	local X2AbilityCost_ActionPoints			ActionPointCost;
	local X2Effect_DamageImmunity				DamageImmunity;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMTalKhazanCharge');
	Template.AbilityIconColor = "df07b7";
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_maximumordanance";
	Template.Hostility = eHostility_Neutral;
	Template.AbilitySourceName = 'eAbilitySource_Debuff';
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MUST_RELOAD_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.OverrideAbilities.AddItem('OverwatchShot');

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	TalKhazanCondition = new class'X2Condition_UnitEffects';
	TalKhazanCondition.AddExcludeEffect(default.TalKhazanChargeName, 'AA_MissingRequiredEffect');
	Template.AbilityShooterConditions.AddItem(TalKhazanCondition);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.DoNotConsumeAllSoldierAbilities.AddItem('SteadyHands');
	Template.AbilityCosts.AddItem(ActionPointCost);

	// For all purposes, this is intended to be a dummy effect. If this damage type is being used by something, why would you do that.
	DamageImmunity = new class'X2Effect_DamageImmunity';
	DamageImmunity.BuildPersistentEffect(2, false, false);
	DamageImmunity.ImmuneTypes.AddItem('ARFMDummyDamage');
	DamageImmunity.EffectName = default.TalKhazanChargeName;
	Template.AddTargetEffect(DamageImmunity);

	// MAKE IT LIVE!
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	
	Template.ActivationSpeech = 'Reloading';
	Template.CustomFireAnim = 'HL_Reload';

	return Template;
}

static function X2AbilityTemplate ARFM_TalKhazanShot()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2AbilityCost_Ammo				AmmoCost;
	local X2AbilityToHitCalc_StandardAim    StandardAim;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2AbilityMultiTarget_Radius       RadiusMultiTarget;
	local X2Condition_UnitEffects			TalKhazanCondition;
	local X2Effect_ApplyWeaponDamage		DamageEffect;
	local X2Condition_UnitProperty			DamageCondition;;
	local X2Effect_RemoveEffects			RemoveEffects;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMTalKhazanShot');
	// Icon Properties
	Template.AbilityIconColor = "df07b7";
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_dazed";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.STANDARD_SHOT_PRIORITY;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.DisplayTargetHitChance = true;
	Template.AbilitySourceName = 'eAbilitySource_Debuff';
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.OverrideAbilities.AddItem('StandardShot');
	// Activated by a button press; additionally, tells the AI this is an activatable
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	// *** VALIDITY CHECKS *** //
	//  Normal effect restrictions (except disoriented)
	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	// Can't shoot while dead
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	
	TalKhazanCondition = new class'X2Condition_UnitEffects';
	TalKhazanCondition.AddRequireEffect(default.TalKhazanChargeName, 'AA_MissingRequiredEffect');
	Template.AbilityShooterConditions.AddItem(TalKhazanCondition);

	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bGuaranteedHit = true;
	Template.AbilityToHitCalc = StandardAim;

	// Only at single targets that are in range.
	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToSquadsightRange = true;
	Template.AbilityTargetStyle = CursorTarget;

	// Ammo
	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);
	Template.bAllowAmmoEffects = true; // 	
	Template.bAllowBonusWeaponEffects = true;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = 3;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.bIgnoreBaseDamage = true;
	DamageEffect.bBypassShields = true;
	DamageEffect.DamageTag = 'RobotOnly';
	DamageCondition = new class'X2Condition_UnitProperty';
	DamageCondition.ExcludeOrganic = true;
	DamageCondition.ExcludeFriendlyToSource = false;
	DamageEffect.TargetConditions.AddItem(DamageCondition);
	Template.AddMultiTargetEffect(DamageEffect);

	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(default.TalKhazanChargeName);
	Template.AddShooterEffect(RemoveEffects);

	Template.AddMultiTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());

	// Targeting Method
	Template.TargetingMethod = class'X2TargetingMethod_ViperSpit';
	Template.CinescriptCameraType = "StandardGunFiring";

	// MAKE IT LIVE!
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	
	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.DamagePreviewFn = TalKhazanDamagePreview;

	return Template;
}

function bool TalKhazanDamagePreview(XComGameState_Ability AbilityState, StateObjectReference TargetRef, out WeaponDamageValue MinDamagePreview, out WeaponDamageValue MaxDamagePreview, out int AllowsShield)
{
	MinDamagePreview = class'ARFM_Requiem_Weapons'.default.AHWTALKHAZAN_BASEDAMAGE;
	MaxDamagePreview.Damage = MaxDamagePreview.Damage;
	return true;
}

// Kosma Series
static function X2AbilityTemplate ARFM_KosmaGrenada()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Condition_UnitProperty          ShooterPropertyCondition;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityCost_Charges				ChargeCost;
	local X2AbilityCharges					Charges;
	local X2Condition_UnitEffects			KosmaCondition;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMKosmaGrenada');
	
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.DoNotConsumeAllSoldierAbilities.AddItem('Salvo');
	ActionPointCost.DoNotConsumeAllSoldierAbilities.AddItem('TotalCombat');
	Template.AbilityCosts.AddItem(ActionPointCost);
	Template.AbilityIconColor = "df07b7";
	ChargeCost = new class'X2AbilityCost_Charges';
	Template.AbilityCosts.AddItem(ChargeCost);

	Charges = new class'X2AbilityCharges';
	Charges.InitialCharges = default.ARFMKosmaCharges;
	Template.AbilityCharges = Charges;
	
	KosmaCondition = new class'X2Condition_UnitEffects';
	KosmaCondition.AddRequireEffect(default.KosmaCoreName, 'AA_MissingRequiredEffect');
	Template.AbilityShooterConditions.AddItem(KosmaCondition);

	ShooterPropertyCondition = new class'X2Condition_UnitProperty';	
	ShooterPropertyCondition.ExcludeDead = true;                    //Can't reload while dead
	Template.AbilityShooterConditions.AddItem(ShooterPropertyCondition);

	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	
	Template.AbilitySourceName = 'eAbilitySource_Debuff';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_ace_hole";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.RELOAD_PRIORITY;
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;
	Template.DisplayTargetHitChance = false;

	Template.ActivationSpeech = 'Reloading';
	Template.Hostility = eHostility_Neutral;

	Template.BuildNewGameStateFn = ReloadKosma_BuildGameState;
	Template.bSkipFireAction = true;
	Template.OverrideAbilityAvailabilityFn = ReloadKosma_OverrideAbilityAvailability;

	return Template;	
}

function ReloadKosma_OverrideAbilityAvailability(out AvailableAction Action, XComGameState_Ability AbilityState, XComGameState_Unit OwnerState)
{
	if (Action.AvailableCode == 'AA_Success')
	{
		if (AbilityState.GetSourceWeapon().Ammo == 0)
			Action.ShotHUDPriority = class'UIUtilities_Tactical'.const.MUST_RELOAD_PRIORITY;
	}
}
	
static function X2AbilityTemplate ARFM_KosmaLaunch()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_DamageImmunity			DamageImmunity;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMKosmaLaunch');
	
	Template.bDontDisplayInAbilitySummary = true;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_ace_hole";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilitySourceName = 'eAbilitySource_Passive';
	Template.AbilityIconColor = "df07b7";
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	// For all purposes, this is intended to be a dummy effect. Nothing should ever use this damage type
	DamageImmunity = new class'X2Effect_DamageImmunity';
	DamageImmunity.BuildPersistentEffect(1, true, false);
	DamageImmunity.ImmuneTypes.AddItem('ARFMDummyDamage');
	DamageImmunity.EffectName = default.KosmaCoreName;
	Template.AddTargetEffect(DamageImmunity);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.bSkipFireAction = true;
	// Note: no visualization on purpose!
	
	return Template;
}

simulated function XComGameState ReloadKosma_BuildGameState( XComGameStateContext Context )
{
	local XComGameState NewGameState;
	local XComGameState_Unit UnitState;
	local XComGameStateContext_Ability AbilityContext;
	local XComGameState_Ability AbilityState;
	local XComGameState_Item WeaponState, NewWeaponState;

	NewGameState = `XCOMHISTORY.CreateNewGameState(true, Context);	
	AbilityContext = XComGameStateContext_Ability(Context);	
	AbilityState = XComGameState_Ability(`XCOMHISTORY.GetGameStateForObjectID( AbilityContext.InputContext.AbilityRef.ObjectID ));

	WeaponState = AbilityState.GetSourceWeapon();
	NewWeaponState = XComGameState_Item(NewGameState.ModifyStateObject(class'XComGameState_Item', WeaponState.ObjectID));

	UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', AbilityContext.InputContext.SourceObject.ObjectID));	

	//  refill the weapon's ammo	
	NewWeaponState.Ammo = NewWeaponState.GetClipSize();
	// Apply the cost
	AbilityState.GetMyTemplate().ApplyCost(AbilityContext, AbilityState, UnitState, NewWeaponState, NewGameState);

	return NewGameState;	
}

simulated function ReloadKosma_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability  Context;
	local StateObjectReference          ShootingUnitRef;	
	local X2Action_PlayAnimation		PlayAnimation;

	local VisualizationActionMetadata        EmptyTrack;
	local VisualizationActionMetadata        ActionMetadata;

	local XComGameState_Ability Ability;
	local X2Action_PlaySoundAndFlyOver SoundAndFlyover;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	ShootingUnitRef = Context.InputContext.SourceObject;

	//Configure the visualization track for the shooter
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(ShootingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(ShootingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(ShootingUnitRef.ObjectID);
					
	PlayAnimation = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	PlayAnimation.Params.AnimName = 'HL_Reload';

	Ability = XComGameState_Ability(History.GetGameStateForObjectID(Context.InputContext.AbilityRef.ObjectID));
	SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	SoundAndFlyOver.SetSoundAndFlyOverParameters(None, "", Ability.GetMyTemplate().ActivationSpeech, eColor_Good);

		//****************************************************************************************
}

DefaultProperties
{
	TalKhazanChargeName="TalKhazanChargedState"
	KosmaCoreName="KosmaCore"
	MorKhazanCurrentLevelName = "MorKhazan_CurrentLevel"
	MorKhazanMaxLevelName = "MorKhazan_MaxLevel"
}