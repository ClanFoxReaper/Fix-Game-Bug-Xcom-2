class ARFM_Resources_Requiem extends X2Item config(GameCore);

var config bool AHWExplosiveDeathLoot;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Resources;
	
	// Requiem Corpses
	Resources.AddItem(CreateCorpseRequiemNiven());
	Resources.AddItem(CreateCorpseRequiemFloater());
	Resources.AddItem(CreateCorpseRequiemCyberdisc());
	Resources.AddItem(CreateCorpseRequiemOutsider());
	Resources.AddItem(CreateCorpseRequiemTitan());
	Resources.AddItem(CreateCorpseRequiemTaipan());
	Resources.AddItem(CreateCorpseRequiemNightmare());
	Resources.AddItem(CreateCorpseRequiemIncubator());
	Resources.AddItem(CreateCorpseRequiemMechtoid());
	Resources.AddItem(CreateCorpseRequiemSeraph());
	Resources.AddItem(CreateCorpseRequiemAndromelid());
	// Requiem Resources
	Resources.AddItem(CreateARFMRequiemEssence());
	Resources.AddItem(CreateARFMRequiemCore());

	return Resources;
}

// Requiem Corpses

static function X2DataTemplate CreateCorpseRequiemNiven()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'CorpseRequiemNiven');

	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.NivenAutopsy";
	Template.ItemCat = 'resource';
	Template.TradingPostValue = 5;
	Template.MaxQuantity = 1;
	Template.LeavesExplosiveRemains = default.AHWExplosiveDeathLoot;

	return Template;
}

static function X2DataTemplate CreateCorpseRequiemFloater()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'CorpseRequiemFloater');

	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.FloaterAutopsy";
	Template.ItemCat = 'resource';
	Template.TradingPostValue = 5;
	Template.MaxQuantity = 1;
	Template.LeavesExplosiveRemains = default.AHWExplosiveDeathLoot;

	return Template;
}

static function X2DataTemplate CreateCorpseRequiemOutsider()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'CorpseRequiemOutsider');

	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.HinterAutopsy";
	Template.ItemCat = 'resource';
	Template.TradingPostValue = 5;
	Template.MaxQuantity = 1;
	Template.LeavesExplosiveRemains = default.AHWExplosiveDeathLoot;

	return Template;
}

static function X2DataTemplate CreateCorpseRequiemCyberdisc()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'CorpseRequiemCyberdisc');

	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.CyberdiscAutopsy";
	Template.ItemCat = 'resource';
	Template.TradingPostValue = 5;
	Template.MaxQuantity = 1;
	Template.LeavesExplosiveRemains = default.AHWExplosiveDeathLoot;

	return Template;
}

static function X2DataTemplate CreateCorpseRequiemTitan()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'CorpseRequiemTitan');

	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.TitanAutopsy";
	Template.ItemCat = 'resource';
	Template.TradingPostValue = 5;
	Template.MaxQuantity = 1;
	Template.LeavesExplosiveRemains = default.AHWExplosiveDeathLoot;

	return Template;
}

static function X2DataTemplate CreateCorpseRequiemTaipan()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'CorpseRequiemTaipan');

	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.TaipanAutopsy";
	Template.ItemCat = 'resource';
	Template.TradingPostValue = 5;
	Template.MaxQuantity = 1;
	Template.LeavesExplosiveRemains = default.AHWExplosiveDeathLoot;

	return Template;
}

static function X2DataTemplate CreateCorpseRequiemNightmare()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'CorpseRequiemNightmare');

	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.NightmareAutopsy";
	Template.ItemCat = 'resource';
	Template.TradingPostValue = 5;
	Template.MaxQuantity = 1;
	Template.LeavesExplosiveRemains = default.AHWExplosiveDeathLoot;

	return Template;
}

static function X2DataTemplate CreateCorpseRequiemIncubator()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'CorpseRequiemIncubator');

	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.IncubatorAutopsy";
	Template.ItemCat = 'resource';
	Template.TradingPostValue = 5;
	Template.MaxQuantity = 1;
	Template.LeavesExplosiveRemains = default.AHWExplosiveDeathLoot;

	return Template;
}

static function X2DataTemplate CreateCorpseRequiemSeraph()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'CorpseRequiemSeraph');

	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.SeraphAutopsy";
	Template.ItemCat = 'resource';
	Template.TradingPostValue = 5;
	Template.MaxQuantity = 1;
	Template.LeavesExplosiveRemains = default.AHWExplosiveDeathLoot;

	return Template;
}

static function X2DataTemplate CreateCorpseRequiemMechtoid()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'CorpseRequiemMechtoid');

	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.MechtoidAutopsy";
	Template.ItemCat = 'resource';
	Template.TradingPostValue = 5;
	Template.MaxQuantity = 1;
	Template.LeavesExplosiveRemains = default.AHWExplosiveDeathLoot;

	return Template;
}

static function X2DataTemplate CreateCorpseRequiemAndromelid()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'CorpseRequiemAndromelid');

	Template.strImage = "img:///AHW_RequiemTechs_UILibrary.AndromelidAutopsy";
	Template.ItemCat = 'resource';
	Template.TradingPostValue = 5;
	Template.MaxQuantity = 1;
	Template.LeavesExplosiveRemains = default.AHWExplosiveDeathLoot;

	return Template;
}

// Requiem Resources

	static function X2DataTemplate CreateARFMRequiemEssence()
{
	local X2ItemTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'ARFMRequiemEssence');

	Template.strImage = "img:///AHW_MagnasV2_UILibrary.Inv_RequiemEssence";
	Template.strInventoryImage = "img:///AHW_MagnasV2_UILibrary.Inv_RequiemEssence_Mini";
	Template.ItemCat = 'resource';
	Template.TradingPostValue = 1;
	Template.MaxQuantity = 99;

	return Template;
}

static function X2DataTemplate CreateARFMRequiemCore()
{
	local X2ItemTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2ItemTemplate', Template, 'ARFMRequiemCore');

	Template.strImage = "img:///AHW_MagnasV2_UILibrary.Inv_RequiemCore";
	Template.strInventoryImage = "img:///AHW_MagnasV2_UILibrary.Inv_RequiemCore_Mini";
	Template.ItemCat = 'RequiemCore';
	Template.TradingPostValue = 50;

	Template.Requirements.RequiredTechs.AddItem('AHWRequiemTech');

	Resources.ItemTemplateName = 'EleriumCore';
	Resources.Quantity = 1;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Resources.ItemTemplateName = 'ARFMRequiemEssence';
	Resources.Quantity = 30;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Template.CanBeBuilt = true;

	return Template;
}
