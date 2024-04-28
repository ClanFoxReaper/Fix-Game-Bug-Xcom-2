class ARFM_Effect_StainlessDreams extends X2Effect_Persistent;

var name NightmareBombTypeName;

function int GetDefendingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, X2Effect_ApplyWeaponDamage WeaponDamageEffect, optional XComGameState NewGameState)
{
	local X2AbilityToHitCalc_Deadeye ToHitCalc;
	local float Stainless;

	Stainless = -0.40f;

	// The damage effect's DamageTypes must be empty or have melee in order to adjust the damage
	if((WeaponDamageEffect.EffectDamageValue.DamageType == NightmareBombTypeName) || (WeaponDamageEffect.DamageTypes.Find(NightmareBombTypeName) != INDEX_NONE))
	{
		ToHitCalc = X2AbilityToHitCalc_DeadEye(AbilityState.GetMyTemplate().AbilityToHitCalc);
		if (ToHitCalc != none)
		{
			return CurrentDamage * Stainless;
		}
	}
	
	return 0;
}

DefaultProperties
{
	NightmareBombTypeName="AHWNightmareBomb"
	bDisplayInSpecialDamageMessageUI = true
	EffectName="ARFMStainlessDreams"
}