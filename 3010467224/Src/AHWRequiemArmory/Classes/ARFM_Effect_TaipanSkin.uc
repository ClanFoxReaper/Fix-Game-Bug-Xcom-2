class ARFM_Effect_TaipanSkin extends X2Effect_Persistent config(RequiemGenetics);

function bool ChangeHitResultForTarget(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit TargetUnit, XComGameState_Ability AbilityState, bool bIsPrimaryTarget, const EAbilityHitResult CurrentResult, out EAbilityHitResult NewHitResult)
{
	local int FailRoll;

	//	don't change a natural miss
	if (!class'XComGameStateContext_Ability'.static.IsHitResultHit(CurrentResult))
		return false;

	if (!TargetUnit.IsAbleToAct())
		return false;

	if (class'XComGameStateContext_Ability'.static.IsHitResultHit(CurrentResult))
	{
		FailRoll = `SYNC_RAND(10);
		if (FailRoll > 7)
		{
			NewHitResult = eHit_Graze;
			return true;
		}
	}

	return false;
}

DefaultProperties
{
	DuplicateResponse = eDupe_Ignore
	EffectName = "ARFMTaipanSkin"
}