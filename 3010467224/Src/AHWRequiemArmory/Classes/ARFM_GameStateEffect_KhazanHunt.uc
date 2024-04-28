class ARFM_GameStateEffect_KhazanHunt extends XComGameState_Effect;

var int CurrentDamageBoost;

function EventListenerReturn ARFMKhazanListener(Object EventData, Object EventSource, XComGameState GameState, Name EventID, Object CallbackData)
{
	local XComGameStateContext_Ability AbilityContext;
	local ARFM_Effect_KhazanHunt Effect;
	local XComGameState NewGameState;
	local ARFM_GameStateEffect_KhazanHunt EffectState;
	local XComGameState_Ability AbilityState;
	local XComGameState_Unit UnitState;
	
	AbilityContext = XComGameStateContext_Ability(GameState.GetContext());
	if (AbilityContext != none && AbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt)
	{
		Effect = ARFM_Effect_KhazanHunt(GetX2Effect());
		if (CurrentDamageBoost < Effect.MaxDamageBoost)
		{
			NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Khazans Hunt Increase Damage on Kill");
			EffectState = ARFM_GameStateEffect_KhazanHunt(NewGameState.ModifyStateObject(Class, ObjectID));
			EffectState.CurrentDamageBoost += Effect.DamageBoostPerKill;
			//	mark unit state and ability state for flyover
			UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', ApplyEffectParameters.SourceStateObjectRef.ObjectID));
			AbilityState = XComGameState_Ability(NewGameState.ModifyStateObject(class'XComGameState_Ability', ApplyEffectParameters.AbilityStateObjectRef.ObjectID));
			`XEVENTMGR.TriggerEvent('ARFMKhazanHunting', AbilityState, UnitState, NewGameState);
			SubmitNewGameState(NewGameState);
		}
	}

	return ELR_NoInterrupt;
}