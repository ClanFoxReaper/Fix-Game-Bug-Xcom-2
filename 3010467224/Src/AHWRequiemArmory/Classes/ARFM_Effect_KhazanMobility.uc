class ARFM_Effect_KhazanMobility extends X2Effect_Persistent;

function RegisterForEvents(XComGameState_Effect EffectGameState)
{
	local X2EventManager EventMan;
	local Object EffectObj;
	local XComGameState_Unit UnitState;

	EventMan = `XEVENTMGR;
	EffectObj = EffectGameState;
	UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));
	EventMan.RegisterForEvent(EffectObj, 'KillMail', EffectGameState.ForwardOperatorListener, ELD_OnStateSubmitted, , UnitState);
}

function ModifyTurnStartActionPoints(XComGameState_Unit UnitState, out array<name> ActionPoints, XComGameState_Effect EffectState)
{
	local UnitValue PendingPointsValue;
	local int i, Points;

	if (UnitState.IsAbleToAct())
	{
		UnitState.GetUnitValue('ForwardOperatorPending', PendingPointsValue);
		Points = PendingPointsValue.fValue;
		for (i = 0; i < Points; ++i)
		{
			ActionPoints.AddItem(class'X2CharacterTemplateManager'.default.MoveActionPoint);
		}
	}
	UnitState.ClearUnitValue('ForwardOperatorPending');
}