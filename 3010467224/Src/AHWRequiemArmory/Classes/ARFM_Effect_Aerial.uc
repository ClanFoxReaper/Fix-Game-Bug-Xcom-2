class ARFM_Effect_Aerial extends X2Effect_Persistent;

function GetToHitAsTargetModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
	local X2AbilityToHitCalc_StandardAim	ToHitCalc;
	local int								iFlankingAimBonus;
	local ShotModifierInfo					ShotInfo, ShotModifier;

	ToHitCalc = X2AbilityToHitCalc_StandardAim(AbilityState.GetMyTemplate().AbilityToHitCalc);

	if (bFlanking && ToHitCalc != none && !ToHitCalc.bMeleeAttack && ToHitCalc.bAllowCrit && Target.HasHeightAdvantageOver(Attacker, true))
	{
		iFlankingAimBonus = Attacker.GetCurrentStat(eStat_FlankingAimBonus);
		if (iFlankingAimBonus > 0)
		{
			ShotModifier.ModType = eHit_Success;
			ShotModifier.Value = -iFlankingAimBonus;
			ShotModifier.Reason = FriendlyName;
			ShotModifiers.AddItem(ShotModifier);

			ShotInfo.ModType = eHit_Success;
			ShotInfo.Value = -25;
			ShotInfo.Reason = FriendlyName;
			ShotModifiers.AddItem(ShotInfo);

			ShotInfo.ModType = eHit_Crit;
			ShotInfo.Value = -25;
			ShotInfo.Reason = FriendlyName;
			ShotModifiers.AddItem(ShotInfo);
		}
	}

	if (!bFlanking && ToHitCalc != none && !ToHitCalc.bMeleeAttack && Target.HasHeightAdvantageOver(Attacker, true))
	{
		ShotInfo.ModType = eHit_Success;
		ShotInfo.Value = -10;
		ShotInfo.Reason = FriendlyName;
		ShotModifiers.AddItem(ShotInfo);
	}

}

defaultproperties
{
	DuplicateResponse = eDupe_Ignore
	EffectName = "ARFM_Effect_Aerial"
}