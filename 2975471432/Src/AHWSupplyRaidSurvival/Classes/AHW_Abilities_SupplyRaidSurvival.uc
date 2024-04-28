class AHW_Abilities_SupplyRaidSurvival extends X2Ability;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(AHW_SpawnEasyWave());
	Templates.AddItem(AHW_SpawnMediumWave());
	Templates.AddItem(AHW_SpawnHardWave());
	Templates.AddItem(AHW_SpawnBrutalWave());
	Templates.AddItem(AHW_SpawnAbsurdWave());

	return Templates;
}

static function X2AbilityTemplate AHW_SpawnEasyWave()
{
	local X2AbilityTemplate					Template;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityCharges					Charges;
	local X2AbilityCost_Charges             ChargeCost;
	local X2AbilityCooldown					Cooldown;
	local X2Condition_GameplayTag			GameplayCondition;
	local AHW_Effect_CallWaveSharedCDS		SharedCooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AHWSpawnEasyWave');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_andromedon_poisoncloud";

	Template.AbilityIconColor = "acd373";
	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MUST_RELOAD_PRIORITY;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Charges  = new class'X2AbilityCharges';
	Charges.InitialCharges = 4;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 99;
	Template.AbilityCooldown = Cooldown;

	// Code Shamelessly Stolen from Proficiency Classes
	SharedCooldown = new class'AHW_Effect_CallWaveSharedCDS';
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnAbsurdWave');
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnMediumWave');
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnHardWave');
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnBrutalWave');
	SharedCooldown.SetCooldownTo = 99;
	Template.AddShooterEffect(SharedCooldown);

	GameplayCondition = new class'X2Condition_GameplayTag';
	GameplayCondition.RequiredGameplayTag = 'AHWSRS';
	Template.AbilityShooterConditions.AddItem(GameplayCondition);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bShowActivation = true;

	return Template;
}

static function X2AbilityTemplate AHW_SpawnMediumWave()
{
	local X2AbilityTemplate					Template;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityCharges					Charges;
	local X2AbilityCost_Charges             ChargeCost;
	local X2AbilityCooldown					Cooldown;
	local X2Condition_GameplayTag			GameplayCondition;
	local AHW_Effect_CallWaveSharedCDS		SharedCooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AHWSpawnMediumWave');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_andromedon_poisoncloud";

	Template.AbilityIconColor = "27aae1";
	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MUST_RELOAD_PRIORITY;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Charges  = new class'X2AbilityCharges';
	Charges.InitialCharges = 4;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 99;
	Template.AbilityCooldown = Cooldown;

	// Code Shamelessly Stolen from Proficiency Classes
	SharedCooldown = new class'AHW_Effect_CallWaveSharedCDS';
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnAbsurdWave');
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnEasyWave');
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnHardWave');
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnBrutalWave');
	SharedCooldown.SetCooldownTo = 99;
	Template.AddShooterEffect(SharedCooldown);

	GameplayCondition = new class'X2Condition_GameplayTag';
	GameplayCondition.RequiredGameplayTag = 'AHWSRS';
	Template.AbilityShooterConditions.AddItem(GameplayCondition);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bShowActivation = true;

	return Template;
}

static function X2AbilityTemplate AHW_SpawnHardWave()
{
	local X2AbilityTemplate					Template;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityCharges					Charges;
	local X2AbilityCost_Charges             ChargeCost;
	local X2AbilityCooldown					Cooldown;
	local X2Condition_GameplayTag			GameplayCondition;
	local AHW_Effect_CallWaveSharedCDS		SharedCooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AHWSpawnHardWave');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_andromedon_poisoncloud";

	Template.AbilityIconColor = "e69831";
	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MUST_RELOAD_PRIORITY;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Charges  = new class'X2AbilityCharges';
	Charges.InitialCharges = 4;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 99;
	Template.AbilityCooldown = Cooldown;

	// Code Shamelessly Stolen from Proficiency Classes
	SharedCooldown = new class'AHW_Effect_CallWaveSharedCDS';
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnAbsurdWave');
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnMediumWave');
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnEasyWave');
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnBrutalWave');
	SharedCooldown.SetCooldownTo = 99;
	Template.AddShooterEffect(SharedCooldown);

	GameplayCondition = new class'X2Condition_GameplayTag';
	GameplayCondition.RequiredGameplayTag = 'AHWSRS';
	Template.AbilityShooterConditions.AddItem(GameplayCondition);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bShowActivation = true;

	return Template;
}

static function X2AbilityTemplate AHW_SpawnBrutalWave()
{
	local X2AbilityTemplate					Template;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityCharges					Charges;
	local X2AbilityCost_Charges             ChargeCost;
	local X2AbilityCooldown					Cooldown;
	local X2Condition_GameplayTag			GameplayCondition;
	local AHW_Effect_CallWaveSharedCDS		SharedCooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AHWSpawnBrutalWave');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_andromedon_poisoncloud";

	Template.AbilityIconColor = "b6b3e3";
	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MUST_RELOAD_PRIORITY;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Charges  = new class'X2AbilityCharges';
	Charges.InitialCharges = 4;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 99;
	Template.AbilityCooldown = Cooldown;

	// Code Shamelessly Stolen from Proficiency Classes
	SharedCooldown = new class'AHW_Effect_CallWaveSharedCDS';
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnAbsurdWave');
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnMediumWave');
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnHardWave');
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnEasyWave');
	SharedCooldown.SetCooldownTo = 99;
	Template.AddShooterEffect(SharedCooldown);

	GameplayCondition = new class'X2Condition_GameplayTag';
	GameplayCondition.RequiredGameplayTag = 'AHWSRS';
	Template.AbilityShooterConditions.AddItem(GameplayCondition);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bShowActivation = true;

	return Template;
}

static function X2AbilityTemplate AHW_SpawnAbsurdWave()
{
	local X2AbilityTemplate					Template;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityCharges					Charges;
	local X2AbilityCost_Charges             ChargeCost;
	local X2AbilityCooldown					Cooldown;
	local X2Condition_GameplayTag			GameplayCondition;
	local AHW_Effect_CallWaveSharedCDS		SharedCooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AHWSpawnAbsurdWave');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_andromedon_poisoncloud";

	Template.AbilityIconColor = "df07b7";
	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.MUST_RELOAD_PRIORITY;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	Charges  = new class'X2AbilityCharges';
	Charges.InitialCharges = 8;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 99;
	Template.AbilityCooldown = Cooldown;

	// Code Shamelessly Stolen from Proficiency Classes
	SharedCooldown = new class'AHW_Effect_CallWaveSharedCDS';
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnEasyWave');
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnMediumWave');
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnHardWave');
	SharedCooldown.AbilitiesToSet.AddItem('AHWSpawnBrutalWave');
	SharedCooldown.SetCooldownTo = 99;
	Template.AddShooterEffect(SharedCooldown);

	GameplayCondition = new class'X2Condition_GameplayTag';
	GameplayCondition.RequiredGameplayTag = 'AHWSRS';
	Template.AbilityShooterConditions.AddItem(GameplayCondition);

	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bShowActivation = true;

	return Template;
}