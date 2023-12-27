func void ZS_Angeln ()
{	
	B_SetPerception (self); 	
	AI_SetWalkmode 	(self,NPC_WALK);
/*	if ((Hlp_StrCmp(Npc_GetNearestWp (self),self.wp)== 0))
	{
	AI_GotoWP	(self, self.wp);
	};*/
		if !(Npc_IsOnFP(self,"FISHING"))
	{
		AI_GotoFp (self,"FISHING");
		AI_AlignToFP( self );				
	};
	if (Npc_HasItems (self,ItMi_Angel) == 0)
	{
	CreateInvItem (self,ItMi_Angel);
	};	
};
	
func int ZS_Angeln_Loop ()
{

	if !(Npc_IsOnFP(self,"FISHING"))
	{
		AI_GotoFp (self,"FISHING");
		AI_AlignToFP( self );				
	};
	
	if (!C_BodyStateContains(self, BS_ITEMINTERACT))
	{
		AI_UseItemToState 	(self,itmi_angel,1);
	};
};

func void ZS_Angeln_End ()
{
	AI_UseItemToState (self,itmi_angel,-1);
};