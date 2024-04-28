class ARFM_Abilities_RequiemGenemods extends X2Ability config(RequiemGenetics);

var config int ARFMTaipanEyesAim;
var config int ARFMTaipanEyesFlankingAim;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(ARFM_TaipanEyes());
	Templates.AddItem(ARFM_TaipanSkin());
	Templates.AddItem(ARFM_HinterNeurons());

	return Templates;
}

static function X2AbilityTemplate ARFM_TaipanEyes()
{
	local X2AbilityTemplate				Template;	
	local X2Effect_PersistentStatChange BuffEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMTaipanEyes');

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_combatstim_perception";
	Template.AbilitySourceName = 'eAbilitySource_Commander';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityIconColor = "df07b7";
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	BuffEffect = new class'X2Effect_PersistentStatChange';
	BuffEffect.BuildPersistentEffect(1, true, false);
	BuffEffect.EffectName = 'ARFMTaipanEyesBoost';
	BuffEffect.AddPersistentStatChange(eStat_Offense, default.ARFMTaipanEyesAim);
	BuffEffect.AddPersistentStatChange(eStat_FlankingAimBonus, default.ARFMTaipanEyesFlankingAim);
	BuffEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddTargetEffect(BuffEffect);


	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate ARFM_TaipanSkin()
{
	local X2AbilityTemplate				Template;	
	local ARFM_Effect_TaipanSkin		BuffEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMTaipanSkin');

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_chitinplating";
	Template.AbilitySourceName = 'eAbilitySource_Commander';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityIconColor = "df07b7";
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	BuffEffect = new class'ARFM_Effect_TaipanSkin';
	BuffEffect.BuildPersistentEffect(1, true, false);
	BuffEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddTargetEffect(BuffEffect);

	Template.AdditionalAbilities.AddItem('AHWTaipanFireWeak');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	
}

static function X2AbilityTemplate ARFM_HinterNeurons()
{
	local X2AbilityTemplate										Template;
	local X2Effect_TargetDamageTypeBonus						BonusDamage;
	local X2Effect_AdditionalAnimSets							AnimSetsEffect;
	local array<string>											AnimSetsToAdd;
	local string												Path;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ARFMHinterNeurons');

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_neuralfeedback";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	Template.AbilityIconColor = "df07b7";
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	BonusDamage = new class'X2Effect_TargetDamageTypeBonus';
	BonusDamage.EffectName = 'ARFMMirrorNeurons';
	BonusDamage.BuildPersistentEffect(1, true, false, true);
	BonusDamage.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, , , Template.AbilitySourceName);
	BonusDamage.DuplicateResponse = eDupe_Ignore;
	BonusDamage.BonusDmg = 1.0;
	BonusDamage.BonusModType = MODOP_Multiplication;
	BonusDamage.BonusDamageTypes.AddItem('AHWRequiem');
	BonusDamage.BonusDamageTypes.AddItem('AHWRequiemCorrosion');
	BonusDamage.BonusDamageTypes.AddItem('Psi');
	Template.AddTargetEffect(BonusDamage);

	AnimSetsToAdd.AddItem("AHW_Magnas_Outsider.Anims.AS_Outsider");
	foreach AnimSetsToAdd (Path)
	{
		AnimSetsEffect = new class'X2Effect_AdditionalAnimSets';
		AnimSetsEffect.AddAnimSetWithPath(Path);
		AnimSetsEffect.BuildPersistentEffect(1, true);
		Template.AddTargetEffect(AnimSetsEffect);
	}

	Template.AdditionalAbilities.AddItem('AHWOutsiderTeleport');
	Template.AdditionalAbilities.AddItem('AHWOutsiderVolt');
	Template.AdditionalAbilities.AddItem('AHWVoidPrison');

	Template.OverrideAbilities.AddItem('ARFMStainlessVest');
	Template.OverrideAbilities.AddItem('ARFMStainlessVest_LW');
	Template.OverrideAbilities.AddItem('MindShield');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}