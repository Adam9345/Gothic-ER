/*******************************************
*            NSC benutzt Blubber           *
*  wenn keine Blubber da, raucht er Joint  *
*******************************************/
//edit by g1210
func void ZS_UseHorn ()
{
	B_SetPerception (self); 	
	AI_SetWalkmode 	(self,NPC_WALK);
	if ((Hlp_StrCmp(Npc_GetNearestWp (self),self.wp)== 0))
	{
	AI_GotoWP	(self, self.wp);
	};
	if (Npc_HasItems (self,ItMiHorn_01) == 0)
	{
	CreateInvItem (self,ItMiHorn_01);
	};	
};


func int ZS_UseHorn_Loop ()
{
	if (!C_BodyStateContains(self, BS_ITEMINTERACT))
	{
		AI_UseItemToState 	(self,ItMiHorn_01,1);
	};

};

func void ZS_UseHorn_End ()
{
AI_UseItemToState (self,ItMiHorn_01,-1);
};

