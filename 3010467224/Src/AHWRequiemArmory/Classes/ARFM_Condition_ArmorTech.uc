class ARFM_Condition_ArmorTech extends X2BreakthroughCondition 
	editinlinenew
	hidecategories(Object);

function bool MeetsCondition(XComGameState_BaseObject kTarget)
{
	local XComGameState_Item ItemState;
	local X2ArmorTemplate ArmorTemplate;
	local X2SparkArmorTemplate_DLC_3 SparkArmorTemplate;

	ItemState = XComGameState_Item( kTarget );
	if (ItemState == none) // not an item
		return false;

	ArmorTemplate = X2ArmorTemplate( ItemState.GetMyTemplate() );
	if (ArmorTemplate != none && ArmorTemplate.ArmorTechCat == 'powered') // Is a power armor
		return true;
	
	SparkArmorTemplate = X2SparkArmorTemplate_DLC_3( ItemState.GetMyTemplate() );
	if (SparkArmorTemplate != none && SparkArmorTemplate.ArmorTechCat == 'powered') // Is a power armor
		return true;

	// not a Armor-Armor
	if (ArmorTemplate.ItemCat != 'Armor')
		return false;
	
	return false;
}