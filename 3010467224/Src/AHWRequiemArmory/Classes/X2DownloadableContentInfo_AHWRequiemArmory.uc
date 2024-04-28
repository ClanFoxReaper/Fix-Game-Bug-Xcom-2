class X2DownloadableContentInfo_AHWRequiemArmory extends X2DownloadableContentInfo config(RequiemWeapons);

var config bool UseNonLWRequiemArmorySettings;
var config bool UseLWRequiemArmorySettings;
var config WeaponDamageValue LWOTC_AHWKALAMAL_BASEDAMAGE;
var config WeaponDamageValue LWOTC_AHWTAZNAL_BASEDAMAGE;
var config WeaponDamageValue LWOTC_AHWBALADUM_BASEDAMAGE;
var config WeaponDamageValue LWOTC_AHWBALAKAL_BASEDAMAGE;
var config WeaponDamageValue LWOTC_AHWBALAKOR_BASEDAMAGE;
var config WeaponDamageValue LWOTC_AHWTAZKOR_BASEDAMAGE;
var config WeaponDamageValue LWOTC_AHWTALKHAZAN_BASEDAMAGE;
var config array <WeaponDamageValue> LWOTC_AHWTALKHAZAN_EXTRADAMAGE;
var config WeaponDamageValue LWOTC_AHWMORKHAZAN_BASEDAMAGE;
var config WeaponDamageValue LWOTC_AHWKORKHAZAN_BASEDAMAGE;
var config WeaponDamageValue LWOTC_AHWHADUM_BASEDAMAGE;
var config WeaponDamageValue LWOTC_AHWHAKOR_BASEDAMAGE;
var config WeaponDamageValue LWOTC_AHWXAEMALA_BASEDAMAGE;

static event OnPostTemplatesCreated() 
{
   local X2ItemTemplateManager		   ItemMgr;
   local array<name> TemplateNames;
   local name TemplateName;
   local array<X2DataTemplate>				TemplateAllDifficulties;
   local X2DataTemplate						Template;
   local X2WeaponTemplate					WeaponTemplate;
   local X2AmmoTemplate						AmmoTemplate;
   local X2EquipmentTemplate				EquipmentTemplate;

   ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

   ItemMgr.GetTemplateNames(TemplateNames);

   if (IsModLoaded('LongWarOfTheChosen') || default.UseLWRequiemArmorySettings)

    foreach TemplateNames(TemplateName)
    {
        ItemMgr.FindDataTemplateAllDifficulties(TemplateName, TemplateAllDifficulties);

        foreach TemplateAllDifficulties(Template)
        {
           WeaponTemplate = X2WeaponTemplate(Template);
		   AmmoTemplate = X2AmmoTemplate(Template);
		   EquipmentTemplate = X2EquipmentTemplate(Template);

   			switch(WeaponTemplate.DataName)
			{
				case 'AHWRequiemMagnetron':
					WeaponTemplate.BaseDamage = default.LWOTC_AHWKALAMAL_BASEDAMAGE;
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateEnvironmentalRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemHeavyRifle':
					WeaponTemplate.BaseDamage = default.LWOTC_AHWKALAMAL_BASEDAMAGE;
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateEnvironmentalRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemLance':
					WeaponTemplate.BaseDamage = default.LWOTC_AHWBALAKOR_BASEDAMAGE;
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateEnvironmentalRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemPistol':
					WeaponTemplate.BaseDamage = default.LWOTC_AHWHAKOR_BASEDAMAGE;
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateEnvironmentalRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemSword':
					WeaponTemplate.BaseDamage = default.LWOTC_AHWTAZNAL_BASEDAMAGE;
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateEnvironmentalRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemCannon':
					WeaponTemplate.BaseDamage = default.LWOTC_AHWBALAKAL_BASEDAMAGE;
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateEnvironmentalRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemShotgun':
					WeaponTemplate.BaseDamage = default.LWOTC_AHWBALADUM_BASEDAMAGE;
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateEnvironmentalRequiemCorrosionStatusEffect(1));
					WeaponTemplate.Abilities.RemoveItem('ARFMBalaDumExecute');
					WeaponTemplate.Abilities.AddItem('CoupDeGrace2');
					break;
				case 'AHWRequiemRifle':
					WeaponTemplate.BaseDamage = default.LWOTC_AHWTAZKOR_BASEDAMAGE;
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateEnvironmentalRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemSMG':
					WeaponTemplate.BaseDamage = default.LWOTC_AHWHADUM_BASEDAMAGE;
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateEnvironmentalRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemSparkSniper':
					WeaponTemplate.BaseDamage = default.LWOTC_AHWXAEMALA_BASEDAMAGE;
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateEnvironmentalRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemScoutSniper':
					WeaponTemplate.BaseDamage = default.LWOTC_AHWMORKHAZAN_BASEDAMAGE;
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateEnvironmentalRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemBolter':
					WeaponTemplate.BaseDamage = default.LWOTC_AHWKORKHAZAN_BASEDAMAGE;
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateEnvironmentalRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemSniper':
					WeaponTemplate.BaseDamage = default.LWOTC_AHWTALKHAZAN_BASEDAMAGE;
					WeaponTemplate.ExtraDamage = default.LWOTC_AHWTALKHAZAN_EXTRADAMAGE;
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateEnvironmentalRequiemCorrosionStatusEffect(1));
					break;
			}

			switch(AmmoTemplate.DataName)
			{
				case 'RequiemRounds':
					AmmoTemplate.TargetEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateEnvironmentalRequiemCorrosionStatusEffect(1));
					break;
			}

			switch(EquipmentTemplate.DataName)
			{
				case 'RequiemStainlessVest':
					EquipmentTemplate.ItemCat = 'plating';
					EquipmentTemplate.Abilities.RemoveItem('ARFMStainlessVest');
					EquipmentTemplate.Abilities.AddItem('ARFMStainlessVest_LW');
					EquipmentTemplate.Abilities.AddItem('Alloy_Plating_Ability');
					EquipmentTemplate.Cost.ResourceCosts.Length = 0;
					EquipmentTemplate.Cost.ArtifactCosts.Length = 0;
					break;
			}

        }
    }

	if (!IsModLoaded('LongWarOfTheChosen') || default.UseNonLWRequiemArmorySettings)

    foreach TemplateNames(TemplateName)
    {
        ItemMgr.FindDataTemplateAllDifficulties(TemplateName, TemplateAllDifficulties);

        foreach TemplateAllDifficulties(Template)
        {
           WeaponTemplate = X2WeaponTemplate(Template);
		   AmmoTemplate = X2AmmoTemplate(Template);
		   EquipmentTemplate = X2EquipmentTemplate(Template);

   			switch(WeaponTemplate.DataName)
			{
				case 'AHWRequiemMagnetron':
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemHeavyRifle':
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemLance':
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemPistol':
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemSword':
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemCannon':
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemShotgun':
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemRifle':
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemSMG':
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemSparkSniper':
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemScoutSniper':
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemBolter':
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateRequiemCorrosionStatusEffect(1));
					break;
				case 'AHWRequiemSniper':
					WeaponTemplate.BonusWeaponEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateRequiemCorrosionStatusEffect(1));
					break;
			}

			switch(AmmoTemplate.DataName)
			{
				case 'RequiemRounds':
					AmmoTemplate.TargetEffects.AddItem(class'AHW_StatusEffects_Requiem'.static.CreateRequiemCorrosionStatusEffect(1));
					break;
			}

			switch(EquipmentTemplate.DataName)
			{
				case 'RequiemStainlessVest':
					EquipmentTemplate.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_ItemGrantedAbilitySet'.default.PLATED_VEST_HP_BONUS);
					EquipmentTemplate.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_ItemGrantedAbilitySet'.default.PLATED_VEST_MITIGATION_AMOUNT);
					break;
			}

        }
    }
}

static function bool IsModLoaded(name DLCName)
{
    local XComOnlineEventMgr    EventManager;
    local int                   Index;

    EventManager = `ONLINEEVENTMGR;

    for(Index = EventManager.GetNumDLC() - 1; Index >= 0; Index--)  
    {
        if(EventManager.GetDLCNames(Index) == DLCName)  
        {
            return true;
        }
    }
    return false;
}