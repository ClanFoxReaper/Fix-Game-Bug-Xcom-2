class ARFM_Effect_NivenCapacitor extends X2Effect_Persistent;

var int DamageMod;

var name PsiDamageTypeName;

function float GetPostDefaultAttackingDamageModifier_CH(XComGameState_Effect EffectState, XComGameState_Unit SourceUnit, Damageable Target, XComGameState_Ability AbilityState, const out EffectAppliedData ApplyEffectParameters, float WeaponDamage, X2Effect_ApplyWeaponDamage WeaponDamageEffect, XComGameState NewGameState)
{
	if((WeaponDamageEffect.EffectDamageValue.DamageType == PsiDamageTypeName) || (WeaponDamageEffect.DamageTypes.Find(PsiDamageTypeName) != INDEX_NONE))
	{
		return WeaponDamage * 0.2;
	}
	
	return 0.0;
}

defaultproperties
{
	PsiDamageTypeName="melee"
	bDisplayInSpecialDamageMessageUI = true
}
