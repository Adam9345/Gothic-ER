func void B_LookAround ()
// 4.6.0. fertig // 25.5.00 Konzeptänderung auf 1 sec. Laut Konzept 3.5.00 soll die Frequenz 0,5 betragen, bisher aber nur integer Werte möglich
{
	PrintDebugNpc( PD_ZS_FRAME, "B_LookAround" );	
	Npc_SetPercTime ( self, 1);
	AI_StandUp ( self);
	AI_PlayAni ( self, "T_SEARCH");
};
func void B_TurnToNpc (var C_NPC slf, var C_Npc oth)
{
	AI_TurnToNpc (slf, oth);
};

func void B_StopLookAt (var C_NPC slf)
{
	//var C_NPC target; target = Npc_GetLookAtTarget(slf);
	
	if (Hlp_IsValidNpc(self))
	{
		AI_StopLookAt (slf);
	};
};
func void B_LookAtNpc (var C_NPC slf, var C_NPC oth)
{
	B_StopLookAt (slf);
	AI_LookAtNpc (slf, oth);
};