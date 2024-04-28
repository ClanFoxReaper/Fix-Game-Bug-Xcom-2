class ARFM_Effect_NeverMore extends X2Effect;

var localized string ARFMNeverMoreFlyover;

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
	local XComGameState_Unit TargetUnit;
	local int CurrentStats;
	local int NeverMoreBase;
	local int NeverMoreRandom;
	local int NeverMoreThreshold;
	local int KillAmount;
	local int NeverMoreRandomBonus;
	local int NeverMoreBonus;

	super.OnEffectAdded(ApplyEffectParameters, kNewTargetState, NewGameState, NewEffectState);

	TargetUnit = XComGameState_Unit(kNewTargetState);
	CurrentStats = TargetUnit.GetCurrentStat(eStat_HP) + TargetUnit.GetCurrentStat(eStat_ShieldHP);
	NeverMoreBase = 4;
	NeverMoreRandom = `SYNC_RAND_STATIC(6);
	NeverMoreThreshold = NeverMoreBase + NeverMoreRandom;
	KillAmount = TargetUnit.GetCurrentStat(eStat_HP) + TargetUnit.GetCurrentStat(eStat_ShieldHP) + NeverMoreBase + NeverMoreRandom + NeverMoreThreshold + 20;
	NeverMoreRandomBonus = `SYNC_RAND_STATIC(2);
	NeverMoreBonus = 1 + NeverMoreRandomBonus;

	if( CurrentStats < NeverMoreThreshold )
	{
		TargetUnit.TakeEffectDamage(self, KillAmount, 0, 0, ApplyEffectParameters, NewGameState, false, false);
	}

	if( CurrentStats > NeverMoreThreshold )
	{
		TargetUnit.TakeEffectDamage(self, NeverMoreBonus, 0, 0, ApplyEffectParameters, NewGameState, false, false);
	}

}

simulated function AddX2ActionsForVisualization(XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata, const name EffectApplyResult)
{
	local X2Action_PlaySoundAndFlyOver SoundAndFlyOver;

	if (EffectApplyResult != 'AA_Success')
		return;

	SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(ActionMetadata, VisualizeGameState.GetContext(), false, ActionMetadata.LastActionAdded));
	SoundAndFlyOver.SetSoundAndFlyOverParameters(None, default.ARFMNeverMoreFlyover, '', eColor_Bad); // TODO: Check with audio if they want a special clip here
}