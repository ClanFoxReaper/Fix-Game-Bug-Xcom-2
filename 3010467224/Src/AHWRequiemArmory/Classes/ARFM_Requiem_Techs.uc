class ARFM_Requiem_Techs extends X2StrategyElement_XpackTechs config(RequiemWeapons);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;
	
	// Requiem Tech Unlock
	Techs.AddItem(CreateAHWRequiemTechUnlock());
	Techs.AddItem(CreateAHWRequiemTitanAutopsy());
	Techs.AddItem(CreateAHWRequiemFloaterAutopsy());
	Techs.AddItem(CreateAHWRequiemOutsiderAutopsy());
	Techs.AddItem(CreateAHWRequiemTaipanAutopsy());
	Techs.AddItem(CreateAHWRequiemMechtoidAutopsy());
	Techs.AddItem(CreateAHWRequiemNightmareAutopsy());
	Techs.AddItem(CreateAHWRequiemIncubatorAutopsy());
	Techs.AddItem(CreateAHWRequiemSeraphAutopsy());
	Techs.AddItem(CreateAHWRequiemAndromelidAutopsy());
	Techs.AddItem(CreateAHWRequiemCyberdiscAutopsy());
	Techs.AddItem(CreateAHWRequiemNivenAutopsy());

	return Techs;
}


// Syusa's Trail - Mission Unlocks!

static function X2DataTemplate CreateAHWRequiemTechUnlock()
{
	local X2TechTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AHWRequiemTech');
	Template.PointsToComplete = 12000;
	Template.bJumpToLabs = true;
	Template.bWeaponTech = true;
	Template.SortingTier = 5;
	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.RequiemTech";

	Template.Requirements.RequiredTechs.AddItem('Tech_Elerium');

	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = 10;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Resources.ItemTemplateName = 'ARFMRequiemEssence';
	Resources.Quantity = 10;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateAHWRequiemNivenAutopsy()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AHWRequiemNivenAutopsy');
	Template.PointsToComplete = 4000;
	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.NivenAutopsy";
	Template.bAutopsy = true;
	Template.bCheckForceInstant = true;
	Template.SortingTier = 1;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredItems.AddItem('CorpseRequiemNiven');

	// Instant Requirements. Will become the Cost if the tech is forced to Instant.
	Artifacts.ItemTemplateName = 'CorpseRequiemNiven';
	Artifacts.Quantity = 6;
	Template.InstantRequirements.RequiredItemQuantities.AddItem(Artifacts);

	// Cost
	Artifacts.ItemTemplateName = 'CorpseRequiemNiven';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateAHWRequiemFloaterAutopsy()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AHWRequiemFloaterAutopsy');
	Template.PointsToComplete = 4000;
	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.FloaterAutopsy";
	Template.bAutopsy = true;
	Template.bCheckForceInstant = true;
	Template.SortingTier = 1;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredItems.AddItem('CorpseRequiemFloater');

	// Instant Requirements. Will become the Cost if the tech is forced to Instant.
	Artifacts.ItemTemplateName = 'CorpseRequiemFloater';
	Artifacts.Quantity = 6;
	Template.InstantRequirements.RequiredItemQuantities.AddItem(Artifacts);

	// Cost
	Artifacts.ItemTemplateName = 'CorpseRequiemFloater';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateAHWRequiemTitanAutopsy()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local X2BreakthroughCondition_WeaponType WeaponTypeCondition;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AHWRequiemTitanAutopsy');
	Template.PointsToComplete = 4000;
	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.TitanAutopsy";
	Template.bAutopsy = true;
	Template.bCheckForceInstant = true;
	Template.SortingTier = 1;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredItems.AddItem('CorpseRequiemTitan');

	// Instant Requirements. Will become the Cost if the tech is forced to Instant.
	Artifacts.ItemTemplateName = 'CorpseRequiemTitan';
	Artifacts.Quantity = 6;
	Template.InstantRequirements.RequiredItemQuantities.AddItem(Artifacts);

	// Cost
	Artifacts.ItemTemplateName = 'CorpseRequiemTitan';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Template.ResearchCompletedFn = RequiemLegionBreakthroughAutopsyCompleted;

	Template.RewardName = 'ARFMShardGauntletsBonus';

	WeaponTypeCondition = new class'X2BreakthroughCondition_WeaponType';
	WeaponTypeCondition.WeaponTypeMatch = 'gauntlet';
	Template.BreakthroughCondition = WeaponTypeCondition;

	return Template;
}

static function X2DataTemplate CreateAHWRequiemOutsiderAutopsy()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AHWRequiemOutsiderAutopsy');
	Template.PointsToComplete = 4000;
	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.HinterAutopsy";
	Template.bAutopsy = true;
	Template.bCheckForceInstant = true;
	Template.SortingTier = 1;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredItems.AddItem('CorpseRequiemOutsider');

	// Instant Requirements. Will become the Cost if the tech is forced to Instant.
	Artifacts.ItemTemplateName = 'CorpseRequiemOutsider';
	Artifacts.Quantity = 6;
	Template.InstantRequirements.RequiredItemQuantities.AddItem(Artifacts);

	// Cost
	Artifacts.ItemTemplateName = 'CorpseRequiemOutsider';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateAHWRequiemTaipanAutopsy()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AHWRequiemTaipanAutopsy');
	Template.PointsToComplete = 4000;
	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.TaipanAutopsy";
	Template.bAutopsy = true;
	Template.bCheckForceInstant = true;
	Template.SortingTier = 1;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredItems.AddItem('CorpseRequiemTaipan');

	// Instant Requirements. Will become the Cost if the tech is forced to Instant.
	Artifacts.ItemTemplateName = 'CorpseRequiemTaipan';
	Artifacts.Quantity = 6;
	Template.InstantRequirements.RequiredItemQuantities.AddItem(Artifacts);

	// Cost
	Artifacts.ItemTemplateName = 'CorpseRequiemTaipan';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateAHWRequiemMechtoidAutopsy()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AHWRequiemMechtoidAutopsy');
	Template.PointsToComplete = 4000;
	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.MechtoidAutopsy";
	Template.bAutopsy = true;
	Template.bCheckForceInstant = true;
	Template.SortingTier = 1;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredItems.AddItem('CorpseRequiemMechtoid');

	// Instant Requirements. Will become the Cost if the tech is forced to Instant.
	Artifacts.ItemTemplateName = 'CorpseRequiemMechtoid';
	Artifacts.Quantity = 6;
	Template.InstantRequirements.RequiredItemQuantities.AddItem(Artifacts);

	// Cost
	Artifacts.ItemTemplateName = 'CorpseRequiemMechtoid';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateAHWRequiemNightmareAutopsy()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local X2BreakthroughCondition_WeaponType WeaponTypeCondition;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AHWRequiemNightmareAutopsy');
	Template.PointsToComplete = 4000;
	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.NightmareAutopsy";
	Template.bAutopsy = true;
	Template.bCheckForceInstant = true;
	Template.SortingTier = 1;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredItems.AddItem('CorpseRequiemNightmare');

	// Instant Requirements. Will become the Cost if the tech is forced to Instant.
	Artifacts.ItemTemplateName = 'CorpseRequiemNightmare';
	Artifacts.Quantity = 6;
	Template.InstantRequirements.RequiredItemQuantities.AddItem(Artifacts);

	// Cost
	Artifacts.ItemTemplateName = 'CorpseRequiemNightmare';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Template.ResearchCompletedFn = RequiemLegionBreakthroughAutopsyCompleted;
	Template.RewardName = 'ARFMRipjackBonus';

	WeaponTypeCondition = new class'X2BreakthroughCondition_WeaponType';
	WeaponTypeCondition.WeaponTypeMatch = 'wristblade';
	Template.BreakthroughCondition = WeaponTypeCondition;

	return Template;
}

static function X2DataTemplate CreateAHWRequiemIncubatorAutopsy()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;
	local ARFM_Condition_ArmorTech ArmorTechCondition;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AHWRequiemIncubatorAutopsy');
	Template.PointsToComplete = 4000;
	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.IncubatorAutopsy";
	Template.bAutopsy = true;
	Template.bCheckForceInstant = true;
	Template.SortingTier = 1;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredItems.AddItem('CorpseRequiemIncubator');

	// Instant Requirements. Will become the Cost if the tech is forced to Instant.
	Artifacts.ItemTemplateName = 'CorpseRequiemIncubator';
	Artifacts.Quantity = 6;
	Template.InstantRequirements.RequiredItemQuantities.AddItem(Artifacts);

	// Cost
	Artifacts.ItemTemplateName = 'CorpseRequiemIncubator';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Template.ResearchCompletedFn = RequiemLegionBreakthroughAutopsyCompleted;
	Template.RewardName = 'ARFMArmorBonus';

	ArmorTechCondition = new class'ARFM_Condition_ArmorTech';
	Template.BreakthroughCondition = ArmorTechCondition;

	return Template;
}

static function X2DataTemplate CreateAHWRequiemSeraphAutopsy()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AHWRequiemSeraphAutopsy');
	Template.PointsToComplete = 4000;
	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.SeraphAutopsy";
	Template.bAutopsy = true;
	Template.bCheckForceInstant = true;
	Template.SortingTier = 1;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredItems.AddItem('CorpseRequiemSeraph');

	// Instant Requirements. Will become the Cost if the tech is forced to Instant.
	Artifacts.ItemTemplateName = 'CorpseRequiemSeraph';
	Artifacts.Quantity = 6;
	Template.InstantRequirements.RequiredItemQuantities.AddItem(Artifacts);

	// Cost
	Artifacts.ItemTemplateName = 'CorpseRequiemSeraph';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateAHWRequiemAndromelidAutopsy()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AHWRequiemAndromelidAutopsy');
	Template.PointsToComplete = 4000;
	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.AndromelidAutopsy";
	Template.bAutopsy = true;
	Template.bCheckForceInstant = true;
	Template.SortingTier = 1;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredItems.AddItem('CorpseRequiemAndromelid');

	// Instant Requirements. Will become the Cost if the tech is forced to Instant.
	Artifacts.ItemTemplateName = 'CorpseRequiemAndromelid';
	Artifacts.Quantity = 6;
	Template.InstantRequirements.RequiredItemQuantities.AddItem(Artifacts);

	// Cost
	Artifacts.ItemTemplateName = 'CorpseRequiemAndromelid';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

static function X2DataTemplate CreateAHWRequiemCyberdiscAutopsy()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'AHWRequiemCyberdiscAutopsy');
	Template.PointsToComplete = 4000;
	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.CyberdiscAutopsy";
	Template.bAutopsy = true;
	Template.bCheckForceInstant = true;
	Template.SortingTier = 1;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');
	Template.Requirements.RequiredItems.AddItem('CorpseRequiemCyberdisc');

	// Instant Requirements. Will become the Cost if the tech is forced to Instant.
	Artifacts.ItemTemplateName = 'CorpseRequiemCyberdisc';
	Artifacts.Quantity = 6;
	Template.InstantRequirements.RequiredItemQuantities.AddItem(Artifacts);

	// Cost
	Artifacts.ItemTemplateName = 'CorpseRequiemCyberdisc';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	return Template;
}

function RequiemLegionBreakthroughAutopsyCompleted(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameState_HeadquartersXCom XComHQ;

	XComHQ = XComGameState_HeadquartersXCom( `XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom') );
	XComHQ = XComGameState_HeadquartersXCom( NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID) );
	XComHQ.TacticalTechBreakthroughs.AddItem( TechState.GetReference() );
}