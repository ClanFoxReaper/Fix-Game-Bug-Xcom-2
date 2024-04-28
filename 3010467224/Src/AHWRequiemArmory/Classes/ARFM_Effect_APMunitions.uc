class ARFM_Effect_APMunitions extends X2Effect_Persistent;

var int Pierce;

function int GetExtraArmorPiercing(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData)
{
	local XComGameState_Item SourceWeapon;

	SourceWeapon = AbilityState.GetSourceWeapon();
	//  make sure the ammo that created this effect is loaded into the weapon
	if (SourceWeapon != none && SourceWeapon.LoadedAmmo.ObjectID == EffectState.ApplyEffectParameters.ItemStateObjectRef.ObjectID)
	{
		return Pierce;
	}
	return 0;
}

DefaultProperties
{
	DuplicateResponse = eDupe_Ignore
	bDisplayInSpecialDamageMessageUI = true
}
