// ********************
// NSC betet an Pray-FP
// ********************

func void ZS_Pray_Innos_FP ()
{
	//Perception_Set_Normal();
	
	//B_ResetAll (self);
	

	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};//AI_SetWalkmode 	(self,NPC_WALK);
/*		
	if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
    {
		AI_GotoWP	(self, self.wp);
	};		
*/	
};

func int ZS_Pray_Innos_FP_Loop ()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"INNOS"))
	{
		B_InterruptMob ("INNOS");//	AI_UseMob(self,"INNOS",1);
	};
	if((Npc_GetStateTime(self) > 5) && c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT))
	{
		Npc_SetStateTime(self,0);
	};
	AI_Wait(self,1);	//return LOOP_CONTINUE;

};

func void ZS_Pray_Innos_FP_End ()
{
	AI_UseMob(self,"INNOS",-1);
	//NPC_StopAni (self,"T_PRAY_RANDOM");
	//AI_PlayAni (self, "T_PRAY_2_STAND");	
};
