func void ZS_NoFight ()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_MOD_NoFight");
	B_SetPerception (self); 	
	Npc_PercDisable (self,PERC_ASSESSENEMY);
	Npc_PercDisable (self,PERC_ASSESSTHREAT);
	Npc_PercDisable (self,PERC_OBSERVEINTRUDER);
	Npc_PercDisable (self,PERC_ASSESSWARN);
	Npc_PercDisable (self,PERC_OBSERVESUSPECT);
};

func void ZS_NoFight_Loop ()
{
	//print ("nofight test");
	AI_Wait (self, 1);
};

func void ZS_NoFight_End ()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_MOD_NoFight_End");
};