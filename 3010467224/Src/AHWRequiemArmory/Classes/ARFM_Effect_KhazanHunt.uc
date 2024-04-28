class ARFM_Effect_KhazanHunt extends X2Effect_Persistent;

var int DamageBoostPerKill;
var int MaxDamageBoost;

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
	local X2EventManager EventMgr;
	local XComGameState_Unit UnitState;
	local Object EffectObj;
	local ARFM_GameStateEffect_KhazanHunt EffectState;

	EffectState = ARFM_GameStateEffect_KhazanHunt(EffectGameState);
	`assert(EffectState != none);
	EventMgr = `XEVENTMGR;
	EffectObj = EffectGameState;
	UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));
	EventMgr.RegisterForEvent(EffectObj, 'ARFMKhazanHunting', EffectState.TriggerAbilityFlyover, ELD_OnStateSubmitted, , UnitState);
	EventMgr.RegisterForEvent(EffectObj, 'KillMail', EffectState.ARFMKhazanListener, ELD_OnStateSubmitted, , UnitState);
}

function int GetAttackingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, optional XComGameState NewGameState) 
{
	local X2Effect_ApplyWeaponDamage DamageEffect;
	local ARFM_GameStateEffect_KhazanHunt KhazanHuntEffectState;
	local int BonusDamage;

	KhazanHuntEffectState = ARFM_GameStateEffect_KhazanHunt(EffectState);

	if (!class'XComGameStateContext_Ability'.static.IsHitResultHit(AppliedData.AbilityResultContext.HitResult) || CurrentDamage == 0)
		return 0;

	// only limit this when actually applying damage (not previewing)
	if( NewGameState != none )
	{
		DamageEffect = X2Effect_ApplyWeaponDamage(class'X2Effect'.static.GetX2Effect(AppliedData.EffectRef));
		if( DamageEffect == none )
		{
			return 0;
		}
	}

	if(AbilityState.SourceWeapon == KhazanHuntEffectState.ApplyEffectParameters.ItemStateObjectRef)
	{
		BonusDamage = KhazanHuntEffectState.CurrentDamageBoost;
		return BonusDamage;
	}

	return 0; 
}

DefaultProperties
{
	DamageBoostPerKill=1
	MaxDamageBoost=4
	EffectName = "ARFMKhazanHunt"
	bDisplayInSpecialDamageMessageUI = true
	DuplicateResponse = eDupe_Ignore
	GameStateEffectClass = class'ARFM_GameStateEffect_KhazanHunt'
}