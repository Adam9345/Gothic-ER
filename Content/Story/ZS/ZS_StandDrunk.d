func void ZS_StandDrunk()
{
	GuardPerception ();
	Npc_PercEnable  (self,	PERC_ASSESSPLAYER, 	B_AssessSC);
	
	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);
	AI_GotoWP		(self, self.wp);
	
	if (Wld_IsFPAvailable(self,"FP_STAND"))
	{																	
		AI_GotoFP (self, "FP_STAND");
		AI_AlignToFP (self);
	}
	else
	{
		AI_AlignToWP	(self);
	};
	
   Mdl_ApplyOverlayMds (self,"Humans_drunken.mds");
};

func void ZS_StandDrunk_loop()
{
	//fixed
	if (Npc_HasItems (self, Itfobeer) ==	0)
	{
	CreateInvItems (self, Itfobeer, 1);
	};
	AI_UseItem (self, Itfobeer);
	AI_Wait		(self, 1);
};

func void ZS_StandDrunk_end()
{
	Mdl_RemoveOverlayMDS	(self,"Humans_drunken.mds");
};
